package com.ict.hhw.progress.model.service;

import java.util.ArrayList;

import com.ict.hhw.common.SearchDate;
import com.ict.hhw.progress.model.vo.P_board;
import com.ict.hhw.progress.model.vo.Psearch;
import com.ict.hhw.progress.model.vo.QaProgress;

public interface PboardService {
	
	int getListCount();
	// 목록조회
	ArrayList<P_board> selectList(int pro_id);
	ArrayList<P_board> selectOldList(int pro_id);
	// 상세보기
	P_board selectPboard(int pid);
	QaProgress selectProgress(int pro_id);
	int addReadCount(int pid);
	// 원글 조회
	int insertPboard(P_board pboard);
	int updatePboard(P_board pboard);
	int deletePboard(int pid);
	ArrayList<P_board> selectSearchTitle(Psearch psearch);
	ArrayList<P_board> selectSearchWriter(Psearch psearch);
	ArrayList<P_board> selectSearchDate(Psearch psearch);
	int getSearchTitleListCount(String keyword);
	int getSearchWriterListCount(String keyword);
	int getSearchDateListCount(SearchDate dates);
	
}
