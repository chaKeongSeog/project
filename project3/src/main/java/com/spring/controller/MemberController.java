package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dto.DDitMemberVO;
import com.spring.dto.MemberListVO;
import com.spring.dto.MemberMemoVO;
import com.spring.dto.MemberVO;
import com.spring.dto.ScheduleVO;
import com.spring.email.EmailSender;
import com.spring.service.MemberService;
import com.spring.service.ScheduleService;

@Controller
public class MemberController {
	private final long FILE_SIZE = 1024*1024*5;//5MB
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ScheduleService scheduleService;

	@Autowired
	private JavaMailSender mailSender;
	
	
	@RequestMapping(value="/member/memoWrite",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView memoWrite(String id,String content) {
		ModelAndView mav = new ModelAndView("jsonView");
		MemberMemoVO memo = new MemberMemoVO();
		memo.setId(id);
		memo.setContent(content);
		
		memberService.memoWrtie(memo);
		
		return mav;
	}
	
	@RequestMapping(value="/member/getMemoList",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getMemoList(String id) {
		ModelAndView mav = new ModelAndView("jsonView");
		List<MemberMemoVO> list = memberService.getMemberMemo(id);
		
		
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value="/member/memoDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView memoDelete(int mno) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		memberService.memoDelete(mno);
		
		
		return mav;
	}
	
	
	@RequestMapping(value = "/excludes/member/joinForm", method = RequestMethod.GET)
	public String regist() {
		
		String url="member/joinForm";

		
		return url;
	}
	@RequestMapping(value = "/excludes/member/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		String url="member/loginForm";

		
		return url;
	}
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(String id,String pwd,HttpServletRequest request,HttpServletResponse response) throws IOException {
		String result = "";
		String url = "redirect:/main";
		MemberListVO member = memberService.getMemberList(id);
		if(member == null) {
			url="index";
			result = "회원님은 존재하지않습니다";
			request.setAttribute("msg",result);
		}else if("disabled".equals(member.getAuthority())) {
			url="index";
			result = member.getName()+"님은 회원 정지이거나 회원 탈퇴입니다.";
			request.setAttribute("msg",result);
		}else if(member != null && member.getPwd().equals(pwd)) {
			url="main";
			//String name = member.getName();
			//String tel = member.getTel();
			//DDitMemberVO ddit = member.getDDitMember(name,tel);
			HttpSession session = request.getSession();
			session.setAttribute("user",member);
			session.setMaxInactiveInterval(6*60);
			request.setAttribute("msg",result);
		}else if(!(member != null && member.getPwd().equals(pwd))){
			url="index";
			result = "아이디 혹은 비밀번호를 확인해주세요";
			request.setAttribute("msg",result);
		}
		return url;
	}
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public String  idCheck(String id,Model model) {
		String id2 = memberService.idCheck(id);
		
		return  id2;
	}
	@RequestMapping(value="/member/join",method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String uploadByMultipartFile(String id,String pwd,String name,String email ,String tel,@RequestParam("file") MultipartFile multi,HttpServletRequest request,HttpServletResponse response,
										Model model) throws Exception{
		if(!dditCheck(name,response)) {
			return null;
		}
		
		if(!fileCheck(multi,1024-1024*5,response)) {
			return null;
		}
		String fileName = multi.getOriginalFilename();
		
		if(fileName == null){
			fileName ="basicprofile.jpeg";
		}
		fileName = saveFile(multi, request, fileName,model);
		
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPwd(pwd);
		member.setName(name);
		member.setTel(tel);
		member.setFileName(fileName);
		member.setEmail(email);
		memberService.join(member);
		
		model.addAttribute("msg",name+"님 회원가입 완료하였습니다");
		
		return "index";
	}	
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		String url="index";
		HttpSession session = request.getSession();
		session.invalidate();
		request.setAttribute("msg",null);
		
		return url;
	}
	
    @RequestMapping(value="/member/searchPwd",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView sendEmailAction (String id,String email,HttpServletResponse response) throws Exception {
        ModelAndView mav;
        
        String pwd=memberService.SearchPwd(id,email);
        if(pwd!=null) {
        	for ( int i = 0; i<4; i++) {
                pwd  = pwd + Character.toString((char)((Math.random() * 26)+97));
            }
        	String title = "비밀번호 찾기 메일입니다.";
            String content = "비밀번호는 "+pwd+" 입니다.";
            
            MimeMessage message = mailSender.createMimeMessage();
            message.setSubject(title);
            message.setText(content);
            message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email));
            mailSender.send(message);
            //비밀번호 변경
            memberService.pwdModify(id,pwd);
            
            mav= new ModelAndView("jsonView");
            mav.addObject("pwd",pwd);
            return mav;
        }else {
        	mav=new ModelAndView("jsonView");
        	mav.addObject("pwd",pwd);
            return mav;
        }
    }
	@RequestMapping(value="/member/SearchID",method = RequestMethod.POST)
	@ResponseBody
    public String searchID(String name,String email) throws Exception {
        String id = memberService.searchID(name,email);
        
        return id;
    }
	@RequestMapping(value="/member/myinfo",method = RequestMethod.GET)
    public String myinfo(String id,Model model) throws Exception {
		String url="/member/myinfo2";
		
		MemberVO member = memberService.getMember(id);
		
		model.addAttribute("member",member);
		
		List<ScheduleVO> list = scheduleService.showSchedule(id);
		model.addAttribute("showSchedule" , list);
		return url;
    }
	
	@RequestMapping(value="/member/imgModify",method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String imgModify(String originFileName,@RequestParam("file") MultipartFile multi,String id,HttpServletRequest request,
			HttpServletResponse response,Model model) throws Exception{
		
		if(!fileCheck(multi,1024-1024*5,response)) {
			return null;
		}
		String fileName = multi.getOriginalFilename();
		String  file_extension = fileName.substring(fileName.lastIndexOf(".")+1);
		if(!(file_extension.equals("jpg") || file_extension.equals("JPG") || file_extension.equals("png") || file_extension.equals("PNG"))) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('파일 확장자명은 jpg,png이어야 합니다') </script>");
			out.println("<script> history.go(-1);</script>");
			return null;
		}
		
		//수정전 파일 삭제
		delete(request,originFileName);
		
		fileName = saveFile(multi, request, fileName,model);
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setFileName(fileName);
		memberService.imgModify(member);
		member = memberService.getMember(id);
		HttpSession session = request.getSession();
		session.setAttribute("user",member);
		model.addAttribute("member",member);
		
		
		return "redirect:myinfo?id="+id+"";
	}
	@RequestMapping(value="/member/modify",method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String modfify(String id,String name,String email ,String tel,HttpServletRequest request,HttpServletResponse response,
										Model model) throws Exception{
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setName(name);
		member.setTel(tel);
		member.setEmail(email);
		memberService.modify(member);
		
		member = memberService.getMember(id);
		model.addAttribute("member",member);
//		return "redirect:myinfo?id="+id+"";
		response.setContentType("text/html;charset = utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('회원수정을 완료하였습니다')");
		out.println("</script>");
		out.println("<script>");
		out.println("history.go(-1)");
		out.println("</script>");
		return null;
	}
	@RequestMapping(value="/member/delete",method = RequestMethod.POST)
	@ResponseBody
    public ModelAndView MemberDelete(String id,Model model) throws Exception {
		String url="index";
		ModelAndView mav = new ModelAndView("jsonView");
		memberService.memberDelete(id);
		
		
		return mav;
    }
	
	@RequestMapping(value="/member/pwdModify",method = RequestMethod.POST)
    public String pwdModify(String id,String currentpassword,String password,HttpServletResponse response) throws Exception {
		String url="redirect:myinfo?id="+id+"";
		boolean result = true;
		MemberVO member = memberService.getMember(id);
		if(!member.getPwd().equals(currentpassword)) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('현재 비밀번호가 맞지않습니다.') </script>");
			out.println("<script> history.go(-1);</script>");
			return null;
		}else {
			member = new MemberVO();
			member.setId(id);
			member.setPwd(password);
			memberService.pwdModify(id, password);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('비밀번호가 변경되었습니다') </script>");
			out.println("<script> history.go(-1);</script>");
		}
		return null;
    }	
	private boolean dditCheck(String name,HttpServletResponse response) throws IOException {
		boolean result = true;
		List<DDitMemberVO> list = memberService.dditMemberCheck(name);
		if("[]".equals(list.toString())) {
			result = false;
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('당신은 ddit 학생이 아닙니다')");
			out.println("history.go(-1)");
			out.println("</script>");
		}
		return result;
	}
	
	
	 private String delete(HttpServletRequest request,String originFileName) {
		 String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
	 	 File file = new File(uploadPath,originFileName);
	 		if(file.exists() == true){
	 		file.delete();
	 	 }
	 	 return null;
	 } 
	
	
	
	private String saveFile(MultipartFile multi,HttpServletRequest request,String fileName,Model model) {
		try {
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
			
			//중복 제거
			UUID uid = UUID.randomUUID();
			fileName = uid+"_"+fileName;
			
			File file = new File(uploadPath,fileName);
			
			if(!file.exists()) {
				file.mkdirs();
			}
			
			multi.transferTo(file);
//			model.addAttribute("uploadedFileName",file.getName());
//			model.addAttribute("uploadPath",file.getAbsolutePath());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileName;
}
	private boolean fileCheck(MultipartFile multi,long size,HttpServletResponse response) throws IOException,ServletException{
		
		boolean result = true;
		String message = "";
		//파일유무
		if(multi.isEmpty()){
			message  = "사진 업로드가 필요합니다";
			result = false;
		}
		//용량 확인 5MB
		if(multi.getSize() > 1024*1024*5){
			message  = "파일 용량 초과입니다";
			result = false;
		}
		if(!result) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('"+message+"') </script>");
			out.println("<script> history.go(-1);</script>");
		}
		

	return result;
}	
	
	


	
}
































