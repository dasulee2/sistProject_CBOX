package com.sist.cbox.dao;


import java.util.List;
import org.apache.ibatis.session.SqlSession;

public class SeatDAOService implements SeatDAO{
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
	}
	@Override
	public List<String> getSeatNo(String theaterNo) {
		SeatDAO stdao=sqlSession.getMapper(SeatDAO.class);
		return stdao.getSeatNo(theaterNo);
	}
	
	@Override
	public String mySeatNo(String sseq) {
		SeatDAO stdao=sqlSession.getMapper(SeatDAO.class);
		return stdao.mySeatNo(sseq);
	}
	

}
