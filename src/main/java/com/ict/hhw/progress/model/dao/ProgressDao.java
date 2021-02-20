package com.ict.hhw.progress.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository("progressDao")
public class ProgressDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}
