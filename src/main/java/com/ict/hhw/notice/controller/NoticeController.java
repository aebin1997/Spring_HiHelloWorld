package com.ict.hhw.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	// 공지사항 메뉴로 이동
	@RequestMapping("noticeHome.do")
	public String noticeHome() {
		return "notice/noticeHome";
	}

	// 공지사항 페이지로 이동
	@RequestMapping("noticeView.do")
	public String noticeView() {
		return "notice/noticeListView";
	}

	// about us 페이지로 이동
	@RequestMapping("aboutUs.do")
	public String aboutUs() {
		return "notice/aboutUs";
	}

	// 사이트 사용법 페이지로 이동
	@RequestMapping("howTo.do")
	public String howTo() {
		return "notice/howTo";
	}

}
