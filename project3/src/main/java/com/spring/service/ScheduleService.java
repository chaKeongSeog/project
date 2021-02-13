package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.dto.GroupScheduleVO;
import com.spring.dto.ScheduleVO;

@Service
public interface ScheduleService {

	void addSchedule(ScheduleVO vo);

	int getNum();

	List<ScheduleVO> showSchedule(String id);

	void delete(int sno);
	
	List<GroupScheduleVO> getGroupScheduleList(int gno);
	
	void GroupAddSchedule(GroupScheduleVO vo);
	
	int getGroupScheduleNum(int gno);
	
	void groupScheduleDelete(int sno);
	
	int getGroupScheduleCount(int gno);
}
