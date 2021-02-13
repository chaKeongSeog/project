package com.spring.service;

import java.util.List;

import com.spring.dao.FaqDAO;
import com.spring.dao.QnaDAO;
import com.spring.dto.FaqVO;
import com.spring.dto.QnaVO;
import com.spring.dto.ReplyVO;

public class FaqServiceImpl implements FaqService{
	private FaqDAO faqDAO;
	public void setFaqDAO(FaqDAO faqDAO) {
		this.faqDAO = faqDAO;
	}
	@Override
	public int getListCount(String search_option, String keyword) {
		int count = faqDAO.getListCount(search_option,keyword);
		return count;
	}

	@Override
	public List<FaqVO> getList(int start, int end, String search_option, String keyword) {
		List<FaqVO> list = faqDAO.getList(start,end,search_option,keyword);
		return list;
	}
	@Override
	public List<ReplyVO> getReplyList(int bno) {
		List<ReplyVO> list = faqDAO.getReplyList(bno);
		return list;
	}
	@Override
	public void regist(FaqVO vo) {
		faqDAO.regist(vo);
		
	}
	@Override
	public void modify(FaqVO vo) {
		faqDAO.modify(vo);
		
	}
	@Override
	public void delete(int bno) {
		faqDAO.delete(bno);
		
	}
	@Override
	public FaqVO getFaq(int bno) {
		FaqVO vo = faqDAO.getFaq(bno);
		return vo;
	}
	@Override
	public void answer(ReplyVO vo) {
		faqDAO.answer(vo);
		
	}
	
	
	
}
