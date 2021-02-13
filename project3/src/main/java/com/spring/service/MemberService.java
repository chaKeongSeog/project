package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.dto.DDitMemberVO;
import com.spring.dto.MemberListVO;
import com.spring.dto.MemberMemoVO;
import com.spring.dto.MemberVO;
@Service
public interface MemberService {

	void join(MemberVO member);

	String idCheck(String id);

	MemberVO getMember(String id);

	String SearchPwd(String id, String email);

	String searchID(String name, String email);

	void modify(MemberVO member);

	void pwdModify(String id, String pwd);

	void memberDelete(String id);

	void imgModify(MemberVO member);

	List<DDitMemberVO> dditMemberCheck(String name);

	MemberListVO getMemberList(String id);
	
	DDitMemberVO getDDitMember(String name,String tel);
	
	void delete(String id);
	
	void memoWrtie(MemberMemoVO memo);
	
	List<MemberMemoVO> getMemberMemo(String id);
	
	void memoDelete(int mno);

}
