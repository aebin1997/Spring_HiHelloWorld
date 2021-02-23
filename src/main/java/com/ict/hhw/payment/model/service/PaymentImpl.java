package com.ict.hhw.payment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.hhw.payment.model.dao.PaymentDao;

@Service("pService")
public class PaymentImpl implements PaymentService{
	
	@Autowired 
	private PaymentDao pDao;
	
	

}
