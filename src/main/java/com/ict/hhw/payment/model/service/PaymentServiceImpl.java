package com.ict.hhw.payment.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.hhw.common.PayInfoSearchDate;
import com.ict.hhw.common.SearchDate;
import com.ict.hhw.member.model.vo.Member;
import com.ict.hhw.payment.model.dao.PaymentDao;
import com.ict.hhw.payment.model.vo.Payment;
import com.ict.hhw.qa.model.vo.Qa;

@Service("pService")
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired 
	private PaymentDao pDao;

	//결제내역 추가 메소드 
	@Override
	public int insertPay(Payment p) {
		int result = pDao.insertPay(p);
		return result;
	}

	@Override
	public int selectPoint(String nickname) {
		return pDao.selectPoint(nickname);
	}

	//결제내역 리스트
	@Override
	public ArrayList<Payment> selectList(String member) {
		return pDao.selectList(member);
	}
	
	//날짜별 결제내역
	@Override
	public ArrayList<Payment> selectSearchDate(PayInfoSearchDate dates) {
		return pDao.selectSearchDate(dates);
	}

	
	
	

}
