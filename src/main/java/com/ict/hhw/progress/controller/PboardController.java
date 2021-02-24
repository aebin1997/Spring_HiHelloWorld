package com.ict.hhw.progress.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;
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

	// 게시글 수정 페이지로 이동 요청 처리용
	@RequestMapping("pupview.do")
	public String boardUpdateForm(@RequestParam("pid") int pid, @RequestParam("page") int currentPage, Model model) {
		P_board Pboard = pboardService.selectPboard(pid);
		if (Pboard != null) {
			model.addAttribute("pboard", Pboard);
			model.addAttribute("page", currentPage);
			return "progress/pboardUpdateView";
		} else {
			model.addAttribute("msg", pid + "번 게시글 수정페이지로 이동 실패");
			return "common/errorPage";
		}
	}

	// 게시글 페이지별 목록 조회 요청 처리용 (+ 목록 페이지로 이동)
	@RequestMapping(value="plist.do", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	public String pboardListMethod(@RequestParam("pro_id") int pro_id, Model model) {
		ArrayList<P_board> list = pboardService.selectList(pro_id);
		
		if (list.size() > 0) {
			model.addAttribute("list", list);
		}
		model.addAttribute("pro_id", pro_id);
		
		return "progress/progress";
	}

	// 검색
	@RequestMapping(value = "psearchTitle.do", method = RequestMethod.POST)
	public String pboardSearchTitleMethod(@RequestParam("keyword") String keyword, @RequestParam("page") int currentPage,
			Model model) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int limit = 10;
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;

		SearchAndPage searches = new SearchAndPage();
		searches.setKeyword(keyword);
		searches.setStartRow(startRow);
		searches.setEndRow(endRow);

		ArrayList<P_board> list = pboardService.selectSearchTitle(searches);

		// 페이지 처리와 관련된 값 처리
		// 검색에 대한 총 페이지 계산을 위한 검색결과 총 목록 갯수 조회
		int listCount = pboardService.getSearchTitleListCount(keyword);
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
			model.addAttribute("action", "psearchTitle.do");
			model.addAttribute("keyword", keyword);

			return "progress/progress";
		} else {
			model.addAttribute("msg", keyword + "로 검색된 게시글 정보가 없습니다.");
			return "common/errorPage";
		}
	}

	@RequestMapping(value = "psearchWriter.do", method = RequestMethod.POST)
	public String boardSearchWriterMethod(@RequestParam("keyword") String keyword,
			@RequestParam("page") int currentPage, Model model) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int limit = 10;
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;

		SearchAndPage searches = new SearchAndPage();
		searches.setKeyword(keyword);
		searches.setStartRow(startRow);
		searches.setEndRow(endRow);

		ArrayList<P_board> list = pboardService.selectSearchWriter(searches);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = pboardService.getSearchWriterListCount(keyword);
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
			model.addAttribute("action", "psearchWriter.do");
			model.addAttribute("keyword", keyword);

			return "progress/progress";
		} else {
			model.addAttribute("msg", keyword + "로 검색된 게시글 정보가 없습니다.");
			return "common/errorPage";
		}
	}

	@RequestMapping(value = "psearchDate.do", method = RequestMethod.POST)
	public String boardSearchDateMethod(SearchDate dates, @RequestParam("page") int currentPage, Model model) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int limit = 10;
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;

		SearchAndPage searches = new SearchAndPage();
		searches.setBegin(dates.getBegin());
		searches.setEnd(dates.getEnd());
		searches.setStartRow(startRow);
		searches.setEndRow(endRow);

		ArrayList<P_board> list = pboardService.selectSearchDate(searches);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = pboardService.getSearchDateListCount(dates);
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
			model.addAttribute("action", "psearchDate.do");
			model.addAttribute("begin", dates.getBegin());
			model.addAttribute("end", dates.getEnd());

			return "progress/progress";
		} else {
			model.addAttribute("msg", dates.getBegin() + "~" + dates.getEnd() + "날짜로 검색된 게시글 정보가 없습니다.");
			return "common/errorPage";
		}
	}

	// 게시글 삭제 요청 처리용
	@RequestMapping("pdelete.do")
	public String pboardDeleteMethod(@RequestParam("pid") int pid, Model model) {
		if (pboardService.deletePboard(pid) > 0) {
			return "redirect:plist.do?page=1";
		} else {
			model.addAttribute("msg", pid + "번 게시글 삭제 실패");
			return "common/errorPage";
		}
	}

	// 게시글 수정 요청 처리용
	@RequestMapping(value = "pupdate.do", method = RequestMethod.POST)
	public String boardUpdateMethod(P_board pboard, @RequestParam("page") int currentPage,
			@RequestParam(name = "delFlag", required = false) String delFlag, HttpServletRequest request, Model model,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {

		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/pboard_files");

		// 원래 첨부파일이 있었는데 삭제를 선택한 경우
		if (pboard.getP_file_name() != null && delFlag != null && delFlag.contentEquals("yes")) {
			// 저장 폴더에서 파일을 삭제함
			new File(savePath + "\\" + pboard.getP_rfile_name()).delete();
			pboard.setP_file_name(null);
			pboard.setP_rfile_name(null);
		}

		// 새로운 첨부파일이 있다면
		if (mfile != null) {
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
			if (pboard.getP_file_name() == null) {
				// 원래 파일을 폴더에서 삭제 처리
				new File(savePath + "\\" + pboard.getP_rfile_name()).delete();
			}

			pboard.setP_file_name(fileName);
			pboard.setP_rfile_name(renameFileName);
		} // mfile != null

		if (pboardService.updatePboard(pboard) > 0) {
			return "redirect:plist.do?page=" + currentPage; // redirect는 컨트롤러에서 컨트롤러 호출
		} else {
			model.addAttribute("msg", pboard.getPid() + "번 게시글 수정 실패.");
			return "common/errorPage";
		}
	}

	// 게시글 상세보기 요청 처리용
	@RequestMapping("pdetail.do")
	public String boardDetailViewMethod(@RequestParam("pid") int pid,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage, Model model) {
		P_board pboard = pboardService.selectPboard(pid);
		int result = pboardService.addReadCount(pid); // 조회수 1증가 처리

		if (pboard != null && result > 0) {
			model.addAttribute("page", currentPage);
			model.addAttribute("pboard", pboard);
			return "progress/pboardDetailView";
		} else {
			model.addAttribute("msg", pid + "번 게시글 조회 실패");
			return "common/erroPage";
		}

	}

	// 게시글 첨부파일 다운로드 요청 처리용
	@RequestMapping("pfdown.do")
	public ModelAndView fileDownMethod(@RequestParam("ofile") String originalFilename,
			@RequestParam("rfile") String renameFilename, HttpServletRequest request, Model model) {

		String savePath = request.getSession().getServletContext().getRealPath("resources/pboard_files");
		File renameFile = new File(savePath + "\\" + renameFilename);

		model.addAttribute("renameFile", renameFile);
		model.addAttribute("originalFilename", originalFilename);
		return new ModelAndView("filedown2", "downFile", model);
	}

}
