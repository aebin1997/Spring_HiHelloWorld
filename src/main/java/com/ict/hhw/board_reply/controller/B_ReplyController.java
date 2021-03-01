package com.ict.hhw.board_reply.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.hhw.board_reply.model.service.B_ReplyService;
import com.ict.hhw.board_reply.model.vo.B_Reply;

@Controller
public class B_ReplyController {
	@Autowired
	private B_ReplyService b_replyService;

	@RequestMapping(value = "rinsert.do", method = RequestMethod.POST)
	public String replyInsertMethod(B_Reply b_reply, Model model) {
		
		if (b_replyService.insertB_Reply(b_reply) > 0) {
			
		
			
			return "redirect:bdetail.do?bid=" + b_reply.getB_ref_bid();
		} else {
			model.addAttribute("msg", b_reply.getB_ref_bid() + "번 글에 대한 댓글달기 실패.");
			return "common/errorPage";
		}
	}

	// ajax 원글에 대한 댓글 조회 처리용
	@RequestMapping(value = "rlist.do", method = RequestMethod.POST)
	@ResponseBody
	public String b_replyListMethod(@RequestParam("b_ref_bid") int b_ref_bid) throws UnsupportedEncodingException {
		// 원글에 대한 댓글 조회 요청
		ArrayList<B_Reply> list = b_replyService.selectList(b_ref_bid); // 결과를 받아줌

		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		// list 옮길 json 배열 준비
		JSONArray jarr = new JSONArray();

		// list 를 jarr 로 옮기기(복사)
		for (B_Reply b_reply : list) {
			// reply 필드값 저장할 json 객체 생성
			JSONObject job = new JSONObject();

			job.put("b_rid", b_reply.getB_rid()); 
			job.put("b_rwriter", b_reply.getB_rwriter()); // 인코딩 해서 제이슨 객체 안에 담는다
			job.put("b_rcontent", URLEncoder.encode(b_reply.getB_rcontent(), "utf-8"));
			job.put("b_create_date", b_reply.getB_create_date().toString());
			job.put("b_ref_bid", b_reply.getB_ref_bid());

			// job 를 jarr 에 저장
			jarr.add(job);
		}

		// 전송용 json 객체에 jarr 담음
		sendJson.put("list", jarr);

		return sendJson.toJSONString(); // jsonView 가 리턴됨

	}
	
	
	@RequestMapping("rdel.do")
	public String replyDeleteMethod(@RequestParam("b_rid") int b_rid, @RequestParam("bid") int bid, Model model) {
		if (b_replyService.deleteB_Reply(b_rid) > 0) {
			return "redirect:bdetail.do?bid=" + bid;
		} else {
			model.addAttribute("msg", b_rid + "번 댓글 삭제 실패.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="rupdate.do", method=RequestMethod.POST)
	public String replyUpdateMethod(B_Reply reply,
			@RequestParam("bid") int bid, Model model) {
		if (b_replyService.updateB_Reply(reply) > 0) {
			return "redirect:bdetail.do?bid=" + bid;
		} else {
			model.addAttribute("msg", reply.getB_rid() + "번 댓글 삭제 실패.");
			return "common/errorPage";
		}
	}
	
	
}