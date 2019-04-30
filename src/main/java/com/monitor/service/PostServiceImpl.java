package com.monitor.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.monitor.dao.PostDAO;
import com.monitor.vo.GoodVO;
import com.monitor.vo.PostVO;

@Service
public class PostServiceImpl implements PostService {
	
	@Inject
	private PostDAO postDAO;
	
	@Transactional
	@Override
	public void write(PostVO postVO) throws Exception {
		postDAO.write(postVO);
		String files = postVO.getFiles();
		if(files == null ) {
			return;
		}else {
			postVO.setFiles(files);
			/*postDAO.addImgFile(postVO);*/
		}
	}
	
	@Override
	public List<PostVO> postList(String userid) throws Exception{
		return postDAO.postList(userid);
	}
	
	//listCheck
	@Override
	public int listCheck(String userid) throws Exception{
		return postDAO.listCheck(userid);
	}
	
	//delete
	@Override
	public void postDelete(int pbno) throws Exception{
		postDAO.postDelete(pbno);
	}
	
/*-------------------------------------------like */
	@Override
	public void goodInsert(GoodVO goodVO) throws Exception {
		postDAO.goodInsert(goodVO);
		postDAO.postGoodUp(goodVO.getPbno());
	}
	@Override
	public void goodDelete(GoodVO goodVO) throws Exception{
		postDAO.goodDelete(goodVO);
		postDAO.postGoodUp(goodVO.getPbno());
	}
	
	@Override
	public int checkCheck(GoodVO goodVO) throws Exception{
		return postDAO.checkCheck(goodVO);
	}
	
/*	@Override
	public List<String> getImgFile(int pbno) throws Exception{
		return postDAO.getImgFile(pbno);
	}*/
	
	@Override
	public int imgListCheck(String userid) throws Exception{
		return postDAO.imgListCheck(userid);
	}
}
