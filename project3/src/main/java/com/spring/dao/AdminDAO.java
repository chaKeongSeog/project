package com.spring.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.dto.DDitMemberVO;
import com.spring.dto.MemberVO;

@Repository
public interface AdminDAO {
	int getMemberListCount(String search_option,String keyword);
	
	List<MemberVO> getMemberList(int start,int end,String search_option,String keyword);
	
	void join(MemberVO vo);
	
	MemberVO getMember(String id);
	
	void memberModify(MemberVO vo);
	
	void memberDelete(String id);
	
	List<DDitMemberVO> getdditmemberList(int start,int end,String search_option,String keyword);
	
	int getdditMemberListCount(String search_option,String keyword);
	
	void dditJoin(DDitMemberVO vo);
	
	void dditdelete(int dno);
	
	DDitMemberVO getdditmemger(int dno);
	
	void dditmodify(DDitMemberVO vo);
}
