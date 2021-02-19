package com.ict.hhw.qa.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.hhw.qa.model.vo.Qar;
import com.ict.hhw.qa.model.dao.QarDao;

@Service("qarService")
public class QarServiceImpl implements QarService {
	
	@Autowired
	private QarDao qarDao;
	
	@Override
	public int insertQar(Qar qar) {
		return qarDao.insertQar(qar);
	}

	@Override
	public int updateQar(Qar qar) {
		return qarDao.updateQar(qar);
	}

	@Override
	public int deleteQar(int qar_id) {
		return qarDao.deleteQar(qar_id);
	}

	@Override
	public Qar selectQar(int qar_id) {
		return qarDao.selectQar(qar_id);
	}

	@Override
	public ArrayList<Qar> selectList(int ref_qa_id) {
		return qarDao.selectList(ref_qa_id);
	}

}
