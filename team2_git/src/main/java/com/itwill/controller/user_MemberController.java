package com.itwill.controller;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.domain.ReservationDTO;
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
			session.setAttribute("id", "1");
			session.setAttribute("nic", user_memberDTO2.getU_nic());
			return "redirect:/index";
			
		}else {
			return "member/msg";
		}
		
	}
	
	@RequestMapping(value = "/member/main", method = RequestMethod.GET)
	public String user_main() {
		
		return "member/main";
	}
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/member/start_login";
	}
	
	@RequestMapping(value = "/member/user_update", method = RequestMethod.GET)
	public String user_update(HttpSession session,Model model) {
	
		String u_id=(String)session.getAttribute("u_id");
		String id = (String)session.getAttribute("id");
	
		user_MemberDTO user_memberDTO=user_memberService.user_getMember(u_id);
		
		model.addAttribute("user_memberDTO", user_memberDTO);
		model.addAttribute("u_id", u_id);
		model.addAttribute("id", id);

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

			return "member/msg";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/member/user_IdCheck", method = RequestMethod.POST)
	public int user_IdCheck(user_MemberDTO user_memberDTO) {
		int result = user_memberService.user_IdCheck(user_memberDTO);
		return result;
	}
	
//	@RequestMapping(value = "/member/start_login", method = RequestMethod.GET)
//	public String start_login() {
//		
//		return "member/start_login";
//	}
	
	@RequestMapping(value = "/member/start_register", method = RequestMethod.GET)
	public String start_register() {
		
		return "member/start_register";
	}
	//마이크레딧 페이지
	@RequestMapping(value = "/member/user_credit", method = RequestMethod.GET)
	public String user_credit(HttpSession session,Model model) {
		String u_id=(String)session.getAttribute("u_id");
		user_MemberDTO user_memberDTO=user_memberService.user_getMember(u_id);
		model.addAttribute("user_memberDTO", user_memberDTO);
		return "member/user_credit";
	}
	// 카카오페이 API
		@RequestMapping(value = "/member/KakaoPay", method = RequestMethod.GET)
		public String KAKAOPAY() {
			
			return "member/KakaoPay";
		}
		
		@RequestMapping("/kakaopay")
	    @ResponseBody
	    public String kakaopay() {
	    System.out.println("test1");
	       try {
	          // 보내는 부분
	          URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
	          HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
	          connection.setRequestMethod("POST");
	          connection.setRequestProperty("Authorization", "KakaoAK 058b950d48df74c9cf15b1a91b3ec87d"); // 어드민 키
	          connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	          connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
	          String parameter = "cid=TC0ONETIME" // 가맹점 코드
	                + "&partner_order_id=partner_order_id" // 가맹점 주문번호
	                + "&partner_user_id=partner_user_id" // 가맹점 회원 id
	                + "&item_name=초코파이" // 상품명
	                + "&quantity=1" // 상품 수량
	                + "&total_amount=5000" // 총 금액
	                + "&vat_amount=200" // 부가세
	                + "&tax_free_amount=0" // 상품 비과세 금액
	                + "&approval_url=http://localhost:8080/" // 결제 성공 시
	                + "&fail_url=http://localhost:8080/" // 결제 실패 시
	                + "&cancel_url=http://localhost:8080/"; // 결제 취소 시
	          OutputStream send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
	          DataOutputStream dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
	          dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
	          dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)
	          
	          int result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
	          InputStream receive; // 받다
	          
	          
	          System.out.println(result);
	          
	          if(result == 200) {
	             receive = connection.getInputStream();
	          }else {
	             receive = connection.getErrorStream(); 
	          }
	          
	          // 읽는 부분
	          InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
	          BufferedReader change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
	          // 받는 부분
	          return change.readLine(); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
	          
	       } catch (MalformedURLException e) {
	          e.printStackTrace();
	       } catch (IOException e) {
	          e.printStackTrace();
	       }
	       return "";
	    }
		// 카카오페이 API 끝
		
		@RequestMapping(value = "/member/CashDeposit1", method = RequestMethod.GET)
		public String CashDeposit() {
			
			return "member/CashDeposit";
		}
		@RequestMapping(value = "/member/CashDeposit2", method = RequestMethod.GET)
		public String CashDeposit2() {
			
			return "member/CashDeposit2";
		}
		@RequestMapping(value = "/member/CashDeposit3", method = RequestMethod.GET)
		public String CashDeposit3() {
			
			return "member/CashDeposit3";
		}

		@RequestMapping(value = "/member/user_list", method = RequestMethod.GET)
		public String user_list(Model model) {
			// ��� ������ ��������
			List<user_MemberDTO> user_list=user_memberService.user_list();
			
			// ������ ���
			model.addAttribute("user_list",user_list);
			
//			/WEB-INF/views/member/list.jsp  => �̵�
			
			return "member/user_list";
		}
		
		@RequestMapping(value = "/member/user_updateList", method = RequestMethod.POST)
		public String user_updateList(user_MemberDTO user_memberDTO) {

			System.out.println(" MemberController  updatePro ");
		
//			user_MemberDTO user_memberDTO2=user_memberService.user_userCheck(user_memberDTO);
					
			if(user_memberDTO!=null) {

				user_memberService.user_updateList(user_memberDTO);
				return "redirect:/member/user_list";
						
			}else {

				return "redirect:/member/user_list";
			}
			
		}
		@RequestMapping(value = "/member/CashWithdrawal", method = RequestMethod.GET)
		   public String CashWithdrawal() {
		      
		      return "member/CashWithdrawal";
		}
		
//		일반회원 예약현황
		@RequestMapping(value = "/member/user_reservation", method = RequestMethod.GET)
		public String user_reservation(HttpSession session,Model model) {

			String u_id=(String)session.getAttribute("u_id");
			List<ReservationDTO> user_reservation= user_memberService.user_reservation(u_id);

			model.addAttribute("user_reservation",user_reservation);
				
			return "member/user_reservation";
		}
}
