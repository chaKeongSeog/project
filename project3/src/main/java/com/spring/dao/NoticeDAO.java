package com.spring.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.dto.BoardListVO;
import com.spring.dto.BoardVO;
@Repository
public interface NoticeDAO {

	List<BoardListVO> getSearchNoticeList(int start, int end, String search_option, String keyword);

	int getListCount(String search_option, String keyword);

	void regist(BoardVO notice);

	BoardListVO getDetail(int bno);

	void modify(BoardVO notice);

	void delete(int bno);

	int getBno();
	
	void updateHit(int bno);

	void answer(BoardListVO vo2);

	void ref_stepUpdate(Map<String, Object> map);

}
