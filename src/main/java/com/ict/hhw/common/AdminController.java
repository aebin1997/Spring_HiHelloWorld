package com.ict.hhw.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminController {

	
	// 관리자 페이지로 이동
	@RequestMapping("admin.do")
	public String admin() {
		return "admin/adminmain";
	}

	// 신고회원리스트 페이지로 이동
		@RequestMapping("blamelist.do")
		public String blame() {
			return "admin/adminmain";
		}

}