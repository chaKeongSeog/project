package com.spring.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.dto.BoardListVO;
import com.spring.dto.ReplyVO;

@Repository
public interface ReplyDAO {

	void write(ReplyVO reply);

	int getCount(int bno);

	List<ReplyVO> getReplyList(int start, int end,int bno);

	void modify(ReplyVO reply);

	void delete(int rno);

	ReplyVO getReply(int rno);

	void answer(ReplyVO vo);

	void refUpdate(Map<String, Object> map);

	void refDelete(int ref);
	
	BoardListVO getBoard(int bno);
	
	int getReplyCount(String search_option,String keyword,String brd_gb);
	
	List<ReplyVO> getAdminReplyList(int start,int end,String brd_gb,String search_option,String keyword);
	
	int getlecturereplyCount(String search_option,String keyword);
	
	List<ReplyVO> getAdminlecturereReplyList(int start,int end,String search_option,String keyword);
	
	

}
