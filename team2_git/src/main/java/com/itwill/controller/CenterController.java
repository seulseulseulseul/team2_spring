package com.itwill.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.domain.CenterDTO;
import com.itwill.domain.PageDTO;
import com.itwill.domain.user_MemberDTO;
import com.itwill.service.CenterService;

@Controller
public class CenterController {
	@Inject
	private CenterService centerService;
	
	
	@RequestMapping(value = "/center/insert", method = RequestMethod.GET)
	public String insert(HttpSession session,Model model){
		String u_id=(String)session.getAttribute("u_id");
		model.addAttribute("u_id", u_id);
		return "center/insert";
	}
	
	@RequestMapping(value = "/center/insertPro", method = RequestMethod.POST)
	public String insertPro(CenterDTO centerDTO){
		System.out.println("CenterController insertPro()");
		centerService.insertCenter(centerDTO);
		return "redirect:/center/list";
	}
	
	@RequestMapping(value = "/center/list", method = RequestMethod.GET)
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
		 
		 List<CenterDTO> centerList = centerService.getCenterList(pageDTO);
		
		 int count = centerService.getCenterCount();
		 pageDTO.setCount(count);
		 
//		 //답변여부 확인 및 날짜형식 포맷
//		 int b_reply = centerService.isReply(b_num);
		 for (CenterDTO centerDTO : centerList) {
			 int isReply = centerService.isReply(centerDTO.getB_num());
			 centerDTO.setIsReply(isReply);
//			 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
//			 dateFormat.format(centerDTO.getB_date());
		}
		 
		 //데이터담기
		 model.addAttribute("centerList",centerList);
		 model.addAttribute("pageDTO",pageDTO);
		return "center/list";
	}
	
	@RequestMapping(value = "/center/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request,Model model){
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		CenterDTO centerDTO = centerService.getCenter(b_num);
		List<CenterDTO> replyList = centerService.getReplyList(b_num);
		model.addAttribute("replyList",replyList);
		model.addAttribute("centerDTO",centerDTO);
		return "center/content";
	}
	@RequestMapping(value = "/center/insertReply", method = RequestMethod.POST)
	public String insertReply(CenterDTO centerDTO){
		System.out.println("CenterController insertPro()");
		centerService.insertReply(centerDTO);
		return "redirect:/center/content?b_num="+centerDTO.getB_num();
	}
	@RequestMapping(value = "/center/delete", method = RequestMethod.GET)
	public String delete(int b_num){
		centerService.deleteCenter(b_num);
		return "redirect:/center/list";
	}
	@RequestMapping(value = "/center/deleteReply", method = RequestMethod.GET)
	public String deleteReply(CenterDTO centerDTO){
		centerService.deleteReply(centerDTO);
		return "redirect:/center/content?b_num="+centerDTO.getB_num();
	}
	
	@RequestMapping(value = "/center/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request,Model model){
		//원래 게시글 정보 받아오기
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		CenterDTO centerDTO = centerService.getCenter(b_num);
		//데이터 담기
		model.addAttribute("centerDTO",centerDTO);
		return "center/update";
	}
	@RequestMapping(value = "/center/updatePro", method = RequestMethod.POST)
	public String updatePro(CenterDTO centerDTO){
		//수정하기
		centerService.updateCenter(centerDTO);
		return "redirect:/center/content?b_num="+centerDTO.getB_num();
	}
}
