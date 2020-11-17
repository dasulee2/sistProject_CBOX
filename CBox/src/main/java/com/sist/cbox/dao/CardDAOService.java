package com.sist.cbox.dao;

import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.Card;

public class CardDAOService implements CardDAO{

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	//결제할 카드 등록
	public int addCard(Card card) {
		CardDAO cdao = sqlSession.getMapper(CardDAO.class);
		return cdao.addCard(card);
	}
	
	@Override
	//해당번호로 등록되어있는 카드 리턴
	public Card getCard(String cardNum) {
		CardDAO cdao = sqlSession.getMapper(CardDAO.class);
		return cdao.getCard(cardNum);
	}
	
}
