<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Author" content="kimwoolina">
<link rel="stylesheet" href="./400510_files/default.css">
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 100px 0 60px 0;">

		<div id="wrapper" class="wrapper-pad ">

			<!-- 콘텐츠 시작 { -->
			<div id="bo_qa" class="container ">
				<div id="wrapper_title">그누보드 5.1.1쓰는데 PHP7.4 버전으로 업글 가능할까요?</div>
				<div id="top_btn">
					<div class="top_btn_wp">
						<a href="https://sir.kr/qa/400510#" title="상단으로"
							class="scroll-top">상단으로</a> <a href="https://sir.kr/qa/400510#"
							title="가운데로" class="scroll-center">가운데로</a> <a
							href="https://sir.kr/qa/400510#" title="하단으로"
							class="scroll-bottom">하단으로</a>
					</div>
				</div>
				<script>
        $(function() {

            $("#top_btn .scroll-top").on("click", function(e) {
                e.preventDefault();
                $("html, body").animate({scrollTop:0}, '500');
                return false;
            });

            $("#top_btn .scroll-center").on("click", function(e) {
                e.preventDefault();

                var middle_pos = $("body").offset().top - ( $(window).height() - $("body").outerHeight(true) ) / 2;

                $("html, body").animate({scrollTop:middle_pos}, '500');
                return false;
            });

            $("#top_btn .scroll-bottom").on("click", function(e) {
                e.preventDefault();

                var scrollBottom = $("html,body").scrollTop + $("html,body").height();

                $("html, body").animate({scrollTop:$(document).height()}, '500');
                return false;
            });

            $(".inner .item").hover(function() {
                $(this).children(".item-sublist").show();
            }, function() {
                $(this).children(".item-sublist").hide();
            });

//            $("#hd_event_link").on("click", function() {
//                $("#hd_modal").css("display", "flex");
//            });
//
//            $("#hd_modal .modal-close").on("click", function() {
//                $("#hd_modal").hide();
//            });
        });

        </script>
				<div id="con_lf">
					<h1 class="pg_tit">QA</h1>
					<article id="sir_qav" class="sir_vbo">
						<header id="qav_head" class="vbo_head">
							<h2>그누보드 5.1.1쓰는데 PHP7.4 버전으로 업글 가능할까요?</h2>

							<div id="qav_info">
								<span class="info_span info_name"><span class="sv_wrap">
										<a href="https://sir.kr/bbs/profile.php?mb_id=bizy"
										class="sv_member" title="귀여운대빵 자기소개" target="_blank"
										rel="nofollow" onclick="return false;"><span
											class="sir_mb_icon"></span> <span class="member">귀여운대빵</span></a>
										<span class="sv"> <a
											href="https://sir.kr/bbs/memo_form.php?me_recv_mb_id=bizy"
											onclick="win_memo(this.href); return false;"><i
												class="fa fa-paper-plane" aria-hidden="true"></i> 쪽지보내기</a> <a
											href="https://sir.kr/bbs/profile.php?mb_id=bizy"
											onclick="win_profile(this.href); return false;"><i
												class="fa fa-user" aria-hidden="true"></i> 자기소개</a> <a
											href="https://sir.kr/bbs/new.php?sfl=mb_id&amp;stx=bizy"><i
												class="fa fa-file-text" aria-hidden="true"></i> 전체게시물</a> <a
											href="https://sir.kr/main/member/?mb_id=bizy"><i
												class="fa fa-file-text-o" aria-hidden="true"></i> 회원게시물</a> <a
											href="https://sir.kr/plugin/friend/friend_action.php?action=add&amp;friend_mb_id=bizy&amp;nonce=9fca2bb8b6"
											class="side_friend_btn" data-action="add"
											data-friend_id="bizy" data-nonce="9fca2bb8b6"><i
												class="fa fa-user-plus" aria-hidden="true"></i> 친구추가</a> <a
											href="https://sir.kr/plugin/memberblock/block_action.php?action=add&amp;friend_mb_id=bizy&amp;nonce=aa308d335b"
											class="side_memberblock_btn" data-action="block"
											data-point="1000" data-memberblock_id="bizy"
											data-nonce="aa308d335b"><i class="fa fa-eye-slash"
												aria-hidden="true"></i> 회원차단</a> <a
											href="https://sir.kr/qa/?sfl=mb_id,1&amp;lstx=bizy"><i
												class="fa fa-question-circle" aria-hidden="true"></i> 회원
												질문검색</a> <a
											href="https://sir.kr/qa/answer.php?sfl=mb_id,2&amp;stx=bizy"><i
												class="fa fa-comment" aria-hidden="true"></i> 회원 답변검색</a> <a
											href="https://sir.kr/qa/?sfl=mb_id,3&amp;lstx=bizy"><i
												class="fa fa-commenting" aria-hidden="true"></i> 회원 댓글검색</a>
									</span>

										<noscript class="sv_nojs">
											<span class="sv"> <a
												href="//sir.kr/bbs/memo_form.php?me_recv_mb_id=bizy"
												onclick="win_memo(this.href); return false;"><i
													class="fa fa-paper-plane" aria-hidden="true"></i> 쪽지보내기</a> <a
												href="//sir.kr/bbs/profile.php?mb_id=bizy"
												onclick="win_profile(this.href); return false;"><i
													class="fa fa-user" aria-hidden="true"></i> 자기소개</a> <a
												href="//sir.kr/bbs/new.php?sfl=mb_id&stx=bizy"><i
													class="fa fa-file-text" aria-hidden="true"></i> 전체게시물</a> <a
												href="//sir.kr/main/member/?mb_id=bizy"><i
													class="fa fa-file-text-o" aria-hidden="true"></i> 회원게시물</a> <a
												href="//sir.kr/plugin/friend/friend_action.php?action=add&amp;friend_mb_id=bizy&amp;nonce=9fca2bb8b6"
												class="side_friend_btn" data-action="add"
												data-friend_id="bizy" data-nonce="9fca2bb8b6"><i
													class="fa fa-user-plus" aria-hidden="true"></i> 친구추가</a> <a
												href="//sir.kr/plugin/memberblock/block_action.php?action=add&amp;friend_mb_id=bizy&amp;nonce=aa308d335b"
												class="side_memberblock_btn" data-action="block"
												data-point="1000" data-memberblock_id="bizy"
												data-nonce="aa308d335b"><i class="fa fa-eye-slash"
													aria-hidden="true"></i> 회원차단</a> <a
												href="//sir.kr/qa/?sfl=mb_id,1&amp;lstx=bizy"><i
													class="fa fa-question-circle" aria-hidden="true"></i> 회원
													질문검색</a> <a
												href="//sir.kr/qa/answer.php?sfl=mb_id,2&amp;stx=bizy"><i
													class="fa fa-comment" aria-hidden="true"></i> 회원 답변검색</a> <a
												href="//sir.kr/qa/?sfl=mb_id,3&amp;lstx=bizy"><i
													class="fa fa-commenting" aria-hidden="true"></i> 회원 댓글검색</a>
											</span>
										</noscript>
								</span></span> <span class="info_span info_date"><time
										datetime="2021-02-18T14:58:09+09:00">2021.02.18
										14:58:09</time></span> <span class="info_span info_ip"></span>
							</div>
						</header>
						<!-- 웹 -->
						<div class="vbo_wr">

							<ul class="sir_vbo_com">
								<li><a href="https://sir.kr/qa/?page=1&amp;unanswered="
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
								<script async="" src="./400510_files/widgets.js.다운로드"
									charset="utf-8"></script>
								<script src="./400510_files/sdk.js.다운로드" async=""></script>
								<a id="answer_400521"></a>
								<article class="answer-item answer-item-select">
									<div class="answer-header">
										<div class="answer-header-profile">
											<h4>
												<span class="sv_wrap"> <a
													href="https://sir.kr/bbs/profile.php?mb_id=pletho"
													class="sv_member" title="플래토 자기소개" target="_blank"
													rel="nofollow" onclick="return false;"><img
														src="./400510_files/pletho.gif" width="22" height="22"
														alt=""> <span class="member">플래토</span></a> <span
													class="sv"> <a
														href="https://sir.kr/bbs/memo_form.php?me_recv_mb_id=pletho"
														onclick="win_memo(this.href); return false;"><i
															class="fa fa-paper-plane" aria-hidden="true"></i> 쪽지보내기</a> <a
														href="https://www.deb.kr/" target="_blank"><i
															class="fa fa-home" aria-hidden="true"></i> 홈페이지</a> <a
														href="https://sir.kr/bbs/profile.php?mb_id=pletho"
														onclick="win_profile(this.href); return false;"><i
															class="fa fa-user" aria-hidden="true"></i> 자기소개</a> <a
														href="https://sir.kr/bbs/new.php?sfl=mb_id&amp;stx=pletho"><i
															class="fa fa-file-text" aria-hidden="true"></i> 전체게시물</a> <a
														href="https://sir.kr/main/member/?mb_id=pletho"><i
															class="fa fa-file-text-o" aria-hidden="true"></i> 회원게시물</a> <a
														href="https://sir.kr/plugin/friend/friend_action.php?action=add&amp;friend_mb_id=pletho&amp;nonce=9fca2bb8b6"
														class="side_friend_btn" data-action="add"
														data-friend_id="pletho" data-nonce="9fca2bb8b6"><i
															class="fa fa-user-plus" aria-hidden="true"></i> 친구추가</a> <a
														href="https://sir.kr/plugin/memberblock/block_action.php?action=add&amp;friend_mb_id=pletho&amp;nonce=aa308d335b"
														class="side_memberblock_btn" data-action="block"
														data-point="1000" data-memberblock_id="pletho"
														data-nonce="aa308d335b"><i class="fa fa-eye-slash"
															aria-hidden="true"></i> 회원차단</a> <a
														href="https://sir.kr/qa/?sfl=mb_id,1&amp;lstx=pletho"><i
															class="fa fa-question-circle" aria-hidden="true"></i> 회원
															질문검색</a> <a
														href="https://sir.kr/qa/answer.php?sfl=mb_id,2&amp;stx=pletho"><i
															class="fa fa-comment" aria-hidden="true"></i> 회원 답변검색</a> <a
														href="https://sir.kr/qa/?sfl=mb_id,3&amp;lstx=pletho"><i
															class="fa fa-commenting" aria-hidden="true"></i> 회원 댓글검색</a>
												</span>

													<noscript class="sv_nojs">
														<span class="sv"> <a
															href="//sir.kr/bbs/memo_form.php?me_recv_mb_id=pletho"
															onclick="win_memo(this.href); return false;"><i
																class="fa fa-paper-plane" aria-hidden="true"></i> 쪽지보내기</a>
															<a href="https://www.deb.kr/" target="_blank"><i
																class="fa fa-home" aria-hidden="true"></i> 홈페이지</a> <a
															href="//sir.kr/bbs/profile.php?mb_id=pletho"
															onclick="win_profile(this.href); return false;"><i
																class="fa fa-user" aria-hidden="true"></i> 자기소개</a> <a
															href="//sir.kr/bbs/new.php?sfl=mb_id&stx=pletho"><i
																class="fa fa-file-text" aria-hidden="true"></i> 전체게시물</a> <a
															href="//sir.kr/main/member/?mb_id=pletho"><i
																class="fa fa-file-text-o" aria-hidden="true"></i> 회원게시물</a>
															<a
															href="//sir.kr/plugin/friend/friend_action.php?action=add&amp;friend_mb_id=pletho&amp;nonce=9fca2bb8b6"
															class="side_friend_btn" data-action="add"
															data-friend_id="pletho" data-nonce="9fca2bb8b6"><i
																class="fa fa-user-plus" aria-hidden="true"></i> 친구추가</a> <a
															href="//sir.kr/plugin/memberblock/block_action.php?action=add&amp;friend_mb_id=pletho&amp;nonce=aa308d335b"
															class="side_memberblock_btn" data-action="block"
															data-point="1000" data-memberblock_id="pletho"
															data-nonce="aa308d335b"><i class="fa fa-eye-slash"
																aria-hidden="true"></i> 회원차단</a> <a
															href="//sir.kr/qa/?sfl=mb_id,1&amp;lstx=pletho"><i
																class="fa fa-question-circle" aria-hidden="true"></i> 회원
																질문검색</a> <a
															href="//sir.kr/qa/answer.php?sfl=mb_id,2&amp;stx=pletho"><i
																class="fa fa-comment" aria-hidden="true"></i> 회원 답변검색</a> <a
															href="//sir.kr/qa/?sfl=mb_id,3&amp;lstx=pletho"><i
																class="fa fa-commenting" aria-hidden="true"></i> 회원 댓글검색</a>
														</span>
													</noscript></span>님의 답변
											</h4>
											<div class="answer-date">
												<time>2021-02-18 15:08:49</time>
											</div>
										</div>
									</div>
									<div class="answer-main">
										<div class="answer-modBtn">
											<button title="답변설정">
												<svg width="13" height="13" viewBox="0 0 50 50">
												<use xlink:href="#svg_ico_more_vertical"></use></svg>
											</button>
											<ul class="answer-modBtn-sub" style="visibility: hidden;">
												<!-- 모바일일 때만 신고 보임 -->
												<li id="qa_singo-qa-400521" title="답변 신고"
													class="sir_react_singo">신고</li>
											</ul>
										</div>

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
												<svg width="13" height="13" viewBox="0 0 50 50">
												<use xlink:href="#svg_ico_answer"></use></svg>
												<span class="des-left">댓글쓰기</span>
											</button>
											<!--                                                             <button type="button" id="qa_singo-qa-400521" class="sir_react_singo" title="신고하기"><svg width="13" height="13" viewBox="0 0 50 50"><use xlink:href="#svg_ico_report" class="qa-ico-report"></use></svg></button>
                                                                                 -->


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
													<svg width="10" height="10" viewBox="0 0 50 50"
														class="mob-none">
													<use xlink:href="#svg_ico_reply"></use></svg>
													<span class="sv_wrap"> <a
														href="https://sir.kr/bbs/profile.php?mb_id=bizy"
														class="sv_member" title="귀여운대빵 자기소개" target="_blank"
														rel="nofollow" onclick="return false;"><span
															class="sir_mb_icon"></span> <span class="member">귀여운대빵</span></a>
														<span class="sv"> <a
															href="https://sir.kr/bbs/memo_form.php?me_recv_mb_id=bizy"
															onclick="win_memo(this.href); return false;"><i
																class="fa fa-paper-plane" aria-hidden="true"></i> 쪽지보내기</a>
															<a href="https://sir.kr/bbs/profile.php?mb_id=bizy"
															onclick="win_profile(this.href); return false;"><i
																class="fa fa-user" aria-hidden="true"></i> 자기소개</a> <a
															href="https://sir.kr/bbs/new.php?sfl=mb_id&amp;stx=bizy"><i
																class="fa fa-file-text" aria-hidden="true"></i> 전체게시물</a> <a
															href="https://sir.kr/main/member/?mb_id=bizy"><i
																class="fa fa-file-text-o" aria-hidden="true"></i> 회원게시물</a>
															<a
															href="https://sir.kr/plugin/friend/friend_action.php?action=add&amp;friend_mb_id=bizy&amp;nonce=9fca2bb8b6"
															class="side_friend_btn" data-action="add"
															data-friend_id="bizy" data-nonce="9fca2bb8b6"><i
																class="fa fa-user-plus" aria-hidden="true"></i> 친구추가</a> <a
															href="https://sir.kr/plugin/memberblock/block_action.php?action=add&amp;friend_mb_id=bizy&amp;nonce=aa308d335b"
															class="side_memberblock_btn" data-action="block"
															data-point="1000" data-memberblock_id="bizy"
															data-nonce="aa308d335b"><i class="fa fa-eye-slash"
																aria-hidden="true"></i> 회원차단</a> <a
															href="https://sir.kr/qa/?sfl=mb_id,1&amp;lstx=bizy"><i
																class="fa fa-question-circle" aria-hidden="true"></i> 회원
																질문검색</a> <a
															href="https://sir.kr/qa/answer.php?sfl=mb_id,2&amp;stx=bizy"><i
																class="fa fa-comment" aria-hidden="true"></i> 회원 답변검색</a> <a
															href="https://sir.kr/qa/?sfl=mb_id,3&amp;lstx=bizy"><i
																class="fa fa-commenting" aria-hidden="true"></i> 회원 댓글검색</a>
													</span>

														<noscript class="sv_nojs">
															<span class="sv"> <a
																href="//sir.kr/bbs/memo_form.php?me_recv_mb_id=bizy"
																onclick="win_memo(this.href); return false;"><i
																	class="fa fa-paper-plane" aria-hidden="true"></i> 쪽지보내기</a>
																<a href="//sir.kr/bbs/profile.php?mb_id=bizy"
																onclick="win_profile(this.href); return false;"><i
																	class="fa fa-user" aria-hidden="true"></i> 자기소개</a> <a
																href="//sir.kr/bbs/new.php?sfl=mb_id&stx=bizy"><i
																	class="fa fa-file-text" aria-hidden="true"></i> 전체게시물</a> <a
																href="//sir.kr/main/member/?mb_id=bizy"><i
																	class="fa fa-file-text-o" aria-hidden="true"></i> 회원게시물</a>
																<a
																href="//sir.kr/plugin/friend/friend_action.php?action=add&amp;friend_mb_id=bizy&amp;nonce=9fca2bb8b6"
																class="side_friend_btn" data-action="add"
																data-friend_id="bizy" data-nonce="9fca2bb8b6"><i
																	class="fa fa-user-plus" aria-hidden="true"></i> 친구추가</a> <a
																href="//sir.kr/plugin/memberblock/block_action.php?action=add&amp;friend_mb_id=bizy&amp;nonce=aa308d335b"
																class="side_memberblock_btn" data-action="block"
																data-point="1000" data-memberblock_id="bizy"
																data-nonce="aa308d335b"><i class="fa fa-eye-slash"
																	aria-hidden="true"></i> 회원차단</a> <a
																href="//sir.kr/qa/?sfl=mb_id,1&amp;lstx=bizy"><i
																	class="fa fa-question-circle" aria-hidden="true"></i>
																	회원 질문검색</a> <a
																href="//sir.kr/qa/answer.php?sfl=mb_id,2&amp;stx=bizy"><i
																	class="fa fa-comment" aria-hidden="true"></i> 회원 답변검색</a> <a
																href="//sir.kr/qa/?sfl=mb_id,3&amp;lstx=bizy"><i
																	class="fa fa-commenting" aria-hidden="true"></i> 회원
																	댓글검색</a>
															</span>
														</noscript></span>
												</h5>
												<span class="reply-date"><time>2021-02-18
														16:00:34</time></span>

												<div class="reply-modBtn">
													<button title="댓글설정">
														<svg width="13" height="13" viewBox="0 0 50 50">
														<use xlink:href="#svg_ico_more_vertical"></use></svg>
													</button>
													<ul class="reply-modBtn-sub" style="visibility: hidden;">
														<li title="댓글 신고"><button
																id="qa_comment_singo-!qa-400535"
																class="cmt_singo cmt_singo_re">신고</button></li>
													</ul>
												</div>
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
								<script async="" src="./400510_files/widgets.js.다운로드"
									charset="utf-8"></script>
								<script src="./400510_files/sdk.js.다운로드" async=""></script>
								<a id="answer_400516"></a>

								<!-- // 답변 end -->
								<script async="" src="./400510_files/widgets.js.다운로드"
									charset="utf-8"></script>
								<script src="./400510_files/sdk.js.다운로드" async=""></script>
								<a id="answer_400518"></a>
								<article class="answer-item">
									<div class="answer-header">
										<div class="answer-header-profile">
											<h4>
												<span class="sv_wrap"> <a
													href="https://sir.kr/bbs/profile.php?mb_id=auddlzz"
													class="sv_member" title="병원에서일해요 자기소개" target="_blank"
													rel="nofollow" onclick="return false;"><span
														class="sir_mb_icon"></span> <span class="member">병원에서일해요</span></a>
													<span class="sv"> <a
														href="https://sir.kr/bbs/memo_form.php?me_recv_mb_id=auddlzz"
														onclick="win_memo(this.href); return false;"><i
															class="fa fa-paper-plane" aria-hidden="true"></i> 쪽지보내기</a> <a
														href="https://sir.kr/bbs/profile.php?mb_id=auddlzz"
														onclick="win_profile(this.href); return false;"><i
															class="fa fa-user" aria-hidden="true"></i> 자기소개</a> <a
														href="https://sir.kr/bbs/new.php?sfl=mb_id&amp;stx=auddlzz"><i
															class="fa fa-file-text" aria-hidden="true"></i> 전체게시물</a> <a
														href="https://sir.kr/main/member/?mb_id=auddlzz"><i
															class="fa fa-file-text-o" aria-hidden="true"></i> 회원게시물</a> <a
														href="https://sir.kr/plugin/friend/friend_action.php?action=add&amp;friend_mb_id=auddlzz&amp;nonce=9fca2bb8b6"
														class="side_friend_btn" data-action="add"
														data-friend_id="auddlzz" data-nonce="9fca2bb8b6"><i
															class="fa fa-user-plus" aria-hidden="true"></i> 친구추가</a> <a
														href="https://sir.kr/plugin/memberblock/block_action.php?action=add&amp;friend_mb_id=auddlzz&amp;nonce=aa308d335b"
														class="side_memberblock_btn" data-action="block"
														data-point="1000" data-memberblock_id="auddlzz"
														data-nonce="aa308d335b"><i class="fa fa-eye-slash"
															aria-hidden="true"></i> 회원차단</a> <a
														href="https://sir.kr/qa/?sfl=mb_id,1&amp;lstx=auddlzz"><i
															class="fa fa-question-circle" aria-hidden="true"></i> 회원
															질문검색</a> <a
														href="https://sir.kr/qa/answer.php?sfl=mb_id,2&amp;stx=auddlzz"><i
															class="fa fa-comment" aria-hidden="true"></i> 회원 답변검색</a> <a
														href="https://sir.kr/qa/?sfl=mb_id,3&amp;lstx=auddlzz"><i
															class="fa fa-commenting" aria-hidden="true"></i> 회원 댓글검색</a>
												</span>

													<noscript class="sv_nojs">
														<span class="sv"> <a
															href="//sir.kr/bbs/memo_form.php?me_recv_mb_id=auddlzz"
															onclick="win_memo(this.href); return false;"><i
																class="fa fa-paper-plane" aria-hidden="true"></i> 쪽지보내기</a>
															<a href="//sir.kr/bbs/profile.php?mb_id=auddlzz"
															onclick="win_profile(this.href); return false;"><i
																class="fa fa-user" aria-hidden="true"></i> 자기소개</a> <a
															href="//sir.kr/bbs/new.php?sfl=mb_id&stx=auddlzz"><i
																class="fa fa-file-text" aria-hidden="true"></i> 전체게시물</a> <a
															href="//sir.kr/main/member/?mb_id=auddlzz"><i
																class="fa fa-file-text-o" aria-hidden="true"></i> 회원게시물</a>
															<a
															href="//sir.kr/plugin/friend/friend_action.php?action=add&amp;friend_mb_id=auddlzz&amp;nonce=9fca2bb8b6"
															class="side_friend_btn" data-action="add"
															data-friend_id="auddlzz" data-nonce="9fca2bb8b6"><i
																class="fa fa-user-plus" aria-hidden="true"></i> 친구추가</a> <a
															href="//sir.kr/plugin/memberblock/block_action.php?action=add&amp;friend_mb_id=auddlzz&amp;nonce=aa308d335b"
															class="side_memberblock_btn" data-action="block"
															data-point="1000" data-memberblock_id="auddlzz"
															data-nonce="aa308d335b"><i class="fa fa-eye-slash"
																aria-hidden="true"></i> 회원차단</a> <a
															href="//sir.kr/qa/?sfl=mb_id,1&amp;lstx=auddlzz"><i
																class="fa fa-question-circle" aria-hidden="true"></i> 회원
																질문검색</a> <a
															href="//sir.kr/qa/answer.php?sfl=mb_id,2&amp;stx=auddlzz"><i
																class="fa fa-comment" aria-hidden="true"></i> 회원 답변검색</a> <a
															href="//sir.kr/qa/?sfl=mb_id,3&amp;lstx=auddlzz"><i
																class="fa fa-commenting" aria-hidden="true"></i> 회원 댓글검색</a>
														</span>
													</noscript></span>님의 답변
											</h4>
											<div class="answer-date">
												<time>2021-02-18 15:07:05</time>
											</div>
										</div>
										<div class="answer-header-btn"></div>
									</div>
									<div class="answer-main">
										<div class="answer-modBtn">
											<button title="답변설정">
												<svg width="13" height="13" viewBox="0 0 50 50">
												<use xlink:href="#svg_ico_more_vertical"></use></svg>
											</button>
											<ul class="answer-modBtn-sub" style="visibility: hidden;">
												<!-- 모바일일 때만 신고 보임 -->
												<li id="qa_singo-qa-400518" title="답변 신고"
													class="sir_react_singo">신고</li>
											</ul>
										</div>
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
												<svg width="13" height="13" viewBox="0 0 50 50">
												<use xlink:href="#svg_ico_answer"></use></svg>
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
			<!-- } 콘텐츠 끝 -->

			<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>