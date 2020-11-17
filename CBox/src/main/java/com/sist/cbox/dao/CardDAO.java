package com.sist.cbox.dao;

import com.sist.cbox.vo.Card;

public interface CardDAO {

	//결제할 카드 등록
	public int addCard(Card card);
	
	//해당번호로 등록되어있는 카드 리턴
	public Card getCard(String cardNum);
	
	
}
