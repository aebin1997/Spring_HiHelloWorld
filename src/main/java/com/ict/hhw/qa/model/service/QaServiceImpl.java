package com.ict.hhw.qa.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.hhw.qa.model.dao.QaDao;
import com.ict.hhw.qa.model.vo.Qa;

@Service("qaService")
public class QaServiceImpl implements QaService{
	@Autowired
	private QaDao qaDao;

	@Override
	public ArrayList<Qa> selectTop3() {
		return qaDao.selectTop3();
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Qa> selectList(int currentPage, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qa selectQa(int qa_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addReadCount(int qa_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertQa(Qa qa) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateQa(Qa qa) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteQa(int qa_id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
