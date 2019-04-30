package com.monitor.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.monitor.dao.MemberDAO;
import com.monitor.dto.LoginDTO;
import com.monitor.util.MailHandler;
import com.monitor.util.TempKey;
import com.monitor.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Transactional
	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		memberDAO.insertMember(memberVO);
		
		String authCode = new TempKey().getKey(50, false);//임의의 인증키 생성
		memberDAO.authKey(memberVO.getEmail(), authCode);//이메일과 위에서 생성된 인증키를 DB에 저장
		//이메일 작성 관련
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Monitor 서비스 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
			.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
			.append("<a href='http://localhost:9000/monitor/member/emailConfirm?email=")
			.append(memberVO.getEmail())
			.append("&authCode=")
			.append(authCode)
			.append("' target='_blenk'>이메일 인증 확인</a>")
			.toString());
		sendMail.setFrom("dantalian0417", "moniMaster");
		sendMail.setTo(memberVO.getEmail());
		sendMail.send();
	}
	
	//ID Check
	@Override
	public int checkID(String userid) throws Exception{
		return memberDAO.checkID(userid);
	}
	
	//인증확인
	@Override
	public void emailConfirm(MemberVO memberVO) throws Exception{
		memberDAO.emailConfirm(memberVO);
	}
	
	//login
	@Override
	public MemberVO login(LoginDTO dto) throws Exception{
		return memberDAO.login(dto);
	}
	
	//Auto login
	@Override
	public void keepLogin(String userid, String sessionid, Date next) throws Exception{
		memberDAO.keepLogin(userid, sessionid, next);
	}
	@Override
	public MemberVO checkSessionKey(String value) throws Exception{
		return memberDAO.checkSessionKey(value);
	}
	
	@Override
	public void myinfoUpdate(MemberVO memberVO) throws Exception{
		memberDAO.myinfoUpdate(memberVO);
	}
}
