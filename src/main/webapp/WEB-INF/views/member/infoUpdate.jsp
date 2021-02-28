<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Author" content="aebin">
<title>내정보관리하기</title>
<link rel="styleSheet" href="/hhw/resources/css/normalize.css">
<link rel="styleSheet" href="/hhw/resources/css/common.css">
<link rel="styleSheet" href="/hhw/resources/css/myPage/popup.css">

<script type="text/javascript">
	function showPopup(multipleFilter) {
		const popup = document.querySelector('#popup');

		if (multipleFilter) {
			popup.classList.add('multiple-filter');
		} else {
			popup.classList.remove('multiple-filter');
		}

		popup.classList.remove('hide');
	}

	function closePopup() {
		const popup = document.querySelector('#popup');
		popup.classList.add('hide');
	}
</script>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<section style="padding: 100px 0 60px 0;">
		<div id="wrap" class="">
			<div id="pos_scroll"></div>


			<div class="page_aticle aticle_type2">
				<div id="snb" class="snb_my">

					<div class="inner_snb">
						<ul class="list_menu">
							<li></li>

							<li></li>

						</ul>
					</div>

				</div>
				<div class="page_section section_myinfo">
					<div class="head_aticle">
						<h2 align="center">${ member.name }님의정보보기</h2>
					</div>


					<div class="type_form member_join member_mod">
						<form id="form" name="frmMember" method="post"
							action="mupdate.do"	enctype="multipart/form-data">
							<input type="hidden" name="mode" value="modMember"> <input
								type="hidden" name="check_mobile" value="1"> <input
								type="hidden" name="auth_finish_code" value=""> <input
								type="hidden" name="rncheck" value=""> <input
								type="hidden" name="dupeinfo" value=""> <input
								type="hidden" name="pakey" value=""> <input
								type="hidden" name="foreigner" value="1"> <input
								type="hidden" name="passwordSkin" value="Y"> <input
								type="hidden" name="m_id" value="dlsdk54">

							<table class="tbl_comm" border="1">
								<tr class="fst">
									<th>*아이디<span class="ico">*<span class="screen_out">필수항목</span></span></th>
									<td><input type="text" value="${ member.id }"
										readonly="" class="inp_read" name="id"></td>
								</tr>
								<tr>
								<tr class="member_pwd">
									<th>*새 비밀번호</th>
									<td>
									<input type="password" name="pwd" id="pwd" label="새 비밀번호" option="regPass" maxlength="16" class="reg_pw">
									<input type="hidden" name="newPasswordCheck" value="0">
										<p class="txt_guide square">
											<span class="txt txt_case4">현재 비밀번호와 다르게 입력</span>
											<span
												class="txt txt_case1">10자 이상 입력</span>
											<span
												class="txt txt_case2">영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상
												조합</span> <span class="txt txt_case3">동일한 숫자 3개 이상 연속 사용 불가</span>
										</p>
									</td>
								</tr>
								<tr class="member_pwd">
									<th>*새 비밀번호 확인</th>
									<td><input type="password" name="pwd2"
										id="pwd2" label="새 비밀번호" option="regPass"
										maxlength="16" class="confirm_pw">
										<p class="txt_guide square">
											<span class="txt txt_case1">동일한 비밀번호를 입력해주세요.</span>
										</p></td>
								</tr>
								<tr>
									<th>* 별명</th>
									<td><input type="text" name="nickname"
										value="${ member.nickname }" readonly></input></td>
								</tr>
								<tr>
									<th>*이름<span class="ico">*<span class="screen_out">필수항목</span></span></th>
									<td><input type="text" name="name"
										value="${ member.name }" readonly required="" fld_esssential=""
										label="이름" placeholder="이름을 입력해주세요"></td>
								</tr>
								<tr>
									<th>이메일<span class="ico">*<span class="screen_out">필수항목</span></span></th>
									<td><input type="text" name="email"	value="${ member.email }" size="30" required="" onblur="chkEmailChange($(this))">
									<input type="hidden" name="chk_email" required="" label="이메일중복체크" value="1">
										<a href="javascript:void(0)" onclick="chkEmail()"
										class="btn default">중복확인</a></td>
								</tr>
								<tr class="field_phone">
									<th>휴대폰<span class="ico">*<span class="screen_out">필수항목</span></span></th>
									<td>
										<div class="phone_num">
											<input type="text" value="${ member.phone }" name="phone">
											<button id="btn_cert" class="btn default" type="button">다른번호
												인증</button>
										</div>
										<div id="codeNum" class="code_num">
											<input type="text" name="auth_code" id="auth_code" value=""
												size="6" maxlength="6" pattern="[0-9]*" label="인증번호 확인"
												disabled="" class="inp_confirm"
												oninput="if(value.length&gt;6)value=value.slice(0,6);$(this).val($(this).val().replace(/[^0-9]/g,&#39;&#39;));">
											<button id="btn_cert_confirm" class="btn default disabled"
												type="button">인증번호 확인</button>
											<p id="countdown" class="count_down"></p>
										</div>
										<p class="txt_guide">
											<span class="txt txt_case1"></span>
										</p>
									</td>
								</tr>

								<tr class="select_sex">
									<th>성별</th>
									<td><c:choose>
											<c:when test="${ member.sex eq 'm' }">
												<input type="radio" name="sex" value="m" checked="checked" readonly><span class="ico"></span>남자
									<input type="radio" name="sex" value="w"> <span class="ico"></span>여자
									<input type="radio" name="sex" value="n">
												<span class="ico"></span>선택안함
									</c:when>

											<c:when test="${ member.sex eq 'w' }">
												<input type="radio" name="sex" value="m">
												<span class="ico"></span>남자
									<input type="radio" name="sex" value="w" checked="checked"
													readonly>
												<span class="ico"></span>여자
									<input type="radio" name="sex" value="n">
												<span class="ico"></span>선택안함
									</c:when>

											<c:otherwise>
												<input type="radio" name="sex" value="m">
												<span class="ico"></span>남자
									<input type="radio" name="sex" value="w">
												<span class="ico"></span>여자
									<input type="radio" name="sex" value="n" checked="checked"
													readonly>
												<span class="ico"></span>선택안함
									</c:otherwise>
										</c:choose></td>
								</tr>

								<c:if test="${ !empty member.address }">
									<c:forTokens var="addr" items="${ member.address }"
										delims="," varStatus="status">
										<c:if test="${ status.index eq 0 }">
											<tr>
												<th>주소<span class="ico">*<span
														class="screen_out">필수항목</span></span></th>
												<td><input type="text" name="post" label="우편번호"
													class="postcodify_postcode5" placeholder="우편번호를 검색해주세요"
													value="${ addr }">
													<button type="button" id="postcodify_search_button"
														class="btn default">
														<span id="addressNo" class="address_no" data-text="검색">검색</span>
													</button></td>
													</tr>
													</c:if>
													<c:if test="${ status.index eq 1 }">
											<tr>
												<th></th>
												<td><input type="text" name="addr1" label="도로명 주소"
													class="postcodify_address" placeholder="도로명 주소를 검색해주세요"
													value="${ addr }"></td>
											</tr>
											</c:if>
											<c:if test="${ status.index eq 2 }">
											<tr>
												<th></th>
												<td><input type="text" name="addr2" label="상세 주소"
													class="postcodify_extra_info" placeholder="상세 주소를 검색해주세요"
													value="${ addr }"></td>
											</tr>
											</c:if>
											</c:forTokens>
											</c:if>
											<!-- jQuery와 Postcodify를 로딩한다. -->
											<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
											<script>
												/*  검색 단추를 누르면 팝업 레이어가 열리도록 설정한다. */
												$(function() {
													$(
															"#postcodify_search_button")
															.postcodifyPopUp();
												});
											</script>

											<tr>
												<th>프로필 사진</th>
												<td><input multiple="multiple" type="file" name="upfile"
													value="${ member.propic }"></td>
											</tr>
											<tr>
												<th rowspan="3">내소개</th>
											</tr>
											<tr>
												<td><input type="text" name="selfintro_head"
													placeholder="30자 이내로 작성해 주세요." value="${ member.selfintro_head }"></td>
											</tr>
											<tr>
												<td><input type="text" name="selfintro_content"
													placeholder="200자 이내로 작성해 주세요." value="${ member.selfintro_content }"></td>
											</tr>

											<tr>
												<td colspan="2" align="center">
													<input type="submit" class="btn default" value="수정하기">
													<button type="button" class="btn default"
														onclick="history.go(-1);">뒤로가기</button> <input
													type="reset" value="초기화하기" class="btn default"> <c:url
														var="mdelete" value="mdelete.do">
														<c:param name="id" value="${ member.id }" />
													</c:url>
													<button type="button" onclick="showPopup()"
														class="btn default">탈퇴하기</button>
													<div id="popup" class="hide">
														<div class="content">
															<p>저희를 떠나지마세요 ㅠ_ㅠ</p>
															<button onclick="location.href='${ mdelete }';">탈퇴하기</button>
															<button onclick="closePopup()">닫기</button>
														</div>
													</div>
												</td>
											</tr>
											</div>


											<script type="text/javascript">
												function validate() {
													// 아이디 중복체크 여부
													if ($("#idDuplicateCheck")
															.val() == 0) {
														alert("사용가능한 아이디를 입력해주세요.");
														$("#userId").focus();
														return false;
													} else {
														return true;
													}

													$("#modal").modal('show');
												}

												$(function() {
													$("#userId")
															.on(
																	"keyup",
																	function() {
																		var userId = $(
																				this)
																				.val();

																		if (userId.length < 5) {
																			$(
																					".guide")
																					.hide();
																			$(
																					"#idDuplicateCheck")
																					.val(
																							0);

																			return;
																		}

																		$
																				.ajax({
																					url : "idCheck.do",
																					data : {
																						id : userId
																					},
																					type : "post",
																					success : function(
																							data) {
																						console
																								.log(data);

																						if (data == "ok") {
																							$(
																									".error")
																									.hide();
																							$(
																									".ok")
																									.show();
																							$(
																									"#idDuplicateCheck")
																									.val(
																											1);
																						} else {
																							$(
																									".ok")
																									.hide();
																							$(
																									".error")
																									.show();
																							$(
																									"#idDuplicateCheck")
																									.val(
																											0);
																						}

																					},
																					error : function(
																							jqxhr,
																							textStatus,
																							errorThrown) {
																						console
																								.log("ajax 처리 실패");

																						console
																								.log(jqxhr);
																						console
																								.log(textStatus);
																						console
																								.log(errorThrown);
																					}
																				});
																	});

													//비밀번호 확인
													$('#pwd2')
															.blur(
																	function() {
																		if ($(
																				'#pwd')
																				.val() != $(
																				'#pwd2')
																				.val()) {
																			if ($(
																					'#pwd2')
																					.val() != '') {
																				alert("비밀번호가 일치하지 않습니다.");
																				$(
																						'#pwd2')
																						.val(
																								'');
																				$(
																						'#pwd2')
																						.focus();
																			}
																		}
																	})

													// 회원가입 modal창
													$("#modal").show();

												});

												// 이메일 중복확인
												function chkEmail() {
													var email_txt = $(
															"input[name='email']")
															.val();
													var trim_txt = email_txt
															.replace(
																	/(^\s*)|(\s*$)/gi,
																	"");
													var email_regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
													$("input[name='email']")
															.val(trim_txt)

													if ($("input[name='email']")
															.val() === "") {
														alert("이메일 주소를 입력해 주세요.");
														$('[name=chk_email]')
																.val('0');
														return false;
													}
													if (email_regex
															.test(trim_txt) === false) {
														alert("잘못된 이메일 형식입니다.");
														$('[name=chk_email]')
																.val('0');
														return false;
													}

													$('[name=chk_email]').val(
															'1');
													alert("사용이 가능합니다.");
													return;

												}

												$("input[name='mobileInp']")
														.change(
																function() {
																	$(
																			"input[name='check_mobile']")
																			.val(
																					"0");
																});

												function chkForm2(f) {
													if ($('[name=chk_email]')
															.val() !== '1') {
														alert(
																'이메일 중복확인을 확인해주세요',
																function() {
																	$(
																			'[name=email]')
																			.focus();
																});
														return false;
													}

													var email_txt = $(
															"input[name='email']")
															.val();
													var trim_txt = email_txt
															.replace(
																	/(^\s*)|(\s*$)/gi,
																	"");
													var email_regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
													$("input[name='email']")
															.val(trim_txt)
													if (email_regex
															.test(trim_txt) === false) {
														alert(
																'잘못된 이메일 형식입니다.',
																function() {
																	$(
																			'input[name=email]')
																			.focus();
																});
														return false;
													}
												}
											</script>

											</td>
											</tr>
											</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>

