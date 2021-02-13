package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.common.Pager;
import com.spring.dto.BoardListVO;
import com.spring.dto.BoardVO;
import com.spring.service.FreeBoardService;

@Controller
public class FreeBoardController {
	@Autowired
	private FreeBoardService freeService;
	
	@RequestMapping(value = "freeBoard/list", method = RequestMethod.GET)
	public ModelAndView home(@RequestParam(defaultValue = "1") int curPage,
							@RequestParam(defaultValue = "all") String search_option,
							@RequestParam(defaultValue = "") String keyword) 
									throws Exception{
		String url="freeBoard/list";
		int count  = freeService.getListCount(search_option,keyword);
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardListVO> list = freeService.getSearchFreeList(start,end,search_option,keyword);
		
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
	@RequestMapping(value = "freeBoard/registForm", method = RequestMethod.GET)
	public String regist() {
		
		String url="freeBoard/regist";
		
		
		return url;
	}
	
	@RequestMapping(value = "freeBoard/answerForm", method = RequestMethod.POST)
	public ModelAndView answer(int bno) {
		String url="freeBoard/answer";
		ModelAndView mav = new ModelAndView();
		BoardListVO freeBoard = freeService.getDetail(bno);
		mav.addObject("freeBoard",freeBoard);
		mav.setViewName(url);
		return mav;
	}
	@RequestMapping(value="freeBoard/regist",method = RequestMethod.POST)
	public ModelAndView regist(@RequestParam(defaultValue = "test") String id,@RequestParam(defaultValue = "test") String title, @RequestParam(defaultValue = "test") String content) throws Exception{
		String url="freeBoard/detail";
		ModelAndView mav = new ModelAndView();
		BoardListVO freeBoard = new BoardListVO();
		freeBoard.setId(id);
		freeBoard.setTitle(title);
		freeBoard.setContent(content);
		freeService.regist(freeBoard);
		int bno = freeService.getBno();
		freeBoard = freeService.getDetail(bno);
		mav.addObject("freeBoard",freeBoard);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="freeBoard/detail",method = RequestMethod.GET)
	public ModelAndView detail(int bno) throws Exception{
		
		String url="/freeBoard/detail";
		ModelAndView mav = new ModelAndView();
		
		BoardListVO freeBoard = freeService.getDetail(bno);
		//조회수 증가
		freeService.updateHit(bno);
		
		mav.addObject("freeBoard",freeBoard);
		mav.setViewName(url);
		
		return mav;
	}
	@RequestMapping(value = "freeBoard/modifyForm", method = RequestMethod.POST)
	public ModelAndView modify(int bno) {
		String url="freeBoard/modify";
		ModelAndView mav = new ModelAndView();
		BoardListVO freeBoard = freeService.getDetail(bno);
		mav.addObject("freeBoard",freeBoard);
		mav.setViewName(url);
		return mav;
	}
	@RequestMapping(value="freeBoard/modify",method = RequestMethod.POST)
	public ModelAndView modify(int  bno,@RequestParam(defaultValue = "test") String id,@RequestParam(defaultValue = "test") String title, @RequestParam(defaultValue = "test") String content) throws Exception{
		String url="/freeBoard/detail";
		ModelAndView mav = new ModelAndView();
		BoardVO board = new BoardVO();
		board.setBno(bno);
		board.setId(id);
		board.setTitle(title);
		board.setContent(content);
		freeService.modify(board);
		BoardListVO vo = freeService.getDetail(bno);
		mav.addObject("freeBoard",vo);
		mav.setViewName(url);
		
		return mav;
	}

	@RequestMapping(value="freeBoard/Delete",method = RequestMethod.POST)
	public String delete(int bno) throws Exception{
		String url="redirect:/freeBoard/list";
		BoardListVO freeBoard = freeService.getDetail(bno);
		int ref_step = freeBoard.getRef_step();
		if(ref_step == 1) {
			int ref = freeBoard.getRef();
			freeService.refDelete(ref);
		}else {
			freeService.delete(bno);
		}
		return url;
	}
	
	@RequestMapping(value="freeBoard/answer",method=RequestMethod.POST)
	public ModelAndView answer(String id,int bno,String title,String content) throws Exception{
		String url="/freeBoard/detail";
		ModelAndView mav = new ModelAndView();
		BoardListVO vo = freeService.getDetail(bno);
		System.out.println(vo.toString());
		int ref = vo.getRef();
		int ref_step = vo.getRef_step();
		int ref_level = vo.getRef_level();
		BoardListVO vo2 = new BoardListVO();
		vo2.setBno(bno);
		vo2.setTitle(title);
		vo2.setContent(content);
		vo2.setId(id);
		vo2.setRef(ref);
		vo2.setRef_step(ref_step+1);
		vo2.setRef_level(ref_level+1);
		freeService.answer(vo2);
		int answer_bno = freeService.getBno();
		BoardListVO freeBoard = freeService.getDetail(answer_bno);
		
		mav.addObject("freeBoard",freeBoard);
		mav.setViewName(url);
		return mav;
	}
	
}
