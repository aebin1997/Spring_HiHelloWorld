package com.ict.hhw.payment.model.service;

import java.util.ArrayList;

import com.ict.hhw.common.PayInfoSearchDate;
import com.ict.hhw.common.SearchDate;
import com.ict.hhw.payment.model.vo.Payment;

public interface PaymentService {

	// 결제내역 추가 메소드
	int insertPay(Payment p);

	int selectPoint(String nickname);

	// 결제내역 리스트
	ArrayList<Payment> selectList(String member);

	// 날짜별 결제내역
	ArrayList<Payment> selectSearchDate(PayInfoSearchDate dates);

	

}
