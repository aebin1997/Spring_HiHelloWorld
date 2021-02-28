package com.ict.hhw.progress.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.hhw.board.model.vo.Board;
import com.ict.hhw.common.SearchDate;
import com.ict.hhw.progress.model.service.PboardService;
import com.ict.hhw.progress.model.vo.P_board;
import com.ict.hhw.progress.model.vo.Psearch;
import com.ict.hhw.progress.model.vo.QaProgress;

@Controller
public class PboardController {

	@Autowired
	private PboardService pboardService;

	// 글쓰기 페이지 이동 요청 처리용
	@RequestMapping("pwmove.do")
	public String movePboardWriteForm(@RequestParam("pro_id") int pro_id, Model model) {
		model.addAttribute("pro_id", pro_id);
		return "progress/pboardWriteForm";
	}

	// 게시글 수정 페이지로 이동 요청 처리용
	@RequestMapping("pupview.do")
	public String boardUpdateForm(@RequestParam("pid") int pid, @RequestParam("pro_id") int pro_id, Model model) {
		P_board Pboard = pboardService.selectPboard(pid);
		if (Pboard != null) {
			model.addAttribute("pboard", Pboard);
			model.addAttribute("pro_id", pro_id);
			return "progress/pboardUpdateView";
		} else {
			model.addAttribute("msg", pid + "번 게시글 수정페이지로 이동 실패");
			return "common/errorPage";
		}
	}

	// 마감(review 페이지로 이동)
	@RequestMapping("review.move")
	public String reviewMove(@RequestParam("pro_id") int pro_id, Model model) {
		QaProgress qplist = pboardService.selectProgress(pro_id);

		model.addAttribute("qplist", qplist);
		return "review/reviewWriteForm";
	}

	// 게시글 페이지별 목록 조회 요청 처리용 (+ 목록 페이지로 이동)
	@RequestMapping(value = "plist.do", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	public String pboardListMethod(@RequestParam("pro_id") int pro_id, Model model) {
		// 오늘 날짜 생성
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		String date = simpleDateFormat.format(new java.util.Date());
		model.addAttribute("today", date);

		ArrayList<P_board> list = pboardService.selectList(pro_id);
		ArrayList<P_board> olist = pboardService.selectOldList(pro_id);
		QaProgress qplist = pboardService.selectProgress(pro_id);

		if (list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("olist", olist);
		}
		model.addAttribute("pro_id", pro_id);
		model.addAttribute("qplist", qplist);

		return "progress/progress";
	}

	// 마감기한 수정
	@ResponseBody
	@RequestMapping(value = "updateDl.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String UpdateDeadline(int pro_id, Model model) {

		// pboardService.processPlus(pro_id);

		return "fail";
	}

	// 진행도 감소
	@ResponseBody
	@RequestMapping(value = "processMinus.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String processMinus(@RequestParam("pro_id") int pro_id, Model model) {
		int val = 0;
		
		QaProgress qplist = pboardService.selectProgress(pro_id);
		
		val = qplist.getPro_process();
		val -= 10;
		
		if (val >= 0) {
			
			if(pboardService.processMinus(pro_id) >0) {
			return  Integer.toString(val);
			}
		}
		
		return "404";
		
	}

	// 진행도 증가
	@ResponseBody
	@RequestMapping(value = "processPlus.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String processPlus(@RequestParam("pro_id") int pro_id, Model model) {
		int val = 0;
		
		QaProgress qplist = pboardService.selectProgress(pro_id);
		
		val = qplist.getPro_process();
		val += 10;
		
		if (val <= 100) {
			if(pboardService.processPlus(pro_id) >0) {
				return  Integer.toString(val);
			}
		}

		return "404";
	}

	// 검색
	@RequestMapping(value = "psearchTitle.do", method = RequestMethod.POST)
	public String pboardSearchTitleMethod(@RequestParam("keyword") String keyword, @RequestParam("pro_id") int pro_id,
			Model model) {
		Psearch searches = new Psearch();
		searches.setKeyword(keyword);
		searches.setP_proid(pro_id);

		ArrayList<P_board> list = pboardService.selectSearchTitle(searches);
		model.addAttribute("pro_id", pro_id);

		if (list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("action", "psearchTitle.do");
			model.addAttribute("keyword", keyword);

			return "progress/progress";
		} else {
			model.addAttribute("msg", keyword + "로 검색된 게시글 정보가 없습니다.");
			return "common/errorPage";
		}
	}

	@RequestMapping(value = "psearchWriter.do", method = RequestMethod.POST)
	public String boardSearchWriterMethod(@RequestParam("keyword") String keyword, @RequestParam("pro_id") int pro_id,
			Model model) {
		Psearch searches = new Psearch();
		searches.setKeyword(keyword);
		searches.setP_proid(pro_id);

		ArrayList<P_board> list = pboardService.selectSearchWriter(searches);
		model.addAttribute("pro_id", pro_id);

		if (list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("action", "psearchWriter.do");
			model.addAttribute("keyword", keyword);

			return "progress/progress";
		} else {
			model.addAttribute("msg", keyword + "로 검색된 게시글 정보가 없습니다.");
			return "common/errorPage";
		}
	}

	@RequestMapping(value = "psearchDate.do", method = RequestMethod.POST)
	public String boardSearchDateMethod(SearchDate dates, @RequestParam("pro_id") int pro_id, Model model) {

		Psearch searches = new Psearch();
		searches.setBegin(dates.getBegin());
		searches.setEnd(dates.getEnd());
		searches.setP_proid(pro_id);

		ArrayList<P_board> list = pboardService.selectSearchDate(searches);

		if (list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("action", "psearchDate.do");
			model.addAttribute("begin", dates.getBegin());
			model.addAttribute("end", dates.getEnd());

			return "progress/progress";
		} else {
			model.addAttribute("msg", dates.getBegin() + "~" + dates.getEnd() + "날짜로 검색된 게시글 정보가 없습니다.");
			return "common/errorPage";
		}
	}

	// 진행 게시판 게시글 등록 처리용
	@RequestMapping(value = "pinsert.do", method = RequestMethod.POST)
	public String boardUpdateMethod(P_board pboard, HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile, @RequestParam("p_proid") int pro_id,
			Model model) {
		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/pboard_files");

		// 첨부파일이 있을때 업로드된 파일을 지정 폴더로 옮기기
		// 단, 첨부된 파일의 이름을 'yyyyMMddHHmmss.확장자'형식으로 바꾸어 저장함
		if (mfile != null) {
			String fileName = mfile.getOriginalFilename();
			pboard.setP_file_name(fileName); // 원래 파일명 vo에 저장

			// 첨부된 파일의 파일명 바꾸기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			// 원래 파일의 확장자 분리추출하여 확장자 붙여주기
			renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);

			if (fileName != null && fileName.length() > 0) {
				try {
					mfile.transferTo(new File(savePath + "\\" + renameFileName));
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", "전송 파일 저장 실패");
					return "common/errorPage";
				}
				pboard.setP_rfile_name(renameFileName);
			}
		}

		if (pboardService.insertPboard(pboard) > 0) {
			model.addAttribute("pro_id", pro_id);
			return "redirect:plist.do";
		} else {
			model.addAttribute("msg", "게시글 등록 실패.");
			return "common/errorPage";
		}
	}

	// 게시글 삭제 요청 처리용
	@RequestMapping("pdelete.do")
	public String pboardDeleteMethod(@RequestParam("pid") int pid, @RequestParam("pro_id") int pro_id, Model model) {
		if (pboardService.deletePboard(pid) > 0) {
			model.addAttribute("pro_id", pro_id);
			return "redirect:plist.do";
		} else {
			model.addAttribute("msg", pid + "번 게시글 삭제 실패");
			return "common/errorPage";
		}
	}

	// 게시글 수정 요청 처리용
	@RequestMapping(value = "pupdate.do", method = RequestMethod.POST)
	public String boardUpdateMethod(P_board pboard, @RequestParam(name = "delFlag", required = false) String delFlag,
			HttpServletRequest request, Model model,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile, @RequestParam("p_proid") int pro_id) {

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
			model.addAttribute("pro_id", pro_id);
			return "redirect:plist.do"; // redirect는 컨트롤러에서 컨트롤러 호출
		} else {
			model.addAttribute("msg", pboard.getPid() + "번 게시글 수정 실패.");
			return "common/errorPage";
		}
	}

	// 게시글 상세보기 요청 처리용
	@RequestMapping("pdetail.do")
	public String boardDetailViewMethod(@RequestParam("pid") int pid, Model model) {
		P_board pboard = pboardService.selectPboard(pid);
		int result = pboardService.addReadCount(pid); // 조회수 1증가 처리

		if (pboard != null && result > 0) {
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
