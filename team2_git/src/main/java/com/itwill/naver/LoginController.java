package com.itwill.naver;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.itwill.domain.user_MemberDTO;
import com.itwill.service.user_MemberService;

/*
 *  Handles requests for the application home page. 
 */

@Controller
public class LoginController {
	
	@Inject
	private user_MemberService user_memberService;
	
	/* NaverLoginBO */ 
	private NaverLoginBO naverLoginBO; 
	private String apiResult = null; 
	
	@Autowired 
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) { 
		this.naverLoginBO = naverLoginBO; 
		
	} 
	
	//로그인 첫 화면 요청 메소드 
	@RequestMapping(value = "/member/start_login", method = { RequestMethod.GET, RequestMethod.POST }) 
	public String start_login(Model model, HttpSession session) { 
		
		System.out.println("여기는 start_login"); 
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */ 
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session); 
		
		System.out.println("네이버:" + naverAuthUrl); 
		
		//네이버 
		model.addAttribute("url", naverAuthUrl); 
		
		return "member/start_login"; 
		
	} 
	
	//네이버 로그인 성공시 callback호출 메소드 
	@RequestMapping(value = "/member/callback", method = { RequestMethod.GET, RequestMethod.POST }) 
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException { 
		
		System.out.println("여기는 callback"); 
		OAuth2AccessToken oauthToken; 
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
	//1. 로그인 사용자 정보를 읽어온다. 
	apiResult = naverLoginBO.getUserProfile(oauthToken); 
	
	//String형식의 json데이터 
	
	/** apiResult json 구조 
	{"resultcode":"00", 
	"message":"success", 
	"response":{"id":"33666449","nickname":"shinn****","age":"20-29",
	"gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}} 
	**/ 
	
	//2. String형식인 apiResult를 json형태로 바꿈 
	JSONParser parser = new JSONParser(); 
	Object obj = parser.parse(apiResult); 
	JSONObject jsonObj = (JSONObject) obj; 
	
	//3. 데이터 파싱 
    //Top레벨 단계 _response 파싱 
    JSONObject response_obj = (JSONObject)jsonObj.get("response"); 
    //response의 nickname값 파싱 
    String u_nic = (String)response_obj.get("nickname"); 
    String u_id = (String)response_obj.get("id");
//    String age = (String)response_obj.get("age");
//    String gender = (String)response_obj.get("gender");
    String u_email = (String)response_obj.get("email");
    String u_name = (String)response_obj.get("name");
//    String birthday = (String)response_obj.get("birthday");
//    String birthyear = (String)response_obj.get("birthyear");
    String u_phone = (String)response_obj.get("mobile");
    
    Map<String, Object> userInfo = new HashMap<String, Object>();
    userInfo.put("u_nic", u_nic);
    userInfo.put("u_id", u_id);

    userInfo.put("u_email", u_email);
    userInfo.put("u_name", u_name);
    userInfo.put("u_phone", u_phone);

    
    if (user_memberService.naverUserCheck(u_id) != null) {
       user_MemberDTO user_memberDTO = new user_MemberDTO();
       
       user_memberDTO.setU_id(u_id);
       user_memberDTO.setU_pass("0000");
       
       session.setAttribute("u_id",u_id);
       model.addAttribute("userInfo", userInfo);
       model.addAttribute("result", apiResult);
       return "redirect:/index";
       
    }else {
       
       model.addAttribute("userInfo", userInfo);
       model.addAttribute("result", apiResult);
       return "member/naver_register";
    
    }
}
	
	//4.파싱 닉네임 세션으로 저장 
//	session.setAttribute("sessionId",nickname); //세션 생성 
//	session.setAttribute("u_id",nickname);
//	session.setAttribute("id", "1");
//	
//	model.addAttribute("result", apiResult); 
//	
//	return "member/start_login"; 
	
	
	
	
	
	//로그아웃 
//	@RequestMapping(value = "/member/logout", method = { RequestMethod.GET, RequestMethod.POST }) 
//	public String logout(HttpSession session)throws IOException { 
//		System.out.println("여기는 logout"); 
//		session.invalidate(); 
//		return "redirect:index";
//	
//	}


}
