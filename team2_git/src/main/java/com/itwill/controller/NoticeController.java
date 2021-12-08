package com.itwill.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.domain.MemberDTO;
import com.itwill.domain.NoticeDTO;
import com.itwill.domain.PageDTO;
import com.itwill.service.NoticeService;

@Controller
public class NoticeController {
	@Inject
	private NoticeService noticeService;
	
	@RequestMapping(value = "/notice/insert", method = RequestMethod.GET)
	public String insert(HttpSession session, Model model){
		String u_id=(String)session.getAttribute("u_id");
		model.addAttribute("u_id", u_id);
		return "notice/insert";
	}
	
	@RequestMapping(value = "/notice/insertPro", method = RequestMethod.POST)
	public String insertPro(NoticeDTO noticeDTO){
		System.out.println("NoticeController insertPro()");
		noticeService.insertNotice(noticeDTO);
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request,Model model){
		//한 화면에 보여줄 글 개수 10개 설정
		 int pageSize = 10;
		 
		//페이지 번호 가져오기
		 String pageNum = request.getParameter("pageNum");
		//페이지 번호가 없으면 -> 1
		 if(pageNum==null){
		 	pageNum="1";
		 }
		 
		 PageDTO pageDTO = new PageDTO();
		 pageDTO.setPageSize(pageSize);
		 pageDTO.setPageNum(pageNum);
		 
		 List<NoticeDTO> noticeList = noticeService.getNoticeList(pageDTO);
		 
		 int count = noticeService.getNoticeCount();
		 pageDTO.setCount(count);
		 
		 //데이터담기
		 model.addAttribute("noticeList",noticeList);
		 model.addAttribute("pageDTO",pageDTO);
		 
		return "notice/list";
	}
	
	@RequestMapping(value = "/notice/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request,Model model) {
		//원래 게시글 정보 받아오기
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		NoticeDTO noticeDTO = noticeService.getNotice(b_num);
		//데이터 담기
		model.addAttribute("noticeDTO",noticeDTO);
		return "notice/update";
	}
	
	@RequestMapping(value = "/notice/updatePro", method = RequestMethod.POST)
	public String updatePro(NoticeDTO noticeDTO) {
		//수정하기
		noticeService.updateNotice(noticeDTO);
		return "redirect:/notice/content?b_num="+noticeDTO.getB_num();
	}
	
	@RequestMapping(value = "/notice/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request,Model model){
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		NoticeDTO noticeDTO = noticeService.getNotice(b_num);
		model.addAttribute("noticeDTO",noticeDTO);
		return "notice/content";
	}
	
	@RequestMapping(value = "/notice/delete", method = RequestMethod.GET)
	public String delete(int b_num) {
		noticeService.deleteNotice(b_num);
		return "redirect:/notice/list";
	}
	


	
	

}
