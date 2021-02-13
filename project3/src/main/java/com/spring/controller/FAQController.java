package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.common.Pager;
import com.spring.dto.FaqVO;
import com.spring.dto.QnaVO;
import com.spring.dto.ReplyVO;
import com.spring.service.FaqService;

@Controller
public class FAQController {
	
	@Autowired
	private FaqService faqService;
	
	@RequestMapping(value = "/faq/list", method = RequestMethod.GET)
	public ModelAndView home(@RequestParam(defaultValue = "1") int curPage,
							 @RequestParam(defaultValue = "all") String search_option,
							 @RequestParam(defaultValue = "") String keyword,
							 HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String url="faq/list";
		
		int count = faqService.getListCount(search_option,keyword);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<FaqVO> list = faqService.getList(start,end,search_option,keyword);
		for(int i = 0; i <list.size();i++) {
			List<ReplyVO> replyList = faqService.getReplyList(list.get(i).getBno());
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
	
	@RequestMapping(value="/faq/registForm",method = RequestMethod.GET)
	public String registForm() {
		String url = "faq/regist";
		
		return url;
	}
	
	@RequestMapping(value="/faq/regist",method = RequestMethod.POST)
	public String regist(String id,String title) {
		String url = "redirect:list";
		FaqVO vo = new FaqVO();
		vo.setId(id);
		vo.setTitle(title);
		faqService.regist(vo);
		
		
		return url;
	}
	
	@RequestMapping(value="/faq/modify",method = RequestMethod.POST)
	public String modify(int bno,String title) {
		String url="redirect:list";
		FaqVO vo = new FaqVO();
		vo.setBno(bno);
		vo.setTitle(title);
		faqService.modify(vo);
		return url;
	}

	@RequestMapping(value="/faq/faqdelete",method = RequestMethod.GET)
	public String delete(int bno) {
		String url="redirect:list";
		faqService.delete(bno);
		return url;
	}
	
}
