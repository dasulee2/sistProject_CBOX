package com.sist.cbox.dao;

import com.sist.cbox.vo.Grade;

public interface GradeDAO {
	
	//등급검사
	public Grade nextGrade(String mid);
	
	
}
