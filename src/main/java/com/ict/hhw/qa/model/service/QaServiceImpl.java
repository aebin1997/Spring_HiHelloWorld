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
		return qaDao.getListCount();
	}

	@Override
	public ArrayList<Qa> selectList(int currentPage, int limit) {
		return qaDao.selectList(currentPage, limit);  
	}

	@Override
	public Qa selectQa(int qa_id) {
		return qaDao.selectQa(qa_id);
	}

	@Override
	public int addReadCount(int qa_id) {
		return qaDao.addReadCount(qa_id);
	}

	@Override
	public int insertQa(Qa qa) {
		return qaDao.insertQa(qa);
	}

	@Override
	public int updateQa(Qa qa) {
		return qaDao.updateQa(qa);
	}

	@Override
	public int deleteQa(int qa_id) {
		return qaDao.deleteQa(qa_id);
	}

}
