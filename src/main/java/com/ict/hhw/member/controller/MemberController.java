package com.ict.hhw.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("login.move")
	public String loginMove() {
		return "member/login";
	}
}
