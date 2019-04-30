package com.monitor.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.monitor.vo.MemberVO;

@Repository
public class UploadFileDAOImpl implements UploadFileDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void uploadProImage(MemberVO memberVO) throws Exception {
		sqlSession.update("UploadMapper.uploadProImage", memberVO);
	}
	
	@Override
	public void uploadTopImage(MemberVO memberVO) throws Exception{
		sqlSession.update("UploadMapper.uploadTopImage", memberVO);
	}
	
}
