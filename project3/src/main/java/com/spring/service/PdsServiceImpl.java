package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.expression.spel.support.BooleanTypedValue;

import com.spring.dao.PdsDAO;
import com.spring.dto.AttachListVO;
import com.spring.dto.AttachVO;
import com.spring.dto.BoardListVO;



public class PdsServiceImpl implements PdsService{
	private PdsDAO pdsDAO;
	public void setPdsDAO(PdsDAO pdsDAO) {
		this.pdsDAO = pdsDAO;
	}
	@Override
	public int getFdsListCount(String search_option, String keyword) {
		int count = pdsDAO.getFdsListCount(search_option,keyword);
		return count;
	}
	
	@Override
	public List<BoardListVO> getFdsList(int start, int end, String search_option, String keyword) {
		List<BoardListVO> list = pdsDAO.getFdsList(start,end,search_option,keyword);
		return list;
	}
	@Override
	public void regist(List<AttachVO> list, BoardListVO board) {
		pdsDAO.regist(board);
		int bno = pdsDAO.getMaxBno();
		for(int i = 0; i <list.size();i++) {
			list.get(i).setBno(bno);
		}
		for(AttachVO attach:list) {
			pdsDAO.registAttach(attach);
		}
		
		
	}
	@Override
	public void regist(BoardListVO board) {
		pdsDAO.regist(board);
	}
	@Override
	public int getMaxBno() {
		int bno = pdsDAO.getMaxBno();
		return bno;
	}
	@Override
	public BoardListVO getBoard(int bno) {
		BoardListVO vo = pdsDAO.getBoard(bno);
		return vo;
	}
	@Override
	public List<AttachVO> getAttachList(int bno) {
		List<AttachVO> list = pdsDAO.getAttachList(bno);
		return list;
	}
	@Override
	public void updateHit(int bno) {
		pdsDAO.updateHit(bno);
		
	}
	@Override
	public void answer(BoardListVO board) {
		int ref = board.getRef();
		int ref_step = board.getRef_step();
		pdsDAO.ref_stepUpdate(ref,ref_step);
		pdsDAO.answer(board);
		
	}
	@Override
	public void answer(List<AttachVO> list, BoardListVO board) {
		int ref = board.getRef();
		int ref_step = board.getRef_step();
		pdsDAO.ref_stepUpdate(ref,ref_step);
		pdsDAO.answer(board);
		
		int bno = pdsDAO.getMaxBno();
		for(int i = 0; i <list.size();i++) {
			list.get(i).setBno(bno);
		}
		for(AttachVO attach:list) {
			pdsDAO.registAttach(attach);
		}
	}
	@Override
	public void delete(int bno, int ref, int ref_step) {
		pdsDAO.delete(bno,ref,ref_step);
		
	}
	@Override
	public List<AttachVO> getChainAttachList(int ref, int ref_step) {
		List<AttachVO> list = pdsDAO.getChainAttachList(ref,ref_step);
		return list;
	}
	@Override
	public List<AttachVO> getAttachList(int[] ano) {
		List<AttachVO> list = new ArrayList<>();
		for(int i=0;i<ano.length;i++) {
			AttachVO attach = pdsDAO.getAttach(ano[i]);
			list.add(attach);
		}
		return list;
	}
	@Override
	public void attachDelete(List<AttachVO> list) {
		for(int i = 0;i<list.size();i++) {
			int ano = list.get(i).getAno();
			pdsDAO.attachDelete(ano);
		}
		
	}
	@Override
	public void modify(BoardListVO board) {
		pdsDAO.modify(board);
		
	}
	@Override
	public void modify(BoardListVO board, List<AttachVO> list) {
		pdsDAO.modify(board);
		int bno = board.getBno();
		for(int i = 0; i <list.size();i++) {
			list.get(i).setBno(bno);
		}
		for(AttachVO attach:list) {
			pdsDAO.registAttach(attach);
		}
		
	}
	@Override
	public AttachVO getAttach(int ano) {
		AttachVO vo = pdsDAO.getAttach(ano);
		return vo;
	}
	@Override
	public void delete(int bno) {
		pdsDAO.delete(bno);
	}
	@Override
	public int getAttachCount(int bno) {
		int count = pdsDAO.getAttachCount(bno);
		return count;
	}
	
	
	
}
