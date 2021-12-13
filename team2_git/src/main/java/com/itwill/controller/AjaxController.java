package com.itwill.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.Trainer_MemberDTO;
import com.itwill.service.MapService;

@RestController
public class AjaxController {
	
	@Inject
	private MapService mapService;
	
	@RequestMapping(value = "/getAddress", method = RequestMethod.GET)
	public ResponseEntity<List<Trainer_MemberDTO>> getAddress(HttpServletRequest request){
		
		
		String t_extraAddress = request.getParameter("t_extraAddress");
		System.out.println("t_extraAddress : " + t_extraAddress);
		List<Trainer_MemberDTO> trainerList = mapService.getAddress(t_extraAddress);
		System.out.println(trainerList.isEmpty());
		ResponseEntity<List<Trainer_MemberDTO>> entity = new ResponseEntity<List<Trainer_MemberDTO>>(trainerList, HttpStatus.OK);
		
		return entity;
		
	}
}