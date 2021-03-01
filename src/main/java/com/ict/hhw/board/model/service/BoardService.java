package com.ict.hhw.board.model.service;

import java.util.ArrayList;

import com.ict.hhw.board.model.vo.Board;
import com.ict.hhw.board.model.vo.BoardList;
import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;

public interface BoardService {
	
	//보드리스트 vo
	BoardList selectBoardList(int bid);
	ArrayList<BoardList> selectBoardList(int currentPage, int limit);
	
	// 댓글 업데이트
	/* int addInsertReply(int bid); */
	
	// 조회수 많은 게시글 top3
	ArrayList<Board> selectTop3();
	int getListCount();
	// 목록조회
	ArrayList<Board> selectList(int currentPage, int limit);
	// 상세보기
	Board selectBoard(int bid);
	int addReadCount(int bid);
	// 원글 조회
	int insertBoard(Board board);
	int updateBoard(Board board);
	int deleteBoard(int bid);
	ArrayList<Board> selectSearchTitle(SearchAndPage searches);
	ArrayList<Board> selectSearchWriter(SearchAndPage searches);
	ArrayList<Board> selectSearchDate(SearchAndPage searches);
	int getSearchTitleListCount(String keyword);
	int getSearchWriterListCount(String keyword);
	int getSearchDateListCount(SearchDate dates);

}