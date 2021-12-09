package com.itwill.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.domain.CenterDTO;
import com.itwill.domain.PageDTO;
import com.itwill.domain.ReviewDTO;
import com.itwill.domain.user_MemberDTO;
import com.itwill.service.TrainerService;
import com.itwill.service.TrainerServiceImpl;


@Controller
public class TrainerController {
	@Inject
	private TrainerServiceImpl trainerService;
	
	
//	@RequestMapping(value = "/about", method = RequestMethod.GET)
//	public String home2() {
//		//처리
//		// /WEB-INF/views/insertForm.jsp => 이동
//		return "about";
//	}
	
	
	//jsp , do 구분 팀원끼리 얘기하기 . 
	@RequestMapping(value = "/trainer/about", method = RequestMethod.GET)
	public String getTrainerInfo(HttpServletRequest req, HttpServletResponse res, HttpSession session, Model model){
		
		// 햇갈릴수 있으니 잘봐
		// 이 컨틀로러 내에서 2가지 기능을 같ㅇ리할거야 
		// 잘봐방 
		
		System.out.println("/trainer/about 접속완료");
		
		
		String url = "";
		
		//트레이너 회원정보야
		String t_id = req.getParameter("t_id"); 
		
		if(t_id.isEmpty()) {
			// 잘못된 접근이겠지? 
			url = "/error/errorPage1";
		}else {
			// d에러나냐 
			// 서비스 객체 호출 
			
//			trainerService.getTrainerInfo(tId);
			

			List temp = trainerService.getTrainerInfo(t_id);
			
			System.out.println("temp >>>" + temp.get(0));
			
			Map map = (Map)temp.get(0);
			
			req.setAttribute("NAME",map.get("T_NAME"));
			req.setAttribute("t_id", map.get("T_ID"));
			req.setAttribute("URL", map.get("VIDEO"));
			req.setAttribute("INTRO",map.get("T_INTRO"));
			req.setAttribute("EMAIL", map.get("T_EMAIL"));
			req.setAttribute("PROGRAM",map.get("T_PROGRAM"));
			req.setAttribute("SNS",map.get("T_SNS"));
			req.setAttribute("EXP", map.get("T_EXP"));
			
			//t_pass 불러오기
			
			url = "/trainer/about";
		}
		
			

			
		//리뷰
			//일반 회원 정보 불러오기
			String u_id=(String)session.getAttribute("u_id");
			//리뷰 불러오기
			List<ReviewDTO> reviewList = trainerService.getReviewList(t_id);
			
			model.addAttribute("u_id", u_id);
			model.addAttribute("t_id", t_id);
			model.addAttribute("reviewList", reviewList);
			
		
		return url;
	}
	//리뷰작성
	@RequestMapping(value = "/trainer/insertReview", method = RequestMethod.POST)
	public String reviewInsert(ReviewDTO reviewDTO){
		System.out.println("Controller reviewInsert()");
		trainerService.insertReview(reviewDTO);
		return "redirect:/trainer/about?t_id="+reviewDTO.getT_id();
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String reviewTest(){
		return "/trainer/reviewTest";
	}
	

	
//	@RequestMapping(value = "/center/insertPro", method = RequestMethod.POST)
//	public String insertPro(CenterDTO centerDTO){
//		System.out.println("CenterController insertPro()");
//		centerService.insertCenter(centerDTO);
//		return "redirect:/center/list";
//	}
	
//	@RequestMapping(value = "/center/list", method = RequestMethod.GET)
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
//		 List<CenterDTO> centerList = centerService.getCenterList(pageDTO);
//		 
//		 int count = centerService.getCenterCount();
//		 pageDTO.setCount(count);
//		 
//		 //데이터담기
//		 model.addAttribute("centerList",centerList);
//		 model.addAttribute("pageDTO",pageDTO);
//		 
//		return "board/list";
//	}
}
