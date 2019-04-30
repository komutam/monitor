package com.monitor.dao;

import com.monitor.vo.MemberVO;

public interface UploadFileDAO {
	
	public void uploadProImage(MemberVO memberVO) throws Exception;
	
	public void uploadTopImage(MemberVO memberVO) throws Exception;
}
