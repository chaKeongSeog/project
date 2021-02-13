package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.common.Pager;
import com.spring.dto.AttachVO;
import com.spring.dto.BoardListVO;
import com.spring.dto.BoardVO;
import com.spring.dto.ChatListVO;
import com.spring.dto.ChatVO;
import com.spring.dto.DDitMemberVO;
import com.spring.dto.EvaluationVO;
import com.spring.dto.FaqVO;
import com.spring.dto.GroupAttachVO;
import com.spring.dto.GroupBoardListVO;
import com.spring.dto.GroupBoardVO;
import com.spring.dto.GroupChatListVO;
import com.spring.dto.GroupChatVO;
import com.spring.dto.GroupFileVO;
import com.spring.dto.GroupListVO;
import com.spring.dto.GroupMemberVO;
import com.spring.dto.GroupMemberVO2;
import com.spring.dto.GroupMemoVO;
import com.spring.dto.GroupScheduleVO;
import com.spring.dto.GroupVO;
import com.spring.dto.GroupVOList;
import com.spring.dto.LectureReplyVO;
import com.spring.dto.MemberListVO;
import com.spring.dto.MemberVO;
import com.spring.dto.MemoVO;
import com.spring.dto.QnaVO;
import com.spring.dto.ReplyVO;
import com.spring.dto.ScheduleVO;
import com.spring.dto.TodoListVO;
import com.spring.service.AdminService;
import com.spring.service.ChatService;
import com.spring.service.FaqService;
import com.spring.service.FreeBoardService;
import com.spring.service.GroupService;
import com.spring.service.LectureService;
import com.spring.service.MemberService;
import com.spring.service.NoticeService;
import com.spring.service.PdsService;
import com.spring.service.QnaService;
import com.spring.service.ReplyService;
import com.spring.service.ScheduleService;
import com.sun.corba.se.impl.protocol.FullServantCacheLocalCRDImpl;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private FreeBoardService freeService;
	
	@Autowired
	private LectureService lectureService;
	
	@Autowired
	private PdsService pdsService;
	
	@Autowired
	private ReplyService replyService;

	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private FaqService faqService;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping(value="/admin/chatList",method = RequestMethod.GET)
	public ModelAndView chatList(@RequestParam(defaultValue = "1") int curPage,
			  					 @RequestParam(defaultValue = "all") String search_option,
			  					 @RequestParam(defaultValue = "") String keyword) {
		ModelAndView mav = new ModelAndView("jsonView");
		String url="/admin/chat/chatList";
		int count = chatService.getChatListCount(search_option,keyword);
		
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<ChatVO> list = chatService.getChatList(start,end,search_option,keyword);
		
		Map<String,Object> map = new HashMap<>();
		map.put("chat",list);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		
		mav.addObject("map",map);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/chatDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView chatDelete(int cno) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		chatService.delete(cno);
		
		return mav;
	}
	
	@RequestMapping(value="/excludes/admin/chatRegistForm",method = RequestMethod.GET)
	public ModelAndView chatRegistForm(int cno[],String search_option,String keyword,int curPage) {
		ModelAndView mav = new ModelAndView("jsonView");
		String url="admin/chat/chatWrite";
		mav.setViewName(url);
		
		List<String> list = new ArrayList<>();
		for(int i = 0; i <cno.length;i++) {
			ChatVO chat = chatService.getChatVO(cno[i]);
			if(!list.contains(chat.getFromID())) {
				list.add(chat.getFromID());
			}
		}
		mav.addObject("curPage",curPage);
		mav.addObject("keyword",keyword);
		mav.addObject("search_option",search_option);
		mav.addObject("chatList",list);
		
		return mav;
	}
	
	@RequestMapping(value="/excludes/admin/chatDetail",method = RequestMethod.GET)
	public ModelAndView chatDetail(int cno) {
		ModelAndView mav = new ModelAndView("jsonView");
		String url="admin/chat/chatDetail";
		
		ChatVO chat = chatService.getChatVO(cno);
		
		mav.addObject("chat",chat);
		mav.setViewName(url);
		return mav;
	}
	
	
	@RequestMapping(value="/admin/chatWrite",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView chatWrite(String id,String content,String[] fromID) {
		ModelAndView mav = new ModelAndView("jsonView");
		//String url="admin/chat/chatWrite";
		
		for(int i = 0; i <fromID.length;i++) {
			chatService.regist(id, fromID[i], content);
		}
		
		
		
		
		return mav;
	}
	
	
	
	@RequestMapping(value="/admin/chatDeleteList",method = RequestMethod.POST)
	public ModelAndView chatDeleteList(int[] cno,int curPage) {
		String url="redirect:chatList?curPage="+curPage;
		ModelAndView mav = new ModelAndView();
		
		for(int i = 0; i <cno.length;i++) {
			chatService.delete(cno[i]);
		}
		
		mav.setViewName(url);

		return mav;
	}
	
	@RequestMapping(value="/admin/chatModifyForm",method = RequestMethod.GET)
	public ModelAndView chatModifyForm(int cno,String search_option,String keyword,int curPage) {
		ModelAndView mav = new ModelAndView("jsonView");
		String url="admin/chat/chatModify";
		ChatVO chat = chatService.getChatVO(cno);
		Map<String ,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("curPage", curPage);
		mav.addObject("chat",chat);
		mav.setViewName(url);
		mav.addObject("map",map);
		return mav;
	}
	
	@RequestMapping(value="/admin/chatVOModify",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView chatModify(int cno,String id,String content) {
		ModelAndView mav = new ModelAndView("jsonView");
		//String url="/admin/chat/chatModify";
		ChatVO vo = new ChatVO();
		vo.setCno(cno);
		vo.setContent(content);
		chatService.chatModify(vo);
		
		
		
		
		//mav.setViewName(url);
		return mav;
	}
	
	
	@RequestMapping(value = "/admin/groupList", method = RequestMethod.GET)
	public ModelAndView groupList(@RequestParam(defaultValue = "1") int curPage,
								  @RequestParam(defaultValue = "all") String search_option,
								  @RequestParam(defaultValue = "") String keyword,
								  HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String url="/admin/group/groupList";
		int count = groupService.getAllGroupListCount(search_option,keyword,curPage);
		
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<GroupListVO> groupList = groupService.getAllGroupList(start,end,search_option, keyword);
		
		for(int i = 0; i <groupList.size();i++) {
			//해당 그룹의 채팅내역
			List<GroupChatVO> grchat = groupService.getgroupchatList(groupList.get(i).getGno());
			
			//해당 그룹의 파일공유 내역
			List<GroupFileVO> grfile = groupService.getGroupFileList(groupList.get(i).getGno());
			
			//해당 그룹의 인증게시판 내역
			List<GroupBoardListVO> grBoard = groupService.getAllGroupBoard(groupList.get(i).getGno());
			
			for(int j = 0; j<grBoard.size();j++) {
				//해당그룹의 인증게시판 게시물의 파일 내역
				List<GroupAttachVO> grAttach = groupService.getGroupAttach(grBoard.get(j).getGbno(),groupList.get(i).getGno());
				grBoard.get(j).setGroupAttachVOList(grAttach);
			}
			
			//해당그룹의 그룹원들
			List<GroupMemberVO2> member = groupService.getGroupMember(groupList.get(i).getGno());
				
			for(int k = 0; k <member.size();k++) {
				//해당 그룹의 그룹원의 공부 계획들
				List<TodoListVO> todoList = groupService.getAllTodoList(member.get(k).getId(),groupList.get(i).getGno());
				member.get(k).setTodoList(todoList);
			}
			
			//해당그룹의 메모 내역
			List<MemoVO> memoList = groupService.getMemoList(groupList.get(i).getGno());
			
			//해당 그룹의 메모 수
			groupList.get(i).setGroupMemoCount(memoList.size());
			
			//해당 그룹의 스케줄 내역
			List<GroupScheduleVO> scheduleList = scheduleService.getGroupScheduleList(groupList.get(i).getGno());
			
			//해당 그룹의 스케줄 수
			groupList.get(i).setGroupScheduleCount(scheduleList.size());
			
			//해당 그룹의 인증게시판 수
			groupList.get(i).setGroupBoardCount(grBoard.size());
			
			//해당 그룹의 그룹원 수
			groupList.get(i).setGroupMemberCount(member.size());
			
			//해당 그룹의 파일공유 수
			groupList.get(i).setGroupFileCount(grfile.size());
			
			//해당그룹의 채팅수
			groupList.get(i).setGroupChatCount(grchat.size());
			
			
			groupList.get(i).setBoard(grBoard);
			groupList.get(i).setSchedule(scheduleList);
			groupList.get(i).setMemo(memoList);
			groupList.get(i).setMember(member);
			groupList.get(i).setFile(grfile);
			groupList.get(i).setChat(grchat);
		}
		
		Map<String,Object> map = new HashMap<>();
		map.put("pager",pager);
		map.put("list", groupList);
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		
		mav.addObject("map",map);
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping(value="excludes/admin/groupScheduleDetail",method = RequestMethod.GET)
	public ModelAndView groupSchedule(int gno) {
		ModelAndView mav = new ModelAndView("jsonView");
		String url = "admin/group/groupSchedule";
		List<GroupScheduleVO> list = scheduleService.getGroupScheduleList(gno);
		int count = scheduleService.getGroupScheduleCount(gno);
		mav.setViewName(url);
		mav.addObject("groupSchedule",list);
		mav.addObject("groupSchedulecount",count);
		mav.addObject("gno",gno);
		
		return mav;
	}
	
	@RequestMapping(value="excludes/admin/groupMemoDetail",method = RequestMethod.GET)
	public ModelAndView groupMemoDetail(int gno) {
		ModelAndView mav = new ModelAndView("jsonView");
		String url = "admin/group/groupMemoDetail";
		
		mav.setViewName(url);
		
		List<GroupMemoVO> list = groupService.getGroupMemoList(gno); 
		
		mav.addObject("memo",list);
		mav.addObject("gno",gno);
		
		
		return mav;
	}
	
	@RequestMapping(value="/admin/groupMemoModify",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView memoModify(int gno,String content,String id,int mno) {
		ModelAndView mav = new ModelAndView("jsonView");
		MemoVO memo = new MemoVO();
		memo.setContent(content);
		memo.setGno(gno);
		memo.setId(id);
		memo.setMno(mno);
		
		groupService.groupMemoModify(memo);
		GroupMemoVO vo = groupService.getGroupMemo(mno);
		
		mav.addObject("gno",gno);
		mav.addObject("memo",vo);
		return mav;
	}
	
	@RequestMapping(value="/admin/groupMemoWrite",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView groupMemoWrite(int gno,String content,String id) {
		ModelAndView mav = new ModelAndView("jsonView");
		MemoVO memo = new MemoVO();
		memo.setContent(content);
		memo.setGno(gno);
		memo.setId(id);
		
		groupService.memoWrite(memo);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/groupMemoDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView groupMemoDelete(int mno) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		groupService.memoDelete(mno);
		
		return mav;
	}
	
	
	
	
	@RequestMapping(value = "/admin/faqModifyForm", method = RequestMethod.GET)
	public ModelAndView faqModifyForm(int bno,String boardType) {
		String url="admin/client/faqmodify";
		ModelAndView mav = new ModelAndView();
		FaqVO vo = faqService.getFaq(bno);
		mav.addObject("faq",vo);
		mav.addObject("boardType",boardType);
		

		mav.setViewName(url);		
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/admin/clientList", method = RequestMethod.GET)
	public ModelAndView qnaList(@RequestParam(defaultValue = "1") int curPage,
								  @RequestParam(defaultValue = "all") String search_option,
								  @RequestParam(defaultValue = "") String keyword,
								  @RequestParam(defaultValue = "E01") String boardType,
									 HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String url="/admin/client/clientList";
		if(boardType.equals("E01")) {
			int count = qnaService.getListCount(search_option, keyword);
			Pager pager = new Pager(count, curPage);
			
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			List<QnaVO> list = qnaService.getList(start, end, search_option, keyword);
			
			Map<String,Object> map = new HashMap<>();
			map.put("list",list);
			map.put("pager",pager);
			map.put("search_option", search_option);
			map.put("keyword", keyword);
			map.put("boardType","E01");
			mav.addObject("map",map);
		}else {
			int count = faqService.getListCount(search_option, keyword);
			
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			
			List<FaqVO> list = faqService.getList(start, end, search_option, keyword);
			
			Map<String,Object> map = new HashMap<>();
			map.put("list",list);
			map.put("pager",pager);
			map.put("search_option", search_option);
			map.put("keyword", keyword);
			map.put("boardType","F01");
			mav.addObject("map",map);
		}	
		mav.setViewName(url);
		return mav;
	}
	
	
	@RequestMapping(value = "/excludes/admin/qnaDetail", method = RequestMethod.GET)
	public ModelAndView qnaDetail(int bno,String boardType) {
		String url="admin/client/qnaDetail";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(url);
		QnaVO qna = qnaService.getQna(bno);
		String content = qna.getContent().replaceAll("\n", "<br>");
		qna.setContent(content);
		mav.addObject("qna",qna);
		mav.setViewName(url);
		
		
		return mav;
	}
	@RequestMapping(value = "/excludes/admin/faqDetail", method = RequestMethod.GET)
	public ModelAndView faqDetail(int bno,String boardType) {
		String url="admin/client/faqDetail";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(url);
		FaqVO vo = faqService.getFaq(bno);
		String content = vo.getContent().replaceAll("\n", "<br>");
		vo.setContent(content);
		mav.addObject("faq",vo);
		mav.setViewName(url);
		
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/qnaModifyForm", method = RequestMethod.GET)
	public ModelAndView qnaModifyForm(int bno,String boardType) {
		String url="admin/client/qnamodify";
		ModelAndView mav = new ModelAndView();
		QnaVO qna = qnaService.getQna(bno);
		mav.addObject("qna",qna);
		mav.addObject("boardType",boardType);
		
		
		mav.setViewName(url);
		
		
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/groupregistForm", method = RequestMethod.GET)
	public String groupregistForm() {
		
		String url="admin/group/groupregist";
		
		
		return url;
	}
	
	@RequestMapping(value="/admin/groupDelete",method = RequestMethod.POST)
	public ModelAndView groupDelete(int[] gno,int curPage,HttpServletRequest request) {
		String url="redirect:groupList?curPage="+curPage;
		ModelAndView mav = new ModelAndView();
		
		for(int i = 0; i <gno.length;i++) {
			List<GroupBoardVO> grBoard = groupService.getGroupAllBoard(gno[i]);
			String attachpath = request.getSession().getServletContext().getRealPath("resources/upload/group/"+gno[i]+"/GroupBoard/");
			for(GroupBoardVO board:grBoard) {
				int gbno = board.getGbno();
				List<GroupAttachVO> grAttachList = groupService.getGroupAttach(gbno, gno[i]);
				for(GroupAttachVO attach:grAttachList) {
					String fileName = attach.getFileName();
					File f = new File(attachpath,fileName);
					f.delete();
				}
			}
			File f2 = new File(attachpath);
			f2.delete();
		}
	
		for(int i = 0; i <gno.length;i++) {
			List<GroupFileVO> fileList = groupService.getGroupFileList(gno[i]);
			String path = request.getSession().getServletContext().getRealPath("resources/upload/group/"+gno[i]);
			for(GroupFileVO vo:fileList) {
				String fileName = vo.getFileName();
				File f = new File(path,fileName);
				f.delete();
			}
			File file = new File(path);
			file.delete();
		}
		
		for(int i = 0; i <gno.length;i++) {
			groupService.groupDelete(gno[i]);
		}
		
		mav.setViewName(url);

		return mav;
	}
	
	@RequestMapping(value="/admin/groupOneDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView groupOneDelete(int gno,HttpServletRequest request) {
		//String url="redirect:/admin/freeList";
		ModelAndView mav = new ModelAndView("jsonView");
		
		List<GroupBoardVO> grBoard = groupService.getGroupAllBoard(gno);
		String attachpath = request.getSession().getServletContext().getRealPath("resources/upload/group/"+gno+"/GroupBoard/");
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
		
		List<GroupFileVO> fileList = groupService.getGroupFileList(gno);
		String path = request.getSession().getServletContext().getRealPath("resources/upload/group/"+gno);
		for(GroupFileVO vo:fileList) {
			String fileName = vo.getFileName();
			File f = new File(path,fileName);
			f.delete();
		}
		File file = new File(path);
		file.delete();
		
		
		groupService.groupDelete(gno);
		
		

		return mav;
	}
	
	
	@RequestMapping(value = "/excludes/admin/groupMemberDetail", method = RequestMethod.GET)
	public ModelAndView groupMemberDetail(int gno) {
		String url="admin/group/groupMemberDetail";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(url);
		
		List<GroupMemberVO2> member = groupService.getGroupMember(gno);
		for(int k = 0; k <member.size();k++) {
			//해당 그룹의 그룹원의 공부 계획들
			List<TodoListVO> todoList = groupService.getAllTodoList(member.get(k).getId(),gno);
			member.get(k).setTodoList(todoList);
		}
		mav.addObject("member",member);
		mav.addObject("gno",gno);
		
		return mav;
	}
	

	@RequestMapping(value="/admin/groupTodoListModify",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView todoListModify(int gtno,int gno,String id,String title,String content) {
		ModelAndView mav = new ModelAndView("jsonView");
		TodoListVO vo = new TodoListVO();
		vo.setGtno(gtno);
		vo.setGno(gno);
		vo.setTitle(title);
		vo.setContent(content.replaceAll("\n", "<br>"));
		vo.setId(id);
		
		groupService.modifyTodoList(vo);
		TodoListVO todo = groupService.getTodoList(gtno);
		mav.addObject("todoList",todo);
			
		return mav;
	}
	
	@RequestMapping(value="/admin/groupTodoListDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView groupTodoListDelete(int gtno) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		groupService.todoListDelete(gtno);
			
		return mav;
	}
	
	@RequestMapping(value = "/excludes/admin/groupFileDetail", method = RequestMethod.GET)
	public ModelAndView groupFileDetail(int gno) {
		String url="admin/group/groupFileDetail";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(url);
		List<GroupFileVO> file = groupService.getGroupFileList(gno);
		mav.addObject("file",file);
		mav.addObject("gno",gno);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/groupFileModify",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView grBoardModify(int gno,
									  String id,
									  int[] fno,
									  List<MultipartFile> multi,
									  HttpServletRequest request,
									  HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("jsonView");
		String path = request.getSession().getServletContext().getRealPath("resources/upload/group/"+gno);
		if(fno != null) {
//			logger.debug("인증게시판 첨부파일:"+list.toString());
			for(int i = 0; i <fno.length;i++) {
				GroupFileVO vo = groupService.getGroupFile(fno[i]);
				groupService.fileDelete(fno[i]);
				File f = new File(path,vo.getFileName());
				f.delete();
			}
		}
		if(!multi.isEmpty()) {
			boolean result = GroupfileCheck(multi,response);
			List<GroupFileVO> list = savaGroupFile(multi,request,path,gno,id);
			for(GroupFileVO group:list) {
				groupService.fileRegist(group);
			}
			mav.addObject("gno",gno);
		}
		return mav;
	}
	
	@RequestMapping(value = "/excludes/admin/groupBoardDetail", method = RequestMethod.GET)
	public ModelAndView groupBoardDetail(int gno,HttpServletRequest request) {
		String url="admin/group/groupBoardDetail";
		ModelAndView mav = new ModelAndView();
		
		List<GroupBoardListVO> list = groupService.getAllGroupBoard(gno);
		String attachpath = request.getSession().getServletContext().getRealPath("resources/upload/group/"+gno+"/GroupBoard/");
		
		for(int i = 0; i <list.size();i++) {
			int gbno = list.get(i).getGbno();
			List<GroupAttachVO> attachList = groupService.getGroupAttach(gbno, gno);
			list.get(i).setGroupAttachVOList(attachList);
		}
		
		mav.addObject("list",list);
		mav.addObject("gno",gno);
		mav.setViewName(url);
		return mav;
	}
	
	
	@RequestMapping(value="/admin/groupModifyForm",method = RequestMethod.GET)
	public ModelAndView groupModifyForm(int gno) {
		String url = "admin/group/groupmodify";
		GroupVO vo = groupService.getGroupInfo(gno);
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("group",vo);
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping(value="/admin/groupModify",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView groupModify(int gno,String id,String name,String goal,String code) {
		ModelAndView mav = new ModelAndView("jsonView");
		GroupVO vo = new GroupVO();
		vo.setGno(gno);
		vo.setGoal(goal);
		vo.setId(id);
		vo.setName(name);
		vo.setCode(code);
		groupService.groupModify(vo);
		
		
		return mav;
	}
	
	@RequestMapping(value="/excludes/admin/groupChatDetail",method = RequestMethod.GET)
	public ModelAndView groupChatDetail(int gno) {
		ModelAndView mav = new ModelAndView("jsonView");
		String url = "admin/group/groupChatDetail";
		List<GroupChatListVO> list = groupService.getMessages(gno);
		mav.addObject("chat",list);
		mav.addObject("gno",gno);
		mav.setViewName(url);
		return mav;
	}
	
	
//	@RequestMapping(value="/admin/groupTodoListWrite",method = RequestMethod.POST)
//	@ResponseBody
//	public ModelAndView groupTodoListWrite(int gno,String id,String title,String content) {
//		ModelAndView mav = new ModelAndView("jsonView");
//		//int gmno = groupService.getGroupMemberNum(gno,id);
//		TodoListVO vo = new TodoListVO();
//		vo.setGno(gno);
//		vo.setId(id);
//		vo.setTitle(title);
//		vo.setContent(content);
//		
//		groupService.adminTodoListWrite(vo);
//		
//		return mav;
//	}
	
	
	@RequestMapping(value="/admin/groupChatWrite",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView groupChatWrite(int gno,String content,String id) {
		ModelAndView mav = new ModelAndView("jsonView");
		String url = "admin/group/groupChatDetail";
		GroupChatVO vo = new GroupChatVO();
		vo.setContent(content);
		vo.setGno(gno);
		vo.setId(id);
		Object result = groupService.addChatMessage(vo);
		
		return mav;
	}
	@RequestMapping(value="/admin/chatModify",method = RequestMethod.POST)
	public ModelAndView chatModify(int gcno,int gno,String id,String content) {
		ModelAndView mav = new ModelAndView("jsonView");
		GroupChatVO chat = new GroupChatVO();
		chat.setContent(content);
		chat.setGcno(gcno);
		chat.setGno(gno);
		chat.setId(id);
		
		groupService.groupChatModify(chat);
		
		GroupChatVO vo = groupService.getGroupChat(gcno);
		mav.addObject("chat",vo);
		return mav;
	}
	
	@RequestMapping(value="/admin/groupChatDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView groupChatDelete(int gcno) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		groupService.groupChatDelete(gcno);
		
		return mav;
	}
	
	@RequestMapping(value="/excludes/admin/groupDetail",method = RequestMethod.GET)
	public ModelAndView groupDetail(int gno) {
		ModelAndView mav = new ModelAndView("jsonView");
		String url = "admin/group/groupDetail";
		GroupVOList group = groupService.getGroupListVO(gno);
		
		mav.addObject("gno",gno);
		mav.addObject("group",group);
		mav.setViewName(url);
		return mav;
	}
	
	boolean GroupfileCheck(List<MultipartFile> multi,HttpServletResponse response) throws IOException{
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
	
	public  List<GroupFileVO> savaGroupFile(List<MultipartFile> multi, HttpServletRequest request,String uploadpath,int gno,String id) throws IllegalStateException, IOException {
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
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/admin/qnamodify",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView qnamodify(int  bno,String boardType,@RequestParam(defaultValue = "test") String id, String title,@RequestParam(defaultValue = "test") String content) throws Exception{
		//String url="/admin/noticeDetail";
		ModelAndView mav = new ModelAndView("jsonView");
		
		QnaVO vo = new QnaVO();
		vo.setBno(bno);
		vo.setContent(content);
		vo.setId(id);
		vo.setTitle(title);
		
		qnaService.modify(vo);
		
	
		
		//mav.addObject("notice",vo);
		//mav.setViewName(url);
		
		return mav;
	}

	
	
	
	@RequestMapping(value="/admin/faqmodify",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView faqmodify(int  bno,String boardType,@RequestParam(defaultValue = "test") String id,@RequestParam(defaultValue = "test") String content) throws Exception{
		//String url="/admin/noticeDetail";
		ModelAndView mav = new ModelAndView("jsonView");
		
		FaqVO vo = new FaqVO();
		vo.setBno(bno);
		vo.setTitle(content);
		vo.setId(id);
		faqService.modify(vo);
		
		//mav.addObject("notice",vo);
		//mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/qnaregistForm", method = RequestMethod.GET)
	public ModelAndView qnaregistForm() {
		String url="admin/client/qnaregist";
		ModelAndView mav = new ModelAndView();

		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/faqregistForm", method = RequestMethod.GET)
	public ModelAndView faqregistForm() {
		String url="admin/client/faqregist";
		ModelAndView mav = new ModelAndView();

		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/qnaregist",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView qnaregist(@RequestParam(defaultValue = "test") String id,String title,@RequestParam(defaultValue = "test") String content,String boardType) throws Exception{
		String url="admin/noticeDetail";
		ModelAndView mav = new ModelAndView("jsonView");
		QnaVO vo = new QnaVO();
		vo.setContent(content);
		vo.setId(id);
		vo.setTitle(title);
		qnaService.regist(vo);
		
		
		return mav;
	}
	
	@RequestMapping(value="/admin/faqregist",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView faqregist(@RequestParam(defaultValue = "test") String id,String title,String boardType) throws Exception{
		String url="admin/noticeDetail";
		ModelAndView mav = new ModelAndView("jsonView");
		FaqVO vo = new FaqVO();
		vo.setTitle(title);
		vo.setId(id);
		faqService.regist(vo);
		
		
		return mav;
	}
	
	@RequestMapping(value="/admin/qnaDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView qnaDelete(int bno,String boardType) {
		//String url="redirect:/admin/freeList";
		ModelAndView mav = new ModelAndView("jsonView");
		
		qnaService.delete(bno);

		return mav;
	}
	
	@RequestMapping(value="/admin/faqDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView faqDelete(int bno,String boardType) {
		//String url="redirect:/admin/freeList";
		ModelAndView mav = new ModelAndView("jsonView");
		
		faqService.delete(bno);

		return mav;
	}
	
	@RequestMapping(value="/admin/qnaDeleteList",method = RequestMethod.POST)
	public ModelAndView qnaDeleteList(int[] bno,String boardType,int curPage) {
		String url="redirect:clientList?curPage="+curPage+"&boardType="+boardType;
		ModelAndView mav = new ModelAndView();
		
		for(int i = 0; i <bno.length;i++) {
			qnaService.delete(bno[i]);
		}
		
		
		
		mav.setViewName(url);

		return mav;
	}
	
	@RequestMapping(value="/admin/faqDeleteList",method = RequestMethod.POST)
	public ModelAndView faqDeleteList(int[] bno,String boardType,int curPage) {
		String url="redirect:clientList?curPage="+curPage+"&boardType="+boardType;
		ModelAndView mav = new ModelAndView();
		
		for(int i = 0; i <bno.length;i++) {
			faqService.delete(bno[i]);
		}
		
		
		
		mav.setViewName(url);

		return mav;
	}
	
	@RequestMapping(value="/admin/faqAnswer",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView faqAnswer(int bno,@RequestParam(defaultValue = "test") String id,String content) throws Exception{
		String url="admin/noticeDetail";
		ModelAndView mav = new ModelAndView("jsonView");
		ReplyVO vo = new ReplyVO();
		vo.setBno(bno);
		vo.setId(id);
		vo.setContent(content);
		faqService.answer(vo);
		
		
		return mav;
	}
	
	@RequestMapping(value="/admin/qnaAnswer",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView qnaAnswer(int bno,@RequestParam(defaultValue = "test") String id,String content) throws Exception{
		String url="admin/noticeDetail";
		ModelAndView mav = new ModelAndView("jsonView");
		ReplyVO vo = new ReplyVO();
		vo.setBno(bno);
		vo.setId(id);
		vo.setContent(content);
		qnaService.answer(vo);
		
		
		return mav;
	}
	

	
	@RequestMapping(value="/admin/replyList",method = RequestMethod.GET)
	public ModelAndView replyList(@RequestParam(defaultValue = "1") int curPage,
								  @RequestParam(defaultValue = "all") String search_option,
								  @RequestParam(defaultValue = "") String keyword,
								  @RequestParam(defaultValue = "A01") String boardType) throws Exception{
		String brd_gb = boardType;
		String url="/admin/reply/replyList";
		ModelAndView mav = new ModelAndView();
		
		if(!boardType.equals("B01")) {
			int count = replyService.getReplyCount(search_option,keyword,brd_gb);
			
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			
			List<ReplyVO> list = replyService.getAdminReplyList(start,end,brd_gb,search_option,keyword);
			
			System.out.println("replyList:"+list.toString());
			
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("pager",pager);
			map.put("list",list);
			map.put("boardType",brd_gb);
			map.put("search_option",search_option);
			map.put("keyword",keyword);
			System.out.println("boardType:"+brd_gb);
			mav.addObject("map",map);
			
		}else {
			int count = replyService.getlecturereplyCount(search_option,keyword);
			
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			
			List<ReplyVO> list = replyService.getAdminlecturereReplyList(start,end,search_option,keyword);
			System.out.println("replyList:"+list.toString());
			
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("pager",pager);
			map.put("list",list);
			map.put("boardType",boardType);
			map.put("search_option",search_option);
			map.put("keyword",keyword);
			mav.addObject("map",map);
		}
		mav.setViewName(url);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/admin/replyModifyForm", method = RequestMethod.GET)
	public ModelAndView replyModifyForm(int rno,String boardType) {
		String url="admin/reply/replymodify";
		ModelAndView mav = new ModelAndView();
		if(boardType.equals("B01")) {
			LectureReplyVO vo = lectureService.getReplyOne(rno);
			
			mav.addObject("reply",vo);
			mav.addObject("boardType",boardType);
		}else {
			ReplyVO vo = replyService.getReply(rno);
			
			mav.addObject("reply",vo);
			mav.addObject("boardType",boardType);
			
		}
		mav.setViewName(url);
		
		
		
		return mav;
	}
	
	@RequestMapping(value="/admin/replymodify",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView replymodify(int  rno,String boardType,@RequestParam(defaultValue = "test") String id, @RequestParam(defaultValue = "test") String content) throws Exception{
		//String url="/admin/noticeDetail";
		ModelAndView mav = new ModelAndView("jsonView");
		if(boardType.equals("B01")) {
			LectureReplyVO vo = new LectureReplyVO();
			vo.setRno(rno);
			vo.setContent(content);
			vo.setId(id);
			
			lectureService.replyModify(rno, content);
		}else {
			ReplyVO vo = new ReplyVO();
			vo.setRno(rno);
			vo.setId(id);
			vo.setContent(content);
			
			replyService.modify(vo);
		}
	
		
		//mav.addObject("notice",vo);
		//mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/replyDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView replyDelete(int rno,String boardType) {
		//String url="redirect:/admin/freeList";
		ModelAndView mav = new ModelAndView("jsonView");
		
		if(boardType.equals("B01")) {
			lectureService.replyDeleteOne(rno);
		}else {
			replyService.delete(rno);
		}
		//mav.setViewName(url);

		return mav;
	}
	
	@RequestMapping(value="/admin/replyDeleteList",method = RequestMethod.POST)
	public ModelAndView replyDeleteList(int[] rno,String boardType,int curPage) {
		String url="redirect:replyList?curPage="+curPage+"&boardType="+boardType;
		ModelAndView mav = new ModelAndView();
		
		if(boardType.equals("B01")) {
			for(int i = 0; i <rno.length;i++) {
				lectureService.replyDeleteOne(rno[i]);
			}
		}else {
			for(int i = 0; i <rno.length;i++) {
				replyService.delete(rno[i]);
			}
		}
		
		
		
		mav.setViewName(url);

		return mav;
	}
	
	@RequestMapping(value = "/excludes/admin/replyDetail", method = RequestMethod.GET)
	public ModelAndView replyDetail(int rno,String boardType) {
		String url="admin/reply/replyDetail";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(url);
		
		if(boardType.equals("B01")) {
			LectureReplyVO vo = lectureService.getReplyOne(rno);
			mav.addObject("reply",vo);
		}else {
			ReplyVO vo = replyService.getReply(rno);
			mav.addObject("reply",vo);
		}
		
		return mav;
	}
	
	
	@RequestMapping(value = "/admin/replyregistForm", method = RequestMethod.GET)
	public ModelAndView replyregistForm(String boardType,int bno) {
		String url="admin/reply/replyregist";
		ModelAndView mav = new ModelAndView();
		if(boardType.equals("B01")) {
			mav.addObject("boardType",boardType);
			mav.addObject("eno",bno);
			mav.setViewName(url);
		}else {
			mav.addObject("boardType",boardType);
			mav.addObject("bno",bno);
			mav.setViewName(url);
		}
		
		
		return mav;
	}
	
	@RequestMapping(value="admin/replyregist",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView replyregist(int bno,@RequestParam(defaultValue = "test") String id, @RequestParam(defaultValue = "test") String content,String boardType) throws Exception{
		String url="admin/noticeDetail";
		ModelAndView mav = new ModelAndView("jsonView");
		if(boardType.equals("B01")) {
			LectureReplyVO vo = new LectureReplyVO();
			vo.setEno(bno);
			vo.setId(id);
			vo.setContent(content);
			lectureService.replyWrite(vo);
		}else {
			ReplyVO reply = new ReplyVO();
			reply.setBno(bno);
			reply.setBrd_gb(boardType);
			reply.setContent(content);
			reply.setId(id);
			replyService.write(reply);
			
		}
		
		return mav;
	}
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/admin/noticeList", method = RequestMethod.GET)
	public ModelAndView boardList(@RequestParam(defaultValue = "1") int curPage,
								  @RequestParam(defaultValue = "all") String search_option,
								  @RequestParam(defaultValue = "") String keyword,
								  @RequestParam(defaultValue = "notice") String boardType,
									 HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String url="admin/noticeList";
		System.out.println("boardTypeaaa:"+boardType);
		int count = noticeService.getListCount(search_option, keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardListVO> list = noticeService.getSearchNoticeList(start, end, search_option, keyword);
		
		logger.debug("공지사항 리스트:"+list);
		Map<String,Object> map = new HashMap<>();
		map.put("list",list);
		map.put("pager",pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("boardType","notice");
		mav.addObject("map",map);
		
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/noticeregistForm", method = RequestMethod.GET)
	public String noticeregistForm() {
		
		String url="admin/noticeregist";
		
		
		return url;
	}
	
	@RequestMapping(value="admin/noticeregist",method = RequestMethod.POST)
	public ModelAndView noticeregist(@RequestParam(defaultValue = "test") String id,@RequestParam(defaultValue = "test") String title, @RequestParam(defaultValue = "test") String content) throws Exception{
		String url="admin/noticeDetail";
		ModelAndView mav = new ModelAndView("jsonView");
		BoardVO notice = new BoardVO();
		notice.setId(id);
		notice.setTitle(title);
		notice.setContent(content);
		noticeService.regist(notice);
		int bno = noticeService.getBno();
		BoardListVO vo = noticeService.getDetail(bno);
		mav.addObject("notice",vo);
		
		
		return mav;
	}
	
	@RequestMapping(value="/excludes/admin/noticeDetail",method = RequestMethod.GET)
	public ModelAndView noticedetail(int bno) throws Exception{
		
		String url="/admin/noticeDetail";
		ModelAndView mav = new ModelAndView();
		
		BoardListVO notice = noticeService.getDetail(bno);
		//조회수 증가
		//noticeService.updateHit(bno);
		
		mav.addObject("notice",notice);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/noticeDelete",method = RequestMethod.POST)
	public ModelAndView boardDelete(int[] bno,String boardType,String search_option,String keyword,int curPage) {
		String url="redirect:/admin/noticeList?search_option="+search_option+"&keyword="+keyword+"&curPage="+curPage;
		ModelAndView mav = new ModelAndView();
		
		for(int i = 0; i <bno.length;i++) {
			noticeService.delete(bno[i]);
		}
		
		
		mav.setViewName(url);

		return mav;
	}
	@RequestMapping(value="admin/noticeModifyForm",method = RequestMethod.GET)
	public ModelAndView noticeModifyForm(int bno) throws Exception{
		
		String url="/admin/noticemodify";
		ModelAndView mav = new ModelAndView();
		
		BoardListVO board = noticeService.getDetail(bno);
		//조회수 증가
		//freeService.updateHit(bno);
		
		mav.addObject("notice",board);
		mav.setViewName(url);
		
		return mav;
	}
	
	
	
	@RequestMapping(value="/admin/noticemodify",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView noticemodify(int  bno,@RequestParam(defaultValue = "test") String id,@RequestParam(defaultValue = "test") String title, @RequestParam(defaultValue = "test") String content) throws Exception{
		//String url="/admin/noticeDetail";
		ModelAndView mav = new ModelAndView("jsonView");
		BoardVO board = new BoardVO();
		board.setBno(bno);
		board.setId(id);
		board.setTitle(title);
		board.setContent(content);
		noticeService.modify(board);
		BoardListVO vo = noticeService.getDetail(bno);
		mav.addObject("notice",vo);
		//mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/NoticeDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView NoticeDelete(int bno) {
		//String url="redirect:/admin/freeList";
		ModelAndView mav = new ModelAndView("jsonView");
		
		
		noticeService.delete(bno);
		
		
		
		//mav.setViewName(url);

		return mav;
	}
	@RequestMapping(value = "/admin/freeList", method = RequestMethod.GET)
	public ModelAndView freeList(@RequestParam(defaultValue = "1") int curPage,
								  @RequestParam(defaultValue = "all") String search_option,
								  @RequestParam(defaultValue = "") String keyword,
								  @RequestParam(defaultValue = "notice") String boardType,
									 HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println("asdasffrrer"+boardType);
		String url="admin/freeList";
		int count = freeService.getListCount(search_option, keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardListVO> list = freeService.getSearchFreeList(start, end, search_option, keyword);
		
		logger.debug("자유게시판 리스트:"+list);
		Map<String,Object> map = new HashMap<>();
		map.put("list",list);
		map.put("pager",pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("boardType","free");
		mav.addObject("map",map);
		
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/freeregistForm", method = RequestMethod.GET)
	public String freeregistForm() {
		
		String url="admin/freeregist";
		
		
		return url;
	}
	
	
	@RequestMapping(value="/admin/freeregist",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView regist(@RequestParam(defaultValue = "test") String id,@RequestParam(defaultValue = "test") String title, @RequestParam(defaultValue = "test") String content) throws Exception{
		String url="admin/freeList";
		ModelAndView mav = new ModelAndView("jsonView");
		BoardListVO freeBoard = new BoardListVO();
		freeBoard.setId(id);
		freeBoard.setTitle(title);
		freeBoard.setContent(content);
		freeService.regist(freeBoard);
		int bno = freeService.getBno();
		freeBoard = freeService.getDetail(bno);
		mav.addObject("freeBoard",freeBoard);
		
		
		return mav;
	}
	@RequestMapping(value="/admin/freeDelete",method = RequestMethod.POST)
	public ModelAndView freeDelete(int[] bno,String boardType,String search_option,String keyword,int curPage) {
		String url="redirect:/admin/freeList?search_option="+search_option+"&keyword="+keyword+"&curPage="+curPage;
		ModelAndView mav = new ModelAndView();
		
		for(int i = 0; i <bno.length;i++) {
			freeService.delete(bno[i]);
		}
		
		
		mav.setViewName(url);

		return mav;
	}
	
	@RequestMapping(value="/admin/FreeDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView FreeDelete(int bno) {
		//String url="redirect:/admin/freeList";
		ModelAndView mav = new ModelAndView("jsonView");
		
		
		freeService.delete(bno);
		
		
		
		//mav.setViewName(url);

		return mav;
	}
	
	@RequestMapping(value="/excludes/admin/freeDetail",method = RequestMethod.GET)
	public ModelAndView detail(int bno) throws Exception{
		
		String url="/admin/freeDetail";
		ModelAndView mav = new ModelAndView();
		
		BoardListVO freeBoard = freeService.getDetail(bno);
		//조회수 증가
		//freeService.updateHit(bno);
		
		mav.addObject("freeBoard",freeBoard);
		mav.setViewName(url);
		
		return mav;
	}
	
	
	@RequestMapping(value="/admin/freeModifyForm",method = RequestMethod.GET)
	public ModelAndView freeModifyForm(int bno) throws Exception{
		
		String url="/admin/freemodify";
		ModelAndView mav = new ModelAndView();
		
		BoardListVO freeBoard = freeService.getDetail(bno);
		//조회수 증가
		//freeService.updateHit(bno);
		
		mav.addObject("freeBoard",freeBoard);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="admin/freemodify",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView modify(int  bno,@RequestParam(defaultValue = "test") String id,@RequestParam(defaultValue = "test") String title, @RequestParam(defaultValue = "test") String content) throws Exception{
		//String url="/admin/freeDetail";
		ModelAndView mav = new ModelAndView("jsonView");
		BoardVO board = new BoardVO();
		board.setBno(bno);
		board.setId(id);
		board.setTitle(title);
		board.setContent(content);
		freeService.modify(board);
		BoardListVO vo = freeService.getDetail(bno);
		mav.addObject("freeBoard",vo);
		//mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/evalList", method = RequestMethod.GET)
	public ModelAndView evalList(@RequestParam(defaultValue = "1") int curPage,
								  @RequestParam(defaultValue = "all") String search_option,
								  @RequestParam(defaultValue = "") String keyword,
								  @RequestParam(defaultValue = "notice") String boardType,
									 HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println("asdasffrrer"+boardType);
		String url="admin/evalList";
		int count = lectureService.getListCount(search_option, keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<EvaluationVO> list = lectureService.getList(start, end, search_option, keyword);
		
		logger.debug("수강후기 리스트:"+list);
		Map<String,Object> map = new HashMap<>();
		map.put("list",list);
		map.put("pager",pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("boardType","eval");
		mav.addObject("map",map);
		
		
		return mav;
	}

	@RequestMapping(value = "/admin/evalregistForm", method = RequestMethod.GET)
	public String reportRegistForm() {
		
		String url="admin/evalregist";
		
		
		return url;
	}
	
	@RequestMapping(value = "/admin/evalregist", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView regist(String id,String lecturename,String professorname,String year,String month,String divide,String title,String content,String totalscore ) throws Exception{
		String url="admin/evalDetail";
		ModelAndView mav = new ModelAndView("jsonView");
		
		EvaluationVO eval = new EvaluationVO();
		eval.setId(id);
		eval.setLecturename(lecturename);
		eval.setProfessorname(professorname);
		eval.setYear(year);
		eval.setMonth(month);
		eval.setDivide(divide);
		eval.setTitle(title);
		eval.setContent(content);
		eval.setTotalscore(totalscore);
		
		EvaluationVO vo = lectureService.regist(eval);
		
		
		mav.addObject("lecture",vo);
		return mav;
	}
	@RequestMapping(value="/excludes/admin/evalDetail",method = RequestMethod.GET)
	public ModelAndView evaldetail(int eno) throws Exception{
		
		String url="/admin/evalDetail";
		ModelAndView mav = new ModelAndView();
		
		EvaluationVO vo = lectureService.getEvaluation(eno);
		//조회수 증가
		//noticeService.updateHit(bno);
		
		mav.addObject("lecture",vo);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/evalDelete",method = RequestMethod.POST)
	public ModelAndView evalDelete(int[] bno,String boardType,String search_option,String keyword,int curPage) {
		String url="redirect:/admin/evalList?search_option="+search_option+"&keyword="+keyword+"&curPage="+curPage;
		ModelAndView mav = new ModelAndView();
		
		for(int i = 0; i <bno.length;i++) {
			lectureService.delete(bno[i]);
		}
		
		
		mav.setViewName(url);

		return mav;
	}
	@RequestMapping(value="/admin/EvalDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView EvalDelete(int eno) {
		//String url="redirect:/admin/freeList";
		ModelAndView mav = new ModelAndView("jsonView");
		
		
		lectureService.delete(eno);
		
		
		
		//mav.setViewName(url);

		return mav;
	}
	
	@RequestMapping(value="/admin/evalModifyForm",method=RequestMethod.GET)
	public ModelAndView updateForm(int eno) {
		String url  = "admin/evalmodify";
		EvaluationVO vo = lectureService.getEvaluation(eno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("lecture",vo);
		mav.setViewName(url);
		
		return mav; 
	}
	
	@RequestMapping(value="/admin/evalmodify",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView modify(EvaluationVO eval) {
		//String url  = "admin/evalDetail";
		lectureService.modify(eval);
		
		int eno = eval.getEno();
		EvaluationVO vo = lectureService.getEvaluation(eno);
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("lecture",vo);
		//mav.setViewName(url);
		
		return mav; 
	}
	@RequestMapping(value = "/admin/pdsList", method = RequestMethod.GET)
	public ModelAndView pdsList(@RequestParam(defaultValue = "1") int curPage,
								  @RequestParam(defaultValue = "all") String search_option,
								  @RequestParam(defaultValue = "") String keyword,
								  @RequestParam(defaultValue = "notice") String boardType,
									 HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println("asdasffrrer"+boardType);
		String url="admin/pdsList";
		int count = pdsService.getFdsListCount(search_option, keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardListVO> list = pdsService.getFdsList(start, end, search_option, keyword);
		for(int i = 0; i <list.size();i++) {
			int attachCount = pdsService.getAttachCount(list.get(i).getBno());
			list.get(i).setAttachCount(attachCount);
		}
		logger.debug("자료실 리스트:"+list);
		Map<String,Object> map = new HashMap<>();
		map.put("list",list);
		map.put("pager",pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("boardType","pds");
		mav.addObject("map",map);
		
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/pdsregistForm", method = RequestMethod.GET)
	public String regist() {
		String url="admin/pdsregist";
		
		
		return url;
	}
	
	@RequestMapping(value = "/admin/pdsregist", method = RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public ModelAndView registForm(String id,String title,String content,List<MultipartFile> multi,HttpServletResponse response,HttpServletRequest request) throws IOException{
		String url="admin/pdsDetail";
		ModelAndView mav = new ModelAndView();
		List<AttachVO> list = new ArrayList<>();
		BoardListVO board = new BoardListVO();
		board.setId(id);
		board.setTitle(title);
		board.setContent(content);
		if(multi.isEmpty()) {
			pdsService.regist(board);
			int bno = pdsService.getMaxBno();
			BoardListVO vo = pdsService.getBoard(bno);
			mav.addObject("pds",vo);
//			mav.setViewName(url);
		}else {
			list = saveFile(id,title,content,multi,response,request);
			pdsService.regist(list,board);
			int bno = pdsService.getMaxBno();
			BoardListVO vo = pdsService.getBoard(bno);
			List<AttachVO> attachList = pdsService.getAttachList(bno);
			mav.addObject("pds",vo);
			mav.addObject("attach",attachList);
//			mav.setViewName(url);
		}
		
		
		return mav;
	}
	
	@RequestMapping(value="/excludes/admin/pdsDetail",method = RequestMethod.GET)
	public ModelAndView pdsDetail(int bno) throws Exception{
		String url="/admin/pdsDetail";
		ModelAndView mav = new ModelAndView();
		BoardListVO pds = pdsService.getBoard(bno);
		List<AttachVO> attach = pdsService.getAttachList(bno);
		pdsService.updateHit(bno);		
		
		mav.addObject("pds",pds);
		mav.addObject("attach",attach);
		mav.setViewName(url);
		
		
		return mav;
	}
	
	@RequestMapping(value="/admin/pdsDelete",method = RequestMethod.POST)
	public ModelAndView delete(int[] bno,HttpServletRequest request,String search_option,String keyword,int curPage) {
		ModelAndView mav = new ModelAndView();
		
		String path = request.getSession().getServletContext().getRealPath("resources/upload/pds");
		String url="redirect:/admin/pdsList?search_option="+search_option+"&keyword="+keyword+"&curPage="+curPage;
		
		for(int i = 0; i <bno.length;i++) {
			List<AttachVO> list = pdsService.getAttachList(bno[i]);
			for(int j = 0;j<list.size();j++) {
				for(AttachVO attach:list) {
					File f = new File(path,attach.getFileName());
					f.delete();
				}
			}
			pdsService.delete(bno[i]);
		}
		
		mav.setViewName(url);
		return mav;
	}
	@RequestMapping(value="/admin/PdsOneDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView PdsDelete(int bno,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("jsonView");
		String path = request.getSession().getServletContext().getRealPath("resources/upload/pds");
		
		List<AttachVO> list = pdsService.getAttachList(bno);
		for(int j = 0;j<list.size();j++) {
			for(AttachVO attach:list) {
				File f = new File(path,attach.getFileName());
				f.delete();
			}
		}
		pdsService.delete(bno);
		
		
		return mav;
	}
	

	@RequestMapping(value="/admin/pdsModifyForm",method = RequestMethod.GET)
	public ModelAndView pdsModifyForm(int bno) throws Exception{
		String url="/admin/pdsmodify";
		ModelAndView mav = new ModelAndView();
		
		BoardListVO board = pdsService.getBoard(bno);
		List<AttachVO> list = pdsService.getAttachList(bno);
		
		

		mav.addObject("pds",board);
		mav.addObject("attach",list);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/pdsmodify",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView modify(int[] ano,
							   int bno,
							   String id,
							   String title,
							   String content,
							   List<MultipartFile> multi,
							   HttpServletRequest request,
							   HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView();
		//String url="/admin/pdsDetail";
		//mav.setViewName(url);
		String path = request.getSession().getServletContext().getRealPath("resources/upload/pds");
		if(ano != null) {
			List<AttachVO> list = pdsService.getAttachList(ano);
			pdsService.attachDelete(list);
			for(AttachVO attach:list) {
				File f = new File(path,attach.getFileName());
				f.delete();
			}
		}
		if(multi.isEmpty()) {
			BoardListVO board = new BoardListVO();
			board.setBno(bno);
			board.setId(id);
			board.setTitle(title);
			board.setContent(content);
			pdsService.modify(board);
			BoardListVO vo = pdsService.getBoard(bno);
			mav.addObject("pds",vo);
		}else {
			List<AttachVO> list = saveFile(id, title, content, multi, response, request);	
			BoardListVO board = new BoardListVO();
			board.setBno(bno);
			board.setId(id);
			board.setTitle(title);
			board.setContent(content);
			pdsService.modify(board,list);
			BoardListVO vo = pdsService.getBoard(bno);
			List<AttachVO> attach = pdsService.getAttachList(bno);
			mav.addObject("pds",vo);
			mav.addObject("attach",attach);
		}
		
		return mav;
	}
	
	public List<AttachVO> saveFile(String id,String title,String content,List<MultipartFile> multi,HttpServletResponse response,HttpServletRequest request) throws IOException{
		List<AttachVO> list = new ArrayList<>();
		String path = request.getSession().getServletContext().getRealPath("resources/upload/pds/");
		for(MultipartFile file:multi) {
			String fileName = file.getOriginalFilename();
			if(fileName != "") {
				String uuidFileName = UUID.randomUUID().toString().replace("-","")+"_"+fileName;
				File f = new File(path,uuidFileName);
				if(!f.exists()) {
					f.mkdirs();
				}
				file.transferTo(f);
				AttachVO vo = new AttachVO();
				vo.setFileName(uuidFileName);
				vo.setOriginFileName(fileName);
				vo.setPath(path);
				vo.setId(id);
				list.add(vo);
			}
		}
		return list;
	}
	
	@RequestMapping(value = "/admin/memberList", method = RequestMethod.GET)
	public ModelAndView home(@RequestParam(defaultValue = "1") int curPage,
							 @RequestParam(defaultValue = "all") String search_option,
							 @RequestParam(defaultValue = "") String keyword,
							 HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String url="admin/memberList";
		
		int count = adminService.getMemberListCount(search_option,keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<MemberVO> list = adminService.getmemberList(start,end,search_option,keyword);
		
		logger.debug("회원 리스트:"+list);
		
		Map<String,Object> map = new HashMap<>();
		map.put("list",list);
		map.put("pager",pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.addObject("map",map);
		return mav;
	}
	@RequestMapping(value="/admin/join",method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String uploadByMultipartFile(String id,String pwd,String name,String email ,
										String tel,String authority,
										@RequestParam("file") MultipartFile multi,
										HttpServletRequest request,
										HttpServletResponse response,
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
		member.setAuthority(authority);
		adminService.join(member);
		
		return "redirect:memberList";
	}	
	
	@RequestMapping(value="excludes/admin/memberModifyForm",method = RequestMethod.GET)
	public ModelAndView memberModifyForm(String id) throws Exception{
		String url="/admin/memberModify";
		ModelAndView mav = new ModelAndView();
		
		MemberVO vo = memberService.getMember(id);
		
		

		mav.addObject("member",vo);
		mav.setViewName(url);
		
		return mav;
	}
	@RequestMapping(value="/admin/memberModify",method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public String memberModify(String id,String user,String name,String email,
										String tel,String authority,
										@RequestParam("file") MultipartFile multi,
										HttpServletRequest request,
										HttpServletResponse response,
										Model model) throws Exception{
		String message = null;
		boolean result = true;
		String fileName = null;
		String url = "redirect:memberList";
		
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setName(name);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setAuthority(authority);
		
//		if(!dditCheck(name,response)) {
//			return null;
//		}
		if(!multi.isEmpty()) {
			String filename = multi.getOriginalFilename();
			filename = filename.substring(filename.lastIndexOf(".")+1);
			logger.debug("파일형식:"+filename);
			
			//용량 확인 5MB
			if(multi.getSize() > 1024*1024*5){
				message  = "파일 용량 초과입니다";
				result = false;
			}
			if(filename.equals("JPG") || filename.equals("jpg") || filename.equals("PNG") || filename.equals("png")) {

			}else {
				message  = "파일 형식은 jpg,png이어야 합니다";
				result = false;
			}
			
			if(!result) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script> alert('"+message+"') </script>");
				out.println("<script> history.go(-1);</script>");
				return null;
			}
			fileName = multi.getOriginalFilename();
			
			fileName = saveFile(multi, request, fileName,model);
			vo.setFileName(fileName);
			
			adminService.memberModify(vo);
		}else {
			MemberVO mem = adminService.getMember(id);
			
			vo.setFileName(mem.getFileName());
			
			adminService.memberModify(vo);
		}
		MemberVO mem = adminService.getMember(user);
		logger.debug("mem:"+mem);
		
//		if(mem.getAuthority().equals("user")) {
//			response.setContentType("text/html;charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script> alert('관리자 페이지에 접근할 권한이 없습니다') </script>");
//			out.println("<script>location.href='/project3/index'</script>");
//			
//			return null;
//		}else if(mem.getAuthority().equals("disabled")) {
//			response.setContentType("text/html;charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script> alert('관리자 페이지에 접근할 권한이 없습니다') </script>");
//			out.println("<script>location.href='/project3/index'</script>");
//			return null;
//		}
		String authority2 = mem.getAuthority();
		return authority2;
	}	
	
	@RequestMapping(value = "/admin/memberDetail", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView memberDetail(String id,HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("jsonView");
		String url="admin/memberList";
		MemberVO vo = adminService.getMember(id);
		logger.debug("회원:"+vo);
		
		mav.addObject("member",vo);
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/memberDelete", method = RequestMethod.POST)
	public String memberDelete(String id,String user,HttpServletRequest request,HttpServletResponse response) throws Exception{
		String url="redirect:memberList";
		adminService.memberDelete(id);
		MemberVO mem = adminService.getMember(user);
		if(mem.getAuthority().equals("disabled")) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('관리자 페이지에 접근할 권한이 없습니다') </script>");
			out.println("<script>location.href='/project3/index'</script>");
			return null;
		}
		
		return url;
	}
	
	@RequestMapping(value="/admin/memberDeleteList",method = RequestMethod.POST)
	public ModelAndView memberDeleteList(String[] user,String myid,HttpServletResponse response,String search_option,String keyword,int curPage) throws IOException{
		String url="redirect:memberList?search_option="+search_option+"&keyword="+keyword+"&curPage="+curPage;
		ModelAndView mav = new ModelAndView();
		
		for(int i = 0; i <user.length;i++) {
			memberService.delete(user[i]);
		}
		MemberVO member = memberService.getMember(myid);
		if(member == null) {
			PrintWriter out = response.getWriter();
			out.println("<script> alert('관리자 페이지에 접근할 권한이 없습니다') </script>");
			out.println("<script>location.href='/project3/index'</script>");
			return null;
		}
		
		mav.setViewName(url);
		return mav;
	}
	
	
	
	@RequestMapping(value = "/admin/dditmemberList", method = RequestMethod.GET)
	public ModelAndView dditmemberList(@RequestParam(defaultValue = "1") int curPage,
										 @RequestParam(defaultValue = "all") String search_option,
										 @RequestParam(defaultValue = "") String keyword,
										 HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String url="admin/ddit/dditmemberList";
		
		int count = adminService.getdditMemberListCount(search_option,keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<DDitMemberVO> list = adminService.getdditmemberList(start,end,search_option,keyword);
		
		logger.debug("회원 리스트:"+list);
		
		Map<String,Object> map = new HashMap<>();
		map.put("list",list);
		map.put("pager",pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.addObject("map",map);
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping(value = "admin/dditRegist", method = RequestMethod.GET)
	public String dditRegist() {
		String url="admin/ddit/regist";
		
		
		return url;
	}
	
	@RequestMapping(value="/admin/dditRegitst",method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String dditRegitst(DDitMemberVO ddit) throws Exception{
	
		
		DDitMemberVO member = new DDitMemberVO();
		
		member.setName(ddit.getName());
		member.setAddr1(ddit.getAddr1());
		member.setAddr2(ddit.getAddr2());
		member.setKind(ddit.getKind());
		member.setTel(ddit.getTel());
		member.setRoom(ddit.getRoom());
		
		
		adminService.dditJoin(member);
		
		return "redirect:dditmemberList";
	}	
	
	@RequestMapping(value="/admin/dditmemberDelete",method = RequestMethod.POST)
	public ModelAndView dditmemberDelete(int[] dno,String boardType,String search_option,String keyword,int curPage) {
		String url="redirect:dditmemberList?search_option="+search_option+"&keyword="+keyword+"&curPage="+curPage;
		ModelAndView mav = new ModelAndView();
		
		for(int i = 0; i <dno.length;i++) {
			adminService.dditdelete(dno[i]);
		}
		
		
		mav.setViewName(url);

		return mav;
	}
	
	@RequestMapping(value = "/admin/dditmemberDetail", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView dditmemberDetail(int dno,HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("jsonView");
		String url="admin/memberList";
		DDitMemberVO vo = adminService.getdditmemger(dno);
		
		mav.addObject("ddit",vo);
		
		return mav;
	}
	
	
	@RequestMapping(value="/admin/dditmemberModify",method=RequestMethod.POST)
	public ModelAndView dditmemberModify(DDitMemberVO ddit,String search_option,String keyword,int curPage) {
		String url="redirect:dditmemberList?search_option="+search_option+"&keyword="+keyword+"&curPage="+curPage;
		adminService.dditmodify(ddit);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(url);
		
		return mav; 
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
