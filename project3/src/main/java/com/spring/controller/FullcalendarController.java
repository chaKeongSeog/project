package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dto.GroupScheduleVO;
import com.spring.dto.ScheduleVO;
import com.spring.service.ScheduleService;

@Controller
public class FullcalendarController {
	
	@Autowired
	private ScheduleService scheduleService;
		
	@RequestMapping(value = "calendar/addSchedule", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView addSchedule(String title,String startDate,String endDate,String id) throws Exception{
		ScheduleVO vo = new ScheduleVO();
		vo.setTitle(title);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		vo.setId(id);
		scheduleService.addSchedule(vo);
		int num = scheduleService.getNum();
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("num",num);
		return mav;
	}
	@RequestMapping(value = "/calandar/calandarDelete")
	@ResponseBody
	public String 	calandarDelete(int sno)throws Exception {
		scheduleService.delete(sno);
	    
		return null;
	}
	@RequestMapping(value="/calendar/GroupAddSchedule",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView teamAddSchedule(GroupScheduleVO vo) throws Exception{
		ModelAndView mav = new ModelAndView("jsonView");
		scheduleService.GroupAddSchedule(vo);
		int gno = vo.getGno();
		int num = scheduleService.getGroupScheduleNum(gno);
		mav.addObject("num",num);
		
		return mav;
	}
	
	@RequestMapping(value="/calandar/GroupCalandarDelete",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView GroupCalandarDelete(int sno) throws Exception{
		ModelAndView mav = new ModelAndView("jsonView");
		scheduleService.groupScheduleDelete(sno);
		
		return null;
	}
	
}
