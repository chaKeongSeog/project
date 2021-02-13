package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.dao.QnaDAO;
import com.spring.dao.ReplyDAO;
import com.spring.dto.BoardListVO;
import com.spring.dto.QnaVO;
import com.spring.dto.ReplyVO;

public class QnaServiceImpl implements QnaService{
	private QnaDAO qnaDAO;

	public void setQnaDAO(QnaDAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}

	@Override
	public int getListCount(String search_option, String keyword) {
		int count = qnaDAO.getListCount(search_option,keyword);
		return count;
	}

	@Override
	public List<QnaVO> getList(int start, int end, String search_option, String keyword) {
		List<QnaVO> list = qnaDAO.getList(start,end,search_option,keyword);
		return list;
	}

	@Override
	public List<ReplyVO> getReplyList(int bno) {
		List<ReplyVO> list = qnaDAO.getReplyList(bno);
		return list;
	}

	@Override
	public void regist(QnaVO vo) {
		qnaDAO.regist(vo);
		
	}

	@Override
	public void modify(QnaVO vo) {
		qnaDAO.modify(vo);
		
	}

	@Override
	public void delete(int bno) {
		qnaDAO.delete(bno);
		
	}

	@Override
	public QnaVO getQna(int bno) {
		QnaVO vo = qnaDAO.getQna(bno);
		return vo;
	}

	@Override
	public void answer(ReplyVO vo) {
		qnaDAO.answer(vo);
		
	}
	
	
	
}
