package com.human.pj0511;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.tools.DocumentationTool.Location;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.human.service.IF_member_service;
import com.human.vo.memberVO;

@Controller
public class LoginController {
	@Inject
	IF_member_service memberSer;
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Locale locale, Model model) {
		System.out.println("회원가입 컨트롤러 호출");
		return "signup";
	}
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(Locale locale, Model model, @ModelAttribute memberVO mvo) throws Exception{
		memberSer.insert(mvo);
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Locale locale, Model model, HttpServletRequest req, HttpSession session) throws Exception {
		String username = req.getParameter("id"); // 왜 받았는가?
		String pwd = req.getParameter("pw");  // 왜 받았는가?
		
		memberVO loginUser = memberSer.login(username, pwd);
		//System.out.println(loginUser +"로그인");
		
		// 로그인을 세션으로 처리 하겠습니다...
		// home.jsp    bbsList.jsp  이 두개의 뷰에
		// home.jsp는 로그인 유무에 따라 로그인창 또는 정보가 보이게 하고 싶고
		// List.jsp에는 맨 위에 로그인 한 사람의 정보를 보여 주고 싶다...
		// model로 보낼 때는 둘 중 한 곳의 뷰만 선택을 해야 합니다..
		// 그런데 세션이라는 공간은 모든 뷰가 접근할 수 있는 공간으므로 세션이라는 공간에 로그인 정보를 저장하겠다. 
		if(loginUser != null) {  // 로그인이 성공했다는 의미
			// 세션처리를 어떤 정보를 할 것인가는 개발자가 결정하는데
			// 지금 예제는 아이디만 세션으로 처리하겠다.
			// 세션에 nowUser라는 변수가 있다면..  로그인했다는 의미로 해석할 수 있다. 
			session.setAttribute("nowuser", loginUser.getId());
			System.out.println("로그인 성공");
			return "home";
		}else {
			model.addAttribute("err", "로그인 실패");
			System.out.println("로그인 실패");
		}
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Locale locale, HttpSession session, HttpServletRequest req) {
		session.invalidate(); //세션지우기
		return "redirect:/" + req.getParameter("path");
		
	}
}
