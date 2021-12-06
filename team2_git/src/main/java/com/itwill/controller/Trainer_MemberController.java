package com.itwill.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.domain.Trainer_MemberDTO;
import com.itwill.service.Trainer_MemberService;

@Controller
public class Trainer_MemberController {

	@Inject
	private Trainer_MemberService trainer_memberService;

	@RequestMapping(value = "/member/trainer_register", method = RequestMethod.GET)
	public String trainer_register() {
		
		return "member/trainer_register"; // 이동할 페이지
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
	public String trainer_loginPro(Trainer_MemberDTO trainer_memberDTO,HttpSession session) {

		Trainer_MemberDTO trainer_memberDTO2=trainer_memberService.trainer_userCheck(trainer_memberDTO);
		
		if(trainer_memberDTO2!=null) {
	
			session.setAttribute("t_id", trainer_memberDTO.getT_id());
			return "redirect:/member/main";
			
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
		//로그아웃 처리
		session.invalidate();
		
		return "redirect:/member/main";
	}
	
	
	@RequestMapping(value = "/member/info", method = RequestMethod.GET)
	public String trainer_info(HttpSession session,Model model) {

		String t_id=(String)session.getAttribute("t_id");

		Trainer_MemberDTO trainer_memberDTO=trainer_memberService.trainer_getMember(t_id);

		model.addAttribute("trainer_memberDTO", trainer_memberDTO);
		
		return "member/info";
	}
	
	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
	public String trainer_update(HttpSession session,Model model) {
	
		String t_id=(String)session.getAttribute("t_id");
	
		Trainer_MemberDTO trainer_memberDTO=trainer_memberService.trainer_getMember(t_id);
		
		model.addAttribute("trainer_memberDTO", trainer_memberDTO);

		return "member/updateForm";
	}
	
	@RequestMapping(value = "/member/updatePro", method = RequestMethod.POST)
	public String trainer_updatePro(Trainer_MemberDTO trainer_memberDTO) {

		System.out.println(" MemberController  updatePro ");
	
		Trainer_MemberDTO trainer_memberDTO2=trainer_memberService.trainer_userCheck(trainer_memberDTO);
				
		if(trainer_memberDTO2!=null) {

			trainer_memberService.trainer_updateMember(trainer_memberDTO);
			return "redirect:/member/main";
					
		}else {

			return "member/msg";
		}
		
	}
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/member/trainer_IdCheck", method = RequestMethod.POST)
	public int trainer_IdCheck(Trainer_MemberDTO trainer_memberDTO) {
		int result = trainer_memberService.trainer_IdCheck(trainer_memberDTO);
		return result;
	}
	

}
