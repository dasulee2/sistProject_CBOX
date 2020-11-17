package com.sist.cbox.dao;
import java.util.List;

import com.sist.cbox.vo.Movie;


public interface MovieDAO {
	
	
	public Movie getMovie(String mcode);
	
	public List<Movie> allMovie();
	
	public List<Movie> searchMovie_GPA();
	
	public List<Movie> searchMovie_RATE(String rate);
	
	public List<Movie> searchMovie_RELEASE();
	
	public int updateMovie(Movie m);
	
	public int addMovie(Movie m);

	public List<String> currentMovie();
	
}
