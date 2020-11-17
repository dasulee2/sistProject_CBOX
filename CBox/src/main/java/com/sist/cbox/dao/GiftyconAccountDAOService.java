package com.sist.cbox.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.sist.cbox.vo.CouponAccount;
import com.sist.cbox.vo.GiftyconAccount;
import com.sist.cbox.vo.MyGiftycon;
import com.sist.cbox.vo.myMembershipAccount;

public class GiftyconAccountDAOService implements GiftyconAccountDAO{

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	//기프티콘 구매시 거래내역 추가
	public int addGiftyconAccount1(GiftyconAccount shopAccount) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.addGiftyconAccount1(shopAccount);
	}

	@Override
	//해당 회원의 거래내역 리턴
	public ArrayList<GiftyconAccount> getGiftyconAccountMember(String mid) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.getGiftyconAccountMember(mid);
	}

	@Override
	public List<MyGiftycon> getMyGiftyconlistByMid(String mid) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.getMyGiftyconlistByMid(mid);
	}

	@Override
	public List<MyGiftycon> getListByDate(String mid, String fromDate, String toDate) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.getListByDate(mid, fromDate, toDate);
	}

	@Override
	public List<MyGiftycon> getMyUsedGalistByMid(String mid) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.getMyUsedGalistByMid(mid);
	}

	@Override
	public GiftyconAccount getGiftyconAccount(int dealNum) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.getGiftyconAccount(dealNum);
	}

	@Override
	public int addGiftyconAccount(String mid, String couponCode, String recipient) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.addGiftyconAccount(mid, couponCode, recipient);
	}

	@Override
	public int useGiftycon(int dealNum) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.useGiftycon(dealNum);
	}

	@Override
	public List<GiftyconAccount> getMygiftcon(String mid) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.getMygiftcon(mid);
	}

	@Override
	public List<GiftyconAccount> getUsedMygiftcon(String mid) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.getUsedMygiftcon(mid);
	}

	@Override
	public List<GiftyconAccount> getMygiftcon_M(String mid) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.getMygiftcon_M(mid);
	}

	@Override
	public List<GiftyconAccount> getUsedMygiftcon_M(String mid) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.getUsedMygiftcon_M(mid);
	}

	@Override
	public List<GiftyconAccount> gmovieAccount(String mid) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.gmovieAccount(mid);
	}

	@Override
	public int upGiftyconAc(int dealNum) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.upGiftyconAc(dealNum);
	}
	
	@Override
	public int countGiftyconAc(String mid) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.countGiftyconAc(mid);
	}

	@Override
	public int countCoupontAc(String mid) {
		GiftyconAccountDAO cadao = sqlSession.getMapper(GiftyconAccountDAO.class);
		return cadao.countCoupontAc(mid);
	}
}
