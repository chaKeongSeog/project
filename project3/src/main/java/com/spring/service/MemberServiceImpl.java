package com.spring.service;

import java.util.List;

import com.spring.dao.MemberDAO;
import com.spring.dto.DDitMemberVO;
import com.spring.dto.MemberListVO;
import com.spring.dto.MemberMemoVO;
import com.spring.dto.MemberVO;

public class MemberServiceImpl implements MemberService{
	private MemberDAO memberDAO;

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public void join(MemberVO member) {
		memberDAO.join(member);
		
	}

	@Override
	public String idCheck(String id) {
		String id2 = memberDAO.idCheck(id);
		return id2;
	}

	@Override
	public MemberVO getMember(String id) {
		MemberVO member = memberDAO.getMember(id);
		return member;
	}

	@Override
	public String SearchPwd(String id, String email) {
		String pwd = memberDAO.SearchPwd(id,email);
		return pwd;
	}

	@Override
	public String searchID(String name, String email) {
		String id = memberDAO.SearchID(name,email);
		return id;
	}

	@Override
	public void modify(MemberVO member) {
		memberDAO.modify(member);
		
	}

	@Override
	public void pwdModify(String id, String pwd) {
		memberDAO.pwdModify(id,pwd);
		
	}

	@Override
	public void memberDelete(String id) {
		memberDAO.memberDelete(id);
		
	}

	@Override
	public void imgModify(MemberVO member) {
		memberDAO.imgModify(member);
	}

	@Override
	public List<DDitMemberVO> dditMemberCheck(String name) {
		List<DDitMemberVO> list = memberDAO.dditMemberCheck(name);
		return list;
	}

	@Override
	public MemberListVO getMemberList(String id) {
		MemberListVO member = memberDAO.getMemberList(id);
		return member;
	}

	@Override
	public DDitMemberVO getDDitMember(String name, String tel) {
		DDitMemberVO ddit = memberDAO.getDDitMember(name,tel);
		return ddit;
	}

	@Override
	public void delete(String id) {
		memberDAO.delete(id);
		
	}

	@Override
	public void memoWrtie(MemberMemoVO memo) {
		memberDAO.memoWrtie(memo);
		
	}

	@Override
	public List<MemberMemoVO> getMemberMemo(String id) {
		List<MemberMemoVO> list = memberDAO.getMemberMemo(id);
		return list;
	}

	@Override
	public void memoDelete(int mno) {
		memberDAO.memoDelete(mno);
		
	}

	
	
	
}
