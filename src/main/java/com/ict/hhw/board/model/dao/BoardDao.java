package com.ict.hhw.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.board.model.vo.Board;
import com.ict.hhw.board.model.vo.BoardList;
import com.ict.hhw.board.model.vo.BoardListPage;
import com.ict.hhw.board.model.vo.BoardPage;
import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;

@Repository("boardDao")
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public BoardList selectBoardList(int bid) {
		return sqlSession.selectOne("boardMapper.selectBoardList", bid);
	}

	public ArrayList<BoardList> selectBoardList(int currentPage, int limit) {
		//전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit -1;
		int endRow = startRow + limit - 1;
		
		List<BoardList> list = sqlSession.selectList("boardMapper.selectNewBoardList", new BoardPage(startRow, endRow));
		return (ArrayList<BoardList>)list;
	}
	
	/*
	 * public int addInsertReply(int bid) { return
	 * sqlSession.update("boardMapper.addInsertReply", bid); }
	 */
	
	
	public ArrayList<Board> selectTop3() {
		List<Board> list = sqlSession.selectList("boardMapper.selectTop3");
		return (ArrayList<Board>)list;
	}

	public int getListCount() {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public ArrayList<Board> selectList(int currentPage, int limit) {
		//전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit -1;
		int endRow = startRow + limit - 1;
		
		List<Board> list = sqlSession.selectList("boardMapper.selectList", new BoardPage(startRow, endRow));
		return (ArrayList<Board>)list;
	}

	public Board selectBoard(int bid) {
		return sqlSession.selectOne("boardMapper.selectBoard", bid);
	}

	public int addReadCount(int bid) {
		return sqlSession.update("boardMapper.updateBCount", bid);
	}

	public int insertBoard(Board board) {
		return sqlSession.insert("boardMapper.insertBoard", board);
	}

	public int updateBoard(Board board) {
		return sqlSession.update("boardMapper.updateBoard", board);
	}

	public int deleteBoard(int bid) {
		return sqlSession.update("boardMapper.changeBstatusN", bid);
	}

	public ArrayList<Board> selectSearchTitle(SearchAndPage searches) {
		List<Board> list = sqlSession.selectList("boardMapper.searchTitle", searches);
		return (ArrayList<Board>)list;
	}

	public ArrayList<Board> selectSearchWriter(SearchAndPage searches) {
		List<Board> list = sqlSession.selectList("boardMapper.searchWriter", searches);
		return (ArrayList<Board>)list;
	}

	public ArrayList<Board> selectSearchDate(SearchAndPage searches) {
		List<Board> list = sqlSession.selectList("boardMapper.searchDate", searches);
		return (ArrayList<Board>)list;
	}

	public int getSearchTitleListCount(String keyword) {
		return sqlSession.selectOne("boardMapper.getSearchTitleListCount", keyword);
	}

	public int getSearchWriterListCount(String keyword) {
		return sqlSession.selectOne("boardMapper.getSearchWriterListCount", keyword);
	}

	public int getSearchDateListListCount(SearchDate dates) {
		return sqlSession.selectOne("boardMapper.getSearchDateListCount", dates);
	}

}
