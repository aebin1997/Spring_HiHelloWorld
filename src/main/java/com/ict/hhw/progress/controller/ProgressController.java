package com.ict.hhw.progress.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.hhw.member.model.vo.Member;
import com.ict.hhw.progress.model.service.ProgressService;
import com.ict.hhw.progress.model.vo.Progress;
import com.ict.hhw.progress.model.vo.QaProgress;

@Controller
public class ProgressController {

	@Autowired
	private ProgressService progressService;

	// contact 페이지로 이동
	@RequestMapping("contact.move")
	public String contact() {
		return "contact/contact";
	}

	@RequestMapping("progress.move")
	public String pboardListMethod(HttpSession session, Model model) {

		Member loginMember = new Member();
		loginMember = (Member) session.getAttribute("loginUser");

		String nickname = null;
		ArrayList<QaProgress> list = null;
		ArrayList<QaProgress> requestList = null;
		ArrayList<String> titleList = null;

		// 오늘 날짜 생성
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		String date = simpleDateFormat.format(new java.util.Date());
		model.addAttribute("today", date);

		if (loginMember != null) {
			nickname = loginMember.getNickname();
			list = progressService.selectPlist(nickname);
			titleList = progressService.selectQatitle(nickname);
			requestList = progressService.selectRequest(nickname);
		}

		if (list.size() > 0) {
			model.addAttribute("list", list);
		}
		if (titleList.size() > 0) {
			model.addAttribute("tlist", titleList);
		}
		if (requestList.size() > 0) {

			model.addAttribute("rlist", requestList);
		}

		return "progress/projectApplyForm";
//		} else {
//			model.addAttribute("msg", "진행 목록 출력 목록 조회 실패.");
//			return "common/errorPage";
//		}
	}

	@ResponseBody
	@RequestMapping(value = "selectUser.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String selectUser(String user, HttpSession session, Model model) {

		String selectUser = null;
		selectUser = progressService.selectUser(user);
		if (selectUser != null) {
			return selectUser;
		} else {
			return "fail";
		}
	}
	
	@RequestMapping(value = "progressInsert.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public @ResponseBody String processInsert(@RequestParam("qa_title") String qa_title,
			@RequestParam("pro_answerer") String pro_answerer, @RequestParam("pro_deadline") Date pro_deadline,
			@RequestParam("pro_pay") int pro_pay, HttpSession session, Model model) {

		Member loginMember = new Member();
		loginMember = (Member) session.getAttribute("loginUser");
		String nickname = null;
		nickname = loginMember.getNickname();

		int qa_id = 0;
		Progress progress = new Progress();

		qa_id = Integer.parseInt(progressService.findQaId(qa_title));

		progress.setPro_qid(qa_id);
		progress.setPro_writer(nickname);
		progress.setPro_answerer(pro_answerer);
		progress.setPro_deadline(pro_deadline);
		progress.setPro_pay(pro_pay);

		// 의뢰 프로젝트 추가
		int result = progressService.insertProgress(progress);

		if (result > 0) {
			// alert 창
			return "<script type='text/javascript'>" + "alert(\"의뢰 요청을 성공적으로 전송하였습니다.\");"
					+ "location.href=\"/hhw/progress.move\";" + "</script>";
		} else {
			model.addAttribute("msg", "Q&A 요청 실패!");
			return "common/errorPage";
		}

	}

	@RequestMapping(value = "requestAccept.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public @ResponseBody String requestAccept(@RequestParam("r_pro_id") int r_pro_id) {

		int result = progressService.acceptRequest(r_pro_id);

		if (result > 0) {
			return "<script type='text/javascript'>" + "alert(\"의뢰 요청을 성공적으로 수락하였습니다.\");"
					+ "location.href=\"/hhw/progress.move\";" + "</script>";
		} else {
			return "common.errorPage";
		}
	}

	@RequestMapping(value = "requestRefuse.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public @ResponseBody String requestRefuse(@RequestParam("r_pro_id") int r_pro_id) {

		int result = progressService.refuseRequest(r_pro_id);

		if (result > 0) {
			return "<script type='text/javascript'>" + "alert(\"의뢰 요청을 거절하였습니다.\");"
					+ "location.href=\"/hhw/progress.move\";" + "</script>";
		} else {
			return "common.errorPage";
		}
	}

}
