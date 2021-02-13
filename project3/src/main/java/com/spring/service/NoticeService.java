package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.dto.BoardListVO;
import com.spring.dto.BoardVO;

@Service
public interface NoticeService {

	List<BoardListVO> getSearchNoticeList(int start, int end, String search_option, String keyword);

	int getListCount(String search_option, String keyword);

	void regist(BoardVO notice);

	BoardListVO getDetail(int bno);

	void modify(BoardVO notice);

	void delete(int bno);

	int getBno();

	void updateHit(int bno);

	void answer(BoardListVO vo2);

}
