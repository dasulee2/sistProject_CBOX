package com.sist.cbox.dao;
import java.util.List;

import com.sist.cbox.vo.Member;


public interface MemberDAO {

	//ȸ�� ��ü ��ȸ
	public List<Member> gMember();

	//ȸ�� ���� ��ȸ
	public Member getMember(String mid);

	//ȸ�� �߰�
	public int addMember(Member m);

	//ȸ�� ���� ����
	public int updateMember(Member m);

	//ȸ�� Ż��
	public int delMember(String mid);

	//���̵� ã��
	public String idFind(String name, String phone);
	
	//��й�ȣ ã��
	public int rePwd(String pwd, String mid);
	
	//����ȣ ��ȸ
	public Member getPhone(String phone);
}
