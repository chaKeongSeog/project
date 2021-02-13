package com.spring.service;

import java.util.List;

import com.spring.dao.ScheduleDAO;
import com.spring.dto.GroupScheduleVO;
import com.spring.dto.ScheduleVO;

public class ScheduleServiceImpl implements ScheduleService{
	private ScheduleDAO scheduleDAO;
	public void setScheduleDAO(ScheduleDAO scheduleDAO) {
		this.scheduleDAO = scheduleDAO;
	}
	@Override
	public void addSchedule(ScheduleVO vo) {
		scheduleDAO.addSchedule(vo);
		
	}
	@Override
	public int getNum() {
		int sno = scheduleDAO.getNum();
		return sno;
	}
	@Override
	public List<ScheduleVO> showSchedule(String id) {
		List<ScheduleVO> list = scheduleDAO.showSchedule(id);
		return list;
	}
	@Override
	public void delete(int sno) {
		scheduleDAO.delete(sno);
		
	}
	@Override
	public List<GroupScheduleVO> getGroupScheduleList(int gno) {
		List<GroupScheduleVO> list = scheduleDAO.getGroupScheduleList(gno);
		return list;
	}
	@Override
	public void GroupAddSchedule(GroupScheduleVO vo) {
		scheduleDAO.GroupAddSchedule(vo);
		
	}
	@Override
	public int getGroupScheduleNum(int gno) {
		int num = scheduleDAO.getGroupScheduleNum(gno);
		return num;
	}
	@Override
	public void groupScheduleDelete(int sno) {
		scheduleDAO.groupScheduleDelete(sno);
		
	}
	@Override
	public int getGroupScheduleCount(int gno) {
		int count = scheduleDAO.getGroupScheduleCount(gno);
		return count;
	}
	
	
}
