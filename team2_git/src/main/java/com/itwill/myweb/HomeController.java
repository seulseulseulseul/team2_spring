package com.itwill.myweb;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String home2() {
//		/WEB-INF/views/insertForm.jsp  => 이동
		
		return "insertForm";
	}
	
//	http://localhost:8181/myweb/insertPro   POST
	@RequestMapping(value = "/insertPro", method = RequestMethod.POST)
	public String home2Pro() {
//		회원가입 처리
		System.out.println("회원가입 처리");
		
		// 로그인 페이지로 이동 => 가상주소 이동
		// response.sendRedirect("/login"); 
		return "redirect:/login";
	}
	
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String home3() {
//		/WEB-INF/views/loginForm.jsp  => 이동
		
		return "loginForm";
	}
	
	@RequestMapping(value = "/loginPro", method = RequestMethod.POST)
	public String home3Pro() {
		//로그인 처리
		System.out.println("로그인 처리");
		
		// 가상주소 /main이동
		return "redirect:/main";
	}
	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home4() {
//		/WEB-INF/views/main.jsp  => 이동
		
		return "main";
	}
	
	
	
}
