package com.spring.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dto.ChatListVO;
import com.spring.dto.ChatVO;
import com.spring.service.ChatService;
import com.spring.service.GroupService;



@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@RequestMapping(value = "/chat/list", method = RequestMethod.POST)
	@ResponseBody
	public List<ChatListVO> list(String fromID,String toID,int cno) {
		ModelAndView mav = new ModelAndView();
		List<ChatListVO> list = chatService.getList(fromID,toID,cno);
		chatService.readModify(toID,fromID);
		mav.addObject("list",list);
		
		return list;
	}
	@RequestMapping(value = "/chat/index", method = RequestMethod.GET)
	public ModelAndView index() {
		String url="chat/index";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(url);
	
		return mav;
	}
	@RequestMapping(value = "/chat/detail", method = RequestMethod.POST)
	public ModelAndView detail(String toID) {
		String url="chat/detail";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(url);
		mav.addObject("toID",toID);
		return mav;
	}

	@RequestMapping(value = "/chat/regist", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> regist(String fromID,String toID,String content){
		ResponseEntity<String> entity = null;
		try {
			chatService.regist(fromID,toID,content);
//			entity = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	@RequestMapping(value="/chat/unreadCount",method = RequestMethod.POST)
	@ResponseBody
	public int unreadCount(String fromID) {
		int count = chatService.unreadCount(fromID);
		
		return count;
	}
	@RequestMapping(value = "/chat/messageBoxDetail", method = RequestMethod.GET)
	public ModelAndView messageBoxDetail(String toID) {
		String url="chat/messageBox";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(url);
		mav.addObject("toID",toID);
		return mav;
	}
	@RequestMapping(value = "/chat/messageList", method = RequestMethod.POST)
	@ResponseBody
	public List<ChatVO> messageList(String fromID) {
		List<ChatVO> list = null;
		try {
			list = chatService.getMessageList(fromID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	@RequestMapping(value = "/chat/memberFind", method = RequestMethod.GET)
	public String memberFind() {
		String url="chat/friendFind";
		
		
		return url;
	}
	
	
	
}
