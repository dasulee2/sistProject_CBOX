package com.sist.cbox.dao;
import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.Gpa;

public class GpaDAOService implements GpaDAO {
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
	}
	
	
	@Override
	public Gpa getGpa(String mcode) {
		GpaDAO gdao = sqlSession.getMapper(GpaDAO.class);	
		return gdao.getGpa(mcode);
	}

	@Override
	public int addGpa(Gpa g) {
		GpaDAO gdao = sqlSession.getMapper(GpaDAO.class);	
		return gdao.addGpa(g);
	}

	@Override
	public int updateGpa(Gpa g) {
		GpaDAO gdao = sqlSession.getMapper(GpaDAO.class);	
		return gdao.updateGpa(g);
	}

}
