package com.sist.cbox.dao;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sist.cbox.vo.PointAccount;

public interface PointAccountDAO {
	@Select("SELECT * FROM PointAccount WHERE MID=#{mid}")
	public ArrayList<PointAccount> getPointAccountlistByMid(String mid);
	@Select("SELECT * FROM PointAccount WHERE dealNum=#{dealNum}")
	public PointAccount getPointAccount(int dealNum);
	@Select("SELECT AMOUNT FROM PointAccount WHERE MID=#{mid} AND DEALNUM=(SELECT MAX(DEALNUM) FROM POINTACCOUNT WHERE MID=#{mid})")
	public Integer getMyPoints(String mid);
	@Insert("INSERT INTO POINTACCOUNT VALUES((SELECT MAX(NVL(DEALNUM,0))+1 FROM POINTACCOUNT),#{mid},#{point},(SELECT AMOUNT FROM PointAccount WHERE MID=? AND DEALNUM=(SELECT MAX(DEALNUM) FROM POINTACCOUNT WHERE MID=?))+?,(SELECT to_char(trunc(sysdate),'yyyy/mm/dd') FROM dual),#{sort})")
	public int addPointAccount(@Param("mid")String mid,@Param("point")int point,@Param("sort")String sort);

	//민경
	//로그인 날짜 조회
	public String getDate(String regdate, String sort, String mid);
	//포인트적립 - 민경
	public int addPointAc(PointAccount pa);
	//amount만조회
	//포인트 조회
	public int getPoint(String mid);
}
