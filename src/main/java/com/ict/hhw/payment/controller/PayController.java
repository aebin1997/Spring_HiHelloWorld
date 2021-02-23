package com.ict.hhw.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ict.hhw.payment.model.service.PaymentService;

@Controller
public class PayController {
	
	@Autowired
	private PaymentService pService; /* pService 정하기 */
	
	// '카카오페이'버튼 클릭
	@RequestMapping("kakao.do")
	public String kakaoView() {
		return "payment/kakao";
	}
	
	// 

}
