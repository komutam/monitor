package com.monitor.dao;

import java.util.Date;

import com.monitor.dto.LoginDTO;
import com.monitor.vo.MemberVO;

public interface MemberDAO {
	
	//Signup
	public void insertMember(MemberVO memberVO) throws Exception;
	
	//ID Check
	public int checkID(String userid) throws Exception;
	
	//인증키 생성
	public void authKey(String email, String authCode) throws Exception;
	//인증확인
	public void emailConfirm(MemberVO memberVO) throws Exception;
	
	//login
	public MemberVO login(LoginDTO dto) throws Exception;
	
	//Auto Login
	public void keepLogin(String userid, String sessionid, Date next) throws Exception;
	public MemberVO checkSessionKey(String value) throws Exception;
	
	public void myinfoUpdate(MemberVO memberVO) throws Exception;
}
