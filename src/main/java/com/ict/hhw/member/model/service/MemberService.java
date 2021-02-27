package com.ict.hhw.member.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.ict.hhw.member.model.vo.Member;
import com.ict.hhw.notice.model.vo.Notice;

public interface MemberService {

	// 회원 로그인 서비스를 위한 메소드
	Member loginMember(Member m);

	// 회원 가입 서비스를 위한 메소드
	int insertMember(Member m);

	// 회원 정보 수정 서비스를 위한 메소드
	int updateMember(Member m);

	// 회원 탈퇴 서비스를 위한 메소드
	int deleteMember(String id);

	// 아이디 찾기 위한 메소드
	Member findId(Member m);

	// 비밀번호 찾기 위한 메소드
	Member findPw(Member m);
	
	// 임시 비밀번호 설정 위한 메소드
	int setTempPw(Member m);
	
	// 아이디 중복 체크를 위한 메소드
	int idCheck(String id);
	
	// 회원정보 리스트를 위한 메소드
	ArrayList<Member> selectAll();
	

}
