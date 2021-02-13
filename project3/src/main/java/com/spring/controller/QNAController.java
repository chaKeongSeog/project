package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.common.Pager;
import com.spring.dto.BoardListVO;
import com.spring.dto.QnaVO;
import com.spring.dto.ReplyVO;
import com.spring.service.QnaService;

@Controller
public class QNAController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping(value = "/qna/list", method = RequestMethod.GET)
	public ModelAndView home(@RequestParam(defaultValue = "1") int curPage,
							 @RequestParam(defaultValue = "all") String search_option,
							 @RequestParam(defaultValue = "") String keyword,
							 HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String url="qna/list";
		
		int count = qnaService.getListCount(search_option,keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<QnaVO> list = qnaService.getList(start,end,search_option,keyword);
		for(int i = 0; i <list.size();i++) {
			List<ReplyVO> replyList = qnaService.getReplyList(list.get(i).getBno());
			list.get(i).setReplyList(replyList);
		}
		System.out.println("asdasdasdasd:"+list.toString());
		Map<String,Object> map = new HashMap<>();
		map.put("list",list);
		map.put("pager",pager);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.addObject("map",map);
		return mav;
	}
	
	@RequestMapping(value="/qna/registForm",method = RequestMethod.GET)
	public String registForm() {
		String url = "qna/regist";
		
		return url;
	}
	
	@RequestMapping(value="/qna/regist",method = RequestMethod.POST)
	public String regist(String id,String title,String content) {
		String url = "redirect:list";
		QnaVO vo = new QnaVO();
		vo.setId(id);
		vo.setTitle(title);
		vo.setContent(content);
		qnaService.regist(vo);
		
		
		return url;
	}
	
	@RequestMapping(value="/qna/modify",method = RequestMethod.POST)
	public String modify(int bno,String title,String content) {
		String url="redirect:list";
		QnaVO vo = new QnaVO();
		vo.setBno(bno);
		vo.setContent(content);
		vo.setTitle(title);
		qnaService.modify(vo);
		return url;
	}
	
	@RequestMapping(value="/qna/qnadelete",method = RequestMethod.GET)
	public String delete(int bno) {
		String url="redirect:list";
		qnaService.delete(bno);
		return url;
	}
}
