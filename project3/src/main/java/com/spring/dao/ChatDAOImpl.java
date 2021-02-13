package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.dto.ChatListVO;
import com.spring.dto.ChatVO;

@Repository
public class ChatDAOImpl implements ChatDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public List<ChatListVO> getList(String fromID, String toID, int cno) {
		Map<String,Object> map = new HashMap<>();
		map.put("fromID",fromID);
		map.put("toID",toID);
		map.put("cno",cno);
		List<ChatListVO> list = sqlSession.selectList("Chat-Mapper.getList",map);
		return list;
	}
	@Override
	public void regist(String fromID, String toID, String content) {
		Map<String,Object> map = new HashMap<>();
		map.put("fromID", fromID);
		map.put("toID", toID);
		map.put("content", content);
		sqlSession.insert("Chat-Mapper.regist",map);
		
	}
	@Override
	public void readModify(String toID, String fromID) {
		Map<String,Object> map = new HashMap<>();
		map.put("fromID",fromID);
		map.put("toID",toID);
		sqlSession.update("Chat-Mapper.readModify",map);
	}
	@Override
	public int unreadCount(String fromID) {
		int count = sqlSession.selectOne("Chat-Mapper.unreadCount",fromID);
		return count;
	}
	@Override
	public List<ChatVO> getMessageList(String fromID) {
		List<ChatVO> list = sqlSession.selectList("Chat-Mapper.getMessageList",fromID);
		return list;
	}
	@Override
	public int getChatListCount(String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		
		int count = sqlSession.selectOne("Chat-Mapper.getChatListCount",map);
		return count;
	}
	@Override
	public List<ChatVO> getChatList(int start, int end, String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		map.put("start",start);
		map.put("end",end);
		
		List<ChatVO> list= sqlSession.selectList("Chat-Mapper.getChatList",map);
		
		return list;
	}
	@Override
	public void delete(int cno) {
		sqlSession.delete("Chat-Mapper.delete",cno);
		
	}
	@Override
	public ChatVO getChatVO(int cno) {
		ChatVO vo = sqlSession.selectOne("Chat-Mapper.getChatVO",cno);
		return vo;
	}
	@Override
	public void chatModify(ChatVO vo) {
		sqlSession.update("Chat-Mapper.chatModify",vo);
		
	}
	
	
	
}
