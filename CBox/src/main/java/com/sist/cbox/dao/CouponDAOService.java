package com.sist.cbox.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.Coupon;

public class CouponDAOService implements CouponDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public ArrayList<Coupon> getCouponList() {
		CouponDAO cdao=sqlSession.getMapper(CouponDAO.class);
		return cdao.getCouponList();
	}

	@Override
	public Coupon getCoupon(String couponCode) {
		CouponDAO cdao=sqlSession.getMapper(CouponDAO.class);
		return cdao.getCoupon(couponCode);
	}

}
