package com.ict.hhw.progress.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ict.hhw.member.model.vo.Member;
import com.ict.hhw.progress.model.service.PboardService;
import com.ict.hhw.progress.model.vo.P_board;


@Controller
public class ProgressController {
	
	@Autowired
	private PboardService pboardService;
	
	@RequestMapping("progress.move")
	public String pboardListMethod(HttpSession session, Model model) {
		
		Member loginMember = new Member();
		loginMember = (Member)session.getAttribute("loginUser");

		String nickname = null;
		ArrayList<P_board> list = null;

		if( loginMember != null ) {
			nickname = loginMember.getNickname();
			list = pboardService.selectPlist(nickname);
		}

		if (list.size() > 0) {
			model.addAttribute("list", list);

			return "progress/projectApplyForm";
		} else {
			model.addAttribute("msg", "진행 목록 출력 목록 조회 실패.");
			return "common/errorPage";
		}
	}
}
