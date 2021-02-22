package com.ict.hhw.progress.model.service;

import java.util.ArrayList;

import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;
import com.ict.hhw.progress.model.vo.P_board;

public interface PboardService {
	
	int getListCount();
	// 목록조회
	ArrayList<P_board> selectList(int currentPage, int limit);
	ArrayList<P_board> selectPlist(String nickname);
	// 상세보기
	P_board selectPboard(int pid);
	int addReadCount(int pid);
	// 원글 조회
	//int insertPboard(P_board pboard);
	int updatePboard(P_board pboard);
	int deletePboard(int pid);
	ArrayList<P_board> selectSearchTitle(SearchAndPage searches);
	ArrayList<P_board> selectSearchWriter(SearchAndPage searches);
	ArrayList<P_board> selectSearchDate(SearchAndPage searches);
	int getSearchTitleListCount(String keyword);
	int getSearchWriterListCount(String keyword);
	int getSearchDateListCount(SearchDate dates);
		
}
