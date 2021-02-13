package com.spring.service;

import java.util.List;

import com.spring.dao.LectureDAO;
import com.spring.dao.MemberDAO;
import com.spring.dto.EvaluationVO;
import com.spring.dto.LectureReplyVO;
import com.spring.dto.ReportVO;

public class LectureServiceImpl implements LectureService{
	private LectureDAO lectureDAO;
	
	public void setLectureDAO(LectureDAO lectureDAO) {
		this.lectureDAO = lectureDAO;
	}

	@Override
	public int getListCount(String search_option, String keyword) {
		int count = lectureDAO.getListCount(search_option,keyword);
		return count;
	}

	@Override
	public List<EvaluationVO> getList(int start, int end, String search_option, String keyword) {
		List<EvaluationVO> list = lectureDAO.getList(start,end,search_option,keyword);
		
		return list;
	}

	@Override
	public EvaluationVO regist(EvaluationVO eval) {
		lectureDAO.regist(eval);
		int eno = lectureDAO.getMaxEno();
		EvaluationVO vo = lectureDAO.getEvaluation(eno);
		return vo;
	}

	@Override
	public void delete(int eno) {
		lectureDAO.delete(eno);
		
	}

	@Override
	public void likeUp(int eno) {
		lectureDAO.likeUp(eno);
		
	}

	@Override
	public EvaluationVO getEvaluation(int eno) {
		EvaluationVO Evaluation = lectureDAO.getEvaluation(eno);
		return Evaluation;
	}

	@Override
	public Object likeCheck(int eno) {
		Object enoCheck = lectureDAO.likeCheck(eno);
		return enoCheck;
	}

	@Override
	public void likeCheckWrite(int eno, String id) {
		lectureDAO.likeCheckWrite(eno,id);
		
	}

	@Override
	public void likeCheckDelete(int eno) {
		lectureDAO.likeCheckDelete(eno);
		
	}

	@Override
	public void reportRegist(ReportVO report) {
		lectureDAO.reportRegist(report);
		
	}

	@Override
	public void modify(EvaluationVO eval) {
		lectureDAO.modify(eval);
		
	}
	
	@Override
	public void replyWrite(LectureReplyVO vo) {
		lectureDAO.replyWrite(vo);
		
	}

	@Override
	public int replyListCount(int eno) {
		int count = lectureDAO.replyListCount(eno);
		return count;
	}

	@Override
	public List<LectureReplyVO> replyList(int start,int end,int eno) {
		List<LectureReplyVO> list = lectureDAO.replyList(start,end,eno);
		return list;
	}

	@Override
	public void replyModify(int rno, String rcont) {
		lectureDAO.replyModify(rno,rcont);
		
	}

	@Override
	public void replyDelete(int ref,int ref_step) {
		lectureDAO.replyDelete(ref,ref_step);
		
	}

	@Override
	public void replyAnswer(int rno,int eno, String rcont, String id) {
		LectureReplyVO vo = lectureDAO.getReply(eno,rno);
		System.out.println("해당 댓글 불러오기:"+vo.toString());
		int ref = vo.getRef();
		int ref_step = vo.getRef_step()+1;
		int ref_level = vo.getRef_level()+1;
		lectureDAO.replyRefUpdate(ref,ref_step);
		lectureDAO.replyAnswer(rno,eno,rcont,id,ref,ref_step,ref_level);
		
	}

	@Override
	public LectureReplyVO getReply(int rno,int eno) {
		LectureReplyVO vo = lectureDAO.getReply(eno, rno);
		return vo;
	}

	@Override
	public void answer(EvaluationVO evo) {
		int eno = evo.getEno();
		int ref_step = evo.getRef_step();
		int ref = evo.getRef();
		lectureDAO.refUpdate(ref,ref_step);
		lectureDAO.answer(evo);
	}

	@Override
	public void replyDeleteOne(int rno) {
		lectureDAO.replyDeleteOne(rno);
		
	}

	@Override
	public LectureReplyVO getReplyOne(int rno) {
		LectureReplyVO vo = lectureDAO.getReplyOne(rno);
		return vo;
	}
	
	
	
}
