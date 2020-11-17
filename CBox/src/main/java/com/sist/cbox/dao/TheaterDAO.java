package com.sist.cbox.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.cbox.vo.Theater;

public interface TheaterDAO {
	
	@Select("SELECT * FROM THEATER WHERE THEATERNO=#{theaterNo}")
	public Theater getTheater(String theaterNo);
	
	@Select("select DISTINCT location, information, image, lat, lng from theater order by location")
	public List<Theater> getTheaters();
	
	@Select("select DISTINCT location, information, image, lat, lng from theater where location=#{location}")
	public Theater getTheater2(String location);
	
	@Select("select * from theater where location=#{location}")
	public List<Theater> getTheaterNo(String location);
	
}