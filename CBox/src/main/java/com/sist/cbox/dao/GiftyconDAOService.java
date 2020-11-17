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
	//Ÿ�Ժ� ��ǰ ���� (type: C-�޺�  S-����  B-����  M-��ȭ������)
	public List<Giftycon> getGiftycons(String type) {
		GiftyconDAO gdao = sqlSession.getMapper(GiftyconDAO.class);
		return gdao.getGiftycons(type);
	}

	@Override
	//�ڵ�� ��ġ�ϴ� ��ǰ ����
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
