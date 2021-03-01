package com.ict.hhw.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;
import com.ict.hhw.review.model.dao.ReviewDao;
import com.ict.hhw.review.model.vo.Review;


@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {
	@Autowired //의존성 어노테이션 
	   private ReviewDao reviewDao;

	   @Override
	   public int getListCount() {
	      return reviewDao.getListCount();
	   }

	   @Override
	   public ArrayList<Review> selectList(int currentPage, int limit) {
	      return reviewDao.selectList(currentPage, limit);
	   }

	   @Override
	   public Review selectReview(int bid) {
	      return reviewDao.selectReview(bid);
	   }

	   @Override
	   public int addReadCount(int bid) {
	      return reviewDao.addReadCount(bid);
	   }

	   @Override
	   public int insertReview(Review board) {
	      return reviewDao.insertReview(board);
	   }
	   
	   @Override
	   public int deleteReview(int bid) {
	      return reviewDao.deleteReview(bid);
	   }

		@Override
		public ArrayList<Review> selectSearchTitle(SearchAndPage searches) {
			return reviewDao.selectSearchTitle(searches);
		}
		
		@Override
		public ArrayList<Review> selectSearchWriter(SearchAndPage searches) {
			return reviewDao.selectSearchWriter(searches);
		}
		
		@Override
		public ArrayList<Review> selectSearchDate(SearchAndPage searches) {
			return reviewDao.selectSearchDate(searches);
		}

		@Override
		public int getSearchTitleListCount(String keyword) {
			return reviewDao.getSearchTitleListCount(keyword);
		}

		@Override
		public int getSearchWriterListCount(String keyword) {
			return reviewDao.getSearchWriterListCount(keyword);
		}

		@Override
		public int getSearchDateListCount(SearchDate dates) {
			return reviewDao.getSearchDateListListCount(dates);
		}

}
