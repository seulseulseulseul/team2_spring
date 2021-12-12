package com.itwill.team2;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.team2.HomeController;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
		
		return "redirect:/index";
	}
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String home2() {
		//처리
		// /WEB-INF/views/insertForm.jsp => 이동
		return "about";
	}
	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public String home3() {
		return "blog";
	}
	@RequestMapping(value = "/blog-single", method = RequestMethod.GET)
	public String home4() {
		return "blog-single";
	}
	@RequestMapping(value = "/classes", method = RequestMethod.GET)
	public String home5() {
		return "classes";
	}
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String home6() {
		return "contact";
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home7() {
		return "index";
	}
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home8() {
		return "main";
	}
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	public String home9() {
		return "schedule";
	}
	@RequestMapping(value = "/trainer", method = RequestMethod.GET)
	public String home10() {
		return "trainer";
	}
}
