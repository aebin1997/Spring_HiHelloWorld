package com.ict.hhw.qa.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
}

















