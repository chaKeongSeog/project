package com.spring.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.dto.DDitMemberVO;
import com.spring.dto.MemberListVO;
import com.spring.dto.MemberMemoVO;
import com.spring.dto.MemberVO;
@Repository
public interface MemberDAO {

	void join(MemberVO member);

	String idCheck(String id);

	MemberVO getMember(String id);

	String SearchPwd(String id, String email);

	String SearchID(String name, String email);

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
