package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.dto.DDitMemberVO;
import com.spring.dto.MemberVO;

@Service
public interface AdminService {
	int getMemberListCount(String search_option,String keyword);
	
	List<MemberVO> getmemberList(int start,int end,String search_option,String keyword);
	
	void join(MemberVO vo);
	
	MemberVO getMember(String id);
	
	void memberModify(MemberVO vo);
	
	void memberDelete(String id);
	
	int getdditMemberListCount(String search_option,String keyword);
	
	List<DDitMemberVO> getdditmemberList(int start,int end,String search_option,String keyword);
	
	void dditJoin(DDitMemberVO vo);
	
	void dditdelete(int eno);
	
	DDitMemberVO getdditmemger(int dno);
	
	void dditmodify(DDitMemberVO vo);
}
