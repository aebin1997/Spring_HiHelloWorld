<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Author" content="kimwoolina">
<link rel="stylesheet" href="/hhw/resources/css/default.css">
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 70px 0 60px 0;">

		<div id="wrapper" class="wrapper-pad ">

			<!-- 콘텐츠 시작 { -->
			<div id="bo_qa" class="container ">
				<div id="wrapper_title">그누보드 5.1.1쓰는데 PHP7.4 버전으로 업글 가능할까요?</div>
				<div id="con_lf">
					<h1 class="pg_tit">QA</h1>
					<article id="sir_qav" class="sir_vbo">
						<header id="qav_head" class="vbo_head">
							<h2>그누보드 5.1.1쓰는데 PHP7.4 버전으로 업글 가능할까요?</h2>

							<div id="qav_info">
								<span class="info_span info_name"><span class="sv_wrap">
										<span
											class="member">귀여운대빵</span>
								</span></span> <span class="info_span info_date"><time
										datetime="2021-02-18T14:58:09+09:00">2021.02.18
										14:58:09</time></span> <span class="info_span info_ip"></span>
							</div>
						</header>
						<!-- 웹 -->
						<div class="vbo_wr">

							<ul class="sir_vbo_com">
								<li><a href="#"
									class="sir_b01">목록</a></li>
							</ul>
						</div>
						<section id="vbo_con">
							<h2 class="con_h2">본문</h2>
							<div class="con_inner">
								<p>안녕하세요</p>

								<p>현재 그누보드 5.1.1 사용중이며 코어를 너무 많이 수정해놔서 그누보드 최신 버전으로는 업그레이드가
									거의 어렵습니다.</p>

								<p>PHP 7&nbsp;버전대를 꼭 써야할 이유가 생겼는데, PHP 7.4 로 업글하면 db연결 자체방식
									자체가 달라서 사이트가 안열릴 수 있다고 하는데요.</p>

								<p>업글해서 간단하게 몇 함수만 수정하면 사용이 가능할까요?</p>

								<p>주로 어떤 오류가 발생하는지도 궁금합니다.</p>

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
												<span class="sv_wrap">
													<span class="member">플래토</span>
													</span>님의 답변
											</h4>
											<div class="answer-date">
												<time>2021-02-18 15:08:49</time>
											</div>
										</div>
									</div>
									<div class="answer-main">
										<div class="answer-main-content">
											<!-- 답변 본문 내용 -->

											<p>안하시는게 좋을것 같습니다.</p>

											<p>&nbsp;</p>

											<p>예상치 못한 다양한 오류를 수정하다가 많은시간과 에너지를 소비하게 될것같네요</p>

											<p>&nbsp;</p>

											<p>PHP와 그누보드의 최신버전을 가지고&nbsp;</p>

											<p>코어커스텀을 다른방법으로 새로 처리되게 손보시는게 더 낫지 않을까 생각합니다.</p>
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
											<div id="c400521" class="alist_wcmt wcmt"
												style="display: none;"></div>
										</section>

										<!-- 답변 아래 리플 반복 -->
										<a id="c_400535"></a>
										<article class="answer-reply vcmt">
											<div class="answer-reply-header">
												<div class="blind">귀여운대빵님의 댓글</div>
												<h5>
													<span class="sv_wrap">
													<span class="member">귀여운대빵</span>
													</span>
												</h5>
												<span class="reply-date"><time>2021-02-18
														16:00:34</time></span>

											</div>
											<div class="answer-reply-content ">
												<!-- 답변 댓글 내용 -->
												<p>
													아.. 좋은 의견 감사합니다. <br>힘들더라도 PHP8 + 그누보드 최신버전에 기존 커스텀을
													씌우는게 더 좋겠네요. <br>이런 방법을 미처 생각지 못했었습니다. <br>감사합니다.
												</p>
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
												<span class="sv_wrap"> <span class="member">병원에서일해요</span>
													</span>님의 답변
											</h4>
											<div class="answer-date">
												<time>2021-02-18 15:07:05</time>
											</div>
										</div>
										<div class="answer-header-btn"></div>
									</div>
									<div class="answer-main">
										<div class="answer-main-content">
											<!-- 답변 본문 내용 -->
											<p>구버전에서 사용하던 명령어들이 바뀌어서</p>
											<p>간단한 수정은 아닐것같네요</p>
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
						</div>
					</article>
				</div>
				<div id="con_ri">
					<!-- 로그인 -->
					<div id="sub_menu">
						<div id="consubmit2"></div>
						<!--/ 커뮤니티 전용 사이드 배너 -->
					</div>
					<div class="sub-menu">
						<div class="section tag-fav">
							<div class="title">관심태그</div>
							<div id="board_favorite_tags" class="list board_fav_tags empty">
								<div class="fav-empty">
									관심태그를 등록해보세요.<br>관심있는 주제만 모아서 보실 수 있습니다.
								</div>
							</div>
						</div>
					</div>
					<!-- SIR 오른쪽 메뉴 아래 -->
				</div>

			</div>
			</div>
			<!-- } 콘텐츠 끝 -->

			<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>