package com.ict.hhw.blame.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.blame.model.vo.Blame;

@Repository("blameDao")
public class BlameDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Blame selectBlame(int blame_no) {
		return sqlSession.selectOne("blameMapper.selectBlame", blame_no);
	}

	public int insertBlame(Blame blame) {
		return sqlSession.insert("blameMapper.insertBlame", blame);
	}

}
