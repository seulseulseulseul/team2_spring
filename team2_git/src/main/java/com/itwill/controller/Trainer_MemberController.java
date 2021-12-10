package com.itwill.controller;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.itwill.domain.Trainer_MemberDTO;
import com.itwill.service.Trainer_MemberService;

@Controller
public class Trainer_MemberController {

	@Resource(name="uploadPath")
	private String uploadPath;

@Inject
private Trainer_MemberService trainer_memberService;

@RequestMapping(value = "/member/trainer_register", method = RequestMethod.GET)
public String trainer_register() {
	
	return "member/trainer_register"; //
}

@RequestMapping(value = "/member/trainer_registerPro", method = RequestMethod.POST)
public String trainer_registerPro(Trainer_MemberDTO trainer_memberDTO) {

	int result = trainer_memberService.trainer_IdCheck(trainer_memberDTO);
	try {
		if(result==1) {
			return "member/trainer_register";
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

//	Trainer_MemberDTO trainer_memberDTO2=trainer_memberService.trainer_userCheck(trainer_memberDTO);
			
//	if(trainer_memberDTO2!=null) {
		if(trainer_memberDTO!=null) {

		trainer_memberService.trainer_updateMember(trainer_memberDTO);
//		return "redirect:/member/main";
		return "redirect:/index";
				
	}else {

//		return "member/msg";
		return "index";
	}
	
}

@ResponseBody
@RequestMapping(value="/member/trainer_IdCheck", method = RequestMethod.POST)
public int trainer_IdCheck(Trainer_MemberDTO trainer_memberDTO) {
	int result = trainer_memberService.trainer_IdCheck(trainer_memberDTO);
	return result;
}
	

//@RequestMapping(value = "/trainer/about", method = RequestMethod.GET)
//public String trainer_getMember(HttpSession session,Model model) {
//	// 디비에 데이터 가져오기
//	//세션값 가져오기
//	String t_id=(String)session.getAttribute("t_id");
//	// 디비에 데이터 가져오기
//	// 리턴할형 MemberDTO getMember(String id)
//	Trainer_MemberDTO trainer_memberDTO=trainer_memberService.trainer_getMember(t_id);
//	// memberDTO 담아서 이동
//	model.addAttribute("trainer_memberDTO", trainer_memberDTO);
//	
////	/WEB-INF/views/member/updateForm.jsp  => 이동
//	return "member/updateForm";
//}
	@RequestMapping(value = "/trainer/about", method = RequestMethod.GET)
	public String trainer_getinfo(HttpServletRequest req, HttpServletResponse res,Model model){
		
		System.out.println("/trainer/about 접속완료");
		
		String url = "";
		
		String t_id = req.getParameter("t_id"); 
		
		if(t_id.isEmpty()) {
		 
			url = "/error/errorPage1";
		}else {
			List<Trainer_MemberDTO> temp = trainer_memberService.trainer_getinfo(t_id);
			
			System.out.println("temp >>>" + temp.get(0));
			Map map = (Map)temp.get(0);

	         req.setAttribute("t_id", map.get("t_id"));
			 req.setAttribute("t_name",map.get("t_name"));
	         req.setAttribute("t_address",map.get("t_address"));  
	         req.setAttribute("t_email", map.get("t_email"));
	         req.setAttribute("t_introduce",map.get("t_introduce"));
	         req.setAttribute("t_exp", map.get("t_exp"));
	         req.setAttribute("t_sns",map.get("t_sns"));
	         req.setAttribute("t_program",map.get("t_program"));
	         req.setAttribute("t_video", map.get("t_video")); 	
			url = "about";
		}
				
		return url;
	}


}
	
	