<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="maxPage" value="${ requestScope.maxPage }" />
<c:set var="startPage" value="${ requestScope.startPage }" />
<c:set var="endPage" value="${ requestScope.endPage }" />
<c:set var="currentPage" value="${ requestScope.currentPage }" />

<%-- 글쓰기 페이지 이동 요청 url --%>
<c:url var="pwf" value="/pwmove.do" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Author" content="kimwoolina">
<link rel="stylesheet" href="/hhw/resources/css/default.css">

<script type="text/javascript" src="/hhw/resources/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	// 검색 기능 jquery
	$(function() {
		showDiv();

		$("input[name=item]").on("change", function() { //on으로 이벤트 설정가능 "change"이벤트일때 function()을 실행해라
			showDiv(); // = radio버튼상태가 바뀔때 showDiv를 실행해라
		});
	});
	
	function showDiv() {
		if ($("input[name=item]").eq(0).is(":checked")) { //첫번째가 선택 되어 있느냐, 그러면 이 함수를 실행해라~! 라는 뜻
			$("#titleDiv").css("display", "block");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "none");
		}
		if ($("input[name=item]").eq(1).is(":checked")) { //두번째가 선택 되어 있느냐, 그러면 이 함수를 실행해라~! 라는 뜻
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "block");
			$("#dateDiv").css("display", "none");
		}
		if ($("input[name=item]").eq(2).is(":checked")) { //세번째가 선택 되어 있느냐, 그러면 이 함수를 실행해라~! 라는 뜻
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "block");
		}
	}
	
	function showWriteForm() {
		location.href = "${ pwf }";
	}
</script>
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 70px 0 60px 0;">


		<div id="wrapper" class="wrapper-pad ">
			<!-- 콘텐츠 시작 { -->
			<div id="bo_qa" class="container ">
				<div id="con_lf">
					<article id="sir_qav" class="sir_vbo">
						<header id="qav_head" class="vbo_head">
							<h2>질문제목</h2>
							<div id="qav_info">
								<span class="info_span info_name"><span class="sv_wrap">
										<span class="member">질문자닉네임</span>
								</span></span><span class="info_span info_date"><time
										datetime="2021-02-18T14:58:09+09:00">질문작성시간</time></span><span
									class="info_span info_ip"></span>
							</div>
						</header>
						<!-- 웹 -->
						<div class="vbo_wr">
							<ul class="sir_vbo_com">
								<c:url var="plist" value="/plist.do">
								<c:param name="page" value="1" />
								</c:url>
								<li><a href="${ plist }" class="sir_b01">목록</a></li>
							</ul>
						</div>
						<section id="vbo_con">
							<div class="con_inner">
								<p>질문 내용</p>
								<p>&nbsp;</p>
								<div style="clear: both;"></div>
							</div>
							<div class="qa_tags qa_tags_view"></div>
						</section>
						<!-- 답변이 존재한다면 -->
						<div id="qa_answer" class="qa-answer">
							<a id="qa_answer-anchor"></a>
							<div class="qa-answer-sort">
								<h3>답변</h3>
								<div class="qa-sort">
									<select name="qa_sort_select" id="qa_sort" title="답변 정렬">
										<option value="lastet" data-target="vsst=lastet#qa_answer">최근순</option>
										<option value="old" data-target="vsst=old#qa_answer">오래된순</option>
									</select>
								</div>
							</div>
							<section class="qa-answerList">
								<!-- 답변 아이템 반복, 채택 답변 최상단 -->
								<a id="answer_400521"></a>
								<article class="answer-item answer-item-select">
									<div class="answer-header">
										<div class="answer-header-profile">
											<h4>
												<span class="sv_wrap"> <span class="member">답변자닉네임</span>
												</span>님의 답변
											</h4>
											<div class="answer-date">
												<time>답변 시간</time>
											</div>
										</div>
									</div>
									<div class="answer-main">
										<div class="answer-main-content">
											<!-- 답변 본문 내용 -->
											<p>답변 내용</p>
											<div style="clear: both;"></div>
										</div>
										<div class="answer-main-btn">
											<!-- 댓글 쓰기 및 갯수 -->
											<button title="댓글쓰기" class="answer-main-btn-left"
												data-wr_id="400521" data-w="c" data-check="active"
												onclick="return q2a_votes.comment_write(&#39;vbo_wcmt&#39;, this, &#39;c400521&#39;)">
												<span class="des-left">댓글쓰기</span>
											</button>
										</div>
									</div>
									<section class="answer-replyList">
										<!-- 댓글 입력창 -->
										<section class="answer-reply-write">
											<div id="c400632" class="alist_wcmt wcmt"
												style="display: block;">
												<div id="vbo_wcmt" class="answer-reply-modify">
													<form id="fcomment" name="fcomment" method="post"
														action="//sir.kr/qa/write_comment_update.php"
														onsubmit="return fcomment_submit(this);"
														autocomplete="off">


														<div id="wcmt_content">
															<div class="sir_ta reply-write-text">
																<label for="wr_content" class="sir_sr">댓글내용</label>
																<textarea name="wr_content" id="wr_content" required=""
																	maxlength="5000" cols="30" rows="1" title="댓글 내용 입력"
																	style="height: 70px;"></textarea>
															</div>
														</div>

														<div id="wcmt_btn" class="reply-write-submit">
															<input type="reset" id="wcmt_btn_cancel" value="취소"
																title="댓글 취소"> <input type="submit"
																id="wcmt_btn_submit" value="등록" accesskey="s"
																title="댓글 등록">
														</div>
													</form>
												</div>
											</div>
										</section>
										<!-- 답변 아래 리플 반복 -->
										<a id="c_400535"></a>
										<article class="answer-reply vcmt">
											<div class="answer-reply-header">
												<h5>
													<img src="/hhw/resources/images/icon/ico_reply_arrow.PNG">
													<span class="sv_wrap"> <span class="member">댓글작성자닉네임</span>
													</span>
												</h5>
												<span class="reply-date"><time>댓글작성시간</time></span>
											</div>
											<div class="answer-reply-content ">
												<!-- 답변 댓글 내용 -->
												<p>댓글 내용</p>
											</div>
										</article>
										<!-- // 리플 end -->
									</section>
								</article>
								<!-- // 답변 end -->
								<a id="answer_400516"></a>
								<!-- // 답변 end -->
								<a id="answer_400518"></a>
								<article class="answer-item">
									<div class="answer-header">
										<div class="answer-header-profile">
											<h4>
												<span class="sv_wrap"><span class="member">답변자닉네임</span>
												</span>님의 답변
											</h4>
											<div class="answer-date">
												<time>답변작성시간</time>
											</div>
										</div>
										<div class="answer-header-btn"></div>
									</div>
									<div class="answer-main">
										<div class="answer-main-content">
											<!-- 답변 본문 내용 -->
											<p>답변내용</p>
											<div style="clear: both;"></div>
										</div>
										<div class="answer-main-btn">
											<!-- 댓글 쓰기 및 갯수 -->
											<button title="댓글쓰기" class="answer-main-btn-left"
												data-wr_id="400518" data-w="c" data-check="active"
												onclick="return q2a_votes.comment_write(&#39;vbo_wcmt&#39;, this, &#39;c400518&#39;)">
												<span class="des-left">댓글쓰기</span>
											</button>
										</div>
									</div>
									<section class="answer-replyList">
										<!-- 댓글 입력창 -->
										<section class="answer-reply-write">
											<div id="c400518" class="alist_wcmt wcmt"
												style="display: none;"></div>
										</section>
									</section>
								</article>
								<!-- // 답변 end -->
							</section>
							<!-- 글작성 버튼 -->
							<div id="consubmit2" align="right">
                            	<a href="#" class="consubmit2"><i class="fa fa-pencil" aria-hidden="true"></i>  글 작성하기</a>
                    		</div>
						</div>
						<br>
					<%-- 검색기능 --%>
					<center>
						<div>
							<input type="radio" name="item" value="title" checked> 제목
							&nbsp; &nbsp; &nbsp; <input type="radio" name="item"
								value="writer"> 작성자 &nbsp; &nbsp; &nbsp; <input
								type="radio" name="item" value="date"> 날짜
						</div>
						<div id="titleDiv">
							<form action="psearchTitle.do" method="post">
								<!-- 여기서부터 서블릿 때랑 약간다름. method메소드가 따로따로 가게됨 -->
								<input type="hidden" name="page" value="1">
								<!-- 페이지 요청할때는 ${ page }대신에 그냥 무조건 1페이지로 가게끔 -->
								<label> 검색할 제목을 입력하시오 : <input type="search"
									name="keyword"></label> <input type="submit" value="검색">
							</form>
						</div>
						<div id="writerDiv">
							<form action="psearchWriter.do" method="post">
								<!-- 여기서부터 서블릿 때랑 약간다름. method메소드가 따로따로 가게됨 -->
								<input type="hidden" name="page" value="1"> <label>
									검색할 작성자 아이디를 입력하시오 : <input type="search" name="keyword">
								</label> <input type="submit" value="검색">
							</form>
						</div>
						<div id="dateDiv">
							<form action="psearchDate.do" method="post">
								<!-- 여기서부터 서블릿 때랑 약간다름. method메소드가 따로따로 가게됨 -->
								<input type="hidden" name="page" value="1"> <label>
									검색할 날짜를 입력하시오 : <input type="date" name="begin"> ~ <input
									type="date" name="end">
								</label> <input type="submit" value="검색">
							</form>
						</div>
					</center>
					<%-- 리스트 출력  ({)--%>
					<br>
					<%-- 목록 출력 --%>
					<div style="text-align: right; padding-right: 50px">
						<c:url var="plist" value="/plist.do">
							<c:param name="page" value="1" />
						</c:url>
						<button onclick="javascript:location.href='${ plist }';">
							전체 목록 보기</button>
					</div>
					<br>
					<table align="center" border="1" width="700" cellspacing="0">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>첨부파일</th>
							<th>조회수</th>
						</tr>
						<c:forEach items="${ requestScope.list }" var="p">
							<tr>
								<td align="center">${ p.pid }</td>
								<td><c:url var="pdt" value="/pdetail.do">
										<c:param name="page" value="${ currentPage }" />
										<c:param name="pid" value="${ p.pid }" />
									</c:url> <a href="${ pdt }">${ p.ptitle }</a></td>
								<td align="center">${ p.pwriter }</td>
								<td align="center">${ p.p_date }</td>
								<td align="center">${ p.pcount }</td>
								<td align="center"><c:if
										test="${ !empty p.p_file_name }">
     					 ◎
				      </c:if> <c:if test="${ empty p.p_file_name }">
				      &nbsp;
				      </c:if></td>
							</tr>
						</c:forEach>
					</table>
					<br>
					<%-- 현재 페이지가 1이 아니면 링크설정, 현재 1페이지이면 링크없음 --%>
					<c:if test="${ empty action }">
						<%-- 페이징 처리 
						   [맨처음][이전] 숫자...........  [다음][맨끝]
						--%>
						<div style="text-align: center;">
							<c:if test="${ currentPage <= 1}">
							[맨처음]
							</c:if>
							<c:if test="${ currentPage > 1 }">
								<c:url var="pls" value="/plist.do">
									<c:param name="page" value="1" />
								</c:url>
								<a href="${ pls }">[맨처음]</a>
							</c:if>
							&nbsp;
							<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
							<c:if
								test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
								<c:url var="pls2" value="/plist.do">
									<c:param name="page" value="${ startPage - 10 }" />
								</c:url>
								<a href="${ pls2 }">[이전]</a>
							</c:if>
							<c:if
								test="${ !((currentPage - 10) < startPage and (currentPage - 10) >= 1) }">
							[이전]
							</c:if>
							&nbsp;
							<%-- 가운데 표시할 페이지 그룹 숫자 링크 설정 --%>
							<c:forEach var="p2" begin="${ startPage }" end="${ endPage }"
								step="1">
								<c:if test="${ p2 eq currentPage }">
									<font size="4" color="red">[${ p2 }]</font>
								</c:if>
								<c:if test="${ p2 ne currentPage }">
									<c:url var="pls3" value="/plist.do">
										<c:param name="page" value="${ p2 }" />
									</c:url>
									<a href="${ pls3 }">${ p2 }</a>
								</c:if>
							</c:forEach>
							&nbsp;
							<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
							<c:if
								test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
								<c:url var="pls4" value="/plist.do">
									<c:param name="page" value="${ endPage + 10 }" />
								</c:url>
								<a href="${ pls4 }">[다음그룹]</a>
							</c:if>
							<c:if
								test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
							   [다음그룹]&nbsp;
							</c:if>
							<!-- 맨끝 페이지로 이동 처리 -->
							<c:if test="${ currentPage >= maxPage }">
							   [맨끝]&nbsp;
							</c:if>
							<c:if test="${ currentPage < maxPage }">
								<c:url var="pls5" value="/plist.do">
									<c:param name="page" value="${ maxPage }" />
								</c:url>
								<a href="${ pls5 }">[맨끝]</a>
							</c:if>
						</div>
					</c:if>


					<c:if test="${ !empty action}">
						<%-- 페이징 처리 
						   [맨처음][이전] 숫자...........  [다음][맨끝]
						--%>
						<div style="text-align: center;">
							<c:if test="${ currentPage <= 1}">
							[맨처음]
							</c:if>
							<c:if test="${ currentPage > 1 }">
								<c:url var="psearch1" value="${ action }">
									<c:if test="${ action ne 'psearchDate.do'}">
										<c:param name="page" value="1" />
									</c:if>
									<c:if test="${ action eq 'psearchDate.do'}">
										<c:param name="begin" value="${ begin }" />
										<c:param name="end" value="${ end }" />
									</c:if>
								</c:url>
								<a href="${ psearch1 }">[맨처음]</a>
							</c:if>
							&nbsp;
							<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
							<c:if
								test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
								<c:url var="psearch2" value="/plist.do">
									<c:param name="page" value="${ startPage - 10 }" />
								</c:url>
								<a href="${ psearch2 }">[이전]</a>
							</c:if>
							<c:if
								test="${ !((currentPage - 10) < startPage and (currentPage - 10) >= 1) }">
							[이전]
							</c:if>
							&nbsp;
							<%-- 가운데 표시할 페이지 그룹 숫자 링크 설정 --%>
							<c:forEach var="p" begin="${ startPage }" end="${ endPage }"
								step="1">
								<c:if test="${ p eq currentPage }">
									<font size="4" color="red">[${ p }]</font>
								</c:if>
								<c:if test="${ p ne currentPage }">
									<c:url var="psearch3" value="/plist.do">
										<c:param name="page" value="${ p }" />
									</c:url>
									<a href="${ psearch3 }">${ p }</a>
								</c:if>
							</c:forEach>
							&nbsp;
							<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
							<c:if
								test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
								<c:url var="psearch4" value="/plist.do">
									<c:param name="page" value="${ endPage + 10 }" />
								</c:url>
								<a href="${ psearch4 }">[다음그룹]</a>
							</c:if>
							<c:if
								test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
							   [다음그룹]&nbsp;
							</c:if>
							<!-- 맨끝 페이지로 이동 처리 -->
							<c:if test="${ currentPage >= maxPage }">
							   [맨끝]&nbsp;
							</c:if>
							<c:if test="${ currentPage < maxPage }">
								<c:url var="psearch5" value="/plist.do">
									<c:param name="page" value="${ maxPage }" />
								</c:url>
								<a href="${ psearch5 }">[맨끝]</a>
							</c:if>
						</div>
					</c:if>
					<%-- 리스트 출력(}) --%>
					
					</article>
					
				</div>
				<div id="con_ri">
					<!--/ 커뮤니티 전용 사이드 배너 -->
					<div id="sub_menu">
						<div id="consubmit2"></div>
					</div>
					<div class="sub-menu">
						<div class="section tag-fav">
							<div class="title">관심태그</div>
							<div id="board_favorite_tags" class="list board_fav_tags empty">
								<div class="fav-empty">
									관심태그를 등록해보세요.<br> 관심있는 주제만 모아서 보실 수 있습니다.
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- } 콘텐츠 끝 -->


		<!-- 푸터 -->
		</section>
		<jsp:include page="../common/footer.jsp" />

</body>
</html>