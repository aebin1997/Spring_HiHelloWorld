package com.ict.hhw.qa.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.qa.model.vo.Qar;

@Repository("qarDao")
public class QarDao {
	

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertQar(Qar qar) {
		return sqlSession.insert("qarMapper.insertQar", qar);
	}

	public int updateQar(Qar qar) {
		return sqlSession.update("qarMapper.updateQar", qar);
	}

	public int deleteQar(int qar_id) {
		return sqlSession.delete("qarMapper.deleteQar", qar_id);
	}

	public Qar selectQar(int qar_id) {
		return sqlSession.selectOne("qarMapper.selectQar", qar_id);
	}

	public ArrayList<Qar> selectList(int ref_qa_id) {
		List<Qar> list = sqlSession.selectList("qarMapper.selectList", ref_qa_id);
		return (ArrayList<Qar>)list;
	}

}
