package com.monitor.service;

import java.util.Date;

import com.monitor.dto.LoginDTO;
import com.monitor.vo.MemberVO;

public interface MemberService {
	//join
	public void insertMember(MemberVO memberVO) throws Exception;
	
	//ID check
	public int checkID(String userid) throws Exception;
	
	//인증확인
	public void emailConfirm(MemberVO memberVO) throws Exception;
	
	//login
	public MemberVO login(LoginDTO dto) throws Exception;
	
	//Auto login
	public void keepLogin(String userid, String sessionid, Date next) throws Exception;
	public MemberVO checkSessionKey(String value) throws Exception;
	
	//개인정보 업데이트
	public void myinfoUpdate(MemberVO memberVO) throws Exception;
}
