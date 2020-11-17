package com.sist.cbox.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.PointAccount;

public class PointAccountDAOService implements PointAccountDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public ArrayList<PointAccount> getPointAccountlistByMid(String mid) {
		PointAccountDAO padao=sqlSession.getMapper(PointAccountDAO.class);
		return padao.getPointAccountlistByMid(mid);
	}

	@Override
	public PointAccount getPointAccount(int dealNum) {
		PointAccountDAO padao=sqlSession.getMapper(PointAccountDAO.class);
		return padao.getPointAccount(dealNum);
	}

	@Override
	public Integer getMyPoints(String mid) {
		PointAccountDAO padao=sqlSession.getMapper(PointAccountDAO.class);
		return padao.getMyPoints(mid);
	}

	@Override
	public int addPointAccount(String mid, int point, String sort) {
		PointAccountDAO padao=sqlSession.getMapper(PointAccountDAO.class);
		return padao.addPointAccount(mid, point, sort);
	}
	
	@Override
	public String getDate(String regdate, String sort, String mid) {
		PointAccountDAO pdao = sqlSession.getMapper(PointAccountDAO.class);
		return pdao.getDate(regdate, sort, mid);
	}
	
	@Override
	public int addPointAc(PointAccount pa) {
		PointAccountDAO pdao = sqlSession.getMapper(PointAccountDAO.class);
		return pdao.addPointAc(pa);
	}
	
	@Override
	public int getPoint(String mid) {
		PointAccountDAO pdao = sqlSession.getMapper(PointAccountDAO.class);
		return pdao.getPoint(mid);
	}
}
