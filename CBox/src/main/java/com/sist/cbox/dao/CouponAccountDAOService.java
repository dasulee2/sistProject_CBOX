package com.sist.cbox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.CouponAccount;
import com.sist.cbox.vo.myMembershipAccount;

public class CouponAccountDAOService implements CouponAccountDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<myMembershipAccount> getUsedCoupon(String mid) {
		CouponAccountDAO cadao=sqlSession.getMapper(CouponAccountDAO.class);
		return cadao.getUsedCoupon(mid);
	}

	@Override
	public List<myMembershipAccount> getUsableCoupon(String mid) {
		CouponAccountDAO cadao=sqlSession.getMapper(CouponAccountDAO.class);
		return cadao.getUsableCoupon(mid);
	}

	@Override
	public CouponAccount getCouponAccount(int dealNum) {
		CouponAccountDAO cadao=sqlSession.getMapper(CouponAccountDAO.class);
		return cadao.getCouponAccount(dealNum);
	}

	@Override
	public int addCouponAccount(String mid, String couponCode) {
		CouponAccountDAO cadao=sqlSession.getMapper(CouponAccountDAO.class);
		return cadao.addCouponAccount(mid, couponCode);
	}

	@Override
	public int updateCouponAccount(int DEALNUM) {
		CouponAccountDAO cadao=sqlSession.getMapper(CouponAccountDAO.class);
		return cadao.updateCouponAccount(DEALNUM);
	}

	@Override
	public List<myMembershipAccount> getUsedCouponByDate(String mid,String fDate,String tDate) {
		CouponAccountDAO cadao=sqlSession.getMapper(CouponAccountDAO.class);
		return cadao.getUsedCouponByDate(mid, fDate, tDate);
	}
	
	@Override
	public List<CouponAccount> getusable(String mid) {
		CouponAccountDAO cadao=sqlSession.getMapper(CouponAccountDAO.class);
		return cadao.getusable(mid);
	}

	@Override
	public int addCouponAc(CouponAccount ca) {
		CouponAccountDAO cadao=sqlSession.getMapper(CouponAccountDAO.class);
		return cadao.addCouponAc(ca);
	}

	@Override
	public int updateCouponAc(int dealNum) {
		CouponAccountDAO cadao=sqlSession.getMapper(CouponAccountDAO.class);
		return cadao.updateCouponAc(dealNum);
	}
}
