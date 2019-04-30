package com.monitor.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.monitor.dto.LoginDTO;
import com.monitor.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		sqlSession.insert("MemberMapper.insertMember", memberVO);
		sqlSession.insert("MemberMapper.insertAccount", memberVO);
	}
	//email key
	@Override
	public void authKey(String email, String authCode) throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setAuthCode(authCode);
		memberVO.setEmail(email);
		sqlSession.selectOne("MemberMapper.authKey", memberVO);
	}
	
	//ID Check
	@Override
	public int checkID(String userid) throws Exception{
		return sqlSession.selectOne("MemberMapper.checkID", userid);
	}
	
	//인증확인
	@Override
	public void emailConfirm(MemberVO memberVO) throws Exception{
		sqlSession.update("MemberMapper.emailConfirm", memberVO);
	}
	
	//login
	@Override
	public MemberVO login(LoginDTO dto) throws Exception{
		return sqlSession.selectOne("MemberMapper.login", dto);
	}
	
	//Auto Login
	@Override
	public void keepLogin(String userid, String sessionid, Date next) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", userid);
		paramMap.put("sessionid", sessionid);
		paramMap.put("next", next);
		sqlSession.update("MemberMapper.keepLogin", paramMap);
	}
	@Override
	public MemberVO checkSessionKey(String value) throws Exception{
		return sqlSession.selectOne("MemberMapper.checkSessionKey", value);
	}
	
	//개인정보 업데이트
	@Override
	public void myinfoUpdate(MemberVO memberVO) throws Exception{
		sqlSession.update("MemberMapper.myinfoUpdate", memberVO);
	}
}
