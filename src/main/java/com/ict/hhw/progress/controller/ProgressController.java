package com.ict.hhw.progress.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ict.hhw.progress.model.vo.P_board;
import com.ict.spring.board.model.vo.Board;

@Controller
public class ProgressController {

	// 진행페이지로 이동 (임시용)
	@RequestMapping("progress.do")
	public String progress() {
		return "progress/progress";
	}

	// 목록 페이지로 이동
	@RequestMapping("plist.do")
	public String progressView() {
		return "progress/proListView";
	}

	// 게시글 페이지별 목록 조회 요청 처리용
	@RequestMapping("plist2.do")
	public String boardListMethod(@RequestParam("page") int currentPage, Model model) {
		int limit = 10;
		ArrayList<P_board> list = PboardService.selectList(currentPage, limit);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = PboardService.getListCount();
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

			return "progress/proListView";
		} else {
			model.addAttribute("msg", currentPage + "페이지 출력 목록 조회 실패.");
			return "common/errorPage";
		}
	}

}
