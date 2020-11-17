package com.sist.cbox.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.Membership;

public class MembershipDAOService implements MembershipDAO{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public Membership getMembership(String mid) {
		MembershipDAO mdao=sqlSession.getMapper(MembershipDAO.class);
		return mdao.getMembership(mid);
	}

	@Override
	public ArrayList<Membership> getMembershipList() {
		MembershipDAO mdao=sqlSession.getMapper(MembershipDAO.class);
		return mdao.getMembershipList();
	}
	@Override
	public int insertMembership(String mid) {
		MembershipDAO mdao=sqlSession.getMapper(MembershipDAO.class);
		return mdao.insertMembership(mid);
	}
	
	@Override
	public int updateMembership(String mid, int point, String grade) {
		MembershipDAO mdao=sqlSession.getMapper(MembershipDAO.class);
		return mdao.updateMembership(mid, point, grade);
	}
	
	@Override
	public String getGrade(String mid) {
		MembershipDAO mdao = sqlSession.getMapper(MembershipDAO.class);
		return mdao.getGrade(mid);
	}
	@Override
	public int upMembership(String mid, int point) {
		MembershipDAO mdao = sqlSession.getMapper(MembershipDAO.class);
		return mdao.upMembership(mid, point);
	}
}
