package com.ict.hhw.payment.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.hhw.common.PayInfoSearchDate;
import com.ict.hhw.common.SearchDate;
import com.ict.hhw.payment.model.vo.Payment;

@Repository("pDao")
public class PaymentDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertPay(Payment p) {
		return sqlSession.insert("paymentMapper.insertPayment", p);
	}

	public int selectPoint(String nickname) {
		return sqlSession.selectOne("paymentMapper.selectPoint", nickname);
	}

	public ArrayList<Payment> selectList(String member) {
		List<Payment> list = sqlSession.selectList("paymentMapper.selectPList", member);
		return (ArrayList<Payment>)list;
	}

	public ArrayList<Payment> selectSearchDate(PayInfoSearchDate dates) {
		List<Payment> list = sqlSession.selectList("paymentMapper.psearchDate", dates);
		return (ArrayList<Payment>)list;
	}
}
