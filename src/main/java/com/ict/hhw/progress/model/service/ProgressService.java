package com.ict.hhw.progress.model.service;

import java.util.ArrayList;

import com.ict.hhw.progress.model.vo.Progress;

public interface ProgressService {
	ArrayList<Progress> selectPlist(String nickname);
	ArrayList<String> selectQatitle(String nickname);
	String selectUser(String nickname);
	String findQaId(String qa_title);
	int insertProgress(Progress progress);
	ArrayList<Progress> selectRequest(String nickname);
	int acceptRequest(int pro_id);
}
