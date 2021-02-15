package com.ict.hhw.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EtcPageController {

	// Coming Soon 페이지 이동
	@RequestMapping("comingsoon.do")
	public String comingSoon() {
		return "common/comingsoon";
	}

}
