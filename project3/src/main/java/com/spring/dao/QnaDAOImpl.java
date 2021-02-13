package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.BoardListVO;
import com.spring.dto.QnaVO;
import com.spring.dto.ReplyVO;

public class QnaDAOImpl implements QnaDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public int getListCount(String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword",keyword);
		int count = sqlSession.selectOne("QNA-Mapper.getListCount",map);
		return count;
	}
	@Override
	public List<QnaVO> getList(int start, int end, String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword",keyword);
		map.put("start", start);
		map.put("end",end);
		List<QnaVO> list = sqlSession.selectList("QNA-Mapper.getList",map);
		return list;
	}
	@Override
	public List<ReplyVO> getReplyList(int bno) {
		List<ReplyVO> list = sqlSession.selectList("QNA-Mapper.getReplyList",bno);
		return list;
	}
	@Override
	public void regist(QnaVO vo) {
		sqlSession.insert("QNA-Mapper.regist",vo);
		
	}
	@Override
	public void modify(QnaVO vo) {
		sqlSession.update("QNA-Mapper.modify",vo);
		
	}
	@Override
	public void delete(int bno) {
		sqlSession.delete("QNA-Mapper.delete",bno);
		
	}
	@Override
	public QnaVO getQna(int bno) {
		QnaVO vo = sqlSession.selectOne("QNA-Mapper.getQna",bno);
		return vo;
	}
	@Override
	public void answer(ReplyVO vo) {
		sqlSession.insert("QNA-Mapper.answer",vo);
		
	}
	
	
}
