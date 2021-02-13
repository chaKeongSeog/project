package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.dto.FaqVO;
import com.spring.dto.QnaVO;
import com.spring.dto.ReplyVO;

@Service
public interface FaqService {
	int getListCount(String search_option,String keyword);

	List<FaqVO> getList(int start, int end, String search_option, String keyword);
	
	List<ReplyVO> getReplyList(int bno);
	
	void regist(FaqVO vo);
	
	void modify(FaqVO vo);
	
	void delete(int bno);
	
	FaqVO getFaq(int bno);

	void answer(ReplyVO vo);
}
