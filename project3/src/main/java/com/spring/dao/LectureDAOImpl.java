package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.EvaluationVO;
import com.spring.dto.LectureReplyVO;
import com.spring.dto.ReportVO;

public class LectureDAOImpl implements LectureDAO{
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int getListCount(String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		int count = sqlSession.selectOne("Lecture-Mapper.getListCount",map);
		
		return count;
	}

	@Override
	public List<EvaluationVO> getList(int start, int end, String search_option, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("start",start);
		map.put("end",end);
		map.put("search_option", search_option);
		map.put("keyword",keyword);
		List<EvaluationVO> list = sqlSession.selectList("Lecture-Mapper.getList",map);
		
		return list;
	}

	@Override
	public void regist(EvaluationVO eval) {
		sqlSession.insert("Lecture-Mapper.regist",eval);
		
	}

	@Override
	public void delete(int eno) {
		sqlSession.delete("Lecture-Mapper.delete",eno);
		
	}

	@Override
	public void likeUp(int eno) {
		sqlSession.update("Lecture-Mapper.likeUp",eno);
		
	}

	@Override
	public EvaluationVO getEvaluation(int eno) {
		EvaluationVO Evaluation = sqlSession.selectOne("Lecture-Mapper.getEvaluation",eno);
		return Evaluation;
	}

	@Override
	public Object likeCheck(int eno) {
		Object enoCheck = sqlSession.selectOne("Lecture-Mapper.likeCheck",eno);
		return enoCheck;
	}

	@Override
	public void likeCheckWrite(int eno, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("eno",eno);
		map.put("id",id);
		sqlSession.insert("Lecture-Mapper.likeCheckWrite",map);
		
	}

	@Override
	public void likeCheckDelete(int eno) {
		sqlSession.delete("Lecture-Mapper.likeCheckDelete",eno);
		
	}

	@Override
	public void reportRegist(ReportVO report) {
		sqlSession.insert("Lecture-Mapper.reportRegist",report);
		
	}

	@Override
	public void modify(EvaluationVO eval) {
		sqlSession.update("Lecture-Mapper.modify",eval);
		
	}
	
	@Override
	public void replyWrite(LectureReplyVO vo) {
		sqlSession.insert("Lecture-Mapper.replyWrite",vo);
		
	}

	@Override
	public int replyListCount(int eno) {
		int count = sqlSession.selectOne("Lecture-Mapper.replyListCount",eno);
		return count;
	}

	@Override
	public List<LectureReplyVO> replyList(int start,int end,int eno) {
		Map<String,Object> map = new HashMap<>();
		map.put("eno",eno);
		map.put("start",start);
		map.put("end",end);
		List<LectureReplyVO> list = sqlSession.selectList("Lecture-Mapper.replyList",map);
		return list;
	}

	@Override
	public void replyModify(int rno, String rcont) {
		Map<String,Object> map = new HashMap<>();
		map.put("rno",rno);
		map.put("rcont",rcont);
		sqlSession.update("Lecture-Mapper.replyModify",map);
		
	}

	@Override
	public void replyDelete(int ref,int ref_step) {
		Map<String,Object> map = new HashMap<>();
		map.put("ref",ref);
		map.put("ref_step",ref_step);
		sqlSession.delete("Lecture-Mapper.replyDelete",map);
		
	}

	@Override
	public void replyAnswer(int rno, int eno,String rcont, String id,int ref,int ref_step,int ref_level) {
		Map<String,Object> map = new HashMap<>();
		map.put("rno",rno);
		map.put("eno",eno);
		map.put("content",rcont);
		map.put("id",id);
		map.put("ref",ref);
		map.put("ref_step",ref_step);
		map.put("ref_level",ref_level);
		sqlSession.insert("Lecture-Mapper.replyAnswer",map);
		
	}

	@Override
	public LectureReplyVO getReply(int eno, int rno) {
		Map<String,Object> map = new HashMap<>();
		map.put("rno",rno);
		map.put("eno",eno);
		LectureReplyVO vo = sqlSession.selectOne("Lecture-Mapper.getReply",map);
		return vo;
	}

	@Override
	public void replyRefUpdate(int ref, int ref_step) {
		Map<String,Object> map = new HashMap<>();
		map.put("ref",ref);
		map.put("ref_step",ref_step);
		sqlSession.update("Lecture-Mapper.replyRefUpdate",map);
		
	}

	@Override
	public void answer(EvaluationVO evo) {
		sqlSession.insert("Lecture-Mapper.answer",evo);
		
	}

	@Override
	public void refUpdate(int ref, int ref_step) {
		Map<String,Object> map = new HashMap<>();
		map.put("ref",ref);
		map.put("ref_step",ref_step);
		sqlSession.update("Lecture-Mapper.refUpdate",map);
		
	}

	@Override
	public int getMaxEno() {
		int eno = sqlSession.selectOne("Lecture-Mapper.getMaxEno");
		return eno;
	}

	@Override
	public void replyDeleteOne(int rno) {
		sqlSession.delete("Lecture-Mapper.replyDeleteOne",rno);
		
	}

	@Override
	public LectureReplyVO getReplyOne(int rno) {
		LectureReplyVO vo = sqlSession.selectOne("Lecture-Mapper.getReplyOne",rno);
		return vo;
	}
	
	
	
}
