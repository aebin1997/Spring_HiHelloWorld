package com.ict.hhw.qa.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.qa.model.vo.Qa;

@Repository("QaDao")
public class QaDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Qa> selectTop3() {
		List<Qa> list = sqlSession.selectList("qaMapper.selectTop3");
		return (ArrayList<Qa>)list;
	}

	
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public ArrayList<Qa> selectList(int currentPage, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public Qa selectQa(int qa_id) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public int addReadCount(int qa_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int insertQa(Qa qa) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int updateQa(Qa qa) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	public int deleteQa(int qa_id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
