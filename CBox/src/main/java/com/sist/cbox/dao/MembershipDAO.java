package com.sist.cbox.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.cbox.vo.Membership;

public interface MembershipDAO {

	@Select("SELECT * FROM Membership WHERE MID=#{mid}")
	public Membership getMembership(String mid);

	@Select("SELECT * FROM Membership")
	public ArrayList<Membership> getMembershipList();

	@Insert("INSERT INTO MEMBERSHIP (MSEQ, MID, ACCPOINT, USABLEPOINT, GRADE) VALUES ((SELECT NVL(MAX(TO_NUMBER(MSEQ)),0)+1 FROM MEMBERSHIP), #{mid},200,200,'NORMAL')")
	public int insertMembership(String mid);

	//����� ����
	public int updateMembership(String mid, int point, String grade);
	
	//��޻���
	public int upMembership(String mid, int point);

	//��޻�
	public String getGrade(String mid);
}
