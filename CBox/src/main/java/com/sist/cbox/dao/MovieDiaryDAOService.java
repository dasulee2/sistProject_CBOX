package com.sist.cbox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.MovieDiary;

	public class MovieDiaryDAOService implements MovieDiaryDAO {
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
	}
	

	@Override
	public List<MovieDiary> allDiary(String mid) {
		MovieDiaryDAO mddao = sqlSession.getMapper(MovieDiaryDAO.class);	
		return mddao.allDiary(mid);
	}

	@Override
	public int deleteDiary(String mdseq) {
		MovieDiaryDAO mddao = sqlSession.getMapper(MovieDiaryDAO.class);	
		return mddao.deleteDiary(mdseq);
	}

	@Override
	public int addDiary(MovieDiary m) {
		MovieDiaryDAO mddao = sqlSession.getMapper(MovieDiaryDAO.class);	
		return mddao.addDiary(m);
	}
	
	@Override
	public MovieDiary getDiary(String mdseq) {
		MovieDiaryDAO mddao = sqlSession.getMapper(MovieDiaryDAO.class);	
		return mddao.getDiary(mdseq);
	}


	@Override
	public MovieDiary myDiary(String mid, String mcode) {
		MovieDiaryDAO mddao = sqlSession.getMapper(MovieDiaryDAO.class);	
		return mddao.myDiary(mid, mcode);
	}


	@Override
	public List<String> checkDiary() {
		MovieDiaryDAO mddao = sqlSession.getMapper(MovieDiaryDAO.class);	
		return mddao.checkDiary();
	}


	@Override
	public String diaryDetail(String mid, String mcode) {
		MovieDiaryDAO mddao = sqlSession.getMapper(MovieDiaryDAO.class);	
		return mddao.diaryDetail(mid, mcode);
	}


	@Override
	public int updateDiary(MovieDiary m) {
		MovieDiaryDAO mddao = sqlSession.getMapper(MovieDiaryDAO.class);	
		return mddao.updateDiary(m);
	}
	
	

}
