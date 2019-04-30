package com.monitor.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.monitor.vo.GoodVO;
import com.monitor.vo.PostVO;

@Repository
public class PostDAOImpl implements PostDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void write(PostVO postVO) throws Exception {
		sqlSession.insert("PostMapper.write", postVO);
	}
	
	@Override
	public List<PostVO> postList(String userid) throws Exception{
		return sqlSession.selectList("PostMapper.postList", userid);
	}
	
	//listCheck
	@Override
	public int listCheck(String userid) throws Exception{
		return sqlSession.selectOne("PostMapper.listCheck", userid);
	}
	
	//delete
	@Override
	public void postDelete(int pbno) throws Exception{
		sqlSession.delete("PostMapper.postDelete", pbno);
	}
	
/*------------------------------------------- like*/
	@Override
	public void goodInsert(GoodVO goodVO) throws Exception {
		sqlSession.insert("PostMapper.goodInsert", goodVO);
	}
	@Override
	public void postGoodUp(int pbno) throws Exception {
		sqlSession.update("PostMapper.postGoodUp", pbno);
	}
	@Override
	public void goodDelete(GoodVO goodVO) throws Exception{
		sqlSession.delete("PostMapper.goodDelete", goodVO);
	}
	
	@Override
	public int checkCheck(GoodVO goodVO) throws Exception{
		return sqlSession.selectOne("PostMapper.checkCheck", goodVO);
	}
/*------------------------------------------- like end*/
	
	//listCheck
	@Override
	public int imgListCheck(String userid) throws Exception{
		return sqlSession.selectOne("PostMapper.imgListCheck", userid);
	}
	
/*	@Override
	public void addImgFile(PostVO postVO) throws Exception{
		sqlSession.insert("PostMapper.addImgFile", postVO);
	}
	@Override
	public List<String> getImgFile(int pbno) throws Exception{
		System.out.println("바밤바 : "+pbno);
		System.out.println("바밤바2 : "+sqlSession.selectList("PostMapper.getImgFile", pbno));
		return sqlSession.selectList("PostMapper.getImgFile", pbno);
	}*/
	
}
