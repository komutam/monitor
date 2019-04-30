package com.monitor.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") != null) {
			session.removeAttribute("login");
			System.out.println("로그인 널값으로 지움");
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object memberVO = modelMap.get("memberVO");
		Object loginId = modelMap.get("loginId");
		
		if(memberVO != null) {
			session.setAttribute("login", memberVO);
			System.out.println("새로운 로그인"+memberVO);
			session.setAttribute("loginId", loginId);
			System.out.println("새로운 로그인 ID : "+loginId);
			
			//-------------------------autoLogin
			if(request.getParameter("useCookie") != null) {
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/monitor/");
				
				loginCookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(loginCookie);
				
				System.out.println("로그인 인터셉터 쿠키값이 존재");
			}//end-------------------------
			
			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest != null ? (String)dest : "/monitor/");
		}else {
			response.sendRedirect("/monitor/member/login");
		}
	}
}
