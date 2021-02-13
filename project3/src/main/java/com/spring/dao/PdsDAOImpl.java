package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.dto.AttachListVO;
import com.spring.dto.AttachVO;
import com.spring.dto.BoardListVO;


@Repository
public class PdsDAOImpl implements PdsDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public int getFdsListCount(String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		int count = sqlSession.selectOne("FDS-Mapper.getFdsListCount",map);
		return count;
	}
	@Override
	public List<BoardListVO> getFdsList(int start, int end, String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("start",start);
		map.put("end",end);
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		List<BoardListVO> list = sqlSession.selectList("FDS-Mapper.getFdsList",map);
		return list;
	}
	@Override
	public void regist(BoardListVO board) {
		sqlSession.insert("FDS-Mapper.regist",board);
		
	}
	@Override
	public int getMaxBno() {
		int cnt = sqlSession.selectOne("FDS-Mapper.getMaxBno");
		return cnt;
	}
	@Override
	public void registAttach(AttachVO attach) {
		sqlSession.insert("FDS-Mapper.registAttach",attach);
		
	}
	@Override
	public BoardListVO getBoard(int bno) {
		BoardListVO vo = sqlSession.selectOne("FDS-Mapper.getBoard",bno);
		return vo;
	}
	@Override
	public List<AttachVO> getAttachList(int bno) {
		List<AttachVO> list = sqlSession.selectList("FDS-Mapper.getAttachList",bno);
		return list;
	}
	@Override
	public void updateHit(int bno) {
		sqlSession.update("FDS-Mapper.updateHit",bno);
	}
	@Override
	public void answer(BoardListVO board) {
		sqlSession.insert("FDS-Mapper.answer",board);
		
	}
	@Override
	public void ref_stepUpdate(int ref, int ref_step) {
		Map<String,Object> map = new HashMap<>();
		map.put("ref",ref);
		map.put("ref_step",ref_step);
		sqlSession.update("FDS-Mapper.ref_stepUpdate",map);
		
	}
	@Override
	public void delete(int bno, int ref, int ref_step) {
		Map<String,Object> map = new HashMap<>();
		map.put("ref",ref);
		map.put("ref_step",ref_step);
		map.put("bno",bno);
		sqlSession.delete("FDS-Mapper.delete",map);
	}
	@Override
	public List<AttachVO> getChainAttachList(int ref, int ref_step) {
		Map<String,Object> map = new HashMap<>();
		map.put("ref",ref);
		map.put("ref_step",ref_step);
		List<AttachVO> list = sqlSession.selectList("FDS-Mapper.getChainAttachList",map);
		return list;
	}
	@Override
	public AttachVO getAttach(int ano) {
		AttachVO attach = sqlSession.selectOne("FDS-Mapper.getAttach",ano);
		return attach;
	}
	@Override
	public void attachDelete(int ano) {
		sqlSession.delete("FDS-Mapper.attachDelete",ano);
		
	}
	@Override
	public void modify(BoardListVO board) {
		sqlSession.update("FDS-Mapper.modify",board);
		
	}
	@Override
	public void delete(int bno) {
		sqlSession.delete("FDS-Mapper.pdsdelete",bno);
		
	}
	@Override
	public int getAttachCount(int bno) {
		int count = sqlSession.selectOne("FDS-Mapper.getAttachCount",bno);
		return count;
	}
	
	
	
	
}
