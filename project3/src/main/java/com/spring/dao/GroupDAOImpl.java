package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

@Repository
public class GroupDAOImpl implements GroupDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public void insertStRoom(GroupVO vo) {
		sqlSession.insert("Group-Mapper.insertStRoom",vo);

	}
	@Override
	public Object getGroupNum(String code) {
		Object group_num = sqlSession.selectOne("Group-Mapper.getGroupNum",code);
		return group_num;
	}
	@Override
	public int insertStRoomMember(GroupMemberVO gMember) {
		int stgmno = 0;
		stgmno = sqlSession.insert("Group-Mapper.insertStRoomMember",gMember);
		return stgmno;
	}
	@Override
	public List<GroupVO> getGroupList(String id) {
		List<GroupVO> list = sqlSession.selectList("Group-Mapper.getGroupList",id);
		return list;
	}
	@Override
	public int getMemberCount(GroupMemberVO vo) {
		int count = sqlSession.selectOne("Group-Mapper.getMemberCount",vo);
		return count;
	}
	@Override
	public int getGroupCount(int gno) {
		int groupCount = sqlSession.selectOne("Group-Mapper.getGroupCount",gno);
		return groupCount;
	}
	@Override
	public GroupVO getGroupInfo(int gno) {
		GroupVO group = sqlSession.selectOne("Group-Mapper.getGroupInfo",gno);
		return group;
	}
	@Override
	public List<GroupMemberVO2> getGroupMember(int gno) {
		List<GroupMemberVO2> list = sqlSession.selectList("Group-Mapper.getGroupMember",gno);
		return list;
	}
	@Override
	public void modifyGroupMember(GroupMemberVO vo) {
		sqlSession.selectOne("Group-Mapper.modifyGroupMember",vo);
		
	}
	@Override
	public int groupCountCheck(String id) {
		int count = sqlSession.selectOne("Group-Mapper.groupCountCheck",id);
		return count;
	}
	@Override
	public void fileRegist(GroupFileVO vo) {
		sqlSession.insert("Group-Mapper.fileRegist",vo);
		
	}
	@Override
	public List<GroupFileVO> getGroupFileList(int gno) {
		List<GroupFileVO> list = sqlSession.selectList("Group-Mapper.getGroupFileList",gno);
		return list;
	}
	@Override
	public GroupFileVO getGroupFile(int fno) {
		GroupFileVO vo = sqlSession.selectOne("Group-Mapper.getGroupFile",fno);
		return vo;
	}
	@Override
	public void fileDelete(int fno) {
		sqlSession.delete("Group-Mapper.fileDelete",fno);
		
	}
	@Override
	public Object addChatMessage(GroupChatVO vo) {
		Object result = sqlSession.insert("Group-Mapper.addChatMessage",vo);
		return result;
	}
	@Override
	public List<GroupChatListVO> getMessages(int gno) {
		List<GroupChatListVO> list = sqlSession.selectList("Group-Mapper.getMessages",gno);
		return list;
	}
	@Override
	public void groupMemberOut(int gno,String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("id",id);
		map.put("gno",gno);
		sqlSession.delete("Group-Mapper.groupMemberOut",map);
		
	}
	@Override
	public List<DDitMemberVO> getDDitMember(int room) {
		List<DDitMemberVO> list = sqlSession.selectList("Group-Mapper.getDDitMember",room);
		return list;
	}
	@Override
	public void groupDelete(int gno) {
		sqlSession.delete("Group-Mapper.groupDelete",gno);
		
	}
	@Override
	public int getGroupListCount(String name,String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("name",name);
		map.put("id",id);
		int count = sqlSession.selectOne("Group-Mapper.getGroupListCount",map);
		return count ;
	}
	@Override
	public List<GroupVO> getGroupList(int start, int end, String name,String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("start",start);
		map.put("end",end);
		map.put("name",name);
		map.put("id",id);
		List<GroupVO> list = sqlSession.selectList("Group-Mapper.getGroupList",map);
		return list;
	}
	@Override
	public int memoWrite(MemoVO vo) {
		int cnt = sqlSession.insert("Group-Mapper.memoWrite",vo);
		return cnt;
		
	}
	@Override
	public List<MemoVO> getMemoList(int gno) {
		List<MemoVO> list = sqlSession.selectList("Group-Mapper.getMemoList",gno);
		return list;
	}
	@Override
	public int memoDelete(int mno) {
		int cnt = sqlSession.delete("Group-Mapper.memoDelete",mno);
		return cnt;
	}
	@Override
	public int dayWrite(DDAYVO day) {
		int cnt = sqlSession.insert("Group-Mapper.dayWrite",day);
		return cnt;
	}
	@Override
	public DDAYVO getDay(int gno) {
		DDAYVO dday = sqlSession.selectOne("Group-Mapper.getDay",gno);
		return dday;
	}
	@Override
	public int getGroupMemberCount(int gno) {
		int count = sqlSession.selectOne("Group-Mapper.getGroupMemberCount",gno);
		return count;
	}
	@Override
	public List<TodoListVO> getTodoList(String id,int gno) {
		Map<String,Object> map = new HashMap<>();
		map.put("id",id);
		map.put("gno",gno);
		List<TodoListVO> todoList = sqlSession.selectList("Group-Mapper.getTodoList",map);
		return todoList;
	}
	@Override
	public TodoListVO getMemberTodoList(TodoListVO vo) {
		TodoListVO result = sqlSession.selectOne("Group-Mapper.getMemberTodoList",vo);
		return result;
	}
	@Override
	public void modifyTodoList(TodoListVO vo) {
		sqlSession.update("Group-Mapper.modifyTodoList",vo);
		
	}
	@Override
	public List<TodoListVO> TodayTodoListCheck(int gno, String today) {
		Map<String,Object> map = new HashMap<>();
		map.put("gno",gno);
		map.put("today",today);
		List<TodoListVO> list = sqlSession.selectList("Group-Mapper.TodayTodoListCheck",map);
		return list;
	}
	@Override
	public void todoListWrite(TodoListVO todoList) {
		sqlSession.insert("Group-Mapper.todoListWrite",todoList);
		
	}
	@Override
	public int getGroupMemberNum(int gno,String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("gno",gno);
		map.put("id",id);
		int num = sqlSession.selectOne("Group-Mapper.getGroupMemberNum",map);
		return num;
	}
	@Override
	public void insertGroupBoard(GroupBoardVO vo) {
		sqlSession.insert("Group-Mapper.insertGroupBoard",vo);
		
	}
	@Override
	public int getGroupBoardMaxNum() {
		int num = sqlSession.selectOne("Group-Mapper.getGroupBoardMaxNum");
		return num;
	}
	@Override
	public void insertGroupAttach(GroupAttachVO attach) {
		sqlSession.insert("Group-Mapper.insertGroupAttach",attach);
		
	}
	@Override
	public int getGroupBoardCount(String search_option, String keyword, int gno) {
		Map<String,Object> map = new HashMap<>();
		map.put("gno",gno);
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		int count = sqlSession.selectOne("Group-Mapper.getGroupBoardCount",map);
		return count;
	}
	@Override
	public List<GroupBoardListVO> getGroupBoardList(int start, int end, String search_option, String keyword,int gno) {
		Map<String,Object> map = new HashMap<>();
		map.put("start",start);
		map.put("end",end);
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		map.put("gno",gno);
		List<GroupBoardListVO> list = sqlSession.selectList("Group-Mapper.getGroupBoardList",map);
		return list;
	}
	@Override
	public GroupAttachVO getGroupAttach(int gano) {
		GroupAttachVO vo = sqlSession.selectOne("Group-Mapper.getGroupAttach",gano);
		return vo;
	}
	@Override
	public GroupGoodBadCheckVO GroupBoardBadCheck(int gbno, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("gbno",gbno);
		map.put("id",id);
		GroupGoodBadCheckVO vo = sqlSession.selectOne("Group-Mapper.GroupBoardBadCheck",map);
		return vo;
	}
	@Override
	public GroupBoardVO getGroupBoard(int gbno) {
		GroupBoardVO vo = sqlSession.selectOne("Group-Mapper.getGroupBoard",gbno);
		return vo;
	}
	@Override
	public void updateBad(int gbno, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("gbno", gbno);
		map.put("id", id);
		sqlSession.update("Group-Mapper.updateBad",map);
		
	}
	@Override
	public void addGroupBoardCheck(int gbno, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("gbno", gbno);
		map.put("id", id);
		sqlSession.insert("Group-Mapper.addGroupBoardCheck",map);
		
	}
	@Override
	public void updateGood(int gbno, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("gbno", gbno);
		map.put("id", id);
		sqlSession.update("Group-Mapper.updateGood",map);
		
	}
	@Override
	public List<GroupAttachVO> getGroupAttach(int gbno, int gno) {
		Map<String,Object> map = new HashMap<>();
		map.put("gbno", gbno);
		map.put("gno", gno);
		List<GroupAttachVO> attach = sqlSession.selectList("Group-Mapper.getGroupBoardAttach",map);
		return attach;
	}
	@Override
	public void groupBoardAttachDelete(int gano) {
		sqlSession.delete("Group-Mapper.groupBoardAttachDelete",gano);
		
	}
	@Override
	public void GroupBoardModify(GroupBoardVO vo) {
		sqlSession.update("Group-Mapper.GroupBoardModify",vo);
		
	}
	@Override
	public GroupBoardListVO getGroupBoard(int gbno, int gno) {
		Map<String,Object> map = new HashMap<>();
		map.put("gbno", gbno);
		map.put("gno",gno);
		GroupBoardListVO vo = sqlSession.selectOne("Group-Mapper.getGroupboard",map);
		return vo;
	}
	@Override
	public void GroupBoardDelete(int gbno) {
		sqlSession.delete("Group-Mapper.GroupBoardDelete",gbno);
		
	}
	@Override
	public GroupBoardVO getGroupBoardCheck(String id, String today, int gno) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("today", today);
		map.put("gno",gno);
		System.out.println("today:"+today);
		GroupBoardVO vo = sqlSession.selectOne("Group-Mapper.getGroupBoardCheck",map);
		return vo;
	}
	@Override
	public List<GroupBoardListVO> GroupBoardTest(int gno, String today) {
		Map<String,Object> map = new HashMap<>();
		map.put("gno", gno);
		map.put("today", today);
		List<GroupBoardListVO> list = sqlSession.selectList("Group-Mapper.GroupBoardTest",map);
		return list;
	}
	@Override
	public TodoListVO getTodoList(int gno, String id, String today) {
		Map<String,Object> map = new HashMap<>();
		map.put("gno", gno);
		map.put("today", today);
		map.put("id", id);
		TodoListVO vo = sqlSession.selectOne("Group-Mapper.getTodoListOne",map);
		return vo;
	}
	@Override
	public void todoListDelete(int gtno) {
		sqlSession.delete("Group-Mapper.todoListDelete",gtno);
		
	}
	@Override
	public void todoListUpdate(int gtno) {
		sqlSession.update("Group-Mapper.todoListUpdate",gtno);
		
	}
	@Override
	public int getTodoListVertifyCount(int gno) {
		int count = sqlSession.selectOne("Group-Mapper.getTodoListVertifyCount",gno);
		return count;
	}
	@Override
	public int getTodoListVertifyCount(int gno, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("gno", gno);
		map.put("id", id);
		int count = sqlSession.selectOne("Group-Mapper.getMemberTodoListVertifyCount",map);
		return count;
	}
	@Override
	public List<GroupVO> getGroupList() {
		List<GroupVO> list = sqlSession.selectList("Group-Mapper.getFullGroupList");
		return list;
	}
	@Override
	public List<TodoListVO> getTodayTodoList(int gno, String today) {
		Map<String,Object> map = new HashMap<>();
		map.put("gno", gno);
		map.put("today", today);
		List<TodoListVO> list = sqlSession.selectList("Group-Mapper.getTodayTodoList",map);
		return list;
	}
	@Override
	public List<GroupVO> getMemberGroupList(String id) {
		List<GroupVO> list = sqlSession.selectList("Group-Mapper.getMemberGroupList",id);
		return list;
	}
	@Override
	public int getAllGroupListCount(String search_option, String keyword, int curPage) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("curPage", curPage);
		
		int count = sqlSession.selectOne("Group-Mapper.getAllGroupListCount",map);
		
		return count;
	}
	@Override
	public List<GroupListVO> getAllGroupList(int start, int end, String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		List<GroupListVO> list = sqlSession.selectList("Group-Mapper.getAllGroupList",map);
		
		return list;
	}
	@Override
	public List<GroupChatVO> getgroupchatList(int gno) {
		List<GroupChatVO> list = sqlSession.selectList("Group-Mapper.getgroupchatList",gno);
		return list;
	}
	@Override
	public List<GroupBoardListVO> getAllGroupBoard(int gno) {
		List<GroupBoardListVO> list = sqlSession.selectList("Group-Mapper.getAllGroupBoard",gno);
		return list;
	}
	@Override
	public TodoListVO getTodoList(int gtno) {
		TodoListVO vo = sqlSession.selectOne("Group-Mapper.getTodoListVo",gtno);
		return vo;
	}
	@Override
	public List<TodoListVO> getAllTodoList(String id, int gno) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("gno", gno);
		List<TodoListVO> list = sqlSession.selectList("Group-Mapper.getAllTodoList",map);
		
		return list;
	}
	@Override
	public GroupOutListVO getGroupOutList(String id, int gno) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("gno", gno);
		GroupOutListVO vo = sqlSession.selectOne("Group-Mapper.getGroupOutList",map);
		return vo;
	}
	@Override
	public void addGroupMemberOutList(int gno, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("gno", gno);
		sqlSession.insert("Group-Mapper.addGroupMemberOutList",map);
		
	}
	@Override
	public List<GroupBoardVO> getGroupAllBoard(int gno) {
		List<GroupBoardVO> list = sqlSession.selectList("Group-Mapper.getGroupAllBoard",gno);
		
		return list;
	}
	@Override
	public void groupModify(GroupVO vo) {
		sqlSession.update("Group-Mapper.groupModify",vo);
		
	}
	@Override
	public void groupChatModify(GroupChatVO vo) {
		sqlSession.update("Group-Mapper.groupChatModify",vo);
		
	}
	@Override
	public GroupChatVO getGroupChat(int gcno) {
		GroupChatVO vo = sqlSession.selectOne("Group-Mapper.getGroupChat",gcno);
		return vo;
	}
	@Override
	public void groupChatDelete(int gcno) {
		sqlSession.delete("Group-Mapper.groupChatDelete",gcno);
		
	}
	@Override
	public GroupVO getGroupVO(int gno) {
		GroupVO vo = sqlSession.selectOne("Group-Mapper.getGroupVO",gno);
		return vo;
	}
	@Override
	public GroupVOList getGroupListVO(int gno) {
		GroupVOList vo = sqlSession.selectOne("Group-Mapper.getGroupListVO",gno);
		return vo;
	}
	@Override
	public List<GroupMemoVO> getGroupMemoList(int gno) {
		List<GroupMemoVO> list = sqlSession.selectList("Group-Mapper.getGroupMemoList",gno);
		return list;
	}
	@Override
	public void groupMemoModify(MemoVO memo) {
		sqlSession.update("Group-Mapper.groupMemoModify",memo);
		
	}
	@Override
	public GroupMemoVO getGroupMemo(int mno) {
		GroupMemoVO vo = sqlSession.selectOne("Group-Mapper.getGroupMemo",mno);
		return vo;
	}
	@Override
	public void adminTodoListWrite(TodoListVO vo) {
		sqlSession.insert("Group-Mapper.adminTodoListWrite",vo);
		
	}


	
	
	
	

	
	
	
	
	
	
}
