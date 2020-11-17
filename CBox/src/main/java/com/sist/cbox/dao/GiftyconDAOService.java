package com.sist.cbox.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.Giftycon;

public class GiftyconDAOService implements GiftyconDAO{

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	//타입별 상품 리턴 (type: C-콤보  S-스낵  B-음료  M-영화관람권)
	public List<Giftycon> getGiftycons(String type) {
		GiftyconDAO gdao = sqlSession.getMapper(GiftyconDAO.class);
		return gdao.getGiftycons(type);
	}

	@Override
	//코드와 일치하는 상품 리턴
	public Giftycon getGiftycon(String giftyconCode) {
		GiftyconDAO gdao = sqlSession.getMapper(GiftyconDAO.class);
		return gdao.getGiftycon(giftyconCode);
	}
	@Override
	public ArrayList<Giftycon> getCouponList() {
		GiftyconDAO gdao=sqlSession.getMapper(GiftyconDAO.class);
		return gdao.getCouponList();
	}

	@Override
	public Giftycon getCoupon(String couponCode) {
		GiftyconDAO gdao=sqlSession.getMapper(GiftyconDAO.class);
		return gdao.getCoupon(couponCode);
	}
}
