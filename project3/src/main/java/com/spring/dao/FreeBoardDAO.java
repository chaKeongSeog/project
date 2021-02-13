package com.spring.dao;

import java.util.List;
import java.util.Map;

import com.spring.dto.BoardListVO;
import com.spring.dto.BoardVO;

public interface FreeBoardDAO {
	List<BoardListVO> getSearchFreeList(int start, int end, String search_option, String keyword);

	int getListCount(String search_option, String keyword);
	
	void regist(BoardListVO freeBoard);
	
	BoardListVO getDetail(int bno);
	
	int getBno();
	
	void modify(BoardVO freeBoard);
	
	void delete(int bno);
	
	void updateHit(int bno);
	
	void answer(BoardListVO vo2);
	
	void ref_stepUpdate(Map<String, Object> map);

	void refDelete(int ref);
}
