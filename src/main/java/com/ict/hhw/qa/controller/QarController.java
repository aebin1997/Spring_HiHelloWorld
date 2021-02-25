package com.ict.hhw.qa.controller;

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

import com.ict.hhw.qa.model.service.QarService;
import com.ict.hhw.qa.model.vo.Qar;

@Controller
public class QarController {
	@Autowired
	private QarService qarService;
	
	@RequestMapping(value="qarinsert.do", method=RequestMethod.POST)
	public String qarInsertMethod(Qar qar, Model model) {
		if(qarService.insertQar(qar) > 0) {
			return "redirect:qadetail.do?qa_id=" + qar.getRef_qa_id();
		}else {
			model.addAttribute("msg", qar.getRef_qa_id() + "번글 댓글달기 실패");
			return "common/errorPage";
		}
	}
	
	//ajax로 원글에 대한 댓글 조회 요청 처리용
	@RequestMapping(value="qarlist.do", method=RequestMethod.POST)
	@ResponseBody
	public String qarListMethod(@RequestParam("ref_qa_id") int ref_qa_id) throws UnsupportedEncodingException {
		//원글에 대한 댓글 조회 요청
		ArrayList<Qar> list = qarService.selectList(ref_qa_id);
		
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		for(Qar qar : list) {
			System.out.println("확인"+ qar);
			JSONObject job = new JSONObject();
			
			job.put("qar_id", qar.getQar_id());
			job.put("qar_writer", qar.getQar_writer());
			job.put("qar_content", URLEncoder.encode(qar.getQar_content(), "utf-8"));
			job.put("qar_create_date",qar.getQar_create_date().toString());
			job.put("ref_qa_id", qar.getRef_qa_id());
			
			jarr.add(job);
		}
		
		sendJson.put("list", jarr);
		
		return sendJson.toJSONString();
		}

@RequestMapping("qardel.do")
	public  String qarDeleteMethod(@RequestParam("qar_id") int qar_id,
			@RequestParam("qa_id") int qa_id, Model model) {
		if(qarService.deleteQar(qar_id) > 0) {
			return "redirect:qadetail.do?qa_id=" + qa_id;
		}else {
			model.addAttribute("msg", qar_id + "번글 삭제 실패");
			return "common/errorPage";
		}
	}
	
@RequestMapping(value="qarupdate.do", method=RequestMethod.POST)
public String qarUpdateMethod(Qar qar,
	    @RequestParam("qa_id") int qa_id	,Model model) {
	if(qarService.updateQar(qar) > 0) {
		return "redirect:qadetail.do?qa_id=" + qa_id;
	}else {
		model.addAttribute("msg", qar.getQar_id() + "번글 댓글달기 실패");
		return "common/errorPage";
	}
}


}










