package com.sist.cbox.dao;

import com.sist.cbox.vo.Card;

public interface CardDAO {

	//������ ī�� ���
	public int addCard(Card card);
	
	//�ش��ȣ�� ��ϵǾ��ִ� ī�� ����
	public Card getCard(String cardNum);
	
	
}
