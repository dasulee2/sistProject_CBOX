package com.sist.cbox.dao;
import java.util.List;

import com.sist.cbox.vo.Nonmember;


public interface NonmemberDAO {

	//비회원전체조회
	public List<Nonmember> gNonmember();

	//비회원 정보 조회
	public Nonmember getNonMember(String nmid);

	//비회원 정보 추가
	public int addNonMember(Nonmember non);
}
