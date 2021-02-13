<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Author" content="kimwoolina">
<link rel="styleSheet" href="/hhw/resources/css/normalize.css">
<link rel="styleSheet" href="/hhw/resources/css/common.css">
<style type="text/css">
button {
border: 1px solid #f7921a;
    background-color: #fff;
    color: #f7921a;
    display: inline-block;
    width: 120px;
    margin-left: 5px;
    vertical-align: top;
    border-radius: 2px
}
</style>
<script type="text/javascript">
function validate(){
	// 아이디 중복체크 여부
	if($("#idDuplicateCheck").val() == 0){
		alert("사용가능한 아이디를 입력해주세요.");
		$("#userId").focus();
		return false;
	}else{
		return true;
	}
}

$(function(){
	$("#userId").on("keyup",function(){
		var userId = $(this).val();
		
		if(userId.length < 5){
			$(".guide").hide();
			$("#idDuplicateCheck").val(0);
			
			return;
		}
		
		$.ajax({
			url:"idCheck.do",
			data:{id:userId},
			type:"post",
			success:function(data){
				console.log(data);
				
				if(data == "ok"){
					$(".error").hide();
					$(".ok").show();
					$("#idDuplicateCheck").val(1);
				}else{
					$(".ok").hide();
					$(".error").show();
					$("#idDuplicateCheck").val(0);
				}
				
			},error:function(jqxhr,textStatus,errorThrown){
				console.log("ajax 처리 실패");
				
				console.log(jqxhr);
				console.log(textStatus);
				console.log(errorThrown);
			}
		});
	});
	
	//비밀번호 확인
	$('#pwd2').blur(function(){
	   if($('#pwd').val() != $('#pwd2').val()){
	    	if($('#pwd2').val()!=''){
		    alert("비밀번호가 일치하지 않습니다.");
	    	    $('#pwd2').val('');
	          $('#pwd2').focus();
	      }
	  }
	})
});
</script>
</head>
<body class="member-join" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return !disableSelection"
	style="">

	<!-- 헤더  -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 50px 0 50px 0;">


		<div id="wrap" class="">
			<div id="container">
				<div id="main">
					<div id="content">
						<div class="page_aticle">
							<div class="type_form member_join ">
								<form id="form" name="frmMember" method="post"
									action="minsert.do">
									<div class="field_head">
										<h3 class="tit">회원가입</h3>
										<p class="sub">
											<span class="ico">*</span>필수입력사항
										</p>
									</div>
									<table class="tbl_comm">
										<tbody>
											<tr class="fst">
												<th>아이디<span class="ico">*<span
														class="screen_out">필수항목</span></span></th>
												<td><input type="text" name="id" id="userId" value=""
													maxlength="16" required="" fld_esssential="" option="regId"
													label="아이디" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
													<a class="btn default" href="javascript:chkId()">중복확인</a>
													<p class="txt_guide square">
														<span class="txt txt_case1">6자 이상의 영문 혹은 영문과 숫자를 조합</span>
														<span class="txt txt_case2">아이디 중복확인</span>
													</p></td>
											</tr>
											<tr>
												<th>비밀번호<span class="ico">*<span
														class="screen_out">필수항목</span></span></th>
												<td><input type="password" name="pwd" required=""
													fld_esssential="" option="regPass" label="비밀번호"
													maxlength="16" class="reg_pw" placeholder="비밀번호를 입력해주세요">
													<p class="txt_guide square">
														<span class="txt txt_case1">10자 이상 입력</span> <span
															class="txt txt_case2">영문/숫자/특수문자(공백 제외)만 허용하며, 2개
															이상 조합</span> <span class="txt txt_case3">동일한 숫자 3개 이상 연속
															사용 불가</span>
													</p></td>
											</tr>
											<tr class="member_pwd">
												<th>비밀번호확인<span class="ico">*<span
														class="screen_out">필수항목</span></span></th>
												<td><input type="password" name="pwd2" required=""
													fld_esssential="" option="regPass" label="비밀번호"
													maxlength="16" class="confirm_pw"
													placeholder="비밀번호를 한번 더 입력해주세요">
													<p class="txt_guide square">
														<span class="txt txt_case1">동일한 비밀번호를 입력해주세요.</span>
													</p></td>
											</tr>
											<tr>
												<th>이름<span class="ico">*<span
														class="screen_out">필수항목</span></span></th>
												<td><input type="text" name="name" value="" required=""
													fld_esssential="" label="이름" placeholder="이름을 입력해주세요">
												</td>
											</tr>
											<tr>
												<th>닉네임<span class="ico">*<span
														class="screen_out">필수항목</span></span></th>
												<td><input type="text" name="nickname" value=""
													required="" fld_esssential="" label="닉네임"
													placeholder="닉네임을 입력해주세요"></td>
											</tr>
											<tr>
												<th>이메일<span class="ico">*<span
														class="screen_out">필수항목</span></span></th>
												<td><input type="text" name="email" value=""
													data-email="" size="30" required="" fld_esssential=""
													option="regEmail" label="이메일"
													placeholder="예: hihelloworld@hhw.com"> 
													<a
													href="javascript:void(0)" onclick="chkEmail()"
													class="btn default">중복확인</a></td>
											</tr>
											<tr class="field_phone">
												<th>휴대폰<span class="ico">*<span
														class="screen_out">필수항목</span></span></th>
												<td>
													<div class="phone_num">
														<input type="text" value="" pattern="[0-9]*"
															name="phone" placeholder="숫자만 입력해주세요" class="inp">
														<button id="btn_cert" class="btn default disabled"
															type="button">인증번호 받기</button>
													</div>
													<div id="codeNum" class="code_num">
														<input type="text" name="auth_code" id="auth_code"
															value="" size="6" maxlength="6" pattern="[0-9]*"
															label="인증번호 확인" disabled="" class="inp_confirm"
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
											
											<tr>
												<th>주소<span class="ico">*<span
														class="screen_out">필수항목</span></span></th>
												<td>
													<input type="text" name="post"
														label="우편번호" class="postcodify_postcode5"
														placeholder="우편번호를 검색해주세요">&nbsp
														<button type="button" id="postcodify_search_button"><span id="addressNo" class="address_no" data-text="검색">검색</span></button>
												</td>
											<tr><th></th><td>
													<input type="text" name="address1"
														label="도로명 주소" class="postcodify_address"
														placeholder="도로명 주소를 검색해주세요">
											</td></tr>
											<tr><th></th><td>
													<input type="text" name="address2"
														label="상세 주소" class="postcodify_extra_info"
														placeholder="상세 주소를 검색해주세요">
												</td>
											</tr>
											
											<!-- jQuery와 Postcodify를 로딩한다. -->
											<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
											<script>
											/*  검색 단추를 누르면 팝업 레이어가 열리도록 설정한다. */
											$(function(){
												$("#postcodify_search_button").postcodifyPopUp();
											});
											</script>
											
											
											<tr class="select_sex">
												<th>성별</th>
												<td><label class=""> <input type="radio"
														name="sex" value="m"> <span class="ico"></span>남자
												</label> <label class=""> <input type="radio" name="sex"
														value="w"> <span class="ico"></span>여자
												</label> <label class="checked"> <input type="radio"
														name="sex" value="n" checked="checked"> <span
														class="ico"></span>선택안함
												</label></td>
											</tr>
										</tbody>
									</table>
									<div id="formSubmit" class="form_footer">
										<button class="btn active btn_join"
											onclick='return validate();'>가입하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>