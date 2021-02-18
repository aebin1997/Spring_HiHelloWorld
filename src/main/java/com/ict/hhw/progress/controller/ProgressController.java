package com.ict.hhw.progress.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProgressController {
	
	// 진행페이지로 이동 (임시용)
	@RequestMapping("progress.do")
	public String progress() {
		return "progress/progress";
	}
}
