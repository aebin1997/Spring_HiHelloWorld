package com.ict.hhw.progress.model.service;

import java.util.ArrayList;

import com.ict.hhw.progress.model.vo.Progress;
import com.ict.hhw.progress.model.vo.QaProgress;

public interface ProgressService {
	ArrayList<QaProgress> selectPlist(String nickname);
	ArrayList<String> selectQatitle(String nickname);
	String selectUser(String nickname);
	String findQaId(String qa_title);
	int insertProgress(Progress progress);
	ArrayList<QaProgress> selectRequest(String nickname);
	int acceptRequest(int pro_id);
	int refuseRequest(int pro_id);
	int checkDeadline();
}
