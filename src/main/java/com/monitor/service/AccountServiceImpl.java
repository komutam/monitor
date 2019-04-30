package com.monitor.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.monitor.dao.AccountDAO;
import com.monitor.vo.FriendVO;
import com.monitor.vo.GoodVO;
import com.monitor.vo.MemberVO;
import com.monitor.vo.PostVO;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Inject
	private AccountDAO accountDAO;
	
	@Override
	public MemberVO memberAccount(String userid) throws Exception{
		return accountDAO.memberAccount(userid);
	}
	
	@Transactional
	@Override
	public void write(PostVO postVO) throws Exception{
		accountDAO.write(postVO);
		String files = postVO.getFiles();
		if(files == null ) {
			return;
		}else {
			postVO.setFiles(files);
		}
	}
	
	@Override
	public List<PostVO> postList(String userid) throws Exception{
		return accountDAO.postList(userid);
	}
	
	//listCheck
	@Override
	public int listCheck(String userid) throws Exception{
		return accountDAO.listCheck(userid);
	}
	
	//delete
	@Override
	public void postDelete(int pbno) throws Exception{
		accountDAO.postDelete(pbno);
	}

/*------------------------------------------- like*/
	@Override
	public void goodInsert(GoodVO goodVO) throws Exception {
		accountDAO.goodInsert(goodVO);
		accountDAO.postGoodUp(goodVO.getPbno());
	}
	@Override
	public void goodDelete(GoodVO goodVO) throws Exception{
		accountDAO.goodDelete(goodVO);
		accountDAO.postGoodUp(goodVO.getPbno());
	}
	
	@Override
	public int checkCheck(GoodVO goodVO) throws Exception{
		return accountDAO.checkCheck(goodVO);
	}
	@Override
	public int goodCount(GoodVO goodVO) throws Exception{
		return accountDAO.goodCount(goodVO);
	}
//--------------------------
	
	//media page
	@Override
	public List<PostVO> mediaList(String userid) throws Exception{
		return accountDAO.mediaList(userid);
	}
	
	//follow
	@Override
	public void addFriend(FriendVO friendVO) throws Exception{
		accountDAO.addFriend(friendVO);
	}
	@Override
	public int checkFriend(FriendVO friendVO) throws Exception{
		return accountDAO.checkFriend(friendVO);
	}
	@Override
	public void deleteFriend(FriendVO friendVO) throws Exception{
		accountDAO.deleteFriend(friendVO);
	}
	
	//following
	@Override
	public List<MemberVO> followingPage(String userid) throws Exception{
		return accountDAO.followingPage(userid);
	}
	@Override
	public int followingCount(String userid) throws Exception{
		return accountDAO.followingCount(userid);
	}

	//follower
	@Override
	public List<MemberVO> followerPage(String userid) throws Exception{
		return accountDAO.followerPage(userid);
	}
	@Override
	public int followerCount(String userid) throws Exception{
		return accountDAO.followerCount(userid);
	}
	
	@Override
	public List<MemberVO> bestUser() throws Exception{
		return accountDAO.bestUser();
	}
}
