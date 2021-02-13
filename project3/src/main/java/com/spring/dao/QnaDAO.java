package com.spring.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.dto.BoardListVO;
import com.spring.dto.QnaVO;
import com.spring.dto.ReplyVO;

@Repository
public interface QnaDAO {
	int getListCount(String search_option,String keyword);

	List<QnaVO> getList(int start, int end, String search_option, String keyword);

	List<ReplyVO> getReplyList(int bno);

	void regist(QnaVO vo);
	
	void modify(QnaVO vo);
	
	void delete(int bno);
	
	QnaVO getQna(int bno);

	void answer(ReplyVO vo);
}
