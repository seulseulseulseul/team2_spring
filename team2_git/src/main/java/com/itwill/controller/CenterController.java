package com.itwill.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.domain.CenterDTO;
import com.itwill.domain.PageDTO;
import com.itwill.service.CenterService;


@Controller
public class CenterController {
	@Inject
	private CenterService centerService;
	
	@RequestMapping(value = "/center/insert", method = RequestMethod.GET)
	public String insert(){
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
		 
		 //데이터담기
		 model.addAttribute("centerList",centerList);
		 model.addAttribute("pageDTO",pageDTO);
		 
		return "board/list";
	}
}
