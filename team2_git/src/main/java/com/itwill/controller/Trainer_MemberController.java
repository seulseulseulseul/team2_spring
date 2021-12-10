package com.itwill.controller;


import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.domain.Trainer_MemberDTO;
import com.itwill.service.Trainer_MemberService;

@Controller
public class Trainer_MemberController {
	
	//업로드 될 폴더 경로 
		@Resource(name="trainer_UploadPath")
		private String trainer_UploadPath;

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
	
	@RequestMapping(value = "/member/trainer_insert", method = RequestMethod.GET)
	public String insert(HttpSession session,Model model){
		String u_id=(String)session.getAttribute("u_id");
		model.addAttribute("u_id", u_id);
		return "member/insert";
	}
	
	@RequestMapping(value = "/member/trainer_insertPro", method = RequestMethod.POST)
	public String insertPro(HttpServletRequest request, MultipartFile profile_photo) throws Exception{
		
		System.out.println(" Trainer_MemberController  finsertPro ");
		
		Trainer_MemberDTO trainer_memberDTO =new Trainer_MemberDTO(); 
		trainer_memberDTO.setT_id(request.getParameter("t_id"));
		trainer_memberDTO.setT_intro(request.getParameter("t_intro"));
		trainer_memberDTO.setT_exp(request.getParameter("t_exp"));
		trainer_memberDTO.setT_sns(request.getParameter("t_sns"));
		trainer_memberDTO.setT_program(request.getParameter("t_program"));
		trainer_memberDTO.setVideo(request.getParameter("video"));
		//파일 업로드
		// 파일이름  랜덤문자_파일이름 변경
		UUID uid=UUID.randomUUID();
		String fileName=uid.toString()+"_"+profile_photo.getOriginalFilename();
		System.out.println(fileName);
		// 업로드 파일을 복사해서 => upload 폴더에 넣기
		File targetFile=new File(trainer_UploadPath,fileName);
		FileCopyUtils.copy(profile_photo.getBytes(), targetFile);
		// BoardDTO 복사된 파일 이름 저장
		trainer_memberDTO.setProfile_photo(fileName);
		
		trainer_memberService.insertTrainer(trainer_memberDTO);
		
		return "index";
	}
		
	}
	

