package org.mybatis.presentation;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.domain.Account;
import org.mybatis.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;



@Controller
@RequestMapping(value = "/home")
public class HomeController {

	@Resource
	private IUserService userService;


	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home(Account account) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/home/home");
		return modelAndView;
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.POST)
	public ModelAndView index(Account account) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/shop/index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request,Account dto) throws Exception {
		ModelAndView modelAndView;
		
		HttpSession session = request.getSession();
		Account login = userService.Login(dto);//로그인정보
		
		session.setAttribute("user",login);

		if(login!=null) {
			RedirectView redirectView = new RedirectView("/shop/index");
			return new ModelAndView(redirectView);
			
		} else {
			System.out.println("아이디 없음");
			modelAndView = new ModelAndView("/home/login");
			return modelAndView;
		}
		
	}
	
	@GetMapping("idCheck")
	public @ResponseBody int idCheck(@RequestParam("userId")String id) {
		int cnt=userService.idCheck(id);
		System.out.println(cnt);
		return cnt;
	}
	
	

	@RequestMapping(value = "/signPage", method = RequestMethod.GET)
	public ModelAndView signPage(Account account) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/home/signup");
		return modelAndView;
	}
	
	@RequestMapping(value = "/LoginPage", method = RequestMethod.GET)
	public ModelAndView loginPage(Account account) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/home/login");
		return modelAndView;
	}

	@RequestMapping(value = "/regist_Member", method = RequestMethod.POST)
	public ModelAndView regist(Account account) throws Exception {
		userService.SignUp(account);
		ModelAndView modelAndView = new ModelAndView("/shop/index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView mypage(HttpServletRequest request, Account account) throws Exception {
		Account accountList = new Account();
		ModelAndView modelAndView;
		if(request.getSession(false) != null && request.getSession().getAttribute("user") != null) {
			Account session = (Account)request.getSession().getAttribute("user");
			modelAndView = new ModelAndView("/home/mypage");
			
			account.setId(session.getId());
			account.setPassword(session.getPassword());
			
			accountList = userService.mypage(account);
			
			modelAndView.addObject("user", accountList);

			return modelAndView;
		}
		
		modelAndView = new ModelAndView("/shop/index");
		
		return modelAndView;
	}
	

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView update(Account account) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/home/update");
		return modelAndView;
	}
	
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public ModelAndView updateUser(HttpSession session,HttpServletRequest request,Account dto) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/shop/index");

		userService.updateUser(dto);
		
		Account login = userService.Login(dto);
		request.getSession().setAttribute("user", login);
		
		return modelAndView;
	}
	

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public RedirectView logout(HttpSession session,Account dto) throws Exception {

		session.invalidate();
		RedirectView redirectView = new RedirectView("/shop/index");
		return redirectView;
	}
	

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView delete(HttpSession session,Account dto) throws Exception {
		Account idAccount = new Account();
		Account sessionUser = (Account)session.getAttribute("user");
		ModelAndView modelAndView;
		
		idAccount.setId(sessionUser.getId());
		Account account = userService.mypage(idAccount);
		
		if(account.getPassword().equals(dto.getPassword())) {
			userService.delete(dto);
			modelAndView = new ModelAndView("/shop/index");
			session.invalidate();
		} else {
			modelAndView = new ModelAndView("/home/delete");
		}
		
		return modelAndView;
	}
	

	@RequestMapping(value = "/deletePage", method = RequestMethod.GET)
	public ModelAndView deletePage(Account account) throws Exception {

		ModelAndView modelAndView = new ModelAndView("/home/delete");
		return modelAndView;
	}
}
