package com.sist.cbox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.Theater;

public class TheaterDAOService implements TheaterDAO{
private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
	}
	@Override
	public Theater getTheater(String theaterNo) {
		TheaterDAO tdao=sqlSession.getMapper(TheaterDAO.class);
		return tdao.getTheater(theaterNo);
	}
	@Override
	public List<Theater> getTheaters() {
		TheaterDAO tdao=sqlSession.getMapper(TheaterDAO.class);
		return tdao.getTheaters();
	}
	@Override
	public Theater getTheater2(String location) {
		TheaterDAO tdao=sqlSession.getMapper(TheaterDAO.class);
		return tdao.getTheater2(location);
	}
	@Override
	public List<Theater> getTheaterNo(String location) {
		TheaterDAO tdao=sqlSession.getMapper(TheaterDAO.class);
		return tdao.getTheaterNo(location);
	}

}
