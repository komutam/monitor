package com.monitor.service;

import java.util.List;

import com.monitor.vo.GoodVO;
import com.monitor.vo.PostVO;

public interface PostService {
	
	public void write(PostVO postVO) throws Exception;
	
	//list
	public List<PostVO> postList(String userid) throws Exception;
	
	//listCheck
	public int listCheck(String userid) throws Exception;
	
	//delete
	public void postDelete(int pbno) throws Exception;

/*-----------------------------------------------like */	
	public void goodInsert(GoodVO goodVO) throws Exception;
	public void goodDelete(GoodVO goodVO) throws Exception;
	
	public int checkCheck(GoodVO goodVO) throws Exception;

	/*public List<String> getImgFile(int pbno) throws Exception;*/
	
	public int imgListCheck(String userid) throws Exception;
}
