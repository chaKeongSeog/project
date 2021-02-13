package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.dao.NoticeDAO;
import com.spring.dao.ReplyDAO;
import com.spring.dto.BoardListVO;
import com.spring.dto.ReplyVO;

public class ReplyServiceImpl implements ReplyService{
	
	private ReplyDAO replyDAO;

	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	@Override
	public void write(ReplyVO reply) {
		replyDAO.write(reply);
		
	}

	@Override
	public int getCount(int bno) {
		int count = replyDAO.getCount(bno);
		return count;
	}

	@Override
	public List<ReplyVO> getReplyList(int start, int end,int bno) {
		List<ReplyVO> list = replyDAO.getReplyList(start,end,bno);
		return list;
	}

	@Override
	public void modify(ReplyVO reply) {
		replyDAO.modify(reply);
		
	}

	@Override
	public void delete(int rno) {
		replyDAO.delete(rno);
		
	}

	@Override
	public ReplyVO getReply(int rno) {
		ReplyVO reply = replyDAO.getReply(rno);
		return reply;
	}

	@Override
	public void answer(ReplyVO vo) {
		int ref = vo.getRef();
		int ref_step = vo.getRef_step();
		Map<String,Object> map = new HashMap<>();
		map.put("ref",ref);
		
		map.put("ref_step",ref_step);
		replyDAO.refUpdate(map);	
		replyDAO.answer(vo);
		
	}

	@Override
	public void refDelete(int ref) {
		replyDAO.refDelete(ref);
		
	}

	@Override
	public BoardListVO getBoard(int bno) {
		BoardListVO board = replyDAO.getBoard(bno);
		return board;
	}

	@Override
	public int getReplyCount(String search_option,String keyword,String brd_gb) {
		int count = replyDAO.getReplyCount(search_option,keyword,brd_gb);
		return count;
	}

	@Override
	public List<ReplyVO> getAdminReplyList(int start, int end, String brd_gb,String search_option,String keyword) {
		List<ReplyVO> list = replyDAO.getAdminReplyList(start,end,brd_gb,search_option,keyword);
		return list;
	}

	@Override
	public int getlecturereplyCount(String search_option, String keyword) {
		int count = replyDAO.getlecturereplyCount(search_option,keyword);
		return count;
	}

	@Override
	public List<ReplyVO> getAdminlecturereReplyList(int start, int end, String search_option, String keyword) {
		List<ReplyVO> list = replyDAO.getAdminlecturereReplyList(start,end,search_option,keyword);
		return list;
	}

	
	
	
	

}
