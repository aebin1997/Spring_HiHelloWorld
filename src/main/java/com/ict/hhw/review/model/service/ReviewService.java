package com.ict.hhw.review.model.service;

import java.util.ArrayList;

import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;
import com.ict.hhw.review.model.vo.Review;

public interface ReviewService {

	int getListCount();

	// 목록조회
	ArrayList<Review> selectList(int currentPage, int limit);

	// 상세보기
	Review selectReview(int rid);

	int addReadCount(int rid);

	// 원글 조회
	int insertReview(Review review);

	int deleteReview(int rid);

	ArrayList<Review> selectSearchTitle(SearchAndPage searches);

	ArrayList<Review> selectSearchWriter(SearchAndPage searches);

	ArrayList<Review> selectSearchDate(SearchAndPage searches);

	int getSearchTitleListCount(String keyword);

	int getSearchWriterListCount(String keyword);

	int getSearchDateListCount(SearchDate dates);
}
