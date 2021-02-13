package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.dto.BoardListVO;
import com.spring.dto.ReplyVO;
@Service
public interface ReplyService {

	void write(ReplyVO reply);

	int getCount(int bno);

	List<ReplyVO> getReplyList(int start, int end,int bno);

	void modify(ReplyVO reply);

	void delete(int rno);

	ReplyVO getReply(int rno);

	void answer(ReplyVO vo);

	void refDelete(int ref);
	
	BoardListVO getBoard(int bno);
	
	int getReplyCount(String search_option,String keyword,String brd_gb);
	
	List<ReplyVO> getAdminReplyList(int start,int end,String brd_gb,String search_option,String keyword);
	
	int getlecturereplyCount(String search_option,String keyword);
	
	List<ReplyVO> getAdminlecturereReplyList(int start,int end,String search_option,String keyword);
	
	
}
