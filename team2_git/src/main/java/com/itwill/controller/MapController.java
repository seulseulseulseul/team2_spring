package com.itwill.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.domain.TrainerDTO;
import com.itwill.service.MapService;

@Controller
public class MapController {
	
	@Inject
	private MapService mapService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(){
		return "main";
		
	}
	@RequestMapping(value = "/getAddress", method = RequestMethod.POST)
	public ResponseEntity<List<TrainerDTO>> getAddress(HttpServletRequest request){
		
		String t_extraAddress = request.getParameter("t_extraAddress");
		
		List<TrainerDTO> trainerList = mapService.getAddress(t_extraAddress);
		
		ResponseEntity<List<TrainerDTO>> entity = new ResponseEntity<List<TrainerDTO>>(trainerList, HttpStatus.OK);
		
		return entity;
		
	}
	@RequestMapping(value = "/dongSearch", method = RequestMethod.GET)
	public String main(TrainerDTO trainerDTO, HttpServletRequest request, Model model){
		
		// 위경도가 담긴 데이터를 받아 지도에 표시하는 사이트
		String dong = request.getParameter("t_dong");
		
		List<TrainerDTO> trainerList = mapService.getAddress(dong);
		
		model.addAttribute(dong);
		
		ResponseEntity<List<TrainerDTO>> entity = new ResponseEntity<List<TrainerDTO>>(trainerList, HttpStatus.OK);
			
		return "dongSearch";
		
	}
	
}
