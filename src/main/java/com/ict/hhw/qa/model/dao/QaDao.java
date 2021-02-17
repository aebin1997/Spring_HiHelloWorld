package com.ict.hhw.qa.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.qa.model.vo.Qa;
import com.ict.hhw.qa.model.vo.QaPage;

@Repository("QaDao")
public class QaDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Qa> selectTop3() {
		List<Qa> list = sqlSession.selectList("qaMapper.selectTop3");
		return (ArrayList<Qa>)list;
	}

	
	public int getListCount() {
		return sqlSession.selectOne("qaMapper.getListCount");
	}

	
	public ArrayList<Qa> selectList(int currentPage, int limit) {
		int startRow = (currentPage - 1) * limit -1;
		int endRow = startRow + limit -1;
		
		List<Qa> list = sqlSession.selectList("qaMapper.selectList", 
				new QaPage(startRow, endRow));
		return (ArrayList<Qa>)list;
	}

	
	public Qa selectQa(int qa_id) {
		return sqlSession.selectOne("qaMapper.selectQa", qa_id);
	}

	
	public int addReadCount(int qa_id) {
		return sqlSession.update("qaMapper.updateQacount",qa_id);
	}

	
	public int insertQa(Qa qa) {
		return sqlSession.insert("qaMapper.insertQa", qa);
	}

	
	public int updateQa(Qa qa) {
		return sqlSession.update("qaMapper.updateQa",qa);
	}

	
	public int deleteQa(int qa_id) {
		return sqlSession.update("qaMapper.changeQastatusN",qa_id);
	}

}
