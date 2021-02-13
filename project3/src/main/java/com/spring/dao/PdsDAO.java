package com.spring.dao;

import java.util.List;

import com.spring.dto.AttachListVO;
import com.spring.dto.AttachVO;
import com.spring.dto.BoardListVO;


public interface PdsDAO {
	int getFdsListCount(String search_option,String keyword);
	
	List<BoardListVO> getFdsList(int start,int end,String search_option,String keyword);
	
	void regist(BoardListVO board);
	
	int getMaxBno();
	
	void registAttach(AttachVO attach);
	
	BoardListVO getBoard(int bno);
	
	List<AttachVO> getAttachList(int bno);
	
	void updateHit(int bno);
	
	void answer(BoardListVO board);
	
	void ref_stepUpdate(int ref,int ref_step);
	
	void delete(int bno,int ref,int ref_step);
	
	List<AttachVO> getChainAttachList(int ref,int ref_step);
	
	AttachVO getAttach(int ano);
	
	void attachDelete(int ano);
	
	void modify(BoardListVO board);

	void delete(int bno);

	int getAttachCount(int bno);
}
