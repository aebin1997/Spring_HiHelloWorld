<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="styleSheet" href="/hhw/resources/css/normalize.css">
<link rel="styleSheet" href="/hhw/resources/css/common.css">
</head>
<body class="member-find_pwd" oncontextmenu="return false" ondragstart="return false" onselectstart="return !disableSelection" style="">
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
<form name="certForm" method="post" action="https://www.kurly.com/shop/member/find_pwd.php">
<input type="hidden" name="token" value="657451c2374bb0e8778200d76401ae28ff3a973ee0a888c273b5110a9eebd1a6">
<input type="hidden" name="m_id" value="lynpeep">
<input type="hidden" name="otp" value="">
<img class="thumb" src="/hhw/resources/images/icon/icon_findPw.jpg" alt="이메일 찾기">
<p class="desc">
이메일로 인증 완료후
<br>
비밀번호를 재발급 받으세요!
</p>
<p class="info">
입력하신 rlad*****@naver.com 으로 인증번호가 발송되며,<br>인증 후 비밀번호가 재발급됩니다.<br>전송량이 많은 경우 이메일 전송이 지연될 수 있습니다.
</p>
<a href="#" class="btn_type1"><span class="txt_type">인증번호 받기</span></a>
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