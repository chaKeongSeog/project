package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.dao.NoticeDAO;
import com.spring.dto.BoardListVO;
import com.spring.dto.BoardVO;


public class NoticeServiceImpl implements NoticeService{

	private NoticeDAO noticeDAO;

	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	@Override
	public List<BoardListVO> getSearchNoticeList(int start, int end, String search_option, String keyword) {
		List<BoardListVO> list = noticeDAO.getSearchNoticeList(start,end,search_option,keyword);
		return list;
	}

	@Override
	public int getListCount(String search_option, String keyword) {
		int count = noticeDAO.getListCount(search_option,keyword);
		return count;
	}

	@Override
	public void regist(BoardVO notice) {
		noticeDAO.regist(notice);
		
	}

	@Override
	public BoardListVO getDetail(int bno) {
		BoardListVO notice = noticeDAO.getDetail(bno);
		return notice;
	}

	@Override
	public void modify(BoardVO notice) {
		noticeDAO.modify(notice);
		
	}

	@Override
	public void delete(int bno) {
		noticeDAO.delete(bno);
		
	}

	@Override
	public int getBno() {
		int bno = noticeDAO.getBno();
		return bno;
	}

	public void updateHit(int bno) {
		noticeDAO.updateHit(bno);
	}

	@Override
	public void answer(BoardListVO vo2) {
		Map<String,Object> map = new HashMap<>();
		map.put("ref",vo2.getRef());
		map.put("ref_step",vo2.getRef_step());
		noticeDAO.ref_stepUpdate(map);
		noticeDAO.answer(vo2);
		
	}
	

	
	
}
