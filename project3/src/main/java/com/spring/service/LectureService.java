package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.dto.EvaluationVO;
import com.spring.dto.LectureReplyVO;
import com.spring.dto.ReportVO;

@Service
public interface LectureService {
	int getListCount(String search_option,String keyword);
	
	List<EvaluationVO> getList(int start,int end,String search_option,String keyword);
	
	EvaluationVO regist(EvaluationVO eval);
	
	void delete(int eno);
	
	void likeUp(int eno);

	EvaluationVO getEvaluation(int eno);

	Object likeCheck(int eno);

	void likeCheckWrite(int eno, String id);

	void likeCheckDelete(int eno);	
	
	void reportRegist(ReportVO report);
	
	void modify(EvaluationVO eval);
	
	void replyWrite(LectureReplyVO vo);
	
	int replyListCount(int eno);
	
	List<LectureReplyVO> replyList(int start,int end,int eno);
	
	void replyModify(int rno,String rcont);
	
	void replyDelete(int ref,int ref_step);
	
	void replyAnswer(int rno,int eno,String rcont,String id);
	
	LectureReplyVO getReply(int rno,int eno);
	
	void answer(EvaluationVO evo);
	
	void replyDeleteOne(int rno);
	
	LectureReplyVO getReplyOne(int rno);
}
