package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.BoardListVO;
import com.spring.dto.ReplyVO;

public class ReplyDAOImpl implements ReplyDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public void write(ReplyVO reply) {
		sqlSession.insert("Reply-Mapper.write",reply);
		
	}
	@Override
	public int getCount(int bno) {
		int count = sqlSession.selectOne("Reply-Mapper.getCount",bno);
		return count;
	}
	@Override
	public List<ReplyVO> getReplyList(int start, int end,int bno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("bno",bno);
		List<ReplyVO> list = sqlSession.selectList("Reply-Mapper.getReplyList",map);
		return list;
	}
	@Override
	public void modify(ReplyVO reply) {
		sqlSession.update("Reply-Mapper.modify",reply);
		
	}
	@Override
	public void delete(int rno) {
		sqlSession.update("Reply-Mapper.delete",rno);
		
	}
	@Override
	public ReplyVO getReply(int rno) {
		ReplyVO reply = sqlSession.selectOne("Reply-Mapper.getReply",rno);
		return reply;
	}
	@Override
	public void answer(ReplyVO vo) {
		sqlSession.insert("Reply-Mapper.answer",vo);
		
	}
	@Override
	public void refUpdate(Map<String, Object> map) {
		sqlSession.update("Reply-Mapper.refUpdate",map);
		
	}
	@Override
	public void refDelete(int ref) {
		sqlSession.delete("Reply-Mapper.refDelete",ref);
		
	}
	@Override
	public BoardListVO getBoard(int bno) {
		BoardListVO board = sqlSession.selectOne("Reply-Mapper.getBoard",bno);
		return board;
	}
	@Override
	public int getReplyCount(String search_option,String keyword,String brd_gb) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("brd_gb",brd_gb);
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		
		int count = sqlSession.selectOne("Reply-Mapper.getReplyCount",map);
		return count;
	}
	@Override
	public List<ReplyVO> getAdminReplyList(int start, int end, String brd_gb,String search_option,String keyword) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("brd_gb",brd_gb);
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		
		List<ReplyVO> list = sqlSession.selectList("Reply-Mapper.getAdminReplyList",map);
		
		return list;
	}
	@Override
	public int getlecturereplyCount(String search_option, String keyword) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		
		int count = sqlSession.selectOne("Reply-Mapper.getlecturereplyCount",map);
		
		return count;
	}
	@Override
	public List<ReplyVO> getAdminlecturereReplyList(int start, int end, String search_option, String keyword) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		map.put("start",start);
		map.put("end",end);
		
		List<ReplyVO> list = sqlSession.selectList("Reply-Mapper.getAdminlecturereReplyList",map);
		
		return list;
	}
	
	
	
	
}
