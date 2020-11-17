package com.sist.cbox.dao;

import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.Card;

public class CardDAOService implements CardDAO{

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	//������ ī�� ���
	public int addCard(Card card) {
		CardDAO cdao = sqlSession.getMapper(CardDAO.class);
		return cdao.addCard(card);
	}
	
	@Override
	//�ش��ȣ�� ��ϵǾ��ִ� ī�� ����
	public Card getCard(String cardNum) {
		CardDAO cdao = sqlSession.getMapper(CardDAO.class);
		return cdao.getCard(cardNum);
	}
	
}
