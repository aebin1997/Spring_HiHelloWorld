package com.ict.hhw.notice.model.service;

import java.util.ArrayList;

import com.ict.hhw.common.SearchDate;
import com.ict.hhw.notice.model.vo.Notice;

public interface NoticeService {
	ArrayList<Notice> selectAll();
	
	//리스트보기
	Notice selectnotice(int nid);
	int insertNotice(Notice notice);
	int updateNotice(Notice notice);
	int deleteNotice(int nid);
	ArrayList<Notice> selectNewTop3();
	ArrayList<Notice> selectSearchTitle(String keyword);
	ArrayList<Notice> selectSearchWriter(String keyword);
	ArrayList<Notice> selectSearchDate(SearchDate dates);

}