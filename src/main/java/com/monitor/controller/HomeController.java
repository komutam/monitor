package com.monitor.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.monitor.service.AccountService;
import com.monitor.service.PostService;
import com.monitor.vo.GoodVO;
import com.monitor.vo.MemberVO;
import com.monitor.vo.PostVO;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	private PostService postService;
	
	@Inject
	private AccountService accountService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) throws Exception{
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
		String userid = (String)session.getAttribute("loginId");
		model.addAttribute("memberVO",accountService.memberAccount(userid));
		
		return "home";
	}
	
/*	@RequestMapping(value="/userInfo", method=RequestMethod.POST)
	public String userInfo(String userid, Model model) throws Exception{
		model.addAttribute("userInfo", postService.userInfo(userid));
		System.out.println("ss>>> "+postService.userInfo(userid));
		
		return "home";
	}*/
	
	//글 등록
	@RequestMapping(value="/", method=RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody PostVO postVO) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			postService.write(postVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	//글목록 ajax
	@RequestMapping(value="/all/{userid}",  method = RequestMethod.GET)
	public ResponseEntity<List<PostVO>> list(@PathVariable("userid") String userid) throws Exception{
		ResponseEntity<List<PostVO>> entity2 = null;
		try {
			entity2 = new ResponseEntity<List<PostVO>>(postService.postList(userid), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity2 = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity2;
	}

	
	//목록 확인
	@ResponseBody
	@RequestMapping(value="/listCheck", method=RequestMethod.POST)
	public Map<Object, Object> listCheck(String userid) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
		int count = postService.listCheck(userid);
		map.put("listCheck", count);
		return map;
	}
	
	//글 삭제 ajax
	@RequestMapping(value="/delete/{pbno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> postDelete(@PathVariable("pbno") int pbno) throws Exception{
		System.out.println(pbno);
		ResponseEntity<String> entity3 = null;
		try {
			postService.postDelete(pbno);
			entity3 = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity3 = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity3;
	}
	
	@ResponseBody
	@RequestMapping(value="/heart/{pbno}", method=RequestMethod.POST)
	public Map<Object, Object> heart(@PathVariable("pbno") int pbno, @RequestBody GoodVO goodVO) throws Exception{
		goodVO.setPbno(pbno);
		String guserid = goodVO.getGuserid();
		int checkID = postService.checkCheck(goodVO);
		int goodCount = accountService.goodCount(goodVO);
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		System.out.println("likeHeart Check : "+checkID+", pbno = "+pbno+", 그 외 : "+goodVO);
		System.out.println("likeID Check : "+guserid);
		
		if(checkID >= 1) {
			goodCount=goodCount-1;
			postService.goodDelete(goodVO);
		}else if(checkID == 0){
			goodCount=goodCount+1;
			postService.goodInsert(goodVO);
		}
		
		map.put("heart", checkID);
		map.put("goodCount", goodCount);
		System.out.println("gkgkgk : "+goodCount);
		return map;
	}
	
	//이미지 목록 갯수 확인
	@ResponseBody
	@RequestMapping(value="/imgListCheck", method=RequestMethod.POST)
	public Map<Object, Object> imgListCheck(String userid) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
		int count = postService.imgListCheck(userid);
		map.put("imgListCheck", count);
		return map;
	}
	
}
