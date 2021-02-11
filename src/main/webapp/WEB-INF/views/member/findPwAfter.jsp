<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Author" content="kimwoolina">
<link rel="styleSheet" href="/hhw/resources/css/normalize.css">
<link rel="styleSheet" href="/hhw/resources/css/common.css">

<script type="text/javascript">
//이메일 추출
function pwEmail(){
	var userEmail =  '${ email }';
	
	var  len = userEmail.split('@')[0].length-4; // AB***@gamil.com
	
	var result = userEmail.replace(new RegExp('.(?=.{0,' + len + '}@)', 'g'), '*');
	
	document.write(result);
}
</script>
</head>
<body class="member-find_pwd" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return !disableSelection"
	style="">
	<!-- 헤더  -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 50px 0 50px 0;">
	
		<!-- 본문 -->
		<div id="wrap" class="">
			<div id="container">
				<div id="main">
					<div id="content">
						<div class="section_login">
							<h3 class="tit_login">비밀번호 찾기</h3>
							<div class="write_form find_view">
								<form name="certForm" method="post"
									action="https://www.kurly.com/shop/member/find_pwd.php">
									<img class="thumb"
										src="/hhw/resources/images/icon/icon_findPw.jpg" alt="이메일 찾기">
									<p class="desc">
										이메일로 인증 완료후 <br> 비밀번호를 재발급 받으세요!
									</p>
									<p class="info">
										입력하신 <script>pwEmail();</script> 으로 인증번호가 발송되며,<br>인증 후 비밀번호가
										재발급됩니다.<br>전송량이 많은 경우 이메일 전송이 지연될 수 있습니다.
									</p>
									<a href="#" class="btn_type1">
									<span class="txt_type">인증번호 받기</span></a>
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