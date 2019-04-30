package com.monitor.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.monitor.dto.LoginDTO;
import com.monitor.service.MemberService;
import com.monitor.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void joinGET() throws Exception{
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPOST(MemberVO memberVO, RedirectAttributes rttr) throws Exception{
		logger.info("회원가입...");
		logger.info(memberVO.toString());
		memberService.insertMember(memberVO);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/member/login";
	}
	
	//ID Check
	@ResponseBody
	@RequestMapping(value="/checkID", method=RequestMethod.POST)
	public Map<Object, Object> checkID(String userid) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
		int count = memberService.checkID(userid);
		map.put("check", count);
		return map;
	}
	
	//email authCode Check
	@RequestMapping(value="/emailConfirm", method=RequestMethod.GET)
	public String emailConfirm(MemberVO memberVO, Model model) throws Exception{
		memberService.emailConfirm(memberVO);
		model.addAttribute("emailCheck", 1);
		return "/member/emailConfirm";
	}
	
	//loginGET
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET() throws Exception{
	}
	//loginPOST
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPost(LoginDTO dto, HttpSession session, Model model) throws Exception{
		try {
			MemberVO vo = memberService.login(dto);
			if(vo == null) {
				return;
			}else {
				model.addAttribute("memberVO", vo);
				model.addAttribute("loginId", vo.getUserid());
				System.out.println("컨트"+vo);
				//auto login select
				if(dto.isUseCookie()) {
					System.out.println("쿠키값을 저장");
					int amount = 60 * 60 * 24 * 7;
					Date sessionLimit = new Date(System.currentTimeMillis()+(1000 * amount));
					memberService.keepLogin(vo.getUserid(), session.getId(), sessionLimit);
				}//end
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//logout
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		Object obj = session.getAttribute("login");
		
		if(obj != null) {
			MemberVO vo = (MemberVO)obj;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			response.sendRedirect("/monitor/");
			
			if(loginCookie != null) {
				loginCookie.setPath("/monitor/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				memberService.keepLogin(vo.getUserid(), session.getId(), new Date());
			}
		}
	}
	
	@RequestMapping(value="/myinfoUpdate/{userid}", method=RequestMethod.POST)
	ResponseEntity<String> myinfoUpdate(@PathVariable("userid") String userid, @RequestBody MemberVO memberVO) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			memberVO.setUserid(userid);
			memberService.myinfoUpdate(memberVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
