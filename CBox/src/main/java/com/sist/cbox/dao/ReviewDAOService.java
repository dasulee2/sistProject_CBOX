package com.sist.cbox.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sist.cbox.vo.Review;

public class ReviewDAOService implements ReviewDAO {
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
	}
	
	@Override
	public int addReview(Review r) {
		ReviewDAO rdao = sqlSession.getMapper(ReviewDAO.class);	
		return rdao.addReview(r);
	}

	@Override
	public Review getReview(int rseq) {
		ReviewDAO rdao = sqlSession.getMapper(ReviewDAO.class);	
		return rdao.getReview(rseq);
	}

	@Override
	public Review myReview(String mid) {
		ReviewDAO rdao = sqlSession.getMapper(ReviewDAO.class);	
		return rdao.myReview(mid);
	}

	@Override
	public int updateReview(Review r) {
		ReviewDAO rdao = sqlSession.getMapper(ReviewDAO.class);	
		return rdao.updateReview(r);
	}

	@Override
	public int deleteReview(int rseq) {
		ReviewDAO rdao = sqlSession.getMapper(ReviewDAO.class);	
		return rdao.deleteReview(rseq);
	}

	@Override
	public List<Review> allReview(int pg, String mcode) {
		ReviewDAO rdao = sqlSession.getMapper(ReviewDAO.class);	
		return rdao.allReview(pg, mcode);
	}

	@Override
	public int getSeqCount(String mcode) {
		ReviewDAO rdao = sqlSession.getMapper(ReviewDAO.class);	
		return rdao.getSeqCount(mcode);
	}

}
