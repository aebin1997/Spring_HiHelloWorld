package com.ict.hhw.blame.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ict.hhw.blame.model.service.BlameService;
import com.ict.hhw.blame.model.vo.Blame;
import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;

@Controller
public class BlameController {
	@Autowired
	private BlameService BlameService;
	
	
	// 신고글 등록 요청 처리용
	@RequestMapping(value = "b.blame.insert.do", method = RequestMethod.POST)
	public String BlameInsertMethod(Blame Blame, HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile,  Model model) {

		System.out.println(Blame);

		if (BlameService.insertBlame(Blame) > 0) {
			return "redirect:blist.do?page=1";
		} else {
			model.addAttribute("msg", "게시글 등록 실패.");
			return "common/errorPage";
		}
	}

	// 관리자 신고글 상세보기 처리용
	@RequestMapping("b.blame.detail.do")
	public String BlameDetailViewMethod(
			@RequestParam(value="blame_no", required=false) int blame_no,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage, Model model) {
		Blame Blame = BlameService.selectOne(blame_no);
		int result = BlameService.addReadCount(blame_no); // 조회수 1증가 처리

		if (Blame != null && result > 0) {
			model.addAttribute("page", currentPage);
			model.addAttribute("Blame", Blame);
			return "admin/blameDetailView";
		} else {
			model.addAttribute("msg", blame_no + "번 게시글 조회 실패");
			return "common/erroPage";
		}

	}

	
	// 게시글 페이지별 목록 조회 요청 처리용
	@RequestMapping("b.blame.list.do")
	public String blameListMethod(@RequestParam("page") int currentPage, Model model) {
		
		int limit = 10;
		ArrayList<Blame> list = BlameService.selectList(currentPage, limit);
		
		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = BlameService.getListCount();
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

			return "admin/blameListView";
		} else {
			model.addAttribute("msg", currentPage + "페이지 출력 목록 조회 실패.");
			return "common/errorPage";
		}
	}
	
	
	// 검색
	@RequestMapping(value = "b.blame.searchTitle.do", method = RequestMethod.POST)
	public String BlameSearchTitleMethod(@RequestParam("keyword") String keyword,
			@RequestParam("page") int currentPage, Model model) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int limit = 10;
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;

		SearchAndPage searches = new SearchAndPage();
		searches.setKeyword(keyword);
		searches.setStartRow(startRow);
		searches.setEndRow(endRow);

		ArrayList<Blame> list = BlameService.selectSearchTitle(searches);

		// 페이지 처리와 관련된 값 처리
		// 검색에 대한 총 페이지 계산을 위한 검색결과 총 목록 갯수 조회
		int listCount = BlameService.getSearchTitleListCount(keyword);
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
			model.addAttribute("action", "b.blame.searchTitle.do");
			model.addAttribute("keyword", keyword);

			return "admin/blameListView";
		} else {
			model.addAttribute("msg", keyword + "로 검색된 게시글 정보가 없습니다.");
			return "common/errorPage";
		}
	}

	@RequestMapping(value = "b.blame.searchWriter.do", method = RequestMethod.POST)
	public String BlameSearchWriterMethod(@RequestParam("keyword") String keyword,
			@RequestParam("page") int currentPage, Model model) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int limit = 10;
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;

		SearchAndPage searches = new SearchAndPage();
		searches.setKeyword(keyword);
		searches.setStartRow(startRow);
		searches.setEndRow(endRow);

		ArrayList<Blame> list = BlameService.selectSearchWriter(searches);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = BlameService.getSearchWriterListCount(keyword);
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
			model.addAttribute("action", "b.blame.searchWriter.do");
			model.addAttribute("keyword", keyword);
			
			return "admin/blameListView";
		} else {
			model.addAttribute("msg", keyword + "로 검색된 게시글 정보가 없습니다.");
			return "common/errorPage";
		}
	}

	@RequestMapping(value = "b.blame.searchDate.do", method = RequestMethod.POST)
	public String BlameSearchDateMethod(SearchDate dates, @RequestParam("page") int currentPage, Model model) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int limit = 10;
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;

		SearchAndPage searches = new SearchAndPage();
		searches.setBegin(dates.getBegin());
		searches.setEnd(dates.getEnd());
		searches.setStartRow(startRow);
		searches.setEndRow(endRow);

		ArrayList<Blame> list = BlameService.selectSearchDate(searches);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = BlameService.getSearchDateListCount(dates);
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
			model.addAttribute("action", "b.blame.searchDate.do");
			model.addAttribute("begin", dates.getBegin());
			model.addAttribute("end", dates.getEnd());

			return "admin/blameListView";
		} else {
			model.addAttribute("msg", dates.getBegin() + "~" + dates.getEnd() + 
					"날짜로 검색된 게시글 정보가 없습니다.");
			return "common/errorPage";
		}
	}

}