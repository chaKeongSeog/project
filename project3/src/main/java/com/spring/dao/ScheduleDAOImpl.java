package com.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.dto.GroupScheduleVO;
import com.spring.dto.ScheduleVO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public void addSchedule(ScheduleVO vo) {
		sqlSession.insert("Schedule-Mapper.addSchedule",vo);
		
	}
	@Override
	public int getNum() {
		int sno = sqlSession.selectOne("Schedule-Mapper.getNum");
		return sno;
	}
	@Override
	public List<ScheduleVO> showSchedule(String id) {
		List<ScheduleVO> list = sqlSession.selectList("Schedule-Mapper.showSchedule",id);
		return list;
	}
	@Override
	public void delete(int sno) {
		sqlSession.delete("Schedule-Mapper.delete",sno);
		
	}
	@Override
	public List<GroupScheduleVO> getGroupScheduleList(int gno) {
		List<GroupScheduleVO> list = sqlSession.selectList("Schedule-Mapper.getGroupScheduleList",gno);
		return list;
	}
	@Override
	public void GroupAddSchedule(GroupScheduleVO vo) {
		sqlSession.insert("Schedule-Mapper.GroupAddSchedule",vo);
		
	}
	@Override
	public int getGroupScheduleNum(int gno) {
		int num = sqlSession.selectOne("Schedule-Mapper.getGroupScheduleNum",gno);
		return num;
	}
	@Override
	public void groupScheduleDelete(int sno) {
		sqlSession.delete("Schedule-Mapper.groupScheduleDelete",sno);
		
	}
	@Override
	public int getGroupScheduleCount(int gno) {
		int count = sqlSession.selectOne("Schedule-Mapper.getGroupScheduleCount",gno);
		return count;
	}
	
	
}
