package com.sist.cbox.dao;

import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.Grade;

public class GradeDAOService implements GradeDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public Grade nextGrade(String mid) {
		GradeDAO gdao = sqlSession.getMapper(GradeDAO.class);
		return gdao.nextGrade(mid);
	}
	
	

}
