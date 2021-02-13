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
</head>
<body class="member-login" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return !disableSelection"
	style="">
	
	<!-- 헤더  -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 50px 0 50px 0;">
	
	<div id="wrap" class="">
		<div id="container">
			<div id="main">
				<div id="content">
					<div class="section_login">
						<h3 class="tit_login">로그인</h3>
						<div class="write_form">
							<div class="write_view login_view">
								<form action="login.do" method="post" name="form" id="form">
									<input
										type="text" name="id" size="20" tabindex="1" value="" required="required"
										placeholder="아이디를 입력해주세요">
									<input type="password"
										name="pwd" size="20" tabindex="2" required="required"
										placeholder="비밀번호를 입력해주세요" style="margin: 10px 0px 0px">
								<div class="checkbox_save">
										<label class="label_checkbox checked"> <input
											type="checkbox" id="chk_security" name="chk_security"
											value="y" checked="checked"
											onchange="if( this.checked){$(this).parent().addClass(&#39;checked&#39;)}else{$(this).parent().removeClass(&#39;checked&#39;)} ">
											자동 로그인
										</label>
										<div class="login_search">
											<a href="findIdView.do" class="link">아이디 찾기</a>
											<span class="bar"></span>
											<a href="findPwView.do" class="link">비밀번호 찾기</a>
										</div>
									</div>
									<button type="submit" class="btn_type1">
										<span class="txt_type">로그인</span>
									</button>
								</form>
								<a href="enrollView.do"
									class="btn_type2 btn_member"><span class="txt_type">회원가입</span></a>
							</div>
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