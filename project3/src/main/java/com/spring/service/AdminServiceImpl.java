package com.spring.service;

import java.util.List;

import com.spring.dao.AdminDAO;
import com.spring.dao.ChatDAO;
import com.spring.dto.DDitMemberVO;
import com.spring.dto.MemberVO;

public class AdminServiceImpl implements AdminService{
	private AdminDAO adminDAO;

	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
		
	}

	@Override
	public int getMemberListCount(String search_option, String keyword) {
		int count = adminDAO.getMemberListCount(search_option,keyword);
		return count;
	}

	@Override
	public List<MemberVO> getmemberList(int start, int end, String search_option, String keyword) {
		List<MemberVO> list = adminDAO.getMemberList(start,end,search_option, keyword);
		return list;
	}

	@Override
	public void join(MemberVO vo) {
		adminDAO.join(vo);
		
	}

	@Override
	public MemberVO getMember(String id) {
		MemberVO vo = adminDAO.getMember(id);
		return vo;
	}

	@Override
	public void memberModify(MemberVO vo) {
		adminDAO.memberModify(vo);
		
	}

	@Override
	public void memberDelete(String id) {
		adminDAO.memberDelete(id);
		
	}

	@Override
	public List<DDitMemberVO> getdditmemberList(int start, int end, String search_option, String keyword) {
		List<DDitMemberVO> list = adminDAO.getdditmemberList(start,end,search_option,keyword);
		return list;
	}

	@Override
	public int getdditMemberListCount(String search_option, String keyword) {
		int count = adminDAO.getdditMemberListCount(search_option,keyword);
		return count;
	}

	@Override
	public void dditJoin(DDitMemberVO vo) {
		adminDAO.dditJoin(vo);
		
	}

	@Override
	public void dditdelete(int dno) {
		adminDAO.dditdelete(dno);
		
	}

	@Override
	public DDitMemberVO getdditmemger(int dno) {
		DDitMemberVO vo = adminDAO.getdditmemger(dno);
		return vo;
	}

	@Override
	public void dditmodify(DDitMemberVO vo) {
		adminDAO.dditmodify(vo);
		
	}

	
	
	
	
	
}
