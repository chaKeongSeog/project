package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.DDitMemberVO;
import com.spring.dto.MemberListVO;
import com.spring.dto.MemberMemoVO;
import com.spring.dto.MemberVO;

public class MemberDAOImpl implements MemberDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public void join(MemberVO member) {
		sqlSession.insert("Member-Mapper.join",member);
		
	}
	@Override
	public String idCheck(String id) {
		String id2 = sqlSession.selectOne("Member-Mapper.idCheck",id);
		return id2;
	}
	@Override
	public MemberVO getMember(String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("id",id);
		MemberVO member = sqlSession.selectOne("Member-Mapper.getMember",map);
		return member;
	}
	@Override
	public String SearchPwd(String id, String email) {
		Map<String,Object> map = new HashMap<>();
		map.put("id",id);
		map.put("email",email);
		String pwd = sqlSession.selectOne("Member-Mapper.SearchPwd",map);
		return pwd;
	}
	@Override
	public String SearchID(String name, String email) {
		Map<String,Object> map = new HashMap<>();
		map.put("name",name);
		map.put("email",email);
		String id = sqlSession.selectOne("Member-Mapper.SearchID",map);
		return id;
	}
	@Override
	public void modify(MemberVO member) {
		sqlSession.update("Member-Mapper.modify",member);
		
	}
	@Override
	public void pwdModify(String id, String pwd) {
		Map<String,Object> map = new HashMap<>();
		map.put("id",id);
		map.put("pwd",pwd);
		sqlSession.update("Member-Mapper.pwdModify",map);
		
	}
	@Override
	public void memberDelete(String id) {
		sqlSession.delete("Member-Mapper.delete",id);
		
	}
	@Override
	public void imgModify(MemberVO member) {
		sqlSession.update("Member-Mapper.imgModify",member);
		
	}
	@Override
	public List<DDitMemberVO> dditMemberCheck(String name) {
		List<DDitMemberVO> list = sqlSession.selectList("Member-Mapper.dditMemberCheck",name);
		return list;
	}
	@Override
	public MemberListVO getMemberList(String id) {
		MemberListVO member = sqlSession.selectOne("Member-Mapper.getMemberList",id);
		return member;
	}
	@Override
	public DDitMemberVO getDDitMember(String name, String tel) {
		Map<String,Object> map = new HashMap<>();
		map.put("name",name);
		map.put("tel",tel);
		DDitMemberVO ddit = sqlSession.selectOne("Member-Mapper.getDDitMember",map);
		return ddit;
	}
	@Override
	public void delete(String id) {
		sqlSession.delete("Member-Mapper.delete",id);
		
	}
	@Override
	public void memoWrtie(MemberMemoVO memo) {
		sqlSession.insert("Member-Mapper.memoWrtie",memo);		
	}
	@Override
	public List<MemberMemoVO> getMemberMemo(String id) {
		List<MemberMemoVO> list = sqlSession.selectList("Member-Mapper.getMemberMemo",id);
		return list;
	}
	@Override
	public void memoDelete(int mno) {
		sqlSession.delete("Member-Mapper.memoDelete",mno);
		
	}
	
	
}
