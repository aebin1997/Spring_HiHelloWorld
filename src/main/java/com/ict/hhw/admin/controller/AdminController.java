package com.ict.hhw.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminController {

	
	// 관리자 페이지로 이동
	@RequestMapping("admin.do")
	public String admin() {
		return "admin/adminmain";
	}

	// 관리자 페이지로 이동
	@RequestMapping("howTo.do")
	public String howto() {
		return "notice/howTo";
	}

	

}