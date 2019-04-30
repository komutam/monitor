package com.monitor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.monitor.service.AccountService;
import com.monitor.vo.FriendVO;
import com.monitor.vo.GoodVO;
import com.monitor.vo.MemberVO;
import com.monitor.vo.PostVO;

@Controller
public class AccountController {
	
	@Inject
	private AccountService accountService;
	
	@RequestMapping(value = "/account/{userid}", method = RequestMethod.GET)
	public String memberAccount(@PathVariable("userid") String userid, Model model, HttpSession session, FriendVO friendVO) throws Exception{
		String obj = (String)session.getAttribute("loginId");
		friendVO.setUserid(obj);
		friendVO.setFollowing(userid);
		
		model.addAttribute("followerCount", accountService.followerCount(userid));
		model.addAttribute("followingCount", accountService.followingCount(userid));
		model.addAttribute("checkFriend", accountService.checkFriend(friendVO));
		model.addAttribute("memberVO",accountService.memberAccount(userid));
		
		return "account";
	}
	
	//글 등록
	@RequestMapping(value="/account/write", method=RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody PostVO postVO) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			accountService.write(postVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//글목록 ajax
	@RequestMapping(value="/account/all/{userid}",  method = RequestMethod.GET)
	public ResponseEntity<List<PostVO>> list(@PathVariable("userid") String userid, Model model){
		ResponseEntity<List<PostVO>> entity2 = null;
		try {
			entity2 = new ResponseEntity<List<PostVO>>(accountService.postList(userid), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity2 = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity2;
	}
	
	//목록 갯수 확인
	@ResponseBody
	@RequestMapping(value="/account/listCheck", method=RequestMethod.POST)
	public Map<Object, Object> listCheck(String userid) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
		int count = accountService.listCheck(userid);
		map.put("listCheck", count);
		return map;
	}
	
	//글 삭제 ajax
	@RequestMapping(value="/account/delete/{pbno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> postDelete(@PathVariable("pbno") int pbno) throws Exception{
		System.out.println(pbno);
		ResponseEntity<String> entity3 = null;
		try {
			accountService.postDelete(pbno);
			entity3 = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity3 = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity3;
	}
	
	//좋아요
	@ResponseBody
	@RequestMapping(value="/account/heart/{pbno}", method=RequestMethod.POST)
	public Map<Object, Object> heart(@PathVariable("pbno") int pbno, @RequestBody GoodVO goodVO) throws Exception{
		goodVO.setPbno(pbno);
		String guserid = goodVO.getGuserid();
		int checkID = accountService.checkCheck(goodVO);
		int goodCount = accountService.goodCount(goodVO);

		Map<Object, Object> map = new HashMap<Object, Object>();
		
		System.out.println("likeHeart Check : "+checkID+", pbno = "+pbno+", 그 외 : "+goodVO);
		System.out.println("likeID Check : "+guserid);
/*		System.out.println("전체 아이디 : "+checkID);*/
		
		if(checkID >= 1) {
			goodCount=goodCount-1;
			accountService.goodDelete(goodVO);
		}else if(checkID == 0){
			goodCount=goodCount+1;
			accountService.goodInsert(goodVO);
		}
		
		map.put("heart", checkID);
		map.put("goodCount", goodCount);
		
		return map;
	}
	
	//미디어 페이지
	@RequestMapping(value = "/media/{userid}", method = RequestMethod.GET)
	public String mediaPage(@PathVariable("userid") String userid, Model model, FriendVO friendVO, HttpSession session) throws Exception{
		String obj = (String)session.getAttribute("loginId");
		friendVO.setUserid(obj);
		friendVO.setFollowing(userid);
		
		model.addAttribute("followerCount", accountService.followerCount(userid));
		model.addAttribute("followingCount", accountService.followingCount(userid));
		model.addAttribute("checkFriend", accountService.checkFriend(friendVO));
		model.addAttribute("memberVO",accountService.memberAccount(userid));
		return "media";
	}
	//미디어 목록 ajax
	@RequestMapping(value="/media/all/{userid}", method = RequestMethod.GET)
	public ResponseEntity<List<PostVO>> mediaList(@PathVariable("userid") String userid){
		ResponseEntity<List<PostVO>> enti = null;
		try {
			enti = new ResponseEntity<List<PostVO>>(accountService.mediaList(userid), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			enti = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return enti;
	}
	
	//Follow
	@RequestMapping(value="/account/addFriend", method=RequestMethod.POST)
	public ResponseEntity<String> addFriend(@RequestBody FriendVO friendVO) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			accountService.addFriend(friendVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//Follow delete
	@RequestMapping(value="/account/deleteFriend", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFriend(@RequestBody FriendVO friendVO) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			accountService.deleteFriend(friendVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//following Page
	@RequestMapping(value = "/following/{userid}", method = RequestMethod.GET)
	public String followingPage(@PathVariable("userid") String userid, Model model, FriendVO friendVO, HttpSession session) throws Exception{
		String obj = (String)session.getAttribute("loginId");
		friendVO.setUserid(obj);
		friendVO.setFollowing(userid);
		
		model.addAttribute("followerCount", accountService.followerCount(userid));
		model.addAttribute("followingCount", accountService.followingCount(userid));
		model.addAttribute("checkFriend", accountService.checkFriend(friendVO));
		model.addAttribute("memberVO",accountService.memberAccount(userid));
		
		return "following";
	}
	//following list
	@RequestMapping(value="/following/all/{userid}",  method = RequestMethod.GET)
	public ResponseEntity<List<MemberVO>> followingList(@PathVariable("userid") String userid){
		ResponseEntity<List<MemberVO>> entity = null;
		try {
			entity = new ResponseEntity<List<MemberVO>>(accountService.followingPage(userid), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//팔로잉 목록 갯수 확인
	@ResponseBody
	@RequestMapping(value="/followingCheck", method=RequestMethod.POST)
	public Map<Object, Object> followingCheck(String userid) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
		int count = accountService.followingCount(userid);
		map.put("followingCheck", count);
		return map;
	}
	
	//follower Page
	@RequestMapping(value = "/follower/{userid}", method = RequestMethod.GET)
	public String followerPage(@PathVariable("userid") String userid, Model model, FriendVO friendVO, HttpSession session) throws Exception{
		String obj = (String)session.getAttribute("loginId");
		friendVO.setUserid(obj);
		friendVO.setFollowing(userid);
			
		model.addAttribute("followerCount", accountService.followerCount(userid));
		model.addAttribute("followingCount", accountService.followingCount(userid));
		model.addAttribute("checkFriend", accountService.checkFriend(friendVO));
		model.addAttribute("memberVO",accountService.memberAccount(userid));
			
		return "follower";
	}
	//follower list
	@RequestMapping(value="/follower/all/{userid}",  method = RequestMethod.GET)
	public ResponseEntity<List<MemberVO>> followerList(@PathVariable("userid") String userid){
		ResponseEntity<List<MemberVO>> entity = null;
		try {
			entity = new ResponseEntity<List<MemberVO>>(accountService.followerPage(userid), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//팔로워 목록 갯수 확인
	@ResponseBody
	@RequestMapping(value="/followerCheck", method=RequestMethod.POST)
	public Map<Object, Object> followerCheck(String userid) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
		int count = accountService.followerCount(userid);
		map.put("followerCheck", count);
		return map;
	}
	
	//미디어 목록 ajax
	@RequestMapping(value="/bestUser", method = RequestMethod.GET)
	public ResponseEntity<List<MemberVO>> bestUser(){
		ResponseEntity<List<MemberVO>> entity = null;
		try {
			entity = new ResponseEntity<List<MemberVO>>(accountService.bestUser(), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
