package com.itwill.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.domain.TrainerDTO;
import com.itwill.domain.PageDTO;
import com.itwill.service.TrainerService;


@Controller
public class TriainerController {
	@Inject
	private TrainerService trainerService;
	
	@RequestMapping(value = "/trainer/insert", method = RequestMethod.GET)
	public String insert(){
		return "trainer/insert";
	}
	
	@RequestMapping(value = "/tariner/insertPro", method = RequestMethod.POST)
	public String insertPro(TrainerDTO trainerDTO){
		System.out.println("TrainerController insertPro()");
		trainerService.insertTrainer(trainerDTO);
		return "redirect:/trainer/list";
	}
	
//	@RequestMapping(value = "/trainer/list", method = RequestMethod.GET)
//	public String list(HttpServletRequest request,Model model){
//		//한 화면에 보여줄 글 개수 10개 설정
//		 int pageSize = 10;
//		 
//		//페이지 번호 가져오기
//		 String pageNum = request.getParameter("pageNum");
//		//페이지 번호가 없으면 -> 1
//		 if(pageNum==null){
//		 	pageNum="1";
//		 }
//		 
//		 PageDTO pageDTO = new PageDTO();
//		 pageDTO.setPageSize(pageSize);
//		 pageDTO.setPageNum(pageNum);
//		 
//		 List<TrainerDTO> trainerList = trainerService.getTrainerList(pageDTO);
//		 
//		 int count = trainerService.getTrainerCount();
//		 pageDTO.setCount(count);
//		 
//		 //데이터담기
//		 model.addAttribute("trainerList",trainerList);
//		 model.addAttribute("pageDTO",pageDTO);
//		 
//		return "board/list";
	}

