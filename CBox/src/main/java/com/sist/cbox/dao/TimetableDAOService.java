package com.sist.cbox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.Timetable;

public class TimetableDAOService implements TimetableDAO{
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
	}
	@Override
	public List<Timetable> getMovieListByTime(String time) {
		TimetableDAO tdao=sqlSession.getMapper(TimetableDAO.class);
		return tdao.getMovieListByTime(time);
	}

	@Override
	public List<Timetable> getTime(String time, String mcode) {
		TimetableDAO tdao=sqlSession.getMapper(TimetableDAO.class);
		return tdao.getTime(time, mcode);
	}

	@Override
	public List<Timetable> getTableBtwTime(String fromTime, String toTime) {
		TimetableDAO tdao=sqlSession.getMapper(TimetableDAO.class);
		return tdao.getTableBtwTime(fromTime, toTime);
	}
	@Override
	public Timetable getTimetable(String timeSeq) {
		TimetableDAO tdao=sqlSession.getMapper(TimetableDAO.class);
		return tdao.getTimetable(timeSeq);
	}
	@Override
	public List<Timetable> getTimetables() {
		TimetableDAO tdao=sqlSession.getMapper(TimetableDAO.class);
		return tdao.getTimetables();
	}
	@Override
	public List<String> getMcodes() {
		TimetableDAO tdao=sqlSession.getMapper(TimetableDAO.class);
		return tdao.getMcodes();
	}
	@Override
	public List<String> getTheaterNames() {
		TimetableDAO tdao=sqlSession.getMapper(TimetableDAO.class);
		return tdao.getTheaterNames();
	}
	@Override
	public List<String> selectTheater(String mcode) {
		TimetableDAO tdao=sqlSession.getMapper(TimetableDAO.class);
		return tdao.selectTheater(mcode);
	}
	@Override
	public List<String> selectDay(String mcode, String theatername) {
		TimetableDAO tdao=sqlSession.getMapper(TimetableDAO.class);
		return tdao.selectDay(mcode, theatername);
	}
	@Override
	public List<Timetable> selectTime(String mcode, String theatername, String day) {
		TimetableDAO tdao=sqlSession.getMapper(TimetableDAO.class);
		return tdao.selectTime(mcode, theatername, day);
	}
	@Override
	public int addTimetable(String mcode, String theaterNo, String time, String day) {
		TimetableDAO tdao=sqlSession.getMapper(TimetableDAO.class);
		return tdao.addTimetable(mcode, theaterNo, time, day);
	}
	@Override
	public List<String> theaterMovie(String location, int date) {
		TimetableDAO tdao=sqlSession.getMapper(TimetableDAO.class);
		return tdao.theaterMovie(location, date);
	}
	@Override
	public List<Timetable> theaterTimetable(String location, int date) {
		TimetableDAO tdao=sqlSession.getMapper(TimetableDAO.class);
		return tdao.theaterTimetable(location, date);
	}
	
	

}
