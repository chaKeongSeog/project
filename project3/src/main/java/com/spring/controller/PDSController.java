package com.spring.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.filefilter.FalseFileFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.common.Pager;
import com.spring.dto.AttachListVO;
import com.spring.dto.AttachVO;
import com.spring.dto.BoardListVO;
import com.spring.dto.GroupFileVO;
import com.spring.service.GroupService;
import com.spring.service.PdsService;

@Controller
public class PDSController {
	@Autowired
	private PdsService pdsService;
	
	@RequestMapping(value="/pds/list",method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(defaultValue="1") int curPage,
							 @RequestParam(defaultValue="all") String search_option,
							 @RequestParam(defaultValue="") String keyword)throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		String url="pds/list";
		int count  = pdsService.getFdsListCount(search_option,keyword);
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<BoardListVO> list = pdsService.getFdsList(start,end,search_option,keyword);
		System.out.println("pdsList:"+list.toString());
		Map<String,Object> map = new HashMap<>();
		map.put("list",list);
		map.put("pager",pager);
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		mav.addObject("map",map);
		mav.addObject("count",count);
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping(value = "/pds/regist", method = RequestMethod.POST,produces="text/plain;charset=utf-8")
	public ModelAndView registForm(String id,String title,String content,List<MultipartFile> multi,HttpServletResponse response,HttpServletRequest request) throws IOException{
		String url="pds/detail";
		ModelAndView mav = new ModelAndView();
		List<AttachVO> list = new ArrayList<>();
		BoardListVO board = new BoardListVO();
		board.setId(id);
		board.setTitle(title);
		board.setContent(content);
		if(multi.isEmpty()) {
			pdsService.regist(board);
			int bno = pdsService.getMaxBno();
			BoardListVO vo = pdsService.getBoard(bno);
			mav.addObject("pds",vo);
			mav.setViewName(url);
		}else {
			list = saveFile(id,title,content,multi,response,request);
			pdsService.regist(list,board);
			int bno = pdsService.getMaxBno();
			BoardListVO vo = pdsService.getBoard(bno);
			List<AttachVO> attachList = pdsService.getAttachList(bno);
			mav.addObject("pds",vo);
			mav.addObject("attach",attachList);
			mav.setViewName(url);
		}
		
		
		return mav;
	}
	
	@RequestMapping(value="pds/detail",method = RequestMethod.GET)
	public ModelAndView detail(int bno) throws Exception{
		String url="/pds/detail";
		ModelAndView mav = new ModelAndView();
		BoardListVO pds = pdsService.getBoard(bno);
		List<AttachVO> attach = pdsService.getAttachList(bno);
		pdsService.updateHit(bno);		
		
		mav.addObject("pds",pds);
		mav.addObject("attach",attach);
		mav.setViewName(url);
		
		
		return mav;
	}
	
	@RequestMapping(value="/pds/answerForm",method = RequestMethod.POST)
	public ModelAndView answerForm(int bno) {
		ModelAndView mav = new ModelAndView();
		String url="pds/answer";
		BoardListVO pds = pdsService.getBoard(bno);
		mav.addObject("pds",pds);
		mav.setViewName(url);
		
		
		return mav;
	}
	
	public List<AttachVO> saveFile(String id,String title,String content,List<MultipartFile> multi,HttpServletResponse response,HttpServletRequest request) throws IOException{
		List<AttachVO> list = new ArrayList<>();
		String path = request.getSession().getServletContext().getRealPath("resources/upload/pds/");
		for(MultipartFile file:multi) {
			String fileName = file.getOriginalFilename();
			if(fileName != "") {
				String uuidFileName = UUID.randomUUID().toString().replace("-","")+"_"+fileName;
				File f = new File(path,uuidFileName);
				if(!f.exists()) {
					f.mkdirs();
				}
				file.transferTo(f);
				AttachVO vo = new AttachVO();
				vo.setFileName(uuidFileName);
				vo.setOriginFileName(fileName);
				vo.setPath(path);
				vo.setId(id);
				list.add(vo);
			}
		}
		return list;
	}
	
	@RequestMapping(value = "/pds/registForm", method = RequestMethod.GET)
	public String regist() {
		String url="pds/regist";
		
		
		return url;
	}
	
	@RequestMapping(value = "/pds/answer", method = RequestMethod.POST)
	public ModelAndView answer(int bno,String id,String title,String content,
							   List<MultipartFile> multi,
							   HttpServletRequest request,
							   HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView();
		String url="redirect:list";
		mav.setViewName(url);
		BoardListVO board = pdsService.getBoard(bno);
		System.out.println(board.toString());
		int ref = board.getRef();
		int ref_step = board.getRef_step()+1;
		int ref_level = board.getRef_level()+1;
		BoardListVO vo = new BoardListVO();
		vo.setRef(ref);
		vo.setRef_step(ref_step);
		vo.setRef_level(ref_level);
		vo.setId(id);
		vo.setTitle(title);
		vo.setContent(content);
		if(multi.isEmpty()) {
			pdsService.answer(vo);
			bno = pdsService.getMaxBno();
			BoardListVO pds = pdsService.getBoard(bno);
			mav.addObject("pds",pds);
		}else {
			List<AttachVO> list = saveFile(id, title, content, multi, response, request);
			pdsService.answer(list, vo);
			bno = pdsService.getMaxBno();
			BoardListVO pds = pdsService.getBoard(bno);
			List<AttachVO> attach = pdsService.getAttachList(bno);
			mav.addObject("pds",pds);			
			mav.addObject("attach",attach);
		}
		
		return mav;
	}
	
	@RequestMapping(value="/pds/Delete",method = RequestMethod.POST)
	public ModelAndView delete(int bno,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String url = "redirect:list";
		BoardListVO board = pdsService.getBoard(bno);
		int ref = board.getRef();
		int ref_step = board.getRef_step();
		List<AttachVO> list = pdsService.getChainAttachList(ref,ref_step); 
		System.out.println("list:"+list.toString());
		pdsService.delete(bno,ref,ref_step);
		String path = request.getSession().getServletContext().getRealPath("resources/upload/pds");
		for(AttachVO attach:list) {
			File f = new File(path,attach.getFileName());
			f.delete();
		}
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping(value="/pds/modifyForm",method=RequestMethod.POST)
	public ModelAndView modifyForm(int bno) {
		ModelAndView mav = new ModelAndView();
		String url="/pds/modify";
		BoardListVO board = pdsService.getBoard(bno);
		List<AttachVO> list = pdsService.getAttachList(bno);
		mav.addObject("pds",board);
		mav.addObject("attach",list);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/pds/modify",method=RequestMethod.POST)
	public ModelAndView modify(int[] ano,
							   int bno,
							   String id,
							   String title,
							   String content,
							   List<MultipartFile> multi,
							   HttpServletRequest request,
							   HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView();
		String url="/pds/detail";
		mav.setViewName(url);
		String path = request.getSession().getServletContext().getRealPath("resources/upload/pds");
		if(ano != null) {
			List<AttachVO> list = pdsService.getAttachList(ano);
			pdsService.attachDelete(list);
			for(AttachVO attach:list) {
				File f = new File(path,attach.getFileName());
				f.delete();
			}
		}
		if(multi.isEmpty()) {
			BoardListVO board = new BoardListVO();
			board.setBno(bno);
			board.setId(id);
			board.setTitle(title);
			board.setContent(content);
			pdsService.modify(board);
			BoardListVO vo = pdsService.getBoard(bno);
			List<AttachVO> list = pdsService.getAttachList(vo.getBno());
			mav.addObject("pds",vo);
			mav.addObject("attach",list);
		}else {
			List<AttachVO> list = saveFile(id, title, content, multi, response, request);	
			BoardListVO board = new BoardListVO();
			board.setBno(bno);
			board.setId(id);
			board.setTitle(title);
			board.setContent(content);
			pdsService.modify(board,list);
			BoardListVO vo = pdsService.getBoard(bno);
			List<AttachVO> attach = pdsService.getAttachList(bno);
			mav.addObject("pds",vo);
			mav.addObject("attach",attach);
		}
		
		return mav;
	}
	
	@RequestMapping(value="/pds/download",method=RequestMethod.GET)
	public void download(int ano,HttpServletRequest request,HttpServletResponse response) throws Exception{
		List<AttachVO> list = new ArrayList<>();
		AttachVO vo = pdsService.getAttach(ano);
		
		//파일이름 가져오기
		String fileName = vo.getFileName();
		//파일원래이름 가져오기
		String originFileName = vo.getFileName();
		originFileName = originFileName.substring(originFileName.lastIndexOf("_")+1);
		
		// MIME Type 을 application/octet-stream 타입으로 변경
        // 무조건 팝업(다운로드창)이 뜨게 된다.
		response.setContentType("application/octet-stream");
		// 브라우저는 ISO-8859-1을 인식하기 때문에
        // UTF-8 -> ISO-8859-1로 디코딩, 인코딩 한다.
		originFileName = new String(originFileName.getBytes("UTF-8"), "iso-8859-1");
		
		//파일명 지정
		response.setHeader("Content-Disposition", "attachment; filename=\""+originFileName+"\"");
		
		OutputStream os = response.getOutputStream();
		String path = request.getSession().getServletContext().getRealPath("resources/upload/pds");
        FileInputStream fis = new FileInputStream(path + File.separator + fileName);
        int n = 0;
        byte[] b = new byte[512];
        while((n = fis.read(b)) != -1 ) {
            os.write(b, 0, n);
        }
        fis.close();
        os.close();

	}
	
	
}
