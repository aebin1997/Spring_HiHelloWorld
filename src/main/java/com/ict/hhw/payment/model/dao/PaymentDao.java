package com.ict.hhw.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("pDao")
public class PaymentDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

}
