package com.ict.hhw.blame.model.service;

import java.util.ArrayList;

import com.ict.hhw.blame.model.vo.Blame;
import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;

public interface BlameService {
	int getListCount();
	// 목록조회
	ArrayList<Blame> selectList(int currentPage, int limit);
	// 상세보기
	Blame selectBlame(int blame_no);
	int addReadCount(int blame_no);
	// 원글 조회
	int insertBoard(Blame blame);

}