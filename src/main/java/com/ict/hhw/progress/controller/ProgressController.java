package com.ict.hhw.progress.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.hhw.member.model.vo.Member;
import com.ict.hhw.progress.model.service.ProgressService;
import com.ict.hhw.progress.model.vo.Progress;


@Controller
public class ProgressController {
	
	@Autowired
	private ProgressService progressService;
	
	@RequestMapping("progress.move")
	public String pboardListMethod(HttpSession session, Model model) {
		
		Member loginMember = new Member();
		loginMember = (Member)session.getAttribute("loginUser");

		String nickname = null;
		ArrayList<Progress> list = null;
		ArrayList<String> titleList = null;

		if( loginMember != null ) {
			nickname = loginMember.getNickname();
			list = progressService.selectPlist(nickname);
			titleList = progressService.selectQatitle(nickname);
		}

		if (list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("tlist", titleList);

			return "progress/projectApplyForm";
		} else {
			model.addAttribute("msg", "진행 목록 출력 목록 조회 실패.");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("selectUser.do")
	public String selectUser(String user, HttpSession session, Model model) {
		
		String selectUser = null;
		selectUser = progressService.selectUser(user);
		
		if(selectUser.equals(user)) {
			return selectUser;
		}else {
			System.out.println("fail");
		return "fail";
		}
	}
	
	@RequestMapping("processInsert.do")
	public String processInsert() {
		return "projetApplyForm";
	}
	
}
