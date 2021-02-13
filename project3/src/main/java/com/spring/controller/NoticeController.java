package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.common.Pager;
import com.spring.dto.BoardListVO;
import com.spring.dto.BoardVO;
import com.spring.service.NoticeService;


@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "notice/list", method = RequestMethod.GET)
	public ModelAndView home(@RequestParam(defaultValue = "1") int curPage,
							@RequestParam(defaultValue = "all") String search_option,
							@RequestParam(defaultValue = "") String keyword) 
									throws Exception{
		String url="notice/list";
		int count  = noticeService.getListCount(search_option,keyword);
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardListVO> list = noticeService.getSearchNoticeList(start,end,search_option,keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(url);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("count",count);
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		map.put("pager",pager);
		mav.addObject("map",map);
		return mav;
	}
	@RequestMapping(value = "/notice/registForm", method = RequestMethod.GET)
	public String regist() {
		
		String url="notice/regist";
		
		
		return url;
	}
	@RequestMapping(value="notice/regist",method = RequestMethod.POST)
	public ModelAndView regist(@RequestParam(defaultValue = "test") String id,@RequestParam(defaultValue = "test") String title, @RequestParam(defaultValue = "test") String content) throws Exception{
		String url="notice/detail";
		ModelAndView mav = new ModelAndView();
		BoardVO notice = new BoardVO();
		notice.setId(id);
		notice.setTitle(title);
		notice.setContent(content);
		noticeService.regist(notice);
		int bno = noticeService.getBno();
		BoardListVO vo = noticeService.getDetail(bno);
		mav.addObject("notice",vo);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="notice/detail",method = RequestMethod.GET)
	public ModelAndView detail(int bno) throws Exception{
		
		String url="/notice/detail";
		ModelAndView mav = new ModelAndView();
		
		BoardListVO notice = noticeService.getDetail(bno);
		//조회수 증가
		noticeService.updateHit(bno);
		
		mav.addObject("notice",notice);
		mav.setViewName(url);
		
		return mav;
	}
	@RequestMapping(value = "/notice/modifyForm", method = RequestMethod.POST)
	public ModelAndView modify(int bno) {
		String url="notice/modify";
		ModelAndView mav = new ModelAndView();
		BoardListVO notice = noticeService.getDetail(bno);
		mav.addObject("notice",notice);
		mav.setViewName(url);
		return mav;
	}
	
	
	@RequestMapping(value = "/notice/answerForm", method = RequestMethod.POST)
	public ModelAndView answer(int bno) {
		String url="notice/answer";
		ModelAndView mav = new ModelAndView();
		BoardListVO notice = noticeService.getDetail(bno);
		mav.addObject("notice",notice);
		mav.setViewName(url);
		return mav;
	}
	@RequestMapping(value="notice/modify",method = RequestMethod.POST)
	public ModelAndView modify(int  bno,@RequestParam(defaultValue = "test") String id,@RequestParam(defaultValue = "test") String title, @RequestParam(defaultValue = "test") String content) throws Exception{
		String url="/notice/detail";
		ModelAndView mav = new ModelAndView();
		BoardVO board = new BoardVO();
		board.setBno(bno);
		board.setId(id);
		board.setTitle(title);
		board.setContent(content);
		noticeService.modify(board);
		BoardListVO vo = noticeService.getDetail(bno);
		mav.addObject("notice",vo);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="notice/Delete",method = RequestMethod.POST)
	public String delete(int bno) throws Exception{
		String url="redirect:/notice/list";
		noticeService.delete(bno);
		
		
		return url;
	}
	

}
