package com.ict.hhw.qa.model.service;

import java.util.ArrayList;

import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;
import com.ict.hhw.qa.model.vo.Qa;


public interface QaService {
	ArrayList<Qa> selectTop3();
	int getListCount();
	ArrayList<Qa> selectList(int currentPage, int limit);
	Qa selectQa(int qa_id);   
	int addReadCount(int qa_id);
	int insertQa(Qa qa);
	int updateQa(Qa qa);
	int deleteQa(int qa_id);
	ArrayList<Qa> selectSearchTitle(SearchAndPage searches);
	ArrayList<Qa> selectSearchWriter(SearchAndPage searches);
	ArrayList<Qa> selectSearchDate(SearchAndPage searches);
	int getSearchTitleListCount(String keyword);
	int getSearchWriterListCount(String keyword);
	int getSearchDateListCount(SearchDate dates);
}
