<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Author" content="kimwoolina">
<link rel="styleSheet" href="/hhw/resources/css/normalize.css">
<link rel="styleSheet" href="/hhw/resources/css/common.css">
</head>
<body class="member-find_pwd" oncontextmenu="return false"
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
						<h3 class="tit_login">비밀번호 찾기</h3>
						<div class="write_form find_view">
							<form method="post" id="form" name="fm"
								action="findPw.do">
								<strong class="tit_label">아이디</strong>
									<input type="text"
									name="id" tabindex="2" size="29" required="required"
									placeholder="고객님의 아이디를 입력해주세요">
									<strong class="tit_label">이메일</strong>
									<input type="text" name="email" size="29" tabindex="5" required="required"
									placeholder="가입 시 등록하신 이메일 주소를 입력해주세요">
								<p></p>
								<button type="submit" class="btn_type1">
									<span class="txt_type">찾기</span>
								</button>
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