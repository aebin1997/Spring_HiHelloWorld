package com.ict.hhw.progress.model.service;

import java.util.ArrayList;

import com.ict.hhw.progress.model.vo.P_board;

public interface PboardService {
	
	int getListCount();
	// 목록조회
	ArrayList<P_board> selectList(int currentPage, int limit);

		
}
