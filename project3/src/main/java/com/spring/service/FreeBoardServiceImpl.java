package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.dao.ChatDAO;
import com.spring.dao.FreeBoardDAO;
import com.spring.dto.BoardListVO;
import com.spring.dto.BoardVO;

public class FreeBoardServiceImpl implements FreeBoardService{
	private FreeBoardDAO freeBoardDAO;
	public void setFreeBoardDAO(FreeBoardDAO freeBoardDAO) {
		this.freeBoardDAO = freeBoardDAO;
	}
	@Override
	public List<BoardListVO> getSearchFreeList(int start, int end, String search_option, String keyword) {
		List<BoardListVO> list = freeBoardDAO.getSearchFreeList(start,end,search_option,keyword);
		return list;
	}
	@Override
	public int getListCount(String search_option, String keyword) {
		int count = freeBoardDAO.getListCount(search_option,keyword);
		return count;
	}
	@Override
	public void regist(BoardListVO freeBoard) {
		freeBoardDAO.regist(freeBoard);
		
	}
	@Override
	public BoardListVO getDetail(int bno) {
		BoardListVO freeBoard = freeBoardDAO.getDetail(bno);
		return freeBoard;
	}
	@Override
	public int getBno() {
		int bno = freeBoardDAO.getBno();
		return bno;
	}
	@Override
	public void modify(BoardVO freeBoard) {
		freeBoardDAO.modify(freeBoard);
		
	}
	@Override
	public void delete(int bno) {
		freeBoardDAO.delete(bno);
		
	}
	@Override
	public void updateHit(int bno) {
		freeBoardDAO.updateHit(bno);
		
	}
	
	
	@Override
	public void answer(BoardListVO vo2) {
		Map<String,Object> map = new HashMap<>();
		map.put("ref",vo2.getRef());
		map.put("ref_step",vo2.getRef_step());
		freeBoardDAO.ref_stepUpdate(map);
		freeBoardDAO.answer(vo2);
		
	}
	@Override
	public void refDelete(int ref) {
		freeBoardDAO.refDelete(ref);
		
	}
	
	
	
}
