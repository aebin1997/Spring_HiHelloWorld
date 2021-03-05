package com.ict.hhw.qa.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;
import com.ict.hhw.qa.model.service.QaService;
import com.ict.hhw.qa.model.vo.Qa;


@Controller
public class QaController {
	@Autowired
	private QaService qaService;
	
	//글쓰기 페이지 이동 처리용
	@RequestMapping("qawmove.do")
	public String moveQaWriteForm() {
		return "qa/qaWriteForm";
	}
	
	@RequestMapping("qaupview.do")
	public String moveQaUpdateView(@RequestParam("qaid") int qa_id,
	@RequestParam("page") int currentPage, Model model){
		Qa qa = qaService.selectQa(qa_id);
		
		if(qa != null) {
			model.addAttribute("qa", qa);
			model.addAttribute("page", currentPage);
			return "qa/qaUpdateView";
		}else {
			model.addAttribute("msg", qa_id + "번글 수정페이지로 이동실패.");
			return "common/errorPage";
		}
	}
	
	
	
	// 파일업로드 기능이 있는 의뢰 등록 요청 처리용
	@RequestMapping(value = "qainsert.do", method = RequestMethod.POST)
	public String qaInsertMethod(Qa qa,
			HttpServletRequest request, Model model,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext()
				.getRealPath("resources/qa_files");

		// 첨부파일이 있을때 업로드된 파일을 지정 폴더로 옮기기
		// 단 첨부된 파일의 이름이 yyyyMMddHHmmss.확장자 형식으로 바뀌어 저장함
		if (mfile != null) {
			String fileName = mfile.getOriginalFilename();
			if (fileName != null && fileName.length() > 0) {
				qa.setQa_origin_file_name(fileName); //원래 파일명 vo 에 저장
				
				//첨부된 파일의 파일명 바꾸기
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
				
				try {
					mfile.transferTo(new File(savePath + "\\" + renameFileName));
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", "전송 파일 저장 실패");
					return "common/errorPage";
				}
				qa.setQa_rename_file_name(renameFileName);
 
			}
		}

		if (qaService.insertQa(qa) > 0) {
			return "redirect:qalist.do?page=1";
		} else {
			model.addAttribute("msg", "의뢰 등록 실패.");
			return "common/errorPage";
		}
	}
	
	//의뢰 삭제 요청 처리용
	@RequestMapping("qadelete.do")
	public String qaDeleteMethod(@RequestParam("qadelete") int qa_id, Model model){
		if(qaService.deleteQa(qa_id) > 0) {
			return "redirect:qalist.do?page=1";
		}else {
			model.addAttribute("msg" ,qa_id + "번 의뢰 삭제 실패.");
			return "common/errorPage";
		}
	}
	
	//게시글 수정 요청 처리용
	@RequestMapping(value="qaupdate.do", method=RequestMethod.POST)
	public String qaUpdateMethod(Qa qa,
			@RequestParam("page") int currentPage ,
			@RequestParam(name="delFlag", required=false) String delFlag,
			HttpServletRequest request, Model model,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		
		//첨부된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext()
				.getRealPath("resources/qa_files");
		
		//원래 첨부파일 있는데, 삭제를 선택한 경우
		if(qa.getQa_origin_file_name() != null
				&& delFlag != null && delFlag.contentEquals("yes")) {
			//저장 폴더에서 파일 삭제함
			new File(savePath + "\\" + qa.getQa_rename_file_name()).delete();
			qa.setQa_origin_file_name(null);
			qa.setQa_rename_file_name(null);
		}
		
		//새로운 첨부파일이 있다면
		if(mfile != null) {
			String fileName = mfile.getOriginalFilename();
			String renameFileName = null;
			if (fileName != null && fileName.length() > 0) {
				// 첨부된 파일의 파일명 바꾸기
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);

				try {
					mfile.transferTo(new File(savePath + "\\" + renameFileName));
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", "전송 파일 저장 실패");
					return "common/errorPage";
				}
			} // 첨부된 파일의 파일명 변경에서 폴더에 저장 처리
			
			// 원래 첨부파일이 있는데 바뀐 경우
			if (qa.getQa_origin_file_name() == null) {
				// 원래 파일을 폴더에서 삭제 처리
				new File(savePath + "\\" + qa.getQa_rename_file_name()).delete();
			}

			qa.setQa_origin_file_name(fileName);
			qa.setQa_rename_file_name(renameFileName);
		} // mfile != null
		
		if(qaService.updateQa(qa) > 0) {
			return "redirect:qalist.do?page=" + currentPage;
		}else {
			model.addAttribute("msg", qa.getQa_id() + "번 의뢰 수정 실패.");
			return "common/errorPage";
		}
	}
	
	//top3 조회
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
			job.put("qa_writer", qa.getQa_writer());
			job.put("qa_create_date", qa.getQa_create_date().toString());
			
			jarr.add(job);
		}
		
		sendJson.put("list", jarr);
		
		return sendJson.toJSONString();
		}
	
	@RequestMapping("qadetail.do")
	public String qaDetailViewMethod(
			@RequestParam(value = "qa_id", required =false) int qa_id,
			@RequestParam( name = "page", required = false, defaultValue = "1") int currentPage, Model model) {
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
		int maxPage = (int)((double)listCount / limit);
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
	
	//게시글 첨부파일 다운로드 요청 처리용
	@RequestMapping("qafdown.do")
	public ModelAndView fileDownMethod(
			@RequestParam("ofile") String originalFilename,
			@RequestParam("rfile") String renameFilename,
			HttpServletRequest request) {
		String savePath = request.getSession().getServletContext()
				.getRealPath("resources/qa_files");
		File renameFile = new File(savePath + "\\" + renameFilename);
		
		System.out.println("qafdown.do");
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("renameFile" , renameFile);
		model.put("originalFilename", originalFilename); 
		return new ModelAndView("filedownqa", "downFile", model);
	}
	
	@RequestMapping(value = "qaSearchTitle.do", method = RequestMethod.POST)
	public String qaSearchTitleMethod(@RequestParam("keyword") String keyword,
			@RequestParam("page") int currentPage, Model model) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int limit = 10;
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;

		SearchAndPage searches = new SearchAndPage();
		searches.setKeyword(keyword);
		searches.setStartRow(startRow);
		searches.setEndRow(endRow);

		ArrayList<Qa> list = qaService.selectSearchTitle(searches);

		// 페이지 처리와 관련된 값 처리
		// 검색에 대한 총 페이지 계산을 위한 검색결과 총 목록 갯수 조회
		int listCount = qaService.getSearchTitleListCount(keyword);
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) (double) currentPage / 10) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;
		
		if (list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("action", "qaSearchTitle.do");
			model.addAttribute("keyword", keyword);

			return "qa/qaListview";
		} else {
			model.addAttribute("msg", keyword + "로 검색된 게시글 정보가 없습니다.");
			return "common/errorPage";
		}
	}

	@RequestMapping(value = "qaSearchWriter.do", method = RequestMethod.POST)
	public String qaSearchWriterMethod(@RequestParam("keyword") String keyword,
			@RequestParam("page") int currentPage, Model model) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int limit = 10;
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;

		SearchAndPage searches = new SearchAndPage();
		searches.setKeyword(keyword);
		searches.setStartRow(startRow);
		searches.setEndRow(endRow);

		ArrayList<Qa> list = qaService.selectSearchWriter(searches);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = qaService.getSearchWriterListCount(keyword);
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) (double) currentPage / 10) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		if (list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("action", "qaSearchWriter.do");
			model.addAttribute("keyword", keyword);
			
			return "qa/qaListview";
		} else {
			model.addAttribute("msg", keyword + "로 검색된 게시글 정보가 없습니다.");
			return "common/errorPage";
		}
	}

	@RequestMapping(value = "qaSearchDate.do", method = RequestMethod.POST)
	public String qaSearchDateMethod(SearchDate dates, @RequestParam("page") int currentPage, Model model) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int limit = 10;
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;

		SearchAndPage searches = new SearchAndPage();
		searches.setBegin(dates.getBegin());
		searches.setEnd(dates.getEnd());
		searches.setStartRow(startRow);
		searches.setEndRow(endRow);

		ArrayList<Qa> list = qaService.selectSearchDate(searches);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = qaService.getSearchDateListCount(dates);
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) (double) currentPage / 10) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		if (list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("action", "qaSearchDate.do");
			model.addAttribute("begin", dates.getBegin());
			model.addAttribute("end", dates.getEnd());

			return "qa/qaListview";
		} else {
			model.addAttribute("msg", dates.getBegin() + "~" + dates.getEnd() + 
					"날짜로 검색된 게시글 정보가 없습니다.");
			return "common/errorPage";
		}
	}
	
}


