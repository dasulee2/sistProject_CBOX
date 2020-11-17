package com.sist.cbox.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.sist.cbox.vo.Timetable;

public interface TimetableDAO {
	@Select("SELECT * FROM TIMETABLE WHERE TIMESEQ=#{timeSeq}")
	public Timetable getTimetable(String timeSeq);
	
	@Select("SELECT * FROM TIMETABLE WHERE TIME LIKE '${time}%'")
	public List<Timetable> getMovieListByTime(String time);
	
	@Select("SELECT * FROM TIMETABLE WHERE TIME LIKE '${param1}%' AND MCODE LIKE #{param2}")
	public List<Timetable> getTime(String time,String mcode);
	
	@Select("SELECT * FROM TIMETABLE WHERE TIME BETWEEN '${param1}%' AND '${param2}%'")
	public List<Timetable> getTableBtwTime(String fromTime,String toTime);

	@Select("SELECT * FROM TIMETABLE")
	public List<Timetable> getTimetables();

	@Select("SELECT DISTINCT MCODE FROM TIMETABLE")
	public List<String> getMcodes();
	
	@Select("select distinct theatername from timetable t, theater th where t.theaterno=th.theaterno")
	public List<String> getTheaterNames();
	
	@Select("SELECT DISTINCT theatername FROM (SELECT * FROM THEATER T JOIN TIMETABLE TT ON TT.THEATERNO = T.THEATERNO WHERE TT.MCODE=#{mcode})")
	public List<String> selectTheater(String mcode);
	
	@Select("SELECT DISTINCT DAY FROM (SELECT TT.* FROM TIMETABLE TT JOIN THEATER T ON TT.THEATERNO = T.THEATERNO WHERE T.THEATERNAME=#{param2} AND TT.MCODE=#{param1} order by day, time)")
	public List<String> selectDay(String mcode, String theatername);
	
	@Select("SELECT TT.* FROM TIMETABLE TT JOIN THEATER T ON TT.THEATERNO = T.THEATERNO WHERE T.THEATERNAME=#{param2} AND TT.MCODE=#{param1} AND day=#{param3} order by time")
	public List<Timetable> selectTime(String mcode, String theatername, String day);
	
	@SelectKey(before = true, keyProperty = "timeSeq", statement ={"SELECT MAX(NVL(to_number(TIMESEQ),0))+1 FROM TIMETABLE"},resultType=String.class)
	@Insert("INSERT INTO TIMETABLE VALUES(#{param1},#{timeSeq},#{param2},#{param3},#{param4})")
	public int addTimetable(String mcode,String theaterNo,String time,String day);

	@Select("select DISTINCT b.mcode from theater a inner join timetable b on a.THEATERNO=b.theaterno where a.location=#{param1} and b.day=to_char(trunc(sysdate)+${param2},'yy/mm/dd')")
	public List<String> theaterMovie(String location, int date);
	
	@Select("select b.timeseq, a.theaterNo, a.place, a.location, b.mcode, b.day, b.time from theater a inner join timetable b on a.THEATERNO=b.theaterno where a.location=#{param1} and b.day=to_char(trunc(sysdate)+${param2},'yy/mm/dd')")
	public List<Timetable> theaterTimetable(String location, int date);
}
