package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.dto.BoardListVO;
import com.spring.dto.BoardVO;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public List<BoardListVO> getSearchFreeList(int start, int end, String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("start",start);
		map.put("end",end);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		List<BoardListVO> list = sqlSession.selectList("Free-Mapper.getSearchFreeList",map);
		return list;
	}
	@Override
	public int getListCount(String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		int count = sqlSession.selectOne("Free-Mapper.getListCount",map);
		
		return count;
	}
	@Override
	public void regist(BoardListVO freeBoard) {
		sqlSession.insert("Free-Mapper.regist",freeBoard);
		
	}
	@Override
	public BoardListVO getDetail(int bno) {
		BoardListVO freeBoard = sqlSession.selectOne("Free-Mapper.getDetail",bno);
		return freeBoard;
	}
	@Override
	public int getBno() {
		int bno = sqlSession.selectOne("Free-Mapper.getBno");
		return bno;
	}
	@Override
	public void modify(BoardVO freeBoard) {
		sqlSession.update("Free-Mapper.update",freeBoard);
		
	}
	@Override
	public void delete(int bno) {
		sqlSession.delete("Free-Mapper.delete",bno);
		
	}
	@Override
	public void updateHit(int bno) {
		sqlSession.update("Free-Mapper.updateHit",bno);
		
	}
	
	@Override
	public void answer(BoardListVO vo2) {
		sqlSession.insert("Free-Mapper.answer",vo2);
		
	}


	@Override
	public void ref_stepUpdate(Map<String, Object> map) {
		sqlSession.update("Free-Mapper.ref_stepUpdate",map);
		
	}
	@Override
	public void refDelete(int ref) {
		sqlSession.delete("Free-Mapper.refDelete",ref);
		
	}
	
}
