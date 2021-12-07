package com.itwill.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.domain.Trainer_MemberDTO;
import com.itwill.domain.user_MemberDTO;
import com.itwill.service.Trainer_MemberService;

@Controller
public class Trainer_MemberController {

	@Inject
	private Trainer_MemberService trainer_memberService;

	@RequestMapping(value = "/member/trainer_register", method = RequestMethod.GET)
	public String trainer_register() {
		
		return "member/trainer_register"; // �̵��� ������
	}

	@RequestMapping(value = "/member/trainer_registerPro", method = RequestMethod.POST)
	public String trainer_registerPro(Trainer_MemberDTO trainer_memberDTO) {

		int result = trainer_memberService.trainer_IdCheck(trainer_memberDTO);
		try {
			if(result==1) {
				return "member/register";
			}else if(result ==0) {
				trainer_memberService.trainer_register(trainer_memberDTO);
			}
		}catch(Exception e) {
			throw new RuntimeException();
		}
		
		return "redirect:/member/trainer_login";
	}
	
	@RequestMapping(value = "/member/trainer_login", method = RequestMethod.GET)
	public String trainer_login() {
		
		return "member/trainer_login";
	}
	
	@RequestMapping(value = "/member/trainer_loginPro", method = RequestMethod.POST)
	public String trainer_loginPro(Trainer_MemberDTO trainer_memberDTO, HttpSession session) {

		System.out.println("trainer_MemberController trainer_loginPro ");
		System.out.println(trainer_memberDTO.getT_id());
		System.out.println(trainer_memberDTO.getT_pass());
		
		Trainer_MemberDTO trainer_memberDTO2=trainer_memberService.trainer_userCheck(trainer_memberDTO);
		
		if(trainer_memberDTO2!=null) {
	
			session.setAttribute("u_id", trainer_memberDTO.getT_id());
			session.setAttribute("id", "2");
			return "redirect:/index";
			
		}else {
			return "member/msg";
		}
		
	}
	
	@RequestMapping(value = "/member/trainer_update", method = RequestMethod.GET)
	public String trainer_update(HttpSession session,Model model) {
	
		String t_id=(String)session.getAttribute("t_id");
	
		Trainer_MemberDTO trainer_memberDTO=trainer_memberService.trainer_getMember(t_id);
		
		model.addAttribute("trainer_memberDTO", trainer_memberDTO);

		return "member/trainer_update";
	}
	
	@RequestMapping(value = "/member/trainer_updatePro", method = RequestMethod.POST)
	public String trainer_updatePro(Trainer_MemberDTO trainer_memberDTO) {

		System.out.println(" MemberController  updatePro ");
	
//		Trainer_MemberDTO trainer_memberDTO2=trainer_memberService.trainer_userCheck(trainer_memberDTO);
				
//		if(trainer_memberDTO2!=null) {
			if(trainer_memberDTO!=null) {

			trainer_memberService.trainer_updateMember(trainer_memberDTO);
//			return "redirect:/member/main";
			return "redirect:/index";
					
		}else {

//			return "member/msg";
			return "index";
		}
		
	}
	
	//���̵� �ߺ� üũ
	@ResponseBody
	@RequestMapping(value="/member/trainer_IdCheck", method = RequestMethod.POST)
	public int trainer_IdCheck(Trainer_MemberDTO trainer_memberDTO) {
		int result = trainer_memberService.trainer_IdCheck(trainer_memberDTO);
		return result;
	}
	

}
