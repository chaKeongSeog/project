package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.dto.BoardListVO;
import com.spring.dto.GroupVO;
import com.spring.dto.QnaVO;
import com.spring.dto.ReplyVO;

@Service
public interface QnaService {
	
	int getListCount(String search_option,String keyword);

	List<QnaVO> getList(int start, int end, String search_option, String keyword);

	List<ReplyVO> getReplyList(int bno);

	void regist(QnaVO vo);
	
	void modify(QnaVO vo);
	
	void delete(int bno);
	
	QnaVO getQna(int bno);

	void answer(ReplyVO vo);
	
	
	
}
