package com.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.common.Pager;
import com.spring.dto.AttachListVO;
import com.spring.dto.ChatVO;
import com.spring.dto.DDAYVO;
import com.spring.dto.DDitMemberVO;
import com.spring.dto.GroupAttachVO;
import com.spring.dto.GroupBoardListVO;
import com.spring.dto.GroupBoardVO;
import com.spring.dto.GroupChatListVO;
import com.spring.dto.GroupChatVO;
import com.spring.dto.GroupFileVO;
import com.spring.dto.GroupGoodBadCheckVO;
import com.spring.dto.GroupMemberVO;
import com.spring.dto.GroupMemberVO2;
import com.spring.dto.GroupOutListVO;
import com.spring.dto.GroupScheduleVO;
import com.spring.dto.GroupVO;
import com.spring.dto.MemoVO;
import com.spring.dto.TodoListVO;
import com.spring.service.ChatService;
import com.spring.service.GroupService;
import com.spring.service.ScheduleService;


@Controller
public class GroupController {
	
//	private static final Logger logger = Logger.getLogger(GroupController.class);
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping(value="/group/detail",method=RequestMethod.POST)
	public ModelAndView detail(int gno) {
		String url="group/detail";
		ModelAndView mav = new ModelAndView();
		List<GroupScheduleVO> list = scheduleService.getGroupScheduleList(gno);
		mav.addObject("gno",gno);
		mav.addObject("teamSchedule",list);
		return mav;
	}
	@RequestMapping(value="/group/getGroupInfo",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getGroupInfo(int gno) throws Exception{
		System.out.println("gno:"+gno);
		GroupVO group = groupService.getGroupInfo(gno);
		List<GroupMemberVO2> list = groupService.getGroupMember(gno);
		int GroupMemberCount = groupService.getGroupMemberCount(gno);
		int vertifyCount = groupService.getTodoListVertifyCount(gno);
		for(GroupMemberVO2 vo:list) {
			int count = groupService.getTodoListVertifyCount(gno,vo.getId());
			vo.setNovertifyCount(count);
		}
		
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("group",group);
		mav.addObject("list",list);
		mav.addObject("count",GroupMemberCount);
		mav.addObject("vertifyCount",vertifyCount);
		
		return mav;
	}
	@RequestMapping(value="/group/fileDelete",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView fileDelete(int fno,HttpServletRequest request) throws Exception{
		GroupFileVO vo = groupService.getGroupFile(fno);
		String path = request.getSession().getServletContext().getRealPath("resources/upload/group/"+vo.getGno());
		groupService.fileDelete(fno);
		
		String fileName = vo.getFileName();
		ModelAndView mav = new ModelAndView("jsonView");
		File f = new File(path,fileName);
		if(f.exists()) {
			f.delete();
			mav.addObject("result","파일을 정상적으로 삭제하였습니다");
		}else {
			mav.addObject("result","파일 삭제를 실패하였습니다");
		}
		mav.addObject("gno",vo.getGno());
		return mav;
	}
	@RequestMapping(value="/group/insertStRoom",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertStRoom(String id,String name,String goal) throws Exception{
		GroupVO vo = new GroupVO();
		vo.setId(id);
		vo.setName(name);
		vo.setGoal(goal);
		//그룹 코드 생성
		char[] tmp = new char[6];
		for(int i=0; i<tmp.length; i++) {
			int div = (int) Math.floor( Math.random() * 2 );
			
			if(div == 0) { // 0이면 숫자로
				tmp[i] = (char) (Math.random() * 10 + '0') ;
			}else { //1이면 알파벳
				tmp[i] = (char) (Math.random() * 26 + 'A') ;
			}
		}
		vo.setCode(tmp.toString());
		groupService.insertStRoom(vo);
		Object gno2 = groupService.getGroupNum(tmp.toString());
		int gno = Integer.parseInt(String.valueOf(gno2));
		GroupMemberVO gMember = new GroupMemberVO();
		gMember.setId(id);
		gMember.setGno(gno);
		int gmno = groupService.insertStRoomMember(gMember);
		if(gmno == 1) {
			GroupChatVO chatvo = new GroupChatVO();
			chatvo.setContent("(이용 안내)하루 공부 계획을 작성하고 공부한 내역을 인증 게시판에 게시하여야합니다. "
					+ "인증 게시물이 나빠요가 많거나 하루 공부 계획을 게시하지않아서 미인증 계획이 5개가 초과되면 강제 퇴장 조치됩니다.");
			chatvo.setGno(gno);
			chatvo.setId("admin1234");
			Object chat = groupService.addChatMessage(chatvo);
		}
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("gmno",gmno);
		
		return mav;
	}
	
	@RequestMapping(value="/group/getGroupList",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getGroupList(String id) throws Exception{
		List<GroupVO> list = groupService.getGroupList(id);
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("list",list);
		
		return mav;
	}
	
	@RequestMapping(value="/group/insertStRoomMember",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertStRoomMember(String id,String code) throws Exception{
		ModelAndView mav = new ModelAndView("jsonView");
		
		Object gno2 = groupService.getGroupNum(code);
		if(gno2 == null) {
			mav.addObject("result","해당 코드는 존재하지않습니다");
		}else {
			int gno = Integer.parseInt(String.valueOf(gno2));
			
			GroupOutListVO grOutList = groupService.getGroupOutList(id,gno);
			
			if(grOutList != null) {
				mav.addObject("result","강제퇴장 되어 입장이 불가능합니다");
				return mav;
			}
			GroupMemberVO vo = new GroupMemberVO();
			vo.setGno(gno);
			vo.setId(id);
			//해당 아이디 그룹 멤버 여부
			int count = groupService.getMemberCount(vo);
			if(count < 1) {
				//해당 그룹 멤버수 
				int GnoCount = groupService.getGroupCount(gno);
				if(GnoCount <4) {
					//해당 그룹 들어갔는지 확인
					int num = groupService.insertStRoomMember(vo);
					if(num > 0){
						mav.addObject("result","해당 스터디룸으로 입장 가능합니다");
					}
				}else {
					mav.addObject("result","해당 스터디룸은 꽉찼습니다");
				}
			}else {
				mav.addObject("result","이미 해당 스터디룸에 참여하였습니다");
			}
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/group/modifyGroupMember",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView modifyGroupMember(String id,String title,String content,int gno) throws Exception{
		GroupMemberVO vo = new GroupMemberVO();
		vo.setGno(gno);
		vo.setId(id);
		ModelAndView mav = new ModelAndView("jsonView");
		groupService.modifyGroupMember(vo);
		
		return mav;
	}
	
	@RequestMapping(value="/group/getTodoList",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getMemberTodoList(String id,int gno) {
		ModelAndView mav = new ModelAndView("jsonView");
		List<TodoListVO> todoList = groupService.getTodoList(id,gno);
		mav.addObject("todoList",todoList);
		
		return mav;
	}
	@RequestMapping(value="/group/getMemberTodoList",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getMemberTodoList(int gno,int gtno) {
		ModelAndView mav = new ModelAndView("jsonView");
		TodoListVO vo = new TodoListVO();
		vo.setGtno(gtno);
		vo.setGno(gno);
		TodoListVO result = groupService.getMemberTodoList(vo);
		mav.addObject("todoList",result);
		
		return mav;
	}
	
	
	@RequestMapping(value="/group/groupCountCheck",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView groupCountCheck(String id) throws Exception{
		
		System.out.println("id:"+id);
		int count = groupService.groupCountCheck(id);
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("count",count);
		
		return mav;
	}
	@RequestMapping(value="/group/upload",method=RequestMethod.POST,produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ModelAndView upload(int gno,String id,@RequestParam("file")List<MultipartFile> multi,HttpServletRequest request,HttpServletResponse response) throws IOException {
		//파일 경로
		String uploadpath = request.getSession().getServletContext().getRealPath("resources/upload/group/"+gno);
		//파일체크(multipartFile 존재유무,파일 사이즈)
		boolean result = fileCheck(multi,response);
		System.out.println("파일체크:"+result);
		//각 파일 이름 출력
		for(MultipartFile file:multi) {
			System.out.println("UUID 쓰기전 파일이름:"+file.getOriginalFilename());
		}
		//파일 저장 경로에 저장
		List<GroupFileVO> list = savaFile(multi,request,uploadpath,gno,id);
		System.out.println("파일 저장 경로에 들어갔는지 확인:"+list.toString());
		//DB에 저장
		
		for(GroupFileVO vo:list) {
			groupService.fileRegist(vo);
		}
		
		
		
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("gno",gno);
		
		return mav;
	}
	
	
	@RequestMapping(value="/group/getGroupFileList",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ModelAndView GroupFileList(int gno){
		List<GroupFileVO> list = new ArrayList<>();
		list = groupService.getGroupFileList(gno);
		
		
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value="/group/download",method=RequestMethod.GET)
	public void download(int fno,HttpServletRequest request,HttpServletResponse response) throws Exception{
		List<GroupFileVO> list = new ArrayList<>();
		GroupFileVO vo = groupService.getGroupFile(fno);
		System.out.println(vo.toString());
		
		
		//파일이름 가져오기
		String fileName = vo.getFileName();
		//파일원래이름 가져오기
		String originFileName = vo.getFileName();
		originFileName = originFileName.substring(originFileName.lastIndexOf("_")+1);
		
		// MIME Type 을 application/octet-stream 타입으로 변경
        // 무조건 팝업(다운로드창)이 뜨게 된다.
		response.setContentType("application/octet-stream");
		// 브라우저는 ISO-8859-1을 인식하기 때문에
        // UTF-8 -> ISO-8859-1로 디코딩, 인코딩 한다.
		originFileName = new String(originFileName.getBytes("UTF-8"), "iso-8859-1");
		
		//파일명 지정
		response.setHeader("Content-Disposition", "attachment; filename=\""+originFileName+"\"");
		
		OutputStream os = response.getOutputStream();
		String path = request.getSession().getServletContext().getRealPath("resources/upload/group/"+vo.getGno());
        FileInputStream fis = new FileInputStream(path + File.separator + fileName);
        int n = 0;
        byte[] b = new byte[512];
        while((n = fis.read(b)) != -1 ) {
            os.write(b, 0, n);
        }
        fis.close();
        os.close();

	}
	public  List<GroupFileVO> savaFile(List<MultipartFile> multi, HttpServletRequest request,String uploadpath,int gno,String id) throws IllegalStateException, IOException {
		//파일 리스트
		List<GroupFileVO> list = new ArrayList<>();
		//파일 리스트 저장
		for(MultipartFile file: multi) {
			//파일 원래 이름
			String fileName = file.getOriginalFilename();
			//파일 UUID를 통해 겹치지 않는 이름 으로 바꿈
			String UUIDFileName = UUID.randomUUID().toString().replace("-","")+"_"+fileName;
			//파일 타입 jpg인지
			String fileType = UUIDFileName.substring(UUIDFileName.lastIndexOf(".")+1);
			//저장
			File f = new File(uploadpath,UUIDFileName);
			if(!f.exists()) {
				f.mkdirs();
			}
			file.transferTo(f);
			//DB에 넣기위해 객체에 저장
			GroupFileVO groupFile = new GroupFileVO();
			groupFile.setGno(gno);
			groupFile.setUploadPath(uploadpath);
			groupFile.setFileName(UUIDFileName);
			groupFile.setOriginFileName(fileName);
			groupFile.setFileType(fileType);
			groupFile.setId(id);
			list.add(groupFile);
		}
		return list;
	}
	boolean fileCheck(List<MultipartFile> multi,HttpServletResponse response) throws IOException{
		boolean result = true;
		String message = "";
		if(multi.isEmpty()) {
			message = "파일이 존재하지않습니다";
			result  = false;
		}
		for(MultipartFile file:multi) {
			if(file.getSize()> 1024 * 1024 * 10) {
				message = "파일 사이즈가 너무 큽니다";
				result = false;
			}
		}
		if(!result) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.println("<script>alert('"+message+"')</script>");
			out.println("<script>");
			out.println("history.go(-1)");
			out.println("</script>");
		}
		
		return result; 
	}
	
	@RequestMapping(value="/group/addChatMessage",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView addChatMessage(int gno,String id,String chatText) {
		ModelAndView mav = new ModelAndView("jsonView");
		GroupChatVO vo = new GroupChatVO();
		vo.setContent(chatText);
		vo.setGno(gno);
		vo.setId(id);
		Object result = groupService.addChatMessage(vo);
		String result2 = null;
		if(result == "") {
			result2 = "실패";
		}else {
			result2 = "성공";
		}
		
		mav.addObject("result2",result2);
		
		return mav;
	}
	@RequestMapping(value="/group/getMessage",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getMessage(int gno) {
		ModelAndView mav = new ModelAndView("jsonView");
		List<GroupChatListVO> list = groupService.getMessages(gno);
		mav.addObject("list",list);
		System.out.println(list.toString());
		
		return mav;
	}
	
	@RequestMapping(value="/group/groupMemberOut",method = RequestMethod.POST)
	public void groupMemberOut(String id,int gno,HttpServletResponse response,HttpServletRequest request) throws IOException{
		groupService.groupMemberOut(id,gno);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('그룹방에서 나가셨습니다')");
		out.println("</script>");
		out.println("<script>");
		out.println("location.href="+request.getServletPath()+"/main");
		out.println("</script>");
	}
	
	@RequestMapping(value="/group/getDDitMember",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getDDitMember(int room){		
		List<DDitMemberVO> list = groupService.getDDitMember(room);
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("list",list);
		
		
		return mav;
	}
	
	@RequestMapping(value="/group/addcode",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView addcode(String fromID,String toID,int gno,HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("jsonView");
		GroupVO vo = groupService.getGroupInfo(gno);
		String code = vo.getCode();
		
		chatService.regist(fromID, toID,gno+"번방 코드:"+code);
		mav.addObject("result","초대코드를 해당 아이디 메시지함에 보냈습니다");
		
		return mav;
	}
	
	@RequestMapping(value="/group/groupDelete",method = RequestMethod.POST)
	public void groupDelete(int gno,HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<GroupFileVO> Filelist = groupService.getGroupFileList(gno);
		System.out.println(Filelist.toString());
		
		List<GroupBoardVO> grBoard = groupService.getGroupAllBoard(gno);
		String attachpath = request.getSession().getServletContext().getRealPath("resources/upload/group/"+gno+"/GroupBoard");
		for(GroupBoardVO board:grBoard) {
			int gbno = board.getGbno();
			List<GroupAttachVO> grAttachList = groupService.getGroupAttach(gbno, gno);
			for(GroupAttachVO attach:grAttachList) {
				File f = new File(attachpath,attach.getFileName());
				f.delete();
			}
		}
		File f2 = new File(attachpath);
		f2.delete();
		
		String path = request.getSession().getServletContext().getRealPath("resources/upload/group/"+gno);
		for(GroupFileVO file:Filelist) {
			File f = new File(path,file.getFileName());
			f.delete();
		}
		File file = new File(path);
		file.delete();
		groupService.groupDelete(gno);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('해당 그룹방이 삭제되었습니다')");
		out.println("</script>");
		out.println("<script>");
		out.println("location.href='" + request.getContextPath() + "/main'");
		out.println("</script>");
	}
	
	@RequestMapping(value="/group/list",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage,@RequestParam(defaultValue = "")String name,String id){
//		logger.debug("리스트 조회 호출>>>>>>>>>>>>>>>");
//		logger.error("에러발생");
		String url = "group/list";
		ModelAndView mav = new ModelAndView("jsonView");
		int count = groupService.getGroupListCount(name,id);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<GroupVO> list = groupService.getGroupList(start,end,name,id);
		Map<String,Object> map = new HashMap<>();
		map.put("list",list);
		map.put("pager",pager);
		map.put("name",name);
		mav.addObject("map",map);
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping(value="/group/memoWrite",method = RequestMethod.POST)
	public ModelAndView memoWrite(String id,int gno,String content) {
		ModelAndView mav = new ModelAndView("jsonView");
		MemoVO vo = new MemoVO();
		vo.setContent(content);
		vo.setGno(gno);
		vo.setId(id);
		int cnt = groupService.memoWrite(vo);
		String result = null;
		if(cnt > 0) {
			result = "성공";
		}else {
			result = "실패";
		}
		mav.addObject("result",result);
		
		return mav;
	}
	
	@RequestMapping(value="/group/getMemoList",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getTodoList(int gno) {
		ModelAndView mav = new ModelAndView("jsonView");
		List<MemoVO> list = groupService.getMemoList(gno);
		mav.addObject("list",list);
		
		
		return mav;
	}
	
	@RequestMapping(value="/group/memoDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView todoListDelete(int mno) {
		ModelAndView mav = new ModelAndView("jsonView");
		int cnt = groupService.memoDelete(mno);
		String result = null;
		if(cnt > 0) {
			result = "성공";
		}else {
			result = "실패";
		}
		mav.addObject("result",result);
		
		return mav;
	}
	
	@RequestMapping(value="/group/dayWrite",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView dayWrite(String content,int gno,String id,String date) {
		ModelAndView mav = new ModelAndView("jsonView");
		int year = Integer.parseInt(date.substring(0,4));
		int month = Integer.parseInt(date.substring(5,7));
		int day = Integer.parseInt(date.substring(date.lastIndexOf("-")+1));
		
		DDAYVO DDAY = new DDAYVO();
		DDAY.setContent(content);
		DDAY.setId(id);
		DDAY.setGno(gno);
		DDAY.setGrdate(date);
		DDAY.setYear(year);
		DDAY.setMonth(month);
		DDAY.setDay(day);
		
		DDAYVO ddayVO = groupService.dayWrite(DDAY);
		//D-DAY
		Calendar cal = Calendar.getInstance();
		long now_day = cal.getTimeInMillis(); //현재 시간
		cal.set(year, month-1, day); //목표일을 cal에 set
		long event_day = cal.getTimeInMillis(); //목표일에 대한 시간
		long d_day = (event_day - now_day) / (60*60*24*1000);
		String dday = String.valueOf(d_day); 
		if(dday.contains("-")) {
			dday = dday.substring(dday.lastIndexOf("-")+1);
			dday = "+"+dday;
		}else {
			dday = "-"+dday;
		}
		
		mav.addObject("ddayVO",ddayVO);
		mav.addObject("dday",dday);
		
		return mav;
	}
	
	@RequestMapping(value="/group/getDay",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getDay(int gno) {
		ModelAndView mav = new ModelAndView("jsonView");
		DDAYVO d = groupService.getDay(gno);
		if(d != null) {
			String grdate = d.getGrdate();
			String[] dates = grdate.split(" ");
			String date = dates[0];
			int year = Integer.parseInt(date.substring(0,4));
			int month = Integer.parseInt(date.substring(5,7));
			int day = Integer.parseInt(date.substring(date.lastIndexOf("-")+1));
			//D-DAY
			Calendar cal = Calendar.getInstance();
			long now_day = cal.getTimeInMillis(); //현재 시간
			cal.set(year, month-1, day); //목표일을 cal에 set
			long event_day = cal.getTimeInMillis(); //목표일에 대한 시간
			long d_day = (event_day - now_day) / (60*60*24*1000);
			String dday = String.valueOf(d_day); 
			if(dday.contains("-")) {
				dday = dday.substring(dday.lastIndexOf("-")+1);
				dday = "+"+dday;
			}else {
				dday = "-"+dday;
			}
			mav.addObject("ddayVO",d);
			mav.addObject("dday",dday);
		}else {
			mav.addObject("ddayVO","");
			mav.addObject("dday","");
		}
		return mav;
	}
	@RequestMapping(value="/group/todoListWrite",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView todoListWrite(TodoListVO todoList) {
		ModelAndView mav = new ModelAndView("jsonView");
		int gno = todoList.getGno();
		String id = todoList.getId();
		int gmno = groupService.getGroupMemberNum(gno,id);
		todoList.setGmno(gmno);
		groupService.todoListWrite(todoList);
		
		return mav;
	}
	@RequestMapping(value="/group/todoListModify",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView todoListModify(int gtno,int gno,String id,String title,String content) {
		ModelAndView mav = new ModelAndView("jsonView");
		TodoListVO vo = new TodoListVO();
		vo.setGtno(gtno);
		vo.setGno(gno);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setId(id);
		groupService.modifyTodoList(vo);
		
		
			
		return mav;
	}
	
	@RequestMapping(value="/group/grBoardWrite",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView grBoardWrite(int gno,String id,String title,
									String content,
									List<MultipartFile> multi,
									HttpServletRequest request,
									HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("jsonView");
		if(multi.isEmpty()) {
			GroupBoardVO vo = new GroupBoardVO();
			vo.setId(id);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setGno(gno);
			groupService.insertGroupBoard(vo);
		}else {
			GroupBoardVO vo = new GroupBoardVO();
			vo.setId(id);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setGno(gno);
			List<GroupAttachVO> list = saveGroupBoardFile(id,gno,multi,request,response);
			groupService.insertGroupBoard(vo,list);
		}
		
		return mav;
	}
	public List<GroupAttachVO> saveGroupBoardFile(String id,int gno,List<MultipartFile> multi,HttpServletRequest request,HttpServletResponse response) throws IOException{
		String path = request.getSession().getServletContext().getRealPath("resources/upload/group/"+gno+"/GroupBoard");
		List<GroupAttachVO> list = new ArrayList<>();
		for(MultipartFile file:multi) {
			String fileName = file.getOriginalFilename();
			if(fileName != "") {
				String uuidFileName = UUID.randomUUID().toString().replace("-","")+"_"+fileName;
				File f = new File(path,uuidFileName);
				if(!f.exists()) {
					f.mkdirs();
				}
				file.transferTo(f);
				GroupAttachVO vo = new GroupAttachVO();
				vo.setFileName(uuidFileName);
				vo.setGno(gno);
				vo.setId(id);
				vo.setOriginfileName(fileName);
				vo.setPath(path);
				list.add(vo);
			}
		}
		return list;
	}
	@RequestMapping(value="/group/TodayTodoListCheck",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView TodayTodoListCheck(int gno,String id,String today) {
		ModelAndView mav = new ModelAndView("jsonView");
		List<GroupMemberVO2> grList = groupService.getGroupMember(gno); 
		List<TodoListVO> todoList = groupService.TodayTodoListCheck(gno,today);
		List<String> grListNames = new ArrayList<>();
		List<String> todoListNames = new ArrayList<>();
		for(GroupMemberVO2 vo:grList) {
			grListNames.add(vo.getId());
		}
		for(TodoListVO vo:todoList) {
			todoListNames.add(vo.getId());
		}
//		logger.debug("현재 그룹방 회원:"+grListNames.toString());
//		logger.debug("현재날짜 일정 등록한 회원:"+todoListNames.toString());
		
		grListNames.removeAll(todoListNames);
		
//		logger.debug("일정 등록 안한 회원"+grListNames.toString());
		mav.addObject("todoListID",grListNames);
		
		return mav;
	}
	
	@RequestMapping(value="/group/getGroupBoardList",method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView GroupBoardList(@RequestParam(defaultValue="all")String search_option,
									   @RequestParam(defaultValue="") String keyword,
									   @RequestParam(defaultValue="1")int curPage,
									   int gno) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		int count = groupService.getGroupBoardCount(search_option, keyword, gno);
		
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<GroupBoardListVO> list = groupService.getGroupBoardList(start, end, search_option, keyword, gno);
		
		List<List<GroupAttachVO>> attachList = new ArrayList<>();
		for(int i = 0; i <list.size();i++) {
			int gbno = list.get(i).getGbno();
			List<GroupAttachVO> attach = groupService.getGroupAttach(gbno, gno);
			
			// 방법1: VO에 첨부파일목록 필드 추가
			list.get(i).setGroupAttachVOList(attach);
			// 방법2: 첨부파일목록을 별도로
//			attachList.add(attach);
		}
//		logger.debug("인증 게시판 리스트:"+list.toString());
//		logger.debug("인증 게시판 리스트에 해당하는 첨부파일:"+attachList.toString());
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("attach", attachList);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		map.put("gno", gno);
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping(value="/group/GroupAttachDownload",method = RequestMethod.GET)
	public void GroupAttachDownload(int gano,int gno,HttpServletResponse response,HttpServletRequest request) throws Exception{
		List<GroupFileVO> list = new ArrayList<>();
		GroupAttachVO vo = groupService.getGroupAttach(gano);
		System.out.println(vo.toString());
		
		
		//파일이름 가져오기
		String fileName = vo.getFileName();
		//파일원래이름 가져오기
		String originFileName = vo.getFileName();
		originFileName = originFileName.substring(originFileName.lastIndexOf("_")+1);
		
		// MIME Type 을 application/octet-stream 타입으로 변경
        // 무조건 팝업(다운로드창)이 뜨게 된다.
		response.setContentType("application/octet-stream");
		// 브라우저는 ISO-8859-1을 인식하기 때문에
        // UTF-8 -> ISO-8859-1로 디코딩, 인코딩 한다.
		originFileName = new String(originFileName.getBytes("UTF-8"), "iso-8859-1");
		
		//파일명 지정
		response.setHeader("Content-Disposition", "attachment; filename=\""+originFileName+"\"");
		
		OutputStream os = response.getOutputStream();
		String path = request.getSession().getServletContext().getRealPath("resources/upload/group/"+gno+"/GroupBoard");
        FileInputStream fis = new FileInputStream(path + File.separator + fileName);
        int n = 0;
        byte[] b = new byte[512];
        while((n = fis.read(b)) != -1 ) {
            os.write(b, 0, n);
        }
        fis.close();
        os.close();
	}
	
	@RequestMapping(value="/group/GroupBoardBadCheck",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView GroupBoardBadCheck(int gbno,String id) {
		ModelAndView mav = new ModelAndView("jsonView");
		GroupBoardVO grBoard = groupService.getGroupBoard(gbno);
		
		GroupGoodBadCheckVO vo = groupService.GroupBoardBadCheck(gbno,id);
		mav.addObject("check",vo);
		mav.addObject("id",id);
		return mav;
	}
	@RequestMapping(value="/group/GroupBoardGoodCheck",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView GroupBoardGoodCheck(int gbno,String id) {
		ModelAndView mav = new ModelAndView("jsonView");
		GroupBoardVO grBoard = groupService.getGroupBoard(gbno);
		
		GroupGoodBadCheckVO vo = groupService.GroupBoardBadCheck(gbno,id);
		mav.addObject("check",vo);
		mav.addObject("id",id);
		return mav;
	}
	@RequestMapping(value="/group/GroupBoardGoodInsert",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView GroupBoardGoodInsert(int gbno,String id) {
		ModelAndView mav = new ModelAndView("jsonView");
		groupService.updateGood(gbno,id);
		groupService.addGroupBoardCheck(gbno,id);
		
		return mav;
	}
	@RequestMapping(value="/group/GroupBoardBadInsert",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView GroupBoardBadInsert(int gbno,String id) {
		ModelAndView mav = new ModelAndView("jsonView");
		groupService.updateBad(gbno,id);
		groupService.addGroupBoardCheck(gbno,id);
		
		return mav;
	}
	
	@RequestMapping(value="/group/GroupBoardModifyForm",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView GroupBoardModifyForm(int gbno,int gno) {
		ModelAndView mav = new ModelAndView("jsonView");
		GroupBoardVO vo = groupService.getGroupBoard(gbno);
		List<GroupAttachVO> attach = groupService.getGroupAttach(gbno,gno);
		mav.addObject("grBoard",vo);
		mav.addObject("attach",attach);
		return mav;
	}
	
	@RequestMapping(value="/group/grBoardModify",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView grBoardModify(int curPage,
									  int gno,
									  int gbno,
									  String title,
									  String content,
									  int[] gano,
									  List<MultipartFile> multi,
									  HttpServletRequest request,
									  HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("jsonView");
		String path = request.getSession().getServletContext().getRealPath("resources/upload/group/"+gno+"/GroupBoard");
		GroupBoardVO gr = groupService.getGroupBoard(gbno);
		String id = gr.getId();
		if(gano != null) {
			List<GroupAttachVO> list = groupService.getGroupAttach(gano);
//			logger.debug("인증게시판 첨부파일:"+list.toString());
			for(int i = 0; i <list.size();i++) {
				groupService.groupBoardAttachDelete(list.get(i).getGano());
				File f = new File(path,list.get(i).getFileName());
				f.delete();
			}
		}
		if(multi.isEmpty()) {
			GroupBoardVO vo = new GroupBoardVO();
			vo.setGno(gno);
			vo.setGbno(gbno);
			vo.setTitle(title);
			vo.setContent(content);
			groupService.GroupBoardModify(vo);
			GroupBoardListVO grList = groupService.getGroupBoard(gbno,gno);
			mav.addObject("list",grList);
		}else {
			List<GroupAttachVO> list = GroupAttachSave(gbno,gno,id,multi,path,request,response);
			GroupBoardVO vo = new GroupBoardVO();
			vo.setGno(gno);
			vo.setGbno(gbno);
			vo.setTitle(title);
			vo.setContent(content);
			groupService.GroupBoardModify(vo,list);
			GroupBoardListVO grList = groupService.getGroupBoard(gbno,gno);
			List<GroupAttachVO> attach = groupService.getGroupAttach(gbno, gno);
			mav.addObject("list",grList);
			mav.addObject("attach",attach);
		}
		return mav;
	}
	
	@RequestMapping(value="/group/GroupBoardDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView GroupBoardDelete(int gbno,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("jsonView");
		GroupBoardVO vo = groupService.getGroupBoard(gbno);
		int gno = vo.getGno();
		List<GroupAttachVO> list = groupService.getGroupAttach(gbno, gno);
		
		String path = request.getSession().getServletContext().getRealPath("resources/upload/group/"+gno+"/GroupBoard");
		
		for(GroupAttachVO attach:list) {
			File f = new File(path,attach.getFileName());
			if(f.exists()) {
				f.delete();
			}
		}
		groupService.GroupBoardDelete(gbno);
		
		return mav;
	}
	
	@RequestMapping(value="/group/GroupBoardOneWriteCheck",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView GroupBoardOneWriteCheck(String id,String today,int gno) {
		ModelAndView mav = new ModelAndView("jsonView");
		GroupBoardVO gr = groupService.getGroupBoardCheck(id,today,gno);
		String result = null;
//		logger.debug("오늘 인증게시판 글쓰기 여부 데이터:"+gr);
		if(gr == null) {
			result = "Y";
		}else {
			result = "N";
		}
		mav.addObject("result",result);
		return mav;
	}
	
	@RequestMapping(value="/group/GroupBoardTest",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView GroupBoardTest(int gno,String today) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		List<GroupBoardListVO> list = groupService.GroupBoardTest(gno,today);
		List<GroupMemberVO2> groupMember = groupService.getGroupMember(gno);
		
		List<String> names = new ArrayList<>();
		List<String> grMember = new ArrayList<>();
		
		for(GroupMemberVO2 vo:groupMember) {
			grMember.add(vo.getMemberName());
		}
		
		if(list != null) {
			for(GroupBoardListVO vo:list) {
				names.add(vo.getName());
				int good = vo.getGood();
				int bad = vo.getBad();
				if(good > bad) {
//					logger.debug(vo.getId()+":"+vo.getRegdate()+"공부 계획 완료");
					TodoListVO todoList = groupService.getTodoList(gno,vo.getId(),today);
//					logger.debug("해당 계획 dto"+todoList);
					if(todoList != null) {
						groupService.todoListUpdate(todoList.getGtno());
					}
				}
			}
		}
//		logger.debug("오늘 인증게시판 목록:"+list);
		grMember.removeAll(names);
		mav.addObject("names",grMember);
		
		return mav;
	}
	
	
	
	public List<GroupAttachVO> GroupAttachSave(int gbno,int gno,String id,List<MultipartFile> multi,String path,HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<GroupAttachVO> list = new ArrayList<>();
		String uuidfileName = null;
		for(MultipartFile file:multi) {
			String fileName = file.getOriginalFilename();
			System.out.println("asdasdasd:"+fileName);
			if(fileName != "") {
				uuidfileName = UUID.randomUUID().toString().replace("-","")+"_"+fileName;
				File f = new File(path,uuidfileName);
				if(!f.exists()) {
					f.mkdirs();
				}
				file.transferTo(f);
				GroupAttachVO vo = new GroupAttachVO();
				vo.setGbno(gbno);
				vo.setGno(gno);
				vo.setOriginfileName(fileName);
				vo.setPath(path);
				vo.setFileName(uuidfileName);
				vo.setId(id);
				list.add(vo);
			}
		}
		return list;
	}
	
	
	
}
