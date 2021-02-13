package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

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

@Service
public interface GroupService {

	void insertStRoom(GroupVO vo);

	Object getGroupNum(String code);

	int insertStRoomMember(GroupMemberVO gMember);

	List<GroupVO> getGroupList(String id);

	int getMemberCount(GroupMemberVO vo);

	int getGroupCount(int gno);

	GroupVO getGroupInfo(int gno);

	List<GroupMemberVO2> getGroupMember(int gno);

	void modifyGroupMember(GroupMemberVO vo);

	int groupCountCheck(String id);

	void fileRegist(GroupFileVO vo);

	List<GroupFileVO> getGroupFileList(int gno);

	GroupFileVO getGroupFile(int fno);

	void fileDelete(int fno);

	Object addChatMessage(GroupChatVO vo);
	
	List<GroupChatListVO> getMessages(int gno);
	
	void groupMemberOut(String id,int gno);
	
	List<DDitMemberVO> getDDitMember(int room);
	
	void groupDelete(int gno);
	
	int getGroupListCount(String name,String id);
	
	List<GroupVO> getGroupList(int start,int end,String name,String id);
	
	int memoWrite(MemoVO vo);
	
	List<MemoVO> getMemoList(int gno);
	
	int memoDelete(int mno);
	
	DDAYVO dayWrite(DDAYVO day);
	
	DDAYVO getDay(int gno);
	
	int getGroupMemberCount(int gno);
	
	List<TodoListVO> getTodoList(String id,int gno);
	
	TodoListVO getMemberTodoList(TodoListVO vo);
	
	void modifyTodoList(TodoListVO vo);
	
	List<TodoListVO> TodayTodoListCheck(int gno,String today);
	
	void todoListWrite(TodoListVO todoList);
	
	int getGroupMemberNum(int gno,String id);
	
	void insertGroupBoard(GroupBoardVO vo);
	
	void insertGroupBoard(GroupBoardVO vo,List<GroupAttachVO> list);
	
	int getGroupBoardCount(String search_option,String keyword,int gno);
	
	List<GroupBoardListVO> getGroupBoardList(int start,int end,String search_option,String keyword,int gno);
	
	GroupAttachVO getGroupAttach(int gano);
	
	GroupGoodBadCheckVO GroupBoardBadCheck(int gbno,String id);
	
	GroupBoardVO getGroupBoard(int gbno);
	
	GroupBoardListVO getGroupBoard(int gbno,int gno);
	
	void updateBad(int gbno,String id);
	
	void updateGood(int gbno,String id);
	
	void addGroupBoardCheck(int gbno,String id);
	
	List<GroupAttachVO> getGroupAttach(int gbno,int gno);
	
	List<GroupAttachVO> getGroupAttach(int[] gano);
	
	void groupBoardAttachDelete(int gano);
	
	void GroupBoardModify(GroupBoardVO vo);
	
	void GroupBoardModify(GroupBoardVO vo,List<GroupAttachVO> list);
	
	void GroupBoardDelete(int gbno);
	
	GroupBoardVO getGroupBoardCheck(String id,String today,int gno);
	
	List<GroupBoardListVO> GroupBoardTest(int gno,String today);
	
	TodoListVO getTodoList(int gno,String id,String today);
	
	void todoListDelete(int gtno);
	
	void todoListUpdate(int gtno);
	
	int getTodoListVertifyCount(int gno);
	
	int getTodoListVertifyCount(int gno,String id);
	
	void testJobMethod();

	List<GroupVO> getMemberGroupList(String id);
	
	int getAllGroupListCount(String search_option,String keyword,int curPage);
	
	List<GroupListVO> getAllGroupList(int start,int end,String search_option,String keyword);
	
	List<GroupChatVO> getgroupchatList(int gno);
	
	List<GroupBoardListVO> getAllGroupBoard(int gno);
	
	TodoListVO getTodoList(int gtno);
	
	List<TodoListVO> getAllTodoList(String id,int gno);

	GroupOutListVO getGroupOutList(String id, int gno);

	List<GroupBoardVO> getGroupAllBoard(int gno);
	
	void groupModify(GroupVO vo);
	
	void groupChatModify(GroupChatVO vo);
	
	GroupChatVO getGroupChat(int gcno);
	
	void groupChatDelete(int gcno);
	
	GroupVO getGroupVO(int gno);
	
	GroupVOList getGroupListVO(int gno);
	
	List<GroupMemoVO> getGroupMemoList(int gno);
	
	void groupMemoModify(MemoVO memo);
	
	GroupMemoVO getGroupMemo(int mno);
	
	void adminTodoListWrite(TodoListVO vo);
	
}
