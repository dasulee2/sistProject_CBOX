package com.sist.cbox.dao;

import java.util.List;
import com.sist.cbox.vo.MovieDiary;

public interface MovieDiaryDAO {
	
	public List<MovieDiary> allDiary(String mid);
	
	public int deleteDiary(String mdseq);
			
	public int addDiary(MovieDiary m);
	
	public MovieDiary getDiary(String mdseq);
	
	public MovieDiary myDiary(String mid, String mcode);
	
	public List<String> checkDiary();
	
	public String diaryDetail(String mid, String mcode);
	
	public int updateDiary(MovieDiary m );

}
