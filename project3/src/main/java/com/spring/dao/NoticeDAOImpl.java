package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.BoardListVO;
import com.spring.dto.BoardVO;



public class NoticeDAOImpl implements NoticeDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public List<BoardListVO> getSearchNoticeList(int start, int end, String search_option, String keyword) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		List<BoardListVO> list = sqlSession.selectList("Notice-Mapper.getSearchNoticeList",map);
		return list;
	}

	@Override
	public int getListCount(String search_option, String keyword) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		int count = sqlSession.selectOne("Notice-Mapper.getListCount",map);
		return count;
	}


	@Override
	public void regist(BoardVO notice) {
		sqlSession.insert("Notice-Mapper.regist",notice);
		
	}


	@Override
	public BoardListVO getDetail(int bno) {
		BoardListVO notice = sqlSession.selectOne("Notice-Mapper.getDetail",bno);
		return notice;
	}


	@Override
	public void modify(BoardVO notice) {
		sqlSession.update("Notice-Mapper.update",notice);
		
	}


	@Override
	public void delete(int bno) {
		sqlSession.delete("Notice-Mapper.delete",bno);
		
	}


	@Override
	public int getBno() {
		int bno = sqlSession.selectOne("Notice-Mapper.getBno");
		return bno;
	}


	@Override
	public void updateHit(int bno) {
		sqlSession.update("Notice-Mapper.updateHit",bno);
		
	}


	@Override
	public void answer(BoardListVO vo2) {
		sqlSession.insert("Notice-Mapper.answer",vo2);
		
	}


	@Override
	public void ref_stepUpdate(Map<String, Object> map) {
		sqlSession.update("Notice-Mapper.ref_stepUpdate",map);
		
	}

	
}
