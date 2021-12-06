package com.itwill.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.domain.user_MemberDTO;
import com.itwill.domain.user_MemberDTO;
import com.itwill.service.user_MemberService;

@Controller
public class user_MemberController {
	
	@Inject
	private user_MemberService user_memberService;
	
	@RequestMapping(value = "/member/user_register", method = RequestMethod.GET)
	public String user_register(){
		
		return "member/user_register";
	}
	
	@RequestMapping(value = "/member/user_registerPro", method = RequestMethod.POST)
	public String user_registerPro(user_MemberDTO user_memberDTO) {

		int result = user_memberService.user_IdCheck(user_memberDTO);
		try {
			if(result==1) {
				return "member/user_register";
			}else if(result ==0) {
				user_memberService.user_register(user_memberDTO);
			}
		}catch(Exception e) {
			throw new RuntimeException();
		}
		
		return "redirect:/member/user_login";
	}
	
	@RequestMapping(value = "/member/user_login", method = RequestMethod.GET)
	public String user_login() {
		
		return "member/user_login";
	}
	
	@RequestMapping(value = "/member/user_loginPro", method = RequestMethod.POST)
	public String user_loginPro(user_MemberDTO user_memberDTO,HttpSession session) {
		
		System.out.println("user_MemberController user_loginPro ");
		System.out.println(user_memberDTO.getU_id());
		System.out.println(user_memberDTO.getU_pass());

		user_MemberDTO user_memberDTO2=user_memberService.user_userCheck(user_memberDTO);
		
		if(user_memberDTO2!=null) {
	
			session.setAttribute("u_id", user_memberDTO.getU_id());
			return "redirect:/index";
			
		}else {
			return "index";
		}
		
	}
	
	@RequestMapping(value = "/member/main", method = RequestMethod.GET)
	public String main() {
		
		return "member/main";
	}
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/member/main";
	}
	
	
	@RequestMapping(value = "/member/info", method = RequestMethod.GET)
	public String user_info(HttpSession session,Model model) {

		String u_id=(String)session.getAttribute("u_id");

		user_MemberDTO user_memberDTO=user_memberService.user_getMember(u_id);

		model.addAttribute("user_memberDTO", user_memberDTO);
		
		return "member/info";
	}
	
	@RequestMapping(value = "/member/user_update", method = RequestMethod.GET)
	public String user_update(HttpSession session,Model model) {
	
		String u_id=(String)session.getAttribute("u_id");
	
		user_MemberDTO user_memberDTO=user_memberService.user_getMember(u_id);
		
		model.addAttribute("user_memberDTO", user_memberDTO);

		return "member/user_update";
	}
	
	@RequestMapping(value = "/member/user_updatePro", method = RequestMethod.POST)
	public String user_updatePro(user_MemberDTO user_memberDTO) {

		System.out.println(" MemberController  updatePro ");
	
//		user_MemberDTO user_memberDTO2=user_memberService.user_userCheck(user_memberDTO);
				
		if(user_memberDTO!=null) {

			user_memberService.user_updateMember(user_memberDTO);
			return "redirect:/index";
					
		}else {

			return "index";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/member/user_IdCheck", method = RequestMethod.POST)
	public int user_IdCheck(user_MemberDTO user_memberDTO) {
		int result = user_memberService.user_IdCheck(user_memberDTO);
		return result;
	}
	
	@RequestMapping(value = "/member/start_login", method = RequestMethod.GET)
	public String start_login() {
		
		return "member/start_login";
	}
	
	@RequestMapping(value = "/member/start_register", method = RequestMethod.GET)
	public String start_register() {
		
		return "member/start_register";
	}
	
}
