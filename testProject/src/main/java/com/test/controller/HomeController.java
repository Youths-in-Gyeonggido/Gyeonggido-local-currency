package com.test.controller;

import com.test.dto.*;
import com.test.service.UserServiceImpl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.springframework.http.HttpRequest;

//import org.apache.ibatis.reflection.SystemMetaObject;

//import java.text.DateFormat;
//import java.util.Date;
//import java.util.Locale;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Resource(name="userService")
	UserServiceImpl userService;
	
	//메인화ㅕㅁㄴ
	@GetMapping("/")
	public String MainPage() {
		
		return "home";
	}
	
	@PostMapping("Login")
	public String Login(HttpServletRequest request,UserDTO dto) {
//		HttpSession session = request.getSession();
		UserDTO login = userService.Login(dto);
		
		if(login==null) {
			System.out.println("회원 아님");
			return "signup";
		}
		return "home2";
	}
	
	
	//회원가입
	@GetMapping("idCheck")
	public @ResponseBody int idCheck(@RequestParam("userId")String id) {
		System.out.println("여기까지 오긴 하니?");
		int cnt=userService.idCheck(id);
		System.out.println(cnt);
		return cnt;
	}
	
	@GetMapping("/signPage")
	public String signPage() {
		
		return "redirect:/signup";
	}

	@PostMapping("/signUp")
	public String signUp(UserDTO dto) {
		System.out.println("회원가입신호");
		userService.SignUp(dto);
		return "redirect:/";
	}
	
}
