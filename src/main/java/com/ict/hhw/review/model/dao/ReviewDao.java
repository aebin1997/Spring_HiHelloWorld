package com.ict.hhw.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;
import com.ict.hhw.review.model.vo.BoardPage;
import com.ict.hhw.review.model.vo.Review;


@Repository("ReviewDao")
public class ReviewDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("reviewMapper.getListCount");
	}

	public ArrayList<Review> selectList(int currentPage, int limit) {
		//전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit -1;
		int endRow = startRow + limit - 1;
		
		List<Review> list = sqlSession.selectList("reviewMapper.selectList", new BoardPage(startRow, endRow));
		return (ArrayList<Review>)list;
	}

	public Review selectReview(int bid) {
		return sqlSession.selectOne("reviewMapper.selectReview", bid);
	}

	public int addReadCount(int bid) {
		return sqlSession.update("reviewMapper.updateRCount", bid);
	}

	public int insertReview(Review review) {
		return sqlSession.insert("reviewMapper.insertReview", review);
	}

	public int deleteReview(int bid) {
		return sqlSession.update("reviewMapper.changeRstatusN", bid);
	}

	public ArrayList<Review> selectSearchTitle(SearchAndPage searches) {
		List<Review> list = sqlSession.selectList("reviewMapper.searchTitle", searches);
		return (ArrayList<Review>)list;
	}

	public ArrayList<Review> selectSearchWriter(SearchAndPage searches) {
		List<Review> list = sqlSession.selectList("reviewMapper.searchWriter", searches);
		return (ArrayList<Review>)list;
	}

	public ArrayList<Review> selectSearchDate(SearchAndPage searches) {
		List<Review> list = sqlSession.selectList("reviewMapper.searchDate", searches);
		return (ArrayList<Review>)list;
	}

	public int getSearchTitleListCount(String keyword) {
		return sqlSession.selectOne("reviewMapper.getSearchTitleListCount", keyword);
	}

	public int getSearchWriterListCount(String keyword) {
		return sqlSession.selectOne("reviewMapper.getSearchWriterListCount", keyword);
	}

	public int getSearchDateListListCount(SearchDate dates) {
		return sqlSession.selectOne("reviewMapper.getSearchDateListCount", dates);
	}
	
}
