package com.itwill.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.itwill.service.MapService;

@Controller
public class MapController {
	
	@Inject
	private MapService mapService;
	
	@RequestMapping(value = "/dongSearch", method = RequestMethod.GET)
	public String main(){
		
		return "dongSearch";
		
	}
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String main(HttpServletRequest request, Model model){
		
		String t_dong = request.getParameter("t_dong");
		
		model.addAttribute(t_dong);
		
		return "map";
		
	}
}
