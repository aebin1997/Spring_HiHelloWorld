package com.ict.hhw.qa.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.hhw.qa.model.service.QaService;
import com.ict.hhw.qa.model.vo.Qa;


@Controller
public class QaController {
	@Autowired
	private QaService qaService;
	
	@RequestMapping(value="qatop3.do", method=RequestMethod.POST)
	@ResponseBody
	public String qaTop3Method(HttpServletResponse response) throws UnsupportedEncodingException {
		
		ArrayList<Qa> list = qaService.selectTop3();
		
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		for(Qa qa : list) {
			
			JSONObject job = new JSONObject();
			
			job.put("qa_id", qa.getQa_id());
			job.put("qa_title", URLEncoder.encode(qa.getQa_title(), "utf-8"));
			job.put("qa_readcount", qa.getQa_readcount());
			
			jarr.add(job);
		}
		
		sendJson.put("list", jarr);
		
		return sendJson.toJSONString();
		}
	
	@RequestMapping("qadetail.do")
	public String qaDetailViewMethod(@RequestParam("qa_id") int qa_id,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage, Model model) {
		Qa qa = qaService.selectQa(qa_id);
		int result = qaService.addReadCount(qa_id); // 조회수 1증가 처리

		if (qa != null && result > 0) {
			model.addAttribute("page", currentPage);
			model.addAttribute("qa", qa);
			return "qa/qaDetailView";
		} else {
			model.addAttribute("msg", qa_id + "번 게시글 조회 실패");
			return "common/erroPage";
		}

	}
	
	@RequestMapping("qalist.do")
	public String qaListMethod(@RequestParam("page") int currentPage, Model model) {
		int limit = 10;
		ArrayList<Qa> list = qaService.selectList(currentPage, limit);
		
		int listCount = qaService.getListCount();
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = ((int)((double)currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;
		
		if(maxPage < endPage)
			endPage = maxPage;
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			
			return "qa/qaListview";
		}else {
			model.addAttribute("msg", currentPage + "페이지 출력 목록 조회 실패.");
			return "common/errorPage";
		}
	}
	
	
}


