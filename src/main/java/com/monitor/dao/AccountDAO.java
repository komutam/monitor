package com.monitor.dao;

import java.util.List;

import com.monitor.vo.FriendVO;
import com.monitor.vo.GoodVO;
import com.monitor.vo.MemberVO;
import com.monitor.vo.PostVO;

public interface AccountDAO {
	
	public MemberVO memberAccount(String userid) throws Exception;
	
	public void write(PostVO postVO) throws Exception;
	
	//list
	public List<PostVO> postList(String userid) throws Exception;
	
	//listCheck
	public int listCheck(String userid) throws Exception;
	
	//postDelete
	public void postDelete(int pbno) throws Exception;

/*------------------------------ like */	
	public void goodInsert(GoodVO goodVO) throws Exception;
	
	public void postGoodUp(int pbno) throws Exception;
	
	public void goodDelete(GoodVO goodVO) throws Exception;
	
	public int checkCheck(GoodVO goodVO) throws Exception;
	
	public int goodCount(GoodVO goodVO) throws Exception;
	
	//Media list
	public List<PostVO> mediaList(String userid) throws Exception;
	
	//follow
	public void addFriend(FriendVO friendVO) throws Exception;
	public int checkFriend(FriendVO friendVO) throws Exception;
	public void deleteFriend(FriendVO friendVO) throws Exception;
	
	//following
	public List<MemberVO> followingPage(String userid) throws Exception;
	public int followingCount(String userid) throws Exception;
	
	//follower
	public List<MemberVO> followerPage(String userid) throws Exception;
	public int followerCount(String userid) throws Exception;
	
	public List<MemberVO> bestUser() throws Exception;
}
