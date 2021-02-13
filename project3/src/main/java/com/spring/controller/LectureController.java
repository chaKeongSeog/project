package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.common.Pager;
import com.spring.dto.BoardVO;
import com.spring.dto.EvaluationVO;
import com.spring.dto.LectureReplyVO;
import com.spring.dto.ReportVO;
import com.spring.service.GroupService;
import com.spring.service.LectureService;

@Controller
public class LectureController {
	
	@Autowired
	LectureService lectureService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "lecture/list", method = RequestMethod.GET)
	public ModelAndView home(@RequestParam(defaultValue = "1") int curPage,
							@RequestParam(defaultValue = "all") String search_option,
							@RequestParam(defaultValue = "") String keyword) 
									throws Exception{
		String url="lecture/list";
		ModelAndView mav = new ModelAndView();
		int count  = lectureService.getListCount(search_option,keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<EvaluationVO> list = lectureService.getList(start,end,search_option,keyword);
		Map<String,Object> map = new HashMap<>();
		map.put("list",list);
		map.put("pager",pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.setViewName(url);
		mav.addObject("map",map);
		
		System.out.println("count:"+count);
		System.out.println("start:"+start);
		System.out.println("end:"+end);
		System.out.println("startPage:"+pager.getBlockBegin());
		System.out.println("endPage:"+pager.getBlockEnd());
		System.out.println("search_option:"+search_option);
		System.out.println("keyword:"+keyword);
		System.out.println("list:"+list.toString());
		
		
		return mav;
	}
	
	
	@RequestMapping(value = "/lecture/registForm", method = RequestMethod.GET)
	public String registForm() {
		
		String url="lecture/regist";
		
		
		return url;
	}
	@RequestMapping(value = "/lecture/reportRegistForm", method = RequestMethod.GET)
	public String reportRegistForm() {
		
		String url="lecture/reportRegist";
		
		
		return url;
	}
	@RequestMapping(value = "/lecture/regist", method = RequestMethod.POST)
	public ModelAndView regist(EvaluationVO eval) throws Exception{
		String url="redirect:/lecture/list";
		ModelAndView mav = new ModelAndView();
		
		lectureService.regist(eval);
		
		mav.setViewName(url);
		
		return mav;
	}
	@RequestMapping(value = "/lecture/reportWrite", method = RequestMethod.POST)
	public ModelAndView reportWrite(ReportVO report) throws Exception{
		String url="redirect:/lecture/list";
		ModelAndView mav = new ModelAndView();
		String title = report.getTitle();
		String content = report.getContent();
		String email = "ckrudtjr938@gmail.com";
		//관리자에게 메일보내기
		 MimeMessage message = mailSender.createMimeMessage();
         message.setSubject(title);
         message.setText(content);
         message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email));
         mailSender.send(message);
		 
         lectureService.reportRegist(report);
		
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value = "/lecture/delete", method = RequestMethod.POST)
	public ModelAndView delete(int eno) throws Exception{
		String url="redirect:/lecture/list";
		ModelAndView mav = new ModelAndView();
		
		lectureService.delete(eno);
		lectureService.likeCheckDelete(eno);
		
		
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value = "/lecture/likeUp", produces="application/text;charset=utf8")
	@ResponseBody
	public String likeUp(int eno,String id,HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("utf-8");
		Object enoCheck = lectureService.likeCheck(eno);
		String result = null;
		if(enoCheck != null) {
			result = "이미 추쳔하였습니다.";
		}else {
			result = "추천 하였습니다.";
			lectureService.likeUp(eno);
			lectureService.likeCheckWrite(eno,id);
		}
		
	
		return result;
	}
	@RequestMapping(value="/lecture/modifyForm",method=RequestMethod.POST)
	public ModelAndView updateForm(int eno) {
		String url  = "lecture/modify";
		EvaluationVO vo = lectureService.getEvaluation(eno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("lecture",vo);
		mav.setViewName(url);
		
		return mav; 
	}
	
	@RequestMapping(value="/lecture/modify",method=RequestMethod.POST)
	public ModelAndView modify(EvaluationVO eval) {
		String url  = "redirect:list";
		lectureService.modify(eval);
		
		int eno = eval.getEno();
		EvaluationVO vo = lectureService.getEvaluation(eno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("lecture",vo);
		mav.setViewName(url);
		
		return mav; 
	}
	@RequestMapping(value="/lecture/answerForm",method = RequestMethod.POST)
	public ModelAndView answerForm(int eno,String search_option,String keyword,int curPage) {
		ModelAndView mav = new ModelAndView("jsonView");
		EvaluationVO vo = lectureService.getEvaluation(eno);
		String url = "lecture/answer";
		mav.addObject("lecture",vo);
		mav.setViewName(url);
		mav.addObject("search_option",search_option);
		mav.addObject("keyword",keyword);
		mav.addObject("curPage",curPage);
		return mav;
	}
	
	@RequestMapping(value="/lecture/answer",method = RequestMethod.POST)
	public String answer(EvaluationVO eval,String search_option,String keyword,int curPage) {
		String url = "redirect:list?search_option="+search_option+"&keyword="+keyword+"&curPage="+curPage;
		
		int eno = eval.getEno();
		
		EvaluationVO vo = lectureService.getEvaluation(eno);
		
		int ref = vo.getRef();
		int ref_step = vo.getRef_step()+1;
		int ref_level = vo.getRef_level()+1;
		
		EvaluationVO evo = new EvaluationVO();
		evo.setEno(eno);
		evo.setId(eval.getId());
		evo.setRef(ref);
		evo.setRef_step(ref_step);
		evo.setRef_level(ref_level);
		evo.setLecturename(eval.getLecturename());
		evo.setProfessorname(eval.getProfessorname());
		evo.setYear(eval.getYear());
		evo.setMonth(eval.getMonth());
		evo.setDivide(eval.getDivide());
		evo.setTitle(eval.getTitle());
		evo.setContent(eval.getContent());
		evo.setTotalscore(eval.getTotalscore());
		
		lectureService.answer(evo);
		
		return url;
	}
	
	@RequestMapping(value="/lecture/replyWrite",method= RequestMethod.POST)
	@ResponseBody
	public ModelAndView replyWrite(int eno,String content,String id) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		LectureReplyVO vo = new LectureReplyVO();
		vo.setEno(eno);
		vo.setId(id);
		vo.setContent(content);
		
		lectureService.replyWrite(vo);
		
		
		
		
		return mav;
	}
	
	@RequestMapping(value="/excludes/lecture/replyList",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView replyList(int eno,@RequestParam(defaultValue = "1") int curPage) {
		Map<String,Object> map = new HashMap<>();
		ModelAndView mav = new ModelAndView("jsonView");
		String url = "/lecture/replyList";
		
		int count = lectureService.replyListCount(eno);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<LectureReplyVO> list = lectureService.replyList(start,end,eno);
		System.out.println("댓글 리스트:"+list.toString());
		map.put("list",list);
		map.put("pager",pager);
		map.put("eno",eno);
		mav.addObject("map",map);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/lecture/lectureModify",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView lectureModify(int rno,String rcont) {
		ModelAndView mav = new ModelAndView("jsonView");
		lectureService.replyModify(rno,rcont);
		
		return mav;
	}
	
	@RequestMapping(value="/lecture/replyDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView replyDelete(int rno,int eno) {
		ModelAndView mav = new ModelAndView("jsonView");
		LectureReplyVO vo = lectureService.getReply(rno,eno);
		int ref_step = vo.getRef_step();
		int ref = vo.getRef();
		lectureService.replyDelete(ref,ref_step);
		
		return mav;
	}
	
	@RequestMapping(value="/lecture/replyAnswer",method =RequestMethod.POST)
	@ResponseBody
	public ModelAndView replyAnswer(int rno,int eno,String rcont,String id) {
		ModelAndView mav = new ModelAndView("jsonView");
		lectureService.replyAnswer(rno,eno,rcont,id);
		
		
		return mav;
	}
	
	
	
}
