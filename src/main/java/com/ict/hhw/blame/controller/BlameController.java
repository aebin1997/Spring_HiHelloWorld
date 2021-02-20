package com.ict.hhw.blame.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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

import com.ict.hhw.blame.model.service.BlameService;
import com.ict.hhw.blame.model.vo.Blame;
import com.ict.hhw.common.SearchAndPage;
import com.ict.hhw.common.SearchDate;

@Controller
public class BlameController {
	@Autowired
	private BlameService blameService;

	/*
	 * // 글쓰기 페이지 이동 요청 처리용
	 * 
	 * @RequestMapping("bwmove.do") public String moveBoardWriteForm() { return
	 * "board/boardWriteForm"; }
	 * 
	 * // 게시글 수정 페이지로 이동 요청 처리용
	 * 
	 * @RequestMapping("bupview.do") public String
	 * boardUpdateForm(@RequestParam("bid") int bid, @RequestParam("page") int
	 * currentPage, Model model) { Board board = boardService.selectBoard(bid); if
	 * (board != null) { model.addAttribute("board", board);
	 * model.addAttribute("page", currentPage); return "board/boardUpdateView"; }
	 * else { model.addAttribute("msg", bid + "번 게시글 수정페이지로 이동 실패"); return
	 * "common/errorPage"; } }
	 * 
	 * // 파일업로드 기능이 있는 공지글 등록 요청 처리용
	 * 
	 * @RequestMapping(value = "binsert.do", method = RequestMethod.POST) public
	 * String boardUpdateMethod(Board board, HttpServletRequest request,
	 * 
	 * @RequestParam(name = "upfile", required = false) MultipartFile mfile, Model
	 * model) { // 업로드된 파일 저장 폴더 지정하기 String savePath =
	 * request.getSession().getServletContext().getRealPath("resources/board_files")
	 * ;
	 * 
	 * // 첨부파일이 있을때 업로드된 파일을 지정 폴더로 옮기기 // 단, 첨부된 파일의 이름을 'yyyyMMddHHmmss.확장자'형식으로
	 * 바꾸어 저장함 if (mfile != null) { String fileName = mfile.getOriginalFilename();
	 * board.setB_original_filename(fileName); // 원래 파일명 vo에 저장
	 * 
	 * // 첨부된 파일의 파일명 바꾸기 SimpleDateFormat sdf = new
	 * SimpleDateFormat("yyyyMMddHHmmss"); String renameFileName = sdf.format(new
	 * java.sql.Date(System.currentTimeMillis())); // 원래 파일의 확장자 분리추출하여 확장자 붙여주기
	 * renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
	 * 
	 * if (fileName != null && fileName.length() > 0) { try { mfile.transferTo(new
	 * File(savePath + "\\" + renameFileName)); } catch (Exception e) {
	 * e.printStackTrace(); model.addAttribute("msg", "전송 파일 저장 실패"); return
	 * "common/errorPage"; } board.setB_rename_filename(renameFileName); } }
	 * 
	 * if (boardService.insertBoard(board) > 0) { return "redirect:blist.do?page=1";
	 * } else { model.addAttribute("msg", "게시글 등록 실패."); return "common/errorPage";
	 * } }
	 * 
	 * // 게시글 삭제 요청 처리용
	 * 
	 * @RequestMapping("bdelete.do") public String
	 * boardDeleteMethod(@RequestParam("bid") int bid, Model model) { if
	 * (boardService.deleteBoard(bid) > 0) { return "redirect:blist.do?page=1"; }
	 * else { model.addAttribute("msg", bid + "번 게시글 삭제 실패"); return
	 * "common/errorPage"; } }
	 * 
	 * // 게시글 수정 요청 처리용
	 * 
	 * @RequestMapping(value = "bupdate.do", method = RequestMethod.POST) public
	 * String boardUpdateMethod(Board board, @RequestParam("page") int currentPage,
	 * 
	 * @RequestParam(name = "delFlag", required = false) String delFlag,
	 * HttpServletRequest request, Model model,
	 * 
	 * @RequestParam(name = "upfile", required = false) MultipartFile mfile) {
	 * 
	 * // 업로드된 파일 저장 폴더 지정하기 String savePath =
	 * request.getSession().getServletContext().getRealPath("resources/board_files")
	 * ;
	 * 
	 * // 원래 첨부파일이 있었는데 삭제를 선택한 경우 if (board.getB_original_filename() != null &&
	 * delFlag != null && delFlag.contentEquals("yes")) { // 저장 폴더에서 파일을 삭제함 new
	 * File(savePath + "\\" + board.getB_rename_filename()).delete();
	 * board.setB_original_filename(null); board.setB_rename_filename(null); }
	 * 
	 * // 새로운 첨부파일이 있다면 if (mfile != null) { String fileName =
	 * mfile.getOriginalFilename(); String renameFileName = null; if (fileName !=
	 * null && fileName.length() > 0) { // 첨부된 파일의 파일명 바꾸기 SimpleDateFormat sdf =
	 * new SimpleDateFormat("yyyyMMddHHmmss"); renameFileName = sdf.format(new
	 * java.sql.Date(System.currentTimeMillis())); renameFileName += "." +
	 * fileName.substring(fileName.lastIndexOf(".") + 1);
	 * 
	 * try { mfile.transferTo(new File(savePath + "\\" + renameFileName)); } catch
	 * (Exception e) { e.printStackTrace(); model.addAttribute("msg",
	 * "전송 파일 저장 실패"); return "common/errorPage"; } } // 첨부된 파일의 파일명 변경에서 폴더에 저장 처리
	 * 
	 * // 원래 첨부파일이 있는데 바뀐 경우 if (board.getB_original_filename() == null) { // 원래 파일을
	 * 폴더에서 삭제 처리 new File(savePath + "\\" + board.getB_rename_filename()).delete();
	 * }
	 * 
	 * board.setB_original_filename(fileName);
	 * board.setB_rename_filename(renameFileName); } // mfile != null
	 * 
	 * if (boardService.updateBoard(board) > 0) { return "redirect:blist.do?page=" +
	 * currentPage; // redirect는 컨트롤러에서 컨트롤러 호출 } else { model.addAttribute("msg",
	 * board.getBid() + "번 게시글 수정 실패."); return "common/errorPage"; } }
	 * 
	 * // ajax 로 인기 게시글 조회 처리용
	 * 
	 * @RequestMapping(value = "btop3.do", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public String selectTop3Method(HttpServletResponse response)
	 * throws UnsupportedEncodingException { // 최신 공지글 3개 조회해 옴 ArrayList<Board>
	 * list = boardService.selectTop3(); // 결과를 받아줌
	 * 
	 * // 전송용 json 객체 준비 JSONObject sendJson = new JSONObject(); // list 옮길 json 배열
	 * 준비 JSONArray jarr = new JSONArray();
	 * 
	 * // list 를 jarr 로 옮기기(복사) for (Board board : list) { // notice 필드값 저장할 json 객체
	 * 생성 JSONObject job = new JSONObject();
	 * 
	 * job.put("bid", board.getBid()); // map이랑 같다 job.put("btitle",
	 * URLEncoder.encode(board.getBtitle(), "utf-8")); // 인코딩 해서 제이슨 객체 안에 담는다
	 * job.put("bcount", board.getBcount()); // 날짜형식의 데이터를 json객체에 담을 때 주의사항, 뷰쪽에서
	 * 꺼낼 때 에러가나서, string형으로 바꿔서 json에 담아줘야한다.
	 * 
	 * // job 를 jarr 에 저장 jarr.add(job); }
	 * 
	 * // 전송용 json 객체에 jarr 담음 sendJson.put("list", jarr);
	 * 
	 * return sendJson.toJSONString(); // jsonView 가 리턴됨
	 * 
	 * }
	 * 
	 * // 게시글 상세보기 요청 처리용
	 * 
	 * @RequestMapping("bdetail.do") public String boardDetailViewMethod(
	 * 
	 * @RequestParam(value="bid", required=false) int bid,
	 * 
	 * @RequestParam(name = "page", required = false, defaultValue = "1") int
	 * currentPage, Model model) { Board board = boardService.selectBoard(bid); int
	 * result = boardService.addReadCount(bid); // 조회수 1증가 처리
	 * 
	 * if (board != null && result > 0) { model.addAttribute("page", currentPage);
	 * model.addAttribute("board", board); return "board/boardDetailView"; } else {
	 * model.addAttribute("msg", bid + "번 게시글 조회 실패"); return "common/erroPage"; }
	 * 
	 * }
	 * 
	 * // 게시글 페이지별 목록 조회 요청 처리용
	 * 
	 * @RequestMapping("blist.do") public String
	 * boardListMethod(@RequestParam("page") int currentPage, Model model) { int
	 * limit = 10; ArrayList<Board> list = boardService.selectList(currentPage,
	 * limit);
	 * 
	 * // 페이지 처리와 관련된 값 처리 // 총 페이지 계산을 위한 총 목록 갯수 조회 int listCount =
	 * boardService.getListCount(); int maxPage = (int) ((double) listCount / limit
	 * + 0.9); // 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정 // 예 : 현재 페이지가 35이면, 시작페이지를 31로
	 * 지정(페이지 갯수를 10개 표시할 경우) int startPage = ((int) (double) currentPage / 10) * 10
	 * + 1; int endPage = startPage + 9;
	 * 
	 * if (maxPage < endPage) endPage = maxPage;
	 * 
	 * if (list.size() > 0) { model.addAttribute("list", list);
	 * model.addAttribute("currentPage", currentPage); model.addAttribute("maxPage",
	 * maxPage); model.addAttribute("startPage", startPage);
	 * model.addAttribute("endPage", endPage);
	 * 
	 * return "board/boardListView"; } else { model.addAttribute("msg", currentPage
	 * + "페이지 출력 목록 조회 실패."); return "common/errorPage"; } }
	 * 
	 * // 게시글 첨부파일 다운로드 요청 처리용
	 * 
	 * @RequestMapping("bfdown.do") public ModelAndView
	 * fileDownMethod(@RequestParam("ofile") String originalFilename,
	 * 
	 * @RequestParam("rfile") String renameFilename, HttpServletRequest request,
	 * Model model) {
	 * 
	 * String savePath =
	 * request.getSession().getServletContext().getRealPath("resources/board_files")
	 * ; File renameFile = new File(savePath + "\\" + renameFilename);
	 * 
	 * model.addAttribute("renameFile", renameFile);
	 * model.addAttribute("originalFilename", originalFilename); return new
	 * ModelAndView("filedown2", "downFile", model); }
	 * 
	 * 
	 * // 검색
	 * 
	 * @RequestMapping(value = "bsearchTitle.do", method = RequestMethod.POST)
	 * public String boardSearchTitleMethod(@RequestParam("keyword") String keyword,
	 * 
	 * @RequestParam("page") int currentPage, Model model) { // 전달된 값을 이용해서 출력할 시작행과
	 * 끝행을 계산함 int limit = 10; int startRow = (currentPage - 1) * limit - 1; int
	 * endRow = startRow + limit - 1;
	 * 
	 * SearchAndPage searches = new SearchAndPage(); searches.setKeyword(keyword);
	 * searches.setStartRow(startRow); searches.setEndRow(endRow);
	 * 
	 * ArrayList<Board> list = boardService.selectSearchTitle(searches);
	 * 
	 * // 페이지 처리와 관련된 값 처리 // 검색에 대한 총 페이지 계산을 위한 검색결과 총 목록 갯수 조회 int listCount =
	 * boardService.getSearchTitleListCount(keyword); int maxPage = (int) ((double)
	 * listCount / limit + 0.9); // 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정 // 예 : 현재 페이지가
	 * 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우) int startPage = ((int) (double)
	 * currentPage / 10) * 10 + 1; int endPage = startPage + 9;
	 * 
	 * if (maxPage < endPage) endPage = maxPage;
	 * 
	 * if (list.size() > 0) { model.addAttribute("list", list);
	 * model.addAttribute("currentPage", currentPage); model.addAttribute("maxPage",
	 * maxPage); model.addAttribute("startPage", startPage);
	 * model.addAttribute("endPage", endPage); model.addAttribute("action",
	 * "bsearchTitle.do"); model.addAttribute("keyword", keyword);
	 * 
	 * return "board/boardListView"; } else { model.addAttribute("msg", keyword +
	 * "로 검색된 게시글 정보가 없습니다."); return "common/errorPage"; } }
	 * 
	 * @RequestMapping(value = "bsearchWriter.do", method = RequestMethod.POST)
	 * public String boardSearchWriterMethod(@RequestParam("keyword") String
	 * keyword,
	 * 
	 * @RequestParam("page") int currentPage, Model model) { // 전달된 값을 이용해서 출력할 시작행과
	 * 끝행을 계산함 int limit = 10; int startRow = (currentPage - 1) * limit - 1; int
	 * endRow = startRow + limit - 1;
	 * 
	 * SearchAndPage searches = new SearchAndPage(); searches.setKeyword(keyword);
	 * searches.setStartRow(startRow); searches.setEndRow(endRow);
	 * 
	 * ArrayList<Board> list = boardService.selectSearchWriter(searches);
	 * 
	 * // 페이지 처리와 관련된 값 처리 // 총 페이지 계산을 위한 총 목록 갯수 조회 int listCount =
	 * boardService.getSearchWriterListCount(keyword); int maxPage = (int) ((double)
	 * listCount / limit + 0.9); // 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정 // 예 : 현재 페이지가
	 * 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우) int startPage = ((int) (double)
	 * currentPage / 10) * 10 + 1; int endPage = startPage + 9;
	 * 
	 * if (maxPage < endPage) endPage = maxPage;
	 * 
	 * if (list.size() > 0) { model.addAttribute("list", list);
	 * model.addAttribute("currentPage", currentPage); model.addAttribute("maxPage",
	 * maxPage); model.addAttribute("startPage", startPage);
	 * model.addAttribute("endPage", endPage); model.addAttribute("action",
	 * "bsearchWriter.do"); model.addAttribute("keyword", keyword);
	 * 
	 * return "board/boardListView"; } else { model.addAttribute("msg", keyword +
	 * "로 검색된 게시글 정보가 없습니다."); return "common/errorPage"; } }
	 * 
	 * @RequestMapping(value = "bsearchDate.do", method = RequestMethod.POST) public
	 * String boardSearchDateMethod(SearchDate dates, @RequestParam("page") int
	 * currentPage, Model model) { // 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함 int limit = 10;
	 * int startRow = (currentPage - 1) * limit - 1; int endRow = startRow + limit -
	 * 1;
	 * 
	 * SearchAndPage searches = new SearchAndPage();
	 * searches.setBegin(dates.getBegin()); searches.setEnd(dates.getEnd());
	 * searches.setStartRow(startRow); searches.setEndRow(endRow);
	 * 
	 * ArrayList<Board> list = boardService.selectSearchDate(searches);
	 * 
	 * // 페이지 처리와 관련된 값 처리 // 총 페이지 계산을 위한 총 목록 갯수 조회 int listCount =
	 * boardService.getSearchDateListCount(dates); int maxPage = (int) ((double)
	 * listCount / limit + 0.9); // 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정 // 예 : 현재 페이지가
	 * 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우) int startPage = ((int) (double)
	 * currentPage / 10) * 10 + 1; int endPage = startPage + 9;
	 * 
	 * if (maxPage < endPage) endPage = maxPage;
	 * 
	 * if (list.size() > 0) { model.addAttribute("list", list);
	 * model.addAttribute("currentPage", currentPage); model.addAttribute("maxPage",
	 * maxPage); model.addAttribute("startPage", startPage);
	 * model.addAttribute("endPage", endPage); model.addAttribute("action",
	 * "bsearchDate.do"); model.addAttribute("begin", dates.getBegin());
	 * model.addAttribute("end", dates.getEnd());
	 * 
	 * return "board/boardListView"; } else { model.addAttribute("msg",
	 * dates.getBegin() + "~" + dates.getEnd() + "날짜로 검색된 게시글 정보가 없습니다."); return
	 * "common/errorPage"; } }
	 */
}
