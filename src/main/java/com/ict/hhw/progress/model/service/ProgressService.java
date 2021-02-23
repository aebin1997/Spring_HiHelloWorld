package com.ict.hhw.progress.model.service;

import java.util.ArrayList;

import com.ict.hhw.progress.model.vo.Progress;

public interface ProgressService {
	ArrayList<Progress> selectPlist(String nickname);
	ArrayList<String> selectQatitle(String nickname);
	String selectUser(String nickname);
}
