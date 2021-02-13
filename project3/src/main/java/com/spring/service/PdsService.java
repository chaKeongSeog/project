package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.dto.AttachListVO;
import com.spring.dto.AttachVO;
import com.spring.dto.BoardListVO;


@Service
public interface PdsService {
	int getFdsListCount(String search_option,String keyword);
	
	List<BoardListVO> getFdsList(int start,int end,String search_option,String keyword);
	
	void regist(List<AttachVO> list,BoardListVO board);
	
	void regist(BoardListVO board);
	
	int getMaxBno();
	
	BoardListVO getBoard(int bno);
	
	List<AttachVO> getAttachList(int bno);
	
	void updateHit(int bno);
	
	void answer(BoardListVO board);
	
	void answer(List<AttachVO> list,BoardListVO board);
	
	void delete(int bno,int ref,int ref_step);
	
	List<AttachVO> getChainAttachList(int ref,int ref_step);
	
	List<AttachVO> getAttachList(int[] ano);
	
	void attachDelete(List<AttachVO> list);
	
	void modify(BoardListVO board);
	
	void modify(BoardListVO board,List<AttachVO> list);
	
	AttachVO getAttach(int ano);

	void delete(int bno);

	int getAttachCount(int bno);
}
