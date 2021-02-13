package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.FaqVO;
import com.spring.dto.QnaVO;
import com.spring.dto.ReplyVO;

public class FaqDAOImpl implements FaqDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public int getListCount(String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword",keyword);
		int count = sqlSession.selectOne("FAQ-Mapper.getListCount",map);
		return count;
	}
	@Override
	public List<FaqVO> getList(int start, int end, String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword",keyword);
		map.put("start", start);
		map.put("end",end);
		List<FaqVO> list = sqlSession.selectList("FAQ-Mapper.getList",map);
		return list;
	}
	@Override
	public List<ReplyVO> getReplyList(int bno) {
		List<ReplyVO> list = sqlSession.selectList("FAQ-Mapper.getReplyList",bno);
		return list;
	}
	@Override
	public void regist(FaqVO vo) {
		sqlSession.insert("FAQ-Mapper.regist",vo);
		
	}
	@Override
	public void modify(FaqVO vo) {
		sqlSession.update("FAQ-Mapper.modify",vo);
		
	}
	@Override
	public void delete(int bno) {
		sqlSession.delete("FAQ-Mapper.delete",bno);
		
	}
	@Override
	public FaqVO getFaq(int bno) {
		FaqVO vo = sqlSession.selectOne("FAQ-Mapper.getFaq",bno);
		return vo;
	}
	@Override
	public void answer(ReplyVO vo) {
		sqlSession.insert("FAQ-Mapper.answer",vo);
		
	}
	
	
	
}
