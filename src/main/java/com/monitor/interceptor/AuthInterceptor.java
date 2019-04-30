package com.monitor.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.monitor.service.MemberService;
import com.monitor.vo.MemberVO;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) {
			logger.info("no login");
			saveDest(request);
			System.out.println("로그인 안 됨");
			//----------------
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				System.out.println("세션에 login이 존재하지 않지만, 쿠키 중에서 loginCookie가 존재");
				MemberVO memberVO = memberService.checkSessionKey(loginCookie.getValue());
				logger.info("VO : "+memberVO);
				if(memberVO != null) {
					session.setAttribute("login", memberVO);
					return true;
				}
			}//end
			response.sendRedirect("/monitor/member/login");
			return false;
		}
		return true;
	}
	
	private void saveDest(HttpServletRequest request) throws Exception{
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		
		if(query == null || query.equals("null")) {
			query = "";
		}else {
			query = "?"+query;
		}
		if(request.getMethod().equals("GET")) {
			request.getSession().setAttribute("dest", uri+query);
		}
	}
}
