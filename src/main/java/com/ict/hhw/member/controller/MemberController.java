package com.ict.hhw.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ict.hhw.member.model.service.MemberService;
import com.ict.hhw.member.model.vo.Member;

@SessionAttributes("loginUser")

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	// 암호화 처리(spring-security에 bean등록 후) 후 작성
	// @Autowired
	// private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 로깅시 추가
	// private Logger logger = LoggerFactory.getLogger(MemberController.class);

	// 로그인 페이지로 이동
	@RequestMapping("loginView.do")
	public String loginView() {
		return "member/login";
	}

	// 회원가입 페이지로 이동
	@RequestMapping("enrollView.do")
	public String enrollView() {
		return "member/memberInsertForm";
	}

	// (암호화전)로그인 메소드 - @ModelAttribute를 이용한 값 전달 방법(4)
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String memberLogin(@ModelAttribute Member m, Model model, HttpSession session) {

		Member loginUser = mService.loginMember(m);
		
		System.out.println(loginUser);
		
		if (loginUser != null && m.getPwd().equals(loginUser.getPwd())) {
			// 로그인 성공
			session.setAttribute("loginUser", loginUser);
			return "redirect:home.do";
		} else {
			model.addAttribute("msg","로그인 실패");
			return "common/errorPage";
		}
	}

	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		// 로그아웃을 처리를 위해서 커맨드 객체로 세션의 상태를 관리할 수있는 SessionStatus 객체가 필요하다.

		// 세션의 상태를 확정지어주는 메소드 호출
		status.setComplete();

		return "redirect:home.do";
	}
	
	// 마이페이지로 이동
	@RequestMapping("myInfo.do")
	public String myInfoView() {
		return "member/myPage"; 
	}
	
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String id) {
		int result = mService.idCheck(id);
		
		if(result>0) {
			return "fail";
		}else {
			return "ok";
		}
	}
}
