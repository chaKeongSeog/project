package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.dto.BoardListVO;
import com.spring.dto.BoardVO;

@Service
public interface FreeBoardService {
	List<BoardListVO> getSearchFreeList(int start, int end, String search_option, String keyword);

	int getListCount(String search_option, String keyword);
	
	void regist(BoardListVO freeBoard);
	
	BoardListVO getDetail(int bno);
	
	int getBno();
	
	void modify(BoardVO freeBoard);
	
	void delete(int bno);
	
	void updateHit(int bno);
	
	void answer(BoardListVO vo2);

	void refDelete(int ref);
}
