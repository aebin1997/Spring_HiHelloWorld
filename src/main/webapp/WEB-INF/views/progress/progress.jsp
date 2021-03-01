<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- 이동 요청 url --%>
<c:url var="pwf" value="/pwmove.do">
	<c:param name="pro_id" value="${ pro_id }" />
</c:url>

<c:url var="review" value="/review.move">
	<c:param name="pro_id" value="${ pro_id }" />
</c:url>



<!DOCTYPE html>
<html lang="ko">
<head>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Author" content="kimwoolina">
<link rel="stylesheet" href="/hhw/resources/css/default.css">
<script type="text/javascript"
	src="/hhw/resources/js/jquery-3.5.1.min.js"></script>
	
<script type="text/javascript">
	$(function() {
		
		dlMsg(); //마감기한 변경 알림
		
		$("#oldlist").css("display", "none");
		$("#qa_sort").on("change", function(){
	    	var option = $("#qa_sort option:selected").val();
	    	console.log(option);
	    	
	    	if(option == "latest") {
	    		$("#latelist").css("display", "block");
	    		$("#oldlist").css("display", "none");
	        } else if(option == "old"){
	        	$("#latelist").css("display", "none");
	        	$("#oldlist").css("display", "block");
	        }
	    })
		
		hideReplyForm(); //뷰 페이지 처음 실행시에는 댓글달기 폼이 안 보이게 함
		
		// 검색
		showDiv();
		
		
	    // 검색
		$("input[name=item]").on("change", function() { //on으로 이벤트 설정가능 "change"이벤트일때 function()을 실행해라
			showDiv(); // = radio버튼상태가 바뀔때 showDiv를 실행해라
		});
		
		//진행도 감소(start)
		$("#minus").click(function() {
			$.ajax({
				url : "processMinus.do",
				data : {
					pro_id : $("#pro_id").val()
				},
				type : "post",
				success : function(data) {
					if (data == "404") {
						alert("최저값은 0% 입니다.");
					} else {
						var val = parseInt(data);
						alert("진행도를 성공적으로 변경하였습니다.");
						$("#process").html("<progress id='process' value=" + val + " max='100' "
							+ "style='width: 730px;'></progress>");
					}

				},
				error : function(jqxhr, textStatus, errorThrown) {
					console.log("ajax 처리 실패");

					console.log(jqxhr);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		});
		//진행도 감소(end)
		
		//진행도 증가(start)
		$("#plus").click(function() {
			$.ajax({
				url : "processPlus.do",
				data : {
					pro_id : $("#pro_id").val()
				},
				type : "post",
				success : function(data) {
					if (data == "404") {
						alert("최대값은 100% 입니다.");
					} else {
						var val = parseInt(data);
						alert("진행도를 성공적으로 변경하였습니다.");
						$("#process").html("<progress id='process' value=" + val + " max='100' "
							+ "style='width: 730px;'></progress>");
					}

				},
				error : function(jqxhr, textStatus, errorThrown) {
					console.log("ajax 처리 실패");

					console.log(jqxhr);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		});
		//진행도 증가(end)
		
		// jquery ajax 로 해당 게시글에 대한 댓글 조회 요청
		var pid = ${ p.pid };
		$.ajax({
			url : "${ pageContext.request.contextPath }/prlist.do",
			type : "post",
			data : {
				ref_pid : pid
			}, //전송값에 변수 사용
			dataType : "json",
			success : function(data) {
				console.log("success : " + data);

				//object ==> string
				var jsonStr = JSON.stringify(data);
				//string ==> json 
				var json = JSON.parse(jsonStr);

				var values = "";
				for ( var i in json.list) {
					//본인이 등록한 댓글일 때는 수정/삭제 가능하게 함
					if (loginUser == json.list[i].prwriter) {
						values += "<tr><td>"
								+ json.list[i].prwriter
								+ "</td><td>"
								+ json.list[i].pr_date
								+ "</td></tr><tr><td colspan='2'>"
								+ "<form action='prupdate.do' method='post'>"
								+ "<input type='hidden' name='prid' value='" +  json.list[i].prid  + "'>"
								+ "<input type='hidden' name='pid' value='${pboard.pid}'>"
								+ "<textarea name='prcontent' rows='5' cols='50'>"
								+ decodeURIComponent(
										json.list[i].prcontent)
										.replace(/\+/gi, " ")
								+ "</textarea><br><input type='submit' value='수정'></form>"
								+ "<button onclick='replyDelete("
								+ json.list[i].prid
								+ ");'>삭제</button></td></tr>";
					} else { //본인 댓글이 아닐 때
						values += "<tr><td>"
								+ json.list[i].prwriter
								+ "</td><td>"
								+ json.list[i].pr_date
								+ "</td></tr><tr><td colspan='2'>"
								+ decodeURIComponent(
										json.list[i].prcontent)
										.replace(/\+/gi, " ")
								+ "</td></tr>";
					}
				} //for in

				$("#prlistTbl").html($("#prlistTbl").html() + values);
			},
			error : function(jqXHR, textstatus, errorthrown) {
				console.log("error : " + jqXHR + ", " + textstatus
						+ ", " + errorthrown);
			}
		}); //댓글
		
	}); // jquery document ready
	
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
	
	function dlMsg(){
		var message = "${ msg }";
		console.log(message);
		if(message == "ok"){
			alert("마감기한을 성공적으로 변경하였습니다.");
		};
	}
	
	function showReplyForm() {
		$("#replyWriteForm").css("display", "block");
	}
	
	function hideReplyForm() {
		$("#replyWriteForm").css("display", "none");
	}
	
</script>

<!-- 테이블 -->
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/myPage/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/profile.css" />


<style type="text/css">
	#messageWindow {
		background: LightSkyBlue;
		height: 300px;
		overflow: auto;
	}
	
	.chat_content {
		background: rgb(255, 255, 102);
		padding: 10px;
		border-radius: 10px;
		display: inline-block;
		position: relative;
		margin: 10px;
		float: right;
		clear: both;
	}
	
	.chat_content:after {
		content: '';
		positon: absolute;
		right: 0;
		top: 50%;
		width: 0;
		height: 0;
		border: 20px solid transparent;
		border-left-color: rgb(255, 255, 102);
		border-right: 0;
		border-top: 0;
		margin-top: -3.5px;
		margin-right: -10px;
	}
	
	.other-side {
		background: white;
		float: left;
		clear: both;
	}
	
	.other-side:after {
		content: '';
		positon: absolute;
		right: 0;
		top: 50%;
		width: 0;
		height: 0;
		border: 20px solid transparent;
		border-right-color: white;
		border-left: 0;
		border-top: 0;
		margin-top: -3.5px;
		margin-right: -10px;
	}
</style>
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 70px 0 60px 0;">

		<div id="wrapper" class="wrapper-pad ">
			<!-- 콘텐츠 시작 { -->
			<div id="bo_qa" class="container ">
				<div id="con_lf">
					<%-- 마감일 --%>
					<c:if
						test="${ qplist.pro_writer ne sessionScope.loginUser.nickname }">
						<h1 class="pg_tit">마감일 : ${qplist.pro_deadline}</h1>
					</c:if>
					<c:if
						test="${ qplist.pro_writer eq sessionScope.loginUser.nickname }">
						<h1 class="pg_tit">마감일</h1>
						<form action="updateDl.do" method="get">
							<input type="hidden" id="pro_id" name="pro_id"
								value="${ pro_id }"> <input type="date"
								name="pro_deadline" value="${qplist.pro_deadline }"
								min="${ today }" data-date-format="YYYY/MM/DD"
								pattern="YYYY/MM/DD" required> &nbsp;<input
								type="submit" value="수정">
						</form>
						<br>
					</c:if>

					<%-- 진행도 --%>
					<c:if
						test="${ qplist.pro_writer ne sessionScope.loginUser.nickname }">
						<div id="progressBar">
							<progress id="process" value="${ qplist.pro_process }" max="100"
								style="width: 730px;"></progress>
						</div>
					</c:if>
					<c:if
						test="${ qplist.pro_writer eq sessionScope.loginUser.nickname }">
						<button id="minus">
							<img src="/hhw/resources/images/icon/ico_minus.png" width="25px">
						</button>
						<progress value="${ qplist.pro_process }" max="100"
							style="width: 670px;"></progress>
						<button id="plus">
							<img src="/hhw/resources/images/icon/ico_plus.png" width="25px">
						</button>
						<br>
						<br>
					</c:if>

					<div class="vbo_wr">
						<c:if
							test="${ qplist.pro_writer eq sessionScope.loginUser.nickname }">
							<ul class="sir_vbo_com">
								<c:if test="${ qplist.pro_status eq 'Y ' }">
									<li><a href="${ review }"
										onClick="if(confirm('의뢰를 정말로 마감 하시겠습니까?')==true){return true;}else{return false;}"
										class="sir_b01">마감</a></li>
								</c:if>
								<c:if test="${ qplist.pro_status ne 'Y ' }">
									<li><a href="#" onClick="alert('이미 마감된 의뢰입니다.')"
										class="sir_b01">마감</a></li>
								</c:if>
							</ul>
						</c:if>
						<ul class="sir_vbo_com">
							<li><a href="javascript:history.go(-1);" class="sir_b01">목록</a></li>
						</ul>
					</div>

					<br>

					<c:if test="${ qplist ne null }">
						<h1 class="pg_tit">질문</h1>
					</c:if>
					<article id="sir_qav" class="sir_vbo">
						<c:if test="${ qplist ne null }">
							<header id="qav_head" class="vbo_head">
								<h2>${ qplist.qa_title }</h2>
								<div id="qav_info">
									<span class="info_span info_name"><span class="sv_wrap">
											<span class="member">${ qplist.pro_writer }</span>
									</span></span><span class="info_span info_date"><time
											datetime="2021-02-18T14:58:09+09:00">${ qplist.qa_create_date }</time></span><span
										class="info_span info_ip"></span>
								</div>
							</header>
							<section id="vbo_con">
								<div class="con_inner">
									<p>${ qplist.qa_content }</p>
									<p>&nbsp;</p>
									<div style="clear: both;"></div>
								</div>
								<div class="qa_tags qa_tags_view"></div>
							</section>
							<br>
						</c:if>


						<div id="qa_answer" class="qa-answer">
							<a id="qa_answer-anchor"></a>
							<div class="qa-answer-sort">
								<h3>답변</h3>
								<div class="qa-sort">
									<select name="qa_sort_select" id="qa_sort" title="답변 정렬">
										<option value="latest">최근순</option>
										<option value="old">오래된순</option>
									</select>
								</div>
							</div>

							<!-- 최신순으로 정렬 -->
							<!-- 답변이 존재한다면 -->
							<div id="latelist">
								<c:if test="${ requestScope.list ne null }">

									<!-- listing -->
									<c:forEach items="${ requestScope.list }" var="p">
										<section class="qa-answerList">
											<!-- 답변 아이템 반복  -->
											<c:if test="${ p.pwriter eq sessionScope.loginUser.nickname }">
												<a id="answer_400521"></a>
												<article class="answer-item answer-item-select">
													<div class="answer-header">
														<div class="answer-header-profile">
															<h4>
																<span class="member">${ p.ptitle }</span>
															</h4>
															<div class="answer-date">
																<time>${ p.p_date }</time>
															</div>
														</div>
													</div>
													<div class="answer-main">
														<div class="answer-main-content">
															<!-- 답변 본문 내용 -->
															<p>${ p.pcontent }</p>
															<div style="clear: both;"></div>
														</div>
														<div class="answer-main-btn">
															<!-- 댓글 쓰기 및 갯수 -->
															<button title="댓글쓰기" class="answer-main-btn-left"
																data-wr_id="400521" data-w="c" data-check="active"
																onclick="showReplyForm();">
																<span class="des-left">댓글쓰기</span>
															</button>
														</div>
													</div>
													<br>
													<section class="answer-replyList">
														<!-- 댓글 입력창 -->
														<section class="answer-reply-write">
															<div id="replyWriteForm" class="alist_wcmt wcmt">
																<div id="vbo_wcmt" class="answer-reply-modify">
																	<form id="fcomment" name="fcomment" method="post" action="prinsert2.do">
																		<input type="hidden" name="pro_id" value="${ pro_id }">
																		<input type="hidden" name="ref_pid" value="${ p.pid }">
																		<input type="hidden" name="prwriter" value="${ sessionScope.loginUser.nickname }">
																		<div id="wcmt_content">
																			<div class="sir_ta reply-write-text">
																				<label for="prcontent" class="sir_sr">댓글내용</label>
																				<textarea name="prcontent" id="wr_content"
																					required maxlength="5000" cols="30" rows="1"
																					title="댓글 내용 입력" style="height: 70px;"></textarea>
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
														<br>
														<article class="answer-reply vcmt">
															<div class="answer-reply-header">
																<h5>
																	<img
																		src="/hhw/resources/images/icon/ico_reply_arrow.PNG">
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
											</c:if>
											<!-- // 답변 end -->
											
											
											<c:if test="${ p.pwriter ne sessionScope.loginUser.nickname }">
												<article class="answer-item">
													<div class="answer-header">
														<div class="answer-header-profile">
															<h4>
																<span class="member">${ p.ptitle }</span>
															</h4>
															<div class="answer-date">
																<time>${ p.p_date }</time>
															</div>
														</div>
														<div class="answer-header-btn"></div>
													</div>
													<div class="answer-main">
														<div class="answer-main-content">
															<!-- 답변 본문 내용 -->
															<p>${ p.pcontent }</p>
															<div style="clear: both;"></div>
														</div>
														<div class="answer-main-btn">
															<!-- 댓글 쓰기 및 갯수 -->
															<button id="replyWrite" title="댓글쓰기" class="answer-main-btn-left"
																data-wr_id="400518" data-w="c" data-check="active"
																onclick="showReplyForm();">
																<span class="des-left">댓글쓰기</span>
															</button>
														</div>
													</div>
														<!-- 댓글 입력창 -->
														<section class="answer-reply-write">
															<div class="alist_wcmt wcmt">
																<div id="vbo_wcmt" class="answer-reply-modify">
																	<form id="fcomment" name="fcomment" method="post"
																		action="#"
																		onsubmit="return fcomment_submit(this);"
																		autocomplete="off">


																		<div id="wcmt_content">
																			<div class="sir_ta reply-write-text">
																				<label for="wr_content" class="sir_sr">댓글내용</label>
																				<textarea name="wr_content" id="wr_content"
																					required="" maxlength="5000" cols="30" rows="1"
																					title="댓글 내용 입력" style="height: 70px;"></textarea>
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
													<br> <br>
												</article>
											</c:if>
											<!-- // 답변 end -->
										</section>
									</c:forEach>
								</c:if>
							</div>

							<!-- 오래된 순으로 정렬 -->
							<!-- 답변이 존재한다면 -->
							<div id="oldlist">
								<c:if test="${ requestScope.olist ne null }">

									<!-- listing -->
									<c:forEach items="${ requestScope.olist }" var="p">
										<section id="oldList" class="qa-answerList">
											<!-- 답변 아이템 반복  -->
											<c:if
												test="${ p.pwriter eq sessionScope.loginUser.nickname }">
												<a id="answer_400521"></a>
												<article class="answer-item answer-item-select">
													<div class="answer-header">
														<div class="answer-header-profile">
															<h4>
																<span class="member">${ p.ptitle }</span>
															</h4>
															<div class="answer-date">
																<time>${ p.p_date }</time>
															</div>
														</div>
													</div>
													<div class="answer-main">
														<div class="answer-main-content">
															<!-- 답변 본문 내용 -->
															<p>${ p.pcontent }</p>
															<div style="clear: both;"></div>
														</div>
														<div class="answer-main-btn">
															<!-- 댓글 쓰기 및 갯수 -->
															<button title="댓글쓰기" class="answer-main-btn-left"
																data-wr_id="400521" data-w="c" data-check="active"
																onclick="showWriteForm();">
																<span class="des-left">댓글쓰기</span>
															</button>
														</div>
													</div>
													<br>
													<section class="answer-replyList">
														<!-- 댓글 입력창 -->
														<section class="answer-reply-write">
															<div class="alist_wcmt wcmt"
																style="display: block;">
																<div id="vbo_wcmt" class="answer-reply-modify">
																	<form id="fcomment" name="fcomment" method="post"
																		action="#"
																		onsubmit="return fcomment_submit(this);"
																		autocomplete="off">


																		<div id="wcmt_content">
																			<div class="sir_ta reply-write-text">
																				<label for="wr_content" class="sir_sr">댓글내용</label>
																				<textarea name="wr_content" id="wr_content"
																					required="" maxlength="5000" cols="30" rows="1"
																					title="댓글 내용 입력" style="height: 70px;"></textarea>
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
																	<img
																		src="/hhw/resources/images/icon/ico_reply_arrow.PNG">
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
											</c:if>
											<!-- // 답변 end -->
											<c:if
												test="${ p.pwriter ne sessionScope.loginUser.nickname }">
												<article class="answer-item">
													<div class="answer-header">
														<div class="answer-header-profile">
															<h4>
																<span class="member">${ p.ptitle }</span>
															</h4>
															<div class="answer-date">
																<time>${ p.p_date }</time>
															</div>
														</div>
														<div class="answer-header-btn"></div>
													</div>
													<div class="answer-main">
														<div class="answer-main-content">
															<!-- 답변 본문 내용 -->
															<p>${ p.pcontent }</p>
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
													<br> <br>
												</article>
											</c:if>
											<!-- // 답변 end -->
										</section>
									</c:forEach>
								</c:if>
							</div>



							<!-- 글작성 버튼 start-->
							<div id="consubmit2" align="right">
								<a href="javascript:showWriteForm();" class="consubmit2"> <i
									class="fa fa-pencil" aria-hidden="true"></i> 글 작성하기
								</a>
							</div>
							<!-- 글작성 버튼 end-->
						</div>
						<br>
						<%-- 검색기능 --%>
						<div>
							<input type="radio" name="item" value="title" checked> 제목
							&nbsp; &nbsp; &nbsp; <input type="radio" name="item"
								value="writer"> 작성자 &nbsp; &nbsp; &nbsp; <input
								type="radio" name="item" value="date"> 날짜
						</div>
						<div id="titleDiv">
							<form action="psearchTitle.do" method="post">
								<label> 검색할 제목을 입력하시오 : <input type="search"
									name="keyword"></label> <input type="hidden" name="pro_id"
									value="${ pro_id }"><input type="submit" value="검색">
							</form>
						</div>
						<div id="writerDiv">
							<form action="psearchWriter.do" method="post">
								<!-- 여기서부터 서블릿 때랑 약간다름. method메소드가 따로따로 가게됨 -->
								<label>검색할 작성자 아이디를 입력하시오 : <input type="search"
									name="keyword">
								</label><input type="hidden" name="pro_id" value="${ pro_id }">
								<input type="submit" value="검색">
							</form>
						</div>
						<div id="dateDiv">
							<form action="psearchDate.do" method="post">
								<input type="hidden" name="page" value="1"> <label>
									검색할 날짜를 입력하시오 : <input type="date" name="begin"> ~ <input
									type="date" name="end">
								</label> <input type="submit" value="검색">
							</form>
						</div>
						<%-- 리스트 출력  ({)--%>
						<%-- 목록 출력 --%>
						<div style="text-align: right; padding-right: 25px">
							<c:url var="plist" value="/plist.do">
								<c:param name="pro_id" value="${ pro_id }" />
							</c:url>
							<button onclick="javascript:location.href='${ plist }';">
								전체 목록 보기</button>
						</div>
						<br>
						<div class="my_info_area" align="center">
						<c:if test="${ requestScope.list ne null }">
							<table class="boardtype2 th_border my_table" width="700" cellspacing="0">
							<colgroup>
								<col width="100">
								<col width="1000">
								<col width="100">
								<col width="100">
								<col width="100">
								<col width="100">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="title">번호</th>
									<th scope="col" class="title">제목</th>
									<th scope="col" class="title">작성자</th>
									<th scope="col" class="title">날짜</th>
									<th scope="col" class="title">첨부파일</th>
									<th scope="col" class="title">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ requestScope.list }" var="p">
									<tr>
										<td align="center">${ p.pid }</td>
										<td><c:url var="pdt" value="/pdetail.do">
												<c:param name="pid" value="${ p.pid }" />
											</c:url> <a href="${ pdt }">${ p.ptitle }</a></td>
										<td align="center">${ p.pwriter }</td>
										<td align="center">${ p.p_date }</td>
										<td align="center"><c:if test="${ !empty p.p_file_name }">
				     					 ◎
								      </c:if> <c:if test="${ empty p.p_file_name }">
				      				  &nbsp;
				      				  </c:if></td>
										<td align="center">${ p.pcount }</td>
									</tr>
								</c:forEach>
							</tbody>
							</table>
						</c:if>
						</div>
						<br>
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
							<div class="title">실시간 채팅</div>
							<div id="board_favorite_tags" class="list board_fav_tags empty">
								<div class="fav-empty">
									상대방과 실시간 채팅으로 대화해보세요.<br>
								
								<input type="hidden" id="sender" size="10" value="${ sessionScope.loginUser.nickname }">
								<input type="hidden" id="receiver" size="10" value="${ qplist.pro_answerer }"><br>
								<button id="start" style="float:right;"><img src="/hhw/resources/images/icon/ico_chat.jpg" width="30px">
								채팅방 입장</button><br>
								
								</div>
							</div>
							
							<!-- 채팅방 화면  -->
							<div style="width: 300px; display: none;" id="chatbox">
								<fieldset>
									<div id="messageWindow"></div>
									<br> &nbsp;&nbsp;&nbsp;<input id="inputMessage" onkeyup="enterKey();">
									&nbsp;<input type="button" value="보내기" onclick="send();"> <input
										type="button" value="나가기" id="endBtn">
								</fieldset>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- } 콘텐츠 끝 -->
		
		
		<script type="text/javascript">
			//상대방과 연결할 웹소켓 객체 준비
			var webSocket = null;
			//채팅창 앨리먼트 변수
			var $textarea = $('#messageWindow');
			//상대방에게 전송할 메세지 입력 앨리먼트 변수
			var $inputMessage = $('#inputMessage');
			
			/*
				웹소켓 생성 후 사용될 메소드들
				1. open() : 웹소켓 객체 생성시 실행됨.
						서버와 연결해 주는 메소드임
				2. send() : 서버에 메세지 전송하는 메소드임
				3. message() : 서버에서 데이터를 받는 메소드임
				4. error() : 서버에 데이터 전송 중 에러 발생시
						자동 실행되는 메소드임
				5. close() : 서버와 연결 끊을 때 사용하는 메소드임.
			*/
			
			function connection(){
				/*
				웹소켓 객체는 생성자를 통해 생성됨
				객체 생성시에 서버와 자동 연결됨.
				사용되는 프로토콜은 ws:// 임.
				*/	
				webSocket = new WebSocket(
						"ws://localhost:8888/" +
						"<${ request.getContextPath() }");
			
				//웹소켓을 통해서 연결이 될 때 동작할 이벤트핸들러 작성
				webSocket.onopen = function(event){
					$textarea.html("<p class='chat_content'>"
							+ $('#sender').val() + 
							"님이 입장하셨습니다.</p><br>");
					//웹소켓을 통해 채팅서버에 메세지 전송함
					webSocket.send($('#sender').val() + 
							"|님이 입장함.");
				};
				
				//서버로 부터 메세지를 받을 때 동작할 이벤트핸들러 작성
				webSocket.onmessage = function(event){
					onMessage(event);
				};
				
				//서버로 메세지 보낼 때 에러 발생 처리용 이벤트핸들러 작성
				webSocket.onerror = function(event){
					onError(event)
				};
				
				//서버와 연결을 닫을 때의 이벤트핸들러 작성
				webSocket.onclose = function(event){
					onClose(event);
				};
			}
				
			//보내기 버튼 클릭시 실행되는 send() 함수 작성
			function send(){
				//메세지를 입력하지 않고 버튼 누른 경우
				if($inputMessage.val() == "") {
					alert("전송할 메세지를 입력하세요.");
				}else{  //메세지가 입력된 경우
					$textarea.html($textarea.html() + 
						"<p class='chat_content'>나 : "
						+ $inputMessage.val() + "</p><br>");
					webSocket.send($('#sender').val() + "|"
						+ $inputMessage.val());
					$inputMessage.val('');  //기록된 메세지 삭제함
				}
				
				//화면이 위로 스크롤되게 처리함
				$textarea.scrollTop($textarea.height());
			}  //send()
			
			//웹소켓 이벤트핸들러에 의해 실행되는 함수 작성
			function onMessage(event){
				//서버로 부터 데이터를 받았을 때 작동되는 함수임
				var message = event.data.split("|");
				//보낸사람 아이디
				var receiverID = message[0];
				//전송온 메세지
				var content = message[1];
				
				//전송온 메세지가 비었거나, 보낸사람이 내가 연결한
				//사람이 아닐 경우 아무 내용도 실행하지 않는다.
				if(content == "" || 
						!receiverID.match($('#receiver').val())){
					//비워 놓음
				}else{
					$textarea.html($textarea.html() +
							"<p class='chat_content other-side'>"
							+ receiverID + " : " + content 
							+ "</p><br>");
					//화면이 위로 스크롤되게 처리함
					$textarea.scrollTop($textarea.height());
				}
				
			} //onMessage()
			
			function onError(event){
				alert(event.data);
			}
			
			function onClose(event){
				alert(event);
			}
			
			//'채팅하기' 버튼 클릭시, 서버와 연결되고 
			//채팅창이 나타나게 함
			$('#start').on('click', function(){
				//채팅창 영역 보이게 함
				$('#chatbox').css("display", "block");
				//클릭한 버튼은 안 보이게 함
				$(this).css("display", "none");
				//서버와 연결함
				connection();
			});
			
			//'나가기' 버튼 클릭시 소켓닫기
			//채팅창  안 보이게 함
			$('#endBtn').on('click', function(){
				//채팅창 안 보이게 함
				$('#chatbox').css("display", "none");
				//채팅하기 버튼은 다시 보이게 함
				$('#start').css("display", "inline");
				//서버로 종료 메세지 전송함
				webSocket.send($('#sender').val() 
						+ "님이 퇴장하였습니다.");
				//소켓닫기
				webSocket.close();
			});
			
			//전송할 메세지 입력하면서, 키보드 키에서 손뗄때마다
			//실행되는 이벤트핸들러 함수
			function enterKey(){
				//누른 키가 엔터키(Enter) 이면 메세지 전송함
				if(window.event.keyCode == 13){
					send();
				}
			}
		</script>

		<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>