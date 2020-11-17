package com.sist.cbox.dao;


import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface SeatDAO {
	@Select("SELECT SEATNO FROM SEAT WHERE THEATERNO=#{param}")
	public List<String> getSeatNo(String theaterNo);
	
	@Select("SELECT SEATNO FROM SEAT WHERE SEATSEQ=#{seatseq}")
	public String mySeatNo(String seatseq);
	
}
