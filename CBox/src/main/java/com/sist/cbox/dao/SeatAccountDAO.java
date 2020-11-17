package com.sist.cbox.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.cbox.vo.Seat;
import com.sist.cbox.vo.SeatAccount;

public interface SeatAccountDAO {
	@Select("SELECT * FROM SEATACCOUNT S JOIN TIMETABLE T ON S.TIMESEQ=T.TIMESEQ WHERE T.TIME LIKE '${time}%'")
	public List<Seat> getSeatList(String time);
	//시간은 '17/10/26 11:25' 형식으로 입력할 것
	
	@Select("SELECT * FROM SEATACCOUNT SA JOIN TIMETABLE TT ON SA.TIMESEQ=TT.TIMESEQ WHERE TT.TIMESEQ LIKE #{timeSeq} AND SA.STATUS LIKE 'OCCUPIED'  ORDER BY SA.SEATSEQ")
	public List<SeatAccount> getOccupiedList(@Param("timeSeq")String timeSeq);
	
	@Select("SELECT SEATNO FROM SEATACCOUNT SA JOIN SEAT S ON SA.SEATSEQ=S.SEATSEQ WHERE SA.SEATSEQ=#{seatSeq} AND SA.TIMESEQ=#{timeSeq}")
	public String getSeatNo(@Param("seatSeq")String seatSeq,@Param("timeSeq")String timeSeq);
	
	@Select("SELECT SA.SEATSEQ FROM SEATACCOUNT SA JOIN SEAT S ON SA.SEATSEQ=S.SEATSEQ WHERE S.SEATNO=#{seatNo} AND SA.TIMESEQ=${timeSeq}")
	public String getSeatSeq(@Param("seatNo")String seatNo, @Param("timeSeq")String timeSeq);
	
	@SelectKey(before = true, keyProperty = "regdate", statement = {"SELECT to_char(trunc(sysdate),'yy/mm/dd') FROM dual"}, resultType = String.class)
	@Update("UPDATE SEATACCOUNT SET MID=#{mid}, STATUS='OCCUPIED', REGDATE=#{regdate} WHERE TIMESEQ=#{timeSeq} AND SEATSEQ=#{seatSeq}")
	public int addBookingMid(@Param("mid")String mid, @Param("timeSeq")String timeSeq, @Param("seatSeq")String seatSeq);
	
	@SelectKey(before = true, keyProperty = "regdate", statement = {"SELECT to_char(trunc(sysdate),'yy/mm/dd') FROM dual"}, resultType = String.class)
	@Update("UPDATE SEATACCOUNT SET NMID=#{nmid}, STATUS='OCCUPIED', REGDATE=#{regdate} WHERE TIMESEQ=#{timeSeq} AND SEATSEQ=#{seatSeq}")
	public int addBookingNmid(@Param("nmid")String nmid, @Param("timeSeq")String timeSeq, @Param("seatSeq")String seatSeq);

	@Select("SELECT DEALNUM FROM SEATACCOUNT SA JOIN SEAT S ON SA.SEATSEQ=S.SEATSEQ WHERE S.SEATNO='D5' AND SA.TIMESEQ=#{timeSeq}")
	public String checkExisting(String timeSeq);
	
	@Select("SELECT THEATERNO FROM TIMETABLE WHERE TIMESEQ=#{param}")
	public String getTheaterNo(String timeSeq);
	
	@Insert("INSERT INTO SEATACCOUNT VALUES((SELECT MAX(NVL(to_number(DEALNUM),0))+1 FROM SEATACCOUNT),'','',(SELECT SEATSEQ FROM SEAT S JOIN TIMETABLE TT ON S.THEATERNO=TT.THEATERNO WHERE S.SEATNO=#{param1} AND TT.TIMESEQ=#{param2}),#{param2},'AVAILABLE','','')")
	public int setAvilableSeat(String seatNo,String timeSeq);
	
	@Select("SELECT * FROM SEATACCOUNT WHERE MID=#{mid} order by to_number(dealnum) desc")
	public List<SeatAccount> getSeatAccount(String mid);
	
}
