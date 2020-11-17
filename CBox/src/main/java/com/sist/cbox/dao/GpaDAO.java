package com.sist.cbox.dao;

import com.sist.cbox.vo.Gpa;

public interface GpaDAO {
	
	
	public Gpa getGpa(String mcode);
	
	public int addGpa(Gpa g);
	//평점 정보 수정
	public int updateGpa(Gpa g);
	

}
