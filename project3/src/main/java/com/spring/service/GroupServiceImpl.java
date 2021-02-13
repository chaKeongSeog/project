package com.spring.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.GroupDAO;
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
import com.spring.dto.GroupListVO;
import com.spring.dto.GroupMemberVO;
import com.spring.dto.GroupMemberVO2;
import com.spring.dto.GroupMemoVO;
import com.spring.dto.GroupOutListVO;
import com.spring.dto.GroupVO;
import com.spring.dto.GroupVOList;
import com.spring.dto.LectureReplyVO;
import com.spring.dto.MemoVO;
import com.spring.dto.TodoListVO;
import com.sun.media.jfxmedia.logging.Logger;

public class GroupServiceImpl implements GroupService{
	private GroupDAO groupDAO;
	public void setGroupDAO(GroupDAO groupDAO) {
		this.groupDAO = groupDAO;
	}
	@Override
	public void insertStRoom(GroupVO vo) {
		groupDAO.insertStRoom(vo);
		
	}
	@Override
	public Object getGroupNum(String code) {
		Object group_num = groupDAO.getGroupNum(code);
				
		return group_num;
	}
	@Override
	public int  insertStRoomMember(GroupMemberVO gMember) {
		int stgmno = 0;		
		stgmno = groupDAO.insertStRoomMember(gMember);
		return stgmno;
	}
	@Override
	public List<GroupVO> getGroupList(String id) {
		List<GroupVO> list = groupDAO.getGroupList(id);
		return list;
	}
	@Override
	public int getMemberCount(GroupMemberVO vo) {
		int count = groupDAO.getMemberCount(vo);
		return count;
	}
	@Override
	public int getGroupCount(int gno) {
		int groupCount = groupDAO.getGroupCount(gno);
		return groupCount;
	}
	@Override
	public GroupVO getGroupInfo(int gno) {
		GroupVO group = groupDAO.getGroupInfo(gno);
		return group;
	}
	@Override
	public List<GroupMemberVO2> getGroupMember(int gno) {
		List<GroupMemberVO2> list = groupDAO.getGroupMember(gno);
		return list;
	}
	@Override
	public void modifyGroupMember(GroupMemberVO vo) {
		groupDAO.modifyGroupMember(vo);
		
	}
	@Override
	public int groupCountCheck(String id) {
		int count = groupDAO.groupCountCheck(id);
		return count;
	}
	@Override
	public void fileRegist(GroupFileVO vo) {
		groupDAO.fileRegist(vo);
		
	}
	@Override
	public List<GroupFileVO> getGroupFileList(int gno) {
		List<GroupFileVO> list = groupDAO.getGroupFileList(gno);
		return list;
	}
	@Override
	public GroupFileVO getGroupFile(int fno) {
		GroupFileVO vo  = groupDAO.getGroupFile(fno);
		return vo;
	}
	@Override
	public void fileDelete(int fno) {
		groupDAO.fileDelete(fno);
		
	}
	@Override
	public Object addChatMessage(GroupChatVO vo) {
		Object result = groupDAO.addChatMessage(vo);
		return result;
	}
	@Override
	public List<GroupChatListVO> getMessages(int gno) {
		List<GroupChatListVO> list = groupDAO.getMessages(gno);
		return list;
	}
	@Override
	public void groupMemberOut(String id,int gno) {
		groupDAO.groupMemberOut(gno,id);
	}
	@Override
	public List<DDitMemberVO> getDDitMember(int room) {
		List<DDitMemberVO> list = groupDAO.getDDitMember(room);
		return list;
	}
	@Override
	public void groupDelete(int gno) {
		groupDAO.groupDelete(gno);
		
	}
	@Override
	public int getGroupListCount(String name,String id) {
		int count = groupDAO.getGroupListCount(name,id);
		return count;
	}
	@Override
	public List<GroupVO> getGroupList(int start, int end, String name,String id) {
		List<GroupVO> list = groupDAO.getGroupList(start,end,name,id);
		return list;
	}
	@Override
	public int memoWrite(MemoVO vo) {
		int cnt = groupDAO.memoWrite(vo);
		return cnt;
		
	}
	@Override
	public List<MemoVO> getMemoList(int gno) {
		List<MemoVO> list = groupDAO.getMemoList(gno);
		return list;
	}
	@Override
	public int memoDelete(int mno) {
		int cnt = groupDAO.memoDelete(mno);
		return cnt;
	}
	@Override
	public DDAYVO dayWrite(DDAYVO day) {
		int cnt = groupDAO.dayWrite(day);
		int gno = day.getGno();
		DDAYVO ddayVO = groupDAO.getDay(gno);
		
		return ddayVO;
	}
	@Override
	public DDAYVO getDay(int gno) {
		DDAYVO dday = groupDAO.getDay(gno);
		return dday;
	}
	@Override
	public int getGroupMemberCount(int gno) {
		int count = groupDAO.getGroupMemberCount(gno);
		return count;
	}
	@Override
	public List<TodoListVO> getTodoList(String id,int gno) {
		List<TodoListVO> todoList = groupDAO.getTodoList(id,gno);
		return todoList;
	}
	@Override
	public TodoListVO getMemberTodoList(TodoListVO vo) {
		TodoListVO result = groupDAO.getMemberTodoList(vo);
		return result;
	}
	@Override
	public void modifyTodoList(TodoListVO vo) {
		groupDAO.modifyTodoList(vo);
		
	}
	@Override
	public List<TodoListVO> TodayTodoListCheck(int gno, String today) {
		List<TodoListVO> list = groupDAO.TodayTodoListCheck(gno,today);
		return list;
	}
	@Override
	public void todoListWrite(TodoListVO todoList) {
		groupDAO.todoListWrite(todoList);
		
	}
	@Override
	public int getGroupMemberNum(int gno, String id) {
		int num = groupDAO.getGroupMemberNum(gno,id);
		return num;
	}
	@Override
	public void insertGroupBoard(GroupBoardVO vo) {
		groupDAO.insertGroupBoard(vo);
		
	}
	@Override
	public void insertGroupBoard(GroupBoardVO vo,List<GroupAttachVO> list) {
		groupDAO.insertGroupBoard(vo);
		int num = groupDAO.getGroupBoardMaxNum();
		for(GroupAttachVO grAttach:list) {
			grAttach.setGbno(num);
			groupDAO.insertGroupAttach(grAttach);
		}
		
	}
	@Override
	public int getGroupBoardCount(String search_option, String keyword, int gno) {
		int count = groupDAO.getGroupBoardCount(search_option,keyword,gno);
		return count;
	}
	@Override
	public List<GroupBoardListVO> getGroupBoardList(int start, int end, String search_option, String keyword,int gno) {
		List<GroupBoardListVO> list = groupDAO.getGroupBoardList(start,end,search_option,keyword,gno);
		
		return list;
	}
	@Override
	public GroupAttachVO getGroupAttach(int gano) {
		GroupAttachVO vo = groupDAO.getGroupAttach(gano);
		return vo;
	}
	@Override
	public GroupGoodBadCheckVO GroupBoardBadCheck(int gbno, String id) {
		GroupGoodBadCheckVO vo = groupDAO.GroupBoardBadCheck(gbno,id);
		return vo;
	}
	@Override
	public GroupBoardVO getGroupBoard(int gbno) {
		GroupBoardVO vo = groupDAO.getGroupBoard(gbno);
		return vo;
	}
	@Override
	public void updateBad(int gbno, String id) {
		groupDAO.updateBad(gbno,id);
		
	}
	@Override
	public void addGroupBoardCheck(int gbno, String id) {
		groupDAO.addGroupBoardCheck(gbno,id);
		
	}
	@Override
	public void updateGood(int gbno, String id) {
		groupDAO.updateGood(gbno,id);
		
	}
	@Override
	public List<GroupAttachVO> getGroupAttach(int gbno, int gno) {
		List<GroupAttachVO> attach = groupDAO.getGroupAttach(gbno,gno);
		return attach;
	}
	@Override
	public List<GroupAttachVO> getGroupAttach(int[] gano) {
		List<GroupAttachVO> list = new ArrayList<>();
		for(int i = 0; i <gano.length;i++) {
			GroupAttachVO vo = groupDAO.getGroupAttach(gano[i]);
			list.add(vo);
		}
		return list;
	}
	@Override
	public void groupBoardAttachDelete(int gano) {
		groupDAO.groupBoardAttachDelete(gano);
		
	}
	@Override
	public void GroupBoardModify(GroupBoardVO vo) {
		groupDAO.GroupBoardModify(vo);
		
	}
	@Override
	public void GroupBoardModify(GroupBoardVO vo, List<GroupAttachVO> list) {
		groupDAO.GroupBoardModify(vo);
		for(GroupAttachVO attach:list) {
			groupDAO.insertGroupAttach(attach);
		}
	}
	@Override
	public GroupBoardListVO getGroupBoard(int gbno, int gno) {
		GroupBoardListVO vo = groupDAO.getGroupBoard(gbno,gno);
		return vo;
	}
	@Override
	public void GroupBoardDelete(int gbno) {
		groupDAO.GroupBoardDelete(gbno);
		
	}
	@Override
	public GroupBoardVO getGroupBoardCheck(String id, String today, int gno) {
		GroupBoardVO vo = groupDAO.getGroupBoardCheck(id,today,gno);
		return vo;
	}
	@Override
	public List<GroupBoardListVO> GroupBoardTest(int gno, String today) {
		List<GroupBoardListVO> list = groupDAO.GroupBoardTest(gno,today);
		return list;
	}
	@Override
	public TodoListVO getTodoList(int gno, String id, String today) {
		TodoListVO vo = groupDAO.getTodoList(gno,id,today);
		return vo;
	}
	@Override
	public void todoListDelete(int gtno) {
		groupDAO.todoListDelete(gtno);
		
	}
	@Override
	public void todoListUpdate(int gtno) {
		groupDAO.todoListUpdate(gtno);
		
	}
	@Override
	public int getTodoListVertifyCount(int gno) {
		int count = groupDAO.getTodoListVertifyCount(gno);
		return count;
	}
	@Override
	public int getTodoListVertifyCount(int gno, String id) {
		int count = groupDAO.getTodoListVertifyCount(gno,id);
		return count;
	}
	@Override
	public void testJobMethod() {
		SimpleDateFormat format1 = new SimpleDateFormat( "yyyy-MM-dd");
		String today = format1.format (System.currentTimeMillis());
		System.out.println("test job....");
		
		List<String> names = null;
		List<String> grMember = null;
		
		List<GroupVO> list = groupDAO.getGroupList();
		
		for(GroupVO vo:list) {
			int gno = vo.getGno();
			String id = vo.getId();
			
			List<GroupMemberVO2> grmemberList = groupDAO.getGroupMember(gno);
			
			grMember = new ArrayList<>();
			for(GroupMemberVO2 member:grmemberList) {
				//해당 그룹의 맴버 리스트에 넣기
				grMember.add(member.getId());
				
			}
			
			List<TodoListVO> todoList = groupDAO.getTodayTodoList(gno,today);
			
			
			if(todoList.isEmpty()) {
				for(GroupMemberVO2 grmemList:grmemberList) {
					String user = grmemList.getId();
					
					int gmno = groupDAO.getGroupMemberNum(gno,user);
					
					TodoListVO tvo = new TodoListVO();
					tvo.setGmno(gmno);
					tvo.setId(user);
					tvo.setGno(gno);
					tvo.setTitle("[미등록]");
					tvo.setContent("[미등록]");
					
					groupDAO.todoListWrite(tvo);
				}
			}else {
				names = new ArrayList<>();
				for(TodoListVO to:todoList) {
					names.add(to.getId());
				}
				
				grMember.removeAll(names);
				
				if(!grMember.isEmpty()) {
					for(String mem:grMember) {
						String user = mem;
						int gmno = groupDAO.getGroupMemberNum(gno,user);
						TodoListVO tvo = new TodoListVO();
						tvo.setGmno(gmno);
						tvo.setId(user);
						tvo.setGno(gno);
						tvo.setTitle("[미등록]");
						tvo.setContent("[미등록]");
						groupDAO.todoListWrite(tvo);
					}
				}
			}
			//인증게시판 d-day 계획 수정
			List<GroupBoardListVO> grBoardList = groupDAO.GroupBoardTest(gno,today);
			
			if(!grBoardList.isEmpty()) {
				for(GroupBoardListVO grvo:grBoardList) {
					int good = grvo.getGood();
					
					int bad = grvo.getBad();
					
					if(good > bad) {
						TodoListVO todolistvo = groupDAO.getTodoList(gno,grvo.getId(),today);
						if(todolistvo != null) {
							groupDAO.todoListUpdate(todolistvo.getGtno());
						}
					}
				}
			}
			//미인증 내역 5개 넘으면 강제 퇴장
			for(GroupMemberVO2 gmem:grmemberList) {
				int count = groupDAO.getTodoListVertifyCount(gno,gmem.getId());
				if(count > 5) {
					groupDAO.groupMemberOut(gno,gmem.getId());
					
					groupDAO.addGroupMemberOutList(gno,gmem.getId());
					
					GroupChatVO chat = new GroupChatVO();
					chat.setContent("해당 그룹방의 "+gmem.getMemberName()+"님은 미인증 일정 계획이 5개가 초과하여 강퇴 퇴장 조치하였습니다");
					chat.setGno(gno);
					chat.setId("admin1234");
					groupDAO.addChatMessage(chat);
				}
			}
		}
		
		
		
		
	}
//	List<TodoListVO> todoList = groupDAO.getTodoList(id, gno);
	@Override
	public List<GroupVO> getMemberGroupList(String id) {
		List<GroupVO> list = groupDAO.getMemberGroupList(id);
		return list;
	}
	@Override
	public int getAllGroupListCount(String search_option, String keyword, int curPage) {
		int count = groupDAO.getAllGroupListCount(search_option,keyword,curPage);
		return count;
	}
	@Override
	public List<GroupListVO> getAllGroupList(int start, int end, String search_option, String keyword) {
		
		List<GroupListVO> list =  groupDAO.getAllGroupList(start,end,search_option,keyword);
		
		return list;
	}
	@Override
	public List<GroupChatVO> getgroupchatList(int gno) {
		List<GroupChatVO> list = groupDAO.getgroupchatList(gno);
		return list;
	}
	@Override
	public List<GroupBoardListVO> getAllGroupBoard(int gno) {
		List<GroupBoardListVO> list = groupDAO.getAllGroupBoard(gno);
		return list;
	}
	@Override
	public TodoListVO getTodoList(int gtno) {
		TodoListVO vo = groupDAO.getTodoList(gtno);
		return vo;
	}
	@Override
	public List<TodoListVO> getAllTodoList(String id, int gno) {
		List<TodoListVO> list = groupDAO.getAllTodoList(id,gno);
		return list;
	}
	@Override
	public GroupOutListVO getGroupOutList(String id, int gno) {
		GroupOutListVO vo = groupDAO.getGroupOutList(id,gno);
		return vo;
	}
	@Override
	public List<GroupBoardVO> getGroupAllBoard(int gno) {
		List<GroupBoardVO> list = groupDAO.getGroupAllBoard(gno);
		return list;
	}
	@Override
	public void groupModify(GroupVO vo) {
		groupDAO.groupModify(vo);
		
	}
	@Override
	public void groupChatModify(GroupChatVO vo) {
		groupDAO.groupChatModify(vo);
		
	}
	@Override
	public GroupChatVO getGroupChat(int gcno) {
		GroupChatVO vo = groupDAO.getGroupChat(gcno);
		return vo;
	}
	@Override
	public void groupChatDelete(int gcno) {
		groupDAO.groupChatDelete(gcno);
		
	}
	@Override
	public GroupVO getGroupVO(int gno) {
		GroupVO vo = groupDAO.getGroupVO(gno);
		return vo;
	}
	@Override
	public GroupVOList getGroupListVO(int gno) {
		GroupVOList vo = groupDAO.getGroupListVO(gno);
		return vo;
	}
	@Override
	public List<GroupMemoVO> getGroupMemoList(int gno) {
		List<GroupMemoVO> list = groupDAO.getGroupMemoList(gno);
		return list;
	}
	@Override
	public void groupMemoModify(MemoVO memo) {
		groupDAO.groupMemoModify(memo);
		
	}
	@Override
	public GroupMemoVO getGroupMemo(int mno) {
		GroupMemoVO vo = groupDAO.getGroupMemo(mno);
		return vo;
	}
	@Override
	public void adminTodoListWrite(TodoListVO vo) {
		groupDAO.adminTodoListWrite(vo);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	ModelAndView mav = new ModelAndView("jsonView");
//	
//	List<GroupBoardListVO> list = groupService.GroupBoardTest(gno,today);
//	List<GroupMemberVO2> groupMember = groupService.getGroupMember(gno);
//	
//	List<String> names = new ArrayList<>();
//	List<String> grMember = new ArrayList<>();
//	
//	for(GroupMemberVO2 vo:groupMember) {
//		grMember.add(vo.getMemberName());
//	}
//	
//	if(list != null) {
//		for(GroupBoardListVO vo:list) {
//			names.add(vo.getName());
//			int good = vo.getGood();
//			int bad = vo.getBad();
//			if(good > bad) {
////				logger.debug(vo.getId()+":"+vo.getRegdate()+"공부 계획 완료");
//				TodoListVO todoList = groupService.getTodoList(gno,vo.getId(),today);
////				logger.debug("해당 계획 dto"+todoList);
//				if(todoList != null) {
//					groupService.todoListUpdate(todoList.getGtno());
//				}
//			}
//		}
//	}
////	logger.debug("오늘 인증게시판 목록:"+list);
//	grMember.removeAll(names);
	
	
	
	
	
	
}
