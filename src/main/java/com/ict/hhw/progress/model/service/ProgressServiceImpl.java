package com.ict.hhw.progress.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.hhw.progress.model.dao.ProgressDao;
import com.ict.hhw.progress.model.vo.Progress;

@Service("progressService")
public class ProgressServiceImpl implements ProgressService {

	@Autowired
	private ProgressDao progressDao;
	
	@Override
	public ArrayList<Progress> selectPlist(String nickname) {
		return progressDao.selectPlist(nickname);
	}

	@Override
	public ArrayList<String> selectQatitle(String nickname) {
		return progressDao.selectQaTitle(nickname);
	}

	@Override
	public String selectUser(String nickname) {
		return progressDao.selectUser(nickname);
	}

	@Override
	public String findQaId(String qa_title) {
		return progressDao.findQaId(qa_title);
	}

	@Override
	public int insertProgress(Progress progress) {
		int result = progressDao.insertProgress(progress);
		return result;
	}
}
