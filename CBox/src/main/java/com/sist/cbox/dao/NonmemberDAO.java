package com.sist.cbox.dao;
import java.util.List;

import com.sist.cbox.vo.Nonmember;


public interface NonmemberDAO {

	//��ȸ����ü��ȸ
	public List<Nonmember> gNonmember();

	//��ȸ�� ���� ��ȸ
	public Nonmember getNonMember(String nmid);

	//��ȸ�� ���� �߰�
	public int addNonMember(Nonmember non);
}
