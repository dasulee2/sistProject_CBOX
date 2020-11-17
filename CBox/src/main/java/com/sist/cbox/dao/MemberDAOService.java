package com.sist.cbox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.Member;



public class MemberDAOService implements MemberDAO{
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Member> gMember() {
		MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
		return mdao.gMember();
	}

	@Override
	public Member getMember(String mid) {
		MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
		return mdao.getMember(mid);
	}

	@Override
	public int addMember(Member m) {
		MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
		return mdao.addMember(m);
	}

	@Override
	public int updateMember(Member m) {
		MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
		return mdao.updateMember(m);
	}

	@Override
	public int delMember(String mid) {
		MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
		return mdao.delMember(mid);
	}

	@Override
	public String idFind(String name, String phone) {
		MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
		//System.out.println("mdao");
		return mdao.idFind(name, phone);
	}

	@Override
	public int rePwd(String pwd, String mid) {
		MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
		return mdao.rePwd(pwd, mid);
	}
	
	@Override
	public Member getPhone(String phone) {
		MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
		return mdao.getPhone(phone);
	}
	


}
