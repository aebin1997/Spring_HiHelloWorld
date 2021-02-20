package com.ict.hhw.progress.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.hhw.progress.model.dao.PboardDao;
import com.ict.hhw.progress.model.vo.P_board;

@Service("pboardService")
public class PboardServiceImpl implements PboardService{

	@Autowired
	private PboardDao pboardDao;
	
	@Override
	public ArrayList<P_board> selectList(int currentPage, int limit) {
		return pboardDao.selectList(currentPage, limit);
	}

	@Override
	public int getListCount() {
		return pboardDao.getListCount();
	}

}
