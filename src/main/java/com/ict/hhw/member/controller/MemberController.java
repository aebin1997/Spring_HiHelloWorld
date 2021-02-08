package com.ict.hhw.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	//로그인 페이지로 이동
	@RequestMapping("loginView.do")
	public String loginView() {
		return "member/login";
	}
	
	//회원가입 페이지로 이동
	@RequestMapping("enrollView.do")
	public String enrollView() {
		return "member/memberInsertForm";
	}
	
}
