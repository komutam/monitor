package com.monitor.service;

import com.monitor.vo.MemberVO;

public interface UploadFileService {
	
	public void uploadProImage(MemberVO memberVO) throws Exception;
	
	public void uploadTopImage(MemberVO memberVO) throws Exception;
}
