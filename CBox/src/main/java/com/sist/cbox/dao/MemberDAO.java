package com.sist.cbox.dao;
import java.util.List;

import com.sist.cbox.vo.Member;


public interface MemberDAO {

	//회원 전체 조회
	public List<Member> gMember();

	//회원 정보 조회
	public Member getMember(String mid);

	//회원 추가
	public int addMember(Member m);

	//회원 정보 수정
	public int updateMember(Member m);

	//회원 탈퇴
	public int delMember(String mid);

	//아이디 찾기
	public String idFind(String name, String phone);
	
	//비밀번호 찾기
	public int rePwd(String pwd, String mid);
	
	//폰번호 조회
	public Member getPhone(String phone);
}
