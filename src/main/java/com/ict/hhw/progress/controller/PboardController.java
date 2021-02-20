package com.ict.hhw.progress.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ict.hhw.progress.model.service.PboardService;
import com.ict.hhw.progress.model.vo.P_board;

@Controller
public class PboardController {
	
	@Autowired
	private PboardService pboardService;
	
	// 글쓰기 페이지 이동 요청 처리용
	@RequestMapping("pwmove.do")
	public String movePboardWriteForm() {
		return "progress/pboardWriteForm";
	}
	
	
	// 게시글 페이지별 목록 조회 요청 처리용 (+ 목록 페이지로 이동)
		@RequestMapping("plist.do")
		public String pboardListMethod(@RequestParam("page") int currentPage, Model model) {
			int limit = 10;
			ArrayList<P_board> list = pboardService.selectList(currentPage, limit);

			// 페이지 처리와 관련된 값 처리
			// 총 페이지 계산을 위한 총 목록 갯수 조회
			int listCount = pboardService.getListCount();
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

				return "progress/progress";
			} else {
				model.addAttribute("msg", currentPage + "페이지 출력 목록 조회 실패.");
				return "common/errorPage";
			}
		}
}
