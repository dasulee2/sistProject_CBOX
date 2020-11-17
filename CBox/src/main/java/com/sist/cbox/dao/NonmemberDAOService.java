package com.sist.cbox.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.Nonmember;


public class NonmemberDAOService implements NonmemberDAO{
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Nonmember> gNonmember() {
		NonmemberDAO nmdao = sqlSession.getMapper(NonmemberDAO.class);
		return nmdao.gNonmember();
	}

	@Override
	public Nonmember getNonMember(String nmid) {
		NonmemberDAO nmdao = sqlSession.getMapper(NonmemberDAO.class);
		return nmdao.getNonMember(nmid);
	}

	@Override
	public int addNonMember(Nonmember non) {
		NonmemberDAO nmdao = sqlSession.getMapper(NonmemberDAO.class);
		return nmdao.addNonMember(non);
	}

}
