package com.sist.cbox.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.Movie;

public class MovieDAOService implements MovieDAO {
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
	}
	
	@Override
	public Movie getMovie(String mcode) {
		MovieDAO mdao = sqlSession.getMapper(MovieDAO.class);	
		return mdao.getMovie(mcode);
	}

	@Override
	public List<Movie> allMovie() {
		MovieDAO mdao = sqlSession.getMapper(MovieDAO.class);	
		return mdao.allMovie();
	}

	@Override
	public List<Movie> searchMovie_GPA() {
		MovieDAO mdao = sqlSession.getMapper(MovieDAO.class);	
		return mdao.searchMovie_GPA();
	}

	@Override
	public List<Movie> searchMovie_RATE(String rate) {
		MovieDAO mdao = sqlSession.getMapper(MovieDAO.class);	
		return mdao.searchMovie_RATE(rate);
	}

	@Override
	public List<Movie> searchMovie_RELEASE() {
		MovieDAO mdao = sqlSession.getMapper(MovieDAO.class);	
		return mdao.searchMovie_RELEASE();
	}

	@Override
	public int updateMovie(Movie m) {
		MovieDAO mdao = sqlSession.getMapper(MovieDAO.class);	
		return mdao.updateMovie(m);
	}

	@Override
	public int addMovie(Movie m) {
		MovieDAO mdao = sqlSession.getMapper(MovieDAO.class);	
		return mdao.addMovie(m);
	}

	@Override
	public List<String> currentMovie() {
		MovieDAO mdao = sqlSession.getMapper(MovieDAO.class);
		return mdao.currentMovie();
	}

}
