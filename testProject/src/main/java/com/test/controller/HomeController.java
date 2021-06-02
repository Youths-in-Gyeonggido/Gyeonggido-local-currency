package com.test.controller;

import com.test.dto.*;
import com.test.service.UserServiceImpl;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class HomeController {
	
	@Autowired
	UserServiceImpl userService;
	
	//@Autowired
	//bcryptPasswordEncoder pwdEncoder;

	@GetMapping("/")
	public String MainPage() {
		
		return "home";
	}
	@GetMapping("index")
	public String index() {		
		return "index";
	}
	
	@PostMapping("login")
	public String Login(HttpServletRequest request,UserDTO dto,Model model) {
		HttpSession session = request.getSession();
		UserDTO login = userService.Login(dto);//로그인정보
		
		session.setAttribute("user",login);

		if(login==null) {
			System.out.println("아이디 없음");
			
			return "signup";
		}
		else{
			return "index";
		}
		
	}
	
	@GetMapping("idCheck")
	public @ResponseBody int idCheck(@RequestParam("userId")String id) {
		int cnt=userService.idCheck(id);
		System.out.println(cnt);
		return cnt;
	}
	
	@GetMapping("/signPage")
	public String signPage() {	
		return "signup";
	}
	
	@GetMapping("LoginPage")
	public String LoginPage() {	
		return "login";
	}

	@PostMapping("/regist_Member")
	public String signUp(UserDTO dto) {
		//dto.setassWord(pwdEncoder.encode(dto.getPassWord()));
		userService.SignUp(dto);
		return "index";
	}
	
	@GetMapping("mypage")
	public String mypage(UserDTO dto) {
		userService.mypage(dto);
		return "mypage";
	}
	
	@GetMapping("update")
	public String update(UserDTO dto) {
		return "update";
	}
	
	@PostMapping("updateUser")
	public String updateUser(HttpSession session,HttpServletRequest request,UserDTO dto) {
		userService.updateUser(dto);
		UserDTO login = userService.Login(dto);
		request.getSession().setAttribute("user", login);
		
		System.out.println("업데이트 완료");
		return "index";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session,UserDTO dto) {
		session.invalidate();
		return "home";
	}
	
	@PostMapping("delete")
	public String delete(HttpSession session,UserDTO dto) {
		userService.delete(dto);
		session.invalidate();
		return "home";
	}
	
	@GetMapping("deletePage")
	public String deletePage() {
		return "delete";
	}
}
