package com.itwill.controller;


import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.domain.ReservationDTO;
import com.itwill.domain.ReviewDTO;
import com.itwill.domain.Trainer_MemberDTO;
import com.itwill.domain.user_MemberDTO;
import com.itwill.service.Trainer_MemberService;
import com.itwill.service.user_MemberService;
	
@Controller
public class Trainer_MemberController {
	
	//업로드 될 폴더 경로 
		@Resource(name="uploadPath")
		private String uploadPath;

	@Inject
	private Trainer_MemberService trainer_memberService;
	
	@Inject
	private user_MemberService user_memberService;

	@RequestMapping(value = "/member/trainer_register", method = RequestMethod.GET)
	public String trainer_register() {
		
		return "member/trainer_register";
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
	
			session.setAttribute("t_id", trainer_memberDTO.getT_id());
			session.setAttribute("id", "2");
			session.setAttribute("nic", trainer_memberDTO2.getT_nic());
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
	
	@ResponseBody
	@RequestMapping(value="/member/trainer_IdCheck", method = RequestMethod.POST)
	public int trainer_IdCheck(Trainer_MemberDTO trainer_memberDTO) {
		int result = trainer_memberService.trainer_IdCheck(trainer_memberDTO);
		return result;
	}
	
	@RequestMapping(value = "/member/trainer_insert", method = RequestMethod.GET)
	public String insert(HttpSession session,Model model){
		String t_id=(String)session.getAttribute("t_id");
		model.addAttribute("t_id", t_id);
		//트레이너 기존정보 불러오기
		Trainer_MemberDTO trainer_memberDTO;
		
		trainer_memberDTO = trainer_memberService.trainer_getMember(t_id);

		model.addAttribute("trainer_memberDTO", trainer_memberDTO);
		return "member/insert";
	}
	
	@RequestMapping(value = "/member/trainer_insertPro", method = RequestMethod.POST)
	public String insertPro(Model model,HttpServletRequest request, MultipartFile profile_photo) throws Exception{
			
		System.out.println(" Trainer_MemberController  finsertPro ");
		
		Trainer_MemberDTO trainer_memberDTO =new Trainer_MemberDTO(); 
		trainer_memberDTO.setT_id(request.getParameter("t_id"));
		trainer_memberDTO.setT_intro(request.getParameter("t_intro"));
		trainer_memberDTO.setT_exp(request.getParameter("t_exp"));
		trainer_memberDTO.setT_sns(request.getParameter("t_sns"));
		trainer_memberDTO.setT_program(request.getParameter("t_program"));
		trainer_memberDTO.setVideo(request.getParameter("video"));
		//파일 업로드
		if(profile_photo==null){
			//기존파일이름 가져오기
			trainer_memberDTO.setProfile_photo(request.getParameter("oldfile"));
		}else{
		// 파일이름  랜덤문자_파일이름 변경
		UUID uid=UUID.randomUUID();
		String fileName=uid.toString()+"_"+profile_photo.getOriginalFilename();
		System.out.println(fileName);
		// 업로드 파일을 복사해서 => upload 폴더에 넣기
		File targetFile=new File(uploadPath,fileName);
		FileCopyUtils.copy(profile_photo.getBytes(), targetFile);
		// BoardDTO 복사된 파일 이름 저장
		trainer_memberDTO.setProfile_photo(fileName);
		}
		trainer_memberService.insertTrainer(trainer_memberDTO);
		
		return "index";
	}
	
	@RequestMapping(value = "/trainer/about", method = RequestMethod.GET)
	public String getTrainerInfo(HttpSession session,HttpServletRequest request, Model model){
		
		String t_id=(String)request.getParameter("t_id");
		
		Trainer_MemberDTO trainer_memberDTO;
		
		trainer_memberDTO = trainer_memberService.trainer_getMember(t_id);

		model.addAttribute("trainer_memberDTO", trainer_memberDTO);
	
			
			//리뷰
			//t_id저장
			model.addAttribute("t_id", t_id);
			
			List<ReviewDTO> reviewList = trainer_memberService.getReviewList(t_id);
			model.addAttribute("reviewList", reviewList);
		
			//예약
			String u_id=(String)session.getAttribute("u_id");
			int u_cash = 0;
			try {
				u_cash = user_memberService.user_getMember(u_id).getU_cash();
				model.addAttribute("u_cash", u_cash);
			}catch (Exception e) {
				
			}
		return "trainer/about";
	}
	//리뷰작성
	@RequestMapping(value = "/trainer/insertReview", method = RequestMethod.POST)
	public String reviewInsert(ReviewDTO reviewDTO){
		System.out.println("Controller reviewInsert()");
		String u_nic = user_memberService.user_getMember(reviewDTO.getU_id()).getU_nic();
		reviewDTO.setU_nic(u_nic);
		trainer_memberService.insertReview(reviewDTO);
		return "redirect:/trainer/about?t_id="+reviewDTO.getT_id();
	}
	//예약하기
	@RequestMapping(value = "/trainer/insertReservation", method = RequestMethod.POST)
	public String insertReservation(ReservationDTO reservationDTO){
		trainer_memberService.insertReservation(reservationDTO);		
		
		trainer_memberService.trainer_cashUpdate(reservationDTO.getT_id());
		user_memberService.user_cashUpdate(reservationDTO.getU_id());
		
		//예약내역보기
		return "redirect:/member/user_credit";
	}
//	@RequestMapping(value = "/trainer/deleteReview", method = RequestMethod.GET)
//	public String delete(int re_num){
//		trainer_memberService.deleteReview(re_num);
//		return "redirect:/about?t_id=";
//	}
	//마이크레딧 페이지
	@RequestMapping(value = "/member/trainer_credit", method = RequestMethod.GET)
	public String user_credit(HttpSession session,Model model) {
		String t_id=(String)session.getAttribute("t_id");
		Trainer_MemberDTO trainer_memberDTO=trainer_memberService.trainer_getMember(t_id);
		model.addAttribute("trainer_memberDTO", trainer_memberDTO);
		return "member/trainer_credit";
	}
	@RequestMapping(value = "/member/trainer_list", method = RequestMethod.GET)
	public String trainer_list(Model model) {
		// ��� ������ ��������
		List<Trainer_MemberDTO> trainer_list=trainer_memberService.trainer_list();
		
		// ������ ���
		model.addAttribute("trainer_list",trainer_list);
		
//		/WEB-INF/views/member/list.jsp  => �̵�
		
		return "member/trainer_list";
	}
	@RequestMapping(value = "/member/trainer_updateList", method = RequestMethod.POST)
	public String trainer_updateList(Trainer_MemberDTO trainer_memberDTO) {

		System.out.println(" MemberController  updatePro ");
	
//		Trainer_MemberDTO trainer_memberDTO2=trainer_memberService.trainer_userCheck(trainer_memberDTO);
				
//		if(trainer_memberDTO2!=null) {
			if(trainer_memberDTO!=null) {

			trainer_memberService.trainer_updateList(trainer_memberDTO);
			return "member/trainer_list";
					
		}else {

//			return "member/msg";
			return "member/trainer_list";
		}
		
	}
	@RequestMapping(value = "/member/trainer_reservation", method = RequestMethod.GET)
	public String trainer_reservation(HttpSession session, Model model) {
		String t_id=(String)session.getAttribute("t_id");
		List<ReservationDTO> trainer_reservation= trainer_memberService.trainer_reservation(t_id);
		model.addAttribute("trainer_reservation",trainer_reservation);
		return "member/trainer_reservation";
	}
	
	
	@RequestMapping(value = "/mapTest", method = RequestMethod.GET)
	public String mapTest() {
		return "mapTest";
	}
}
	

