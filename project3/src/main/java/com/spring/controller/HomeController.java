package com.spring.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.http.HTTPException;

import org.apache.tiles.request.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dto.BoardListVO;
import com.spring.dto.GroupVO;
import com.spring.service.FreeBoardService;
import com.spring.service.GroupService;
import com.spring.service.NoticeService;




@Controller
public class HomeController {
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private FreeBoardService freeService;
	
	@Autowired
	private GroupService groupService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		String url="index";
		
		
		return url;
	}
	@RequestMapping(value = "/index2", method = RequestMethod.GET)
	public String index2(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		String url="index2";
		
		
		return url;
	}
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		
		


		String url="main";
		return url;
	}
	
	@RequestMapping(value="/home/myinfo",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView myinfo(String id) {
		ModelAndView mav = new ModelAndView("jsonView");
		List<BoardListVO> noticeList = noticeService.getSearchNoticeList(1,5,"all","");
		List<BoardListVO> freeList = freeService.getSearchFreeList(1,5,"all","");
		List<GroupVO> groupList = groupService.getMemberGroupList(id);
		
		Map<String,Object> map = new HashMap<>();
		map.put("notice",noticeList);
		map.put("free",freeList);
		map.put("group",groupList);
		mav.addObject("map",map);
		
		return mav; 
	}
	
}
