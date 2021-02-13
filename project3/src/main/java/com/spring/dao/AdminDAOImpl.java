package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.DDitMemberVO;
import com.spring.dto.MemberVO;

public class AdminDAOImpl implements AdminDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public int getMemberListCount(String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		int count = sqlSession.selectOne("ADMIN-Mapper.getMemberListCount",map);
		return count;
	}
	@Override
	public List<MemberVO> getMemberList(int start, int end, String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		List<MemberVO> list = sqlSession.selectList("ADMIN-Mapper.getMemberList",map);
		return list;
	}
	@Override
	public void join(MemberVO vo) {
		sqlSession.insert("ADMIN-Mapper.join",vo);
		
	}
	@Override
	public MemberVO getMember(String id) {
		MemberVO vo = sqlSession.selectOne("ADMIN-Mapper.getMember",id);
		return vo;
	}
	@Override
	public void memberModify(MemberVO vo) {
		sqlSession.update("ADMIN-Mapper.memberModify",vo);
		
	}
	@Override
	public void memberDelete(String id) {
		sqlSession.update("ADMIN-Mapper.memberDelete",id);
		
	}
	@Override
	public List<DDitMemberVO> getdditmemberList(int start, int end, String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		List<DDitMemberVO> list = sqlSession.selectList("ADMIN-Mapper.getdditmemberList",map);
		
		return list;
	}
	@Override
	public int getdditMemberListCount(String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		int count = sqlSession.selectOne("ADMIN-Mapper.getdditMemberListCount",map);
		
		return count;
	}
	@Override
	public void dditJoin(DDitMemberVO vo) {
		sqlSession.insert("ADMIN-Mapper.dditJoin",vo);
		
	}
	@Override
	public void dditdelete(int dno) {
		sqlSession.delete("ADMIN-Mapper.dditdelete",dno);
		
	}
	@Override
	public DDitMemberVO getdditmemger(int dno) {
		DDitMemberVO vo = sqlSession.selectOne("ADMIN-Mapper.getdditmemger",dno);
		return vo;
	}
	@Override
	public void dditmodify(DDitMemberVO vo) {
		sqlSession.update("ADMIN-Mapper.dditmodify",vo);
		
	}

	
	
	
}
