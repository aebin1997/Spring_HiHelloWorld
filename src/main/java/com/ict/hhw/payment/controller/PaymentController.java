package com.ict.hhw.payment.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.hhw.common.PayInfoSearchDate;
import com.ict.hhw.notice.model.vo.Notice;
import com.ict.hhw.payment.model.service.PaymentService;
import com.ict.hhw.payment.model.vo.Payment;
import com.ict.hhw.qa.model.vo.Qa;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService pService; /* pService 정하기 */

	// '카카오페이'버튼 클릭'
	@RequestMapping(value = "kakao.do")
	public String kakaoView(@RequestParam("price") int price, Model model) {
		System.out.println("price" + price);

		if (price != 0) {
			model.addAttribute("price", price);
			return "payment/kakao";
		} else {
			System.out.println("price 값 없음");
			model.addAttribute("msg", "결제페이지 이동이 실패하였습니다.");
			return "common/errorPage";
		}
	}

	// '카카오페이'완료
	@RequestMapping("pSuccess.do")
	public String insertPay(Payment p) {

		int result = pService.insertPay(p);
		if (result > 0) {
			System.out.println("result :" + result + "개 추가됨");
			return "payment/pSuccess";
		} else {
			System.out.println("결제정보 추가 안됨");
			return "common/errorPage";
		}
	}

	// 보유 포인트 ajax
	@RequestMapping(value = "getPoint.do", method = RequestMethod.POST)
	@ResponseBody
	public String getPoint(@RequestParam("nickname") String nickname) {
		System.out.println("getPoint.do");
		
		String point = String.valueOf(pService.selectPoint(nickname));

		return point;
	}

	// 포인트'충전' & '캐시관리' 로 이동
	@RequestMapping("payInfo.do")
	public String payInfoView(@RequestParam("member") String member, Model model) {

		System.out.println("payInfo.do" + member);
		ArrayList<Payment> list = pService.selectList(member);

		System.out.println(list.size());

		if (list.size() > 0) {
			model.addAttribute("list", list);
			return "member/payInfo";
		} else {
			model.addAttribute("msg" + "페이지 출력 목록 조회 실패.");
			return "common/errorPage";
		}
	}

	// payinfo 날짜로 조회
			@RequestMapping(value = "paysearchDate.do", method = RequestMethod.POST)
			public String paymentSearchDateMethod(PayInfoSearchDate dates, Model model) {
				System.out.println("paysearch date" + dates);
				ArrayList<Payment> list = pService.selectSearchDate(dates);
				System.out.println("paysearch " + list.size());
				
				if (list.size() > 0) {
					model.addAttribute("list", list);
					return "member/payInfo";
				} else {
					model.addAttribute("msg", "날짜로 검색된 공지사항 정보가 없습니다.");
					return "common/errorPage";
				}
			}
	

	
}





















