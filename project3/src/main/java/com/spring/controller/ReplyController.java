package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.common.Pager;
import com.spring.dto.BoardListVO;
import com.spring.dto.ReplyVO;
import com.spring.service.ReplyService;

@RestController
public class ReplyController {
	
	@Autowired
	ReplyService replyService;
	
	
	@RequestMapping(value="/reply/write",method = RequestMethod.POST)
	public void write(ReplyVO reply,int bno) throws Exception{
		BoardListVO board = replyService.getBoard(bno);
		String brd_gb = board.getBrd_gb();
		reply.setBrd_gb(brd_gb);
		
		replyService.write(reply);
		
	}
	@RequestMapping(value="/excludes/reply/replyList",method = RequestMethod.POST)
	public ModelAndView replyList(int bno,@RequestParam(defaultValue = "1") int curPage) throws Exception{
		String url="/reply/replyList";
		int count = replyService.getCount(bno);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<ReplyVO> list = replyService.getReplyList(start,end,bno);
		System.out.println("replyList:"+list.toString());
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("pager",pager);
		map.put("list",list);
		map.put("bno",bno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("map",map);
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping(value="/reply/modify",method = RequestMethod.POST)
	public void write(int rno,String rcont) throws Exception{
		ReplyVO reply = new ReplyVO();
		reply.setRno(rno);
		reply.setContent(rcont);
		replyService.modify(reply);
		
	}
	@RequestMapping(value="/reply/delete",method = RequestMethod.POST)
	public void delete(int rno) throws Exception{
		ReplyVO reply = replyService.getReply(rno);
		int ref_step = reply.getRef_step();
		if(ref_step == 1) {
			int ref = replyService.getReply(rno).getRef();
			replyService.refDelete(ref);
		}else {
			replyService.delete(rno);
		}
		
		
	}
	
	@RequestMapping(value = "/reply/answer",method = RequestMethod.POST)
	public void answer(int rno,String rcont,String id) throws Exception{
		ReplyVO reply = replyService.getReply(rno);
		System.out.println(reply.toString());
		int bno = reply.getBno();
		int ref = reply.getRef();
		int ref_step = reply.getRef_step();
		int ref_level = reply.getRef_level();
		
		BoardListVO board = replyService.getBoard(bno);
		String brd_gb = board.getBrd_gb();
		
		ReplyVO vo = new ReplyVO();
		vo.setBno(bno);
		vo.setRef(ref);
		vo.setRef_step(ref_step+1);
		vo.setRef_level(ref_level+1);
		vo.setContent(rcont);
		vo.setId(id);
		vo.setBrd_gb(brd_gb);
		replyService.answer(vo);
		
	}
}
