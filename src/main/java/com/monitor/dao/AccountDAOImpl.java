package com.monitor.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.monitor.vo.FriendVO;
import com.monitor.vo.GoodVO;
import com.monitor.vo.MemberVO;
import com.monitor.vo.PostVO;

@Repository
public class AccountDAOImpl implements AccountDAO {
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public MemberVO memberAccount(String userid) throws Exception {
		return sqlSession.selectOne("AccountMapper.memberAccount", userid);
	}
	
	@Override
	public void write(PostVO postVO) throws Exception{
		sqlSession.insert("AccountMapper.write", postVO);
	}
	
	@Override
	public List<PostVO> postList(String userid) throws Exception{
		return sqlSession.selectList("AccountMapper.postList", userid);
	}
	
	//listCheck
	@Override
	public int listCheck(String userid) throws Exception{
		return sqlSession.selectOne("AccountMapper.listCheck", userid);
	}
	
	//delete
	@Override
	public void postDelete(int pbno) throws Exception{
		sqlSession.delete("AccountMapper.postDelete", pbno);
	}

/*------------------------------------------- like*/
	@Override
	public void goodInsert(GoodVO goodVO) throws Exception {
		sqlSession.insert("AccountMapper.goodInsert", goodVO);
	}
	@Override
	public void postGoodUp(int pbno) throws Exception {
		sqlSession.update("AccountMapper.postGoodUp", pbno);
	}
	@Override
	public void goodDelete(GoodVO goodVO) throws Exception{
		sqlSession.delete("AccountMapper.goodDelete", goodVO);
	}
	@Override
	public int checkCheck(GoodVO goodVO) throws Exception{
		return sqlSession.selectOne("AccountMapper.checkCheck", goodVO);
	}
	@Override
	public int goodCount(GoodVO goodVO) throws Exception{
		System.out.println("g확인 가즈아 : "+sqlSession.selectOne("AccountMapper.goodCount", goodVO));
		return sqlSession.selectOne("AccountMapper.goodCount", goodVO);
	}
//-----------------------
//media Page
	@Override
	public List<PostVO> mediaList(String userid) throws Exception{
		return sqlSession.selectList("AccountMapper.mediaList", userid);
	}
	
//follow
	@Override
	public void addFriend(FriendVO friendVO) throws Exception{
		sqlSession.insert("AccountMapper.addFriend", friendVO);
	}
	@Override
	public int checkFriend(FriendVO friendVO) throws Exception{
		return sqlSession.selectOne("AccountMapper.checkFriend", friendVO);
	}
	@Override
	public void deleteFriend(FriendVO friendVO) throws Exception{
		sqlSession.delete("AccountMapper.deleteFriend", friendVO);
	}

//following
	@Override
	public List<MemberVO> followingPage(String userid) throws Exception{
		return sqlSession.selectList("AccountMapper.followingPage", userid);
	}
	@Override
	public int followingCount(String userid) throws Exception{
		return sqlSession.selectOne("AccountMapper.followingCount", userid);
	}
	
//follower
	@Override
	public List<MemberVO> followerPage(String userid) throws Exception{
		return sqlSession.selectList("AccountMapper.followerPage", userid);
	}
	@Override
	public int followerCount(String userid) throws Exception{
		return sqlSession.selectOne("AccountMapper.followerCount", userid);
	}
	
	@Override
	public List<MemberVO> bestUser() throws Exception{
		return sqlSession.selectList("AccountMapper.bestUser");
	}
}
