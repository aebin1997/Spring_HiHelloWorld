package com.ict.hhw.pboard_reply.controller;

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

import com.ict.hhw.pboard_reply.model.service.PreplyService;
import com.ict.hhw.pboard_reply.model.vo.P_reply;



@Controller
public class PreplyController {
	@Autowired
	private PreplyService replyService;

	@RequestMapping(value = "prinsert.do", method = RequestMethod.POST)
	public String replyInsertMethod(P_reply reply, Model model) {
		if (replyService.insertReply(reply) > 0) {
			return "redirect:pdetail.do?pid=" + reply.getRef_pid();
		} else {
			model.addAttribute("msg", reply.getRef_pid() + "번 글에 대한 댓글달기 실패.");
			return "common/errorPage";
		}
	}

	// ajax 원글에 대한 댓글 조회 처리용
	@RequestMapping(value = "prlist.do", method = RequestMethod.POST)
	@ResponseBody
	public String replyListMethod(@RequestParam("ref_pid") int ref_pid) throws UnsupportedEncodingException {
		// 원글에 대한 댓글 조회 요청
		ArrayList<P_reply> list = replyService.selectList(ref_pid); // 결과를 받아줌

		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		// list 옮길 json 배열 준비
		JSONArray jarr = new JSONArray();

		// list 를 jarr 로 옮기기(복사)
		for (P_reply reply : list) {
			// reply 필드값 저장할 json 객체 생성
			JSONObject job = new JSONObject();

			job.put("prid", reply.getPrid()); 
			job.put("prwriter", reply.getPrwriter()); // 인코딩 해서 제이슨 객체 안에 담는다
			job.put("prcontent", URLEncoder.encode(reply.getPrcontent(), "utf-8"));
			job.put("pr_date", reply.getPr_date().toString());
			job.put("ref_pid", reply.getRef_pid());

			// job 를 jarr 에 저장
			jarr.add(job);
		}

		// 전송용 json 객체에 jarr 담음
		sendJson.put("list", jarr);

		return sendJson.toJSONString(); // jsonView 가 리턴됨

	}
	
	@RequestMapping("prdel.do")
	public String replyDeleteMethod(@RequestParam("prid") int prid, @RequestParam("pid") int pid, Model model) {
		if (replyService.deleteReply(prid) > 0) {
			return "redirect:pdetail.do?pid=" + pid;
		} else {
			model.addAttribute("msg", prid + "번 댓글 삭제 실패.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="prupdate.do", method=RequestMethod.POST)
	public String replyUpdateMethod(P_reply reply, @RequestParam("pid") int pid, Model model) {
		if (replyService.updateReply(reply) > 0) {
			
			return "redirect:pdetail.do?pid=" + pid;
		} else {
			model.addAttribute("msg", reply.getPrid() + "번 댓글 삭제 실패.");
			return "common/errorPage";
		}
	}
	
	
}
