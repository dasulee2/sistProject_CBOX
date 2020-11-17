package com.sist.cbox.dao;
import java.util.List;

import com.sist.cbox.vo.Review;


public interface ReviewDAO {
	
	public int addReview(Review r);
	
	public Review myReview(String mid);

	public Review getReview(int rseq);
	
	public int updateReview(Review r);
	
	public int getSeqCount(String mcode);
	
	public int deleteReview(int rseq);
	
	public List<Review> allReview(int pg, String mcode);
	

}
