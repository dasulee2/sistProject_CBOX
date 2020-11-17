package com.sist.cbox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.Seat;
import com.sist.cbox.vo.SeatAccount;

public class SeatAccountDAOService implements SeatAccountDAO{
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
	}

	@Override
	public List<Seat> getSeatList(String time) {
		SeatAccountDAO sadao=sqlSession.getMapper(SeatAccountDAO.class);
		return sadao.getSeatList(time);
	}

	@Override
	public List<SeatAccount> getOccupiedList(String timeSeq) {
		SeatAccountDAO sadao=sqlSession.getMapper(SeatAccountDAO.class);
		return sadao.getOccupiedList(timeSeq);
	}

	@Override
	public int setAvilableSeat(String seatNo, String timeSeq) {
		SeatAccountDAO sadao=sqlSession.getMapper(SeatAccountDAO.class);
		return sadao.setAvilableSeat(seatNo, timeSeq);
	}

	@Override
	public int addBookingNmid(String nmid, String seatNo, String timeSeq) {
		SeatAccountDAO sadao=sqlSession.getMapper(SeatAccountDAO.class);
		return sadao.addBookingNmid(nmid, seatNo, timeSeq);
	}

	@Override
	public int addBookingMid(String mid,String timeSeq,String seatSeq) {
		SeatAccountDAO sadao=sqlSession.getMapper(SeatAccountDAO.class);
		return sadao.addBookingMid(mid, timeSeq,seatSeq);
	}

	@Override
	public String getSeatNo(String seatSeq,String timeSeq) {
		SeatAccountDAO sadao=sqlSession.getMapper(SeatAccountDAO.class);
		return sadao.getSeatNo(seatSeq,timeSeq);
	}

	@Override
	public String getSeatSeq(String seatNo, String timeSeq) {
		SeatAccountDAO sadao=sqlSession.getMapper(SeatAccountDAO.class);
		return sadao.getSeatSeq(seatNo, timeSeq);
	}

	@Override
	public String checkExisting(String timeSeq) {
		SeatAccountDAO sadao=sqlSession.getMapper(SeatAccountDAO.class);
		return sadao.checkExisting(timeSeq);
	}

	@Override
	public String getTheaterNo(String timeSeq) {
		SeatAccountDAO sadao=sqlSession.getMapper(SeatAccountDAO.class);
		return sadao.getTheaterNo(timeSeq);
	}
	

	@Override
	public List<SeatAccount> getSeatAccount(String mid) {
		SeatAccountDAO sadao=sqlSession.getMapper(SeatAccountDAO.class);
		return sadao.getSeatAccount(mid);
	}
	
}
