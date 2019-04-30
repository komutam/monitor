package com.monitor.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.monitor.dao.UploadFileDAO;
import com.monitor.vo.MemberVO;

@Service
public class UploadFileServiceImpl implements UploadFileService {
	
	@Inject
	private UploadFileDAO uploadFileDAO;
	
	@Override
	public void uploadProImage(MemberVO memberVO) throws Exception {
		uploadFileDAO.uploadProImage(memberVO);
	}

	@Override
	public void uploadTopImage(MemberVO memberVO) throws Exception{
		uploadFileDAO.uploadTopImage(memberVO);
	}
}
