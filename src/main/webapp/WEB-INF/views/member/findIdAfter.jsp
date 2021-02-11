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
//아이디 추출 함수
function pwId(){
	var user =  '${ memberId }';
	console.log(user);
	var result = user.substring(0, 3);
	
	for(var i=0; i<user.length-3; i++) {
	    result += "*";
	}
	document.write(result);
}
</script>

</head>
<body class="member-find_id" oncontextmenu="return false"
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
							<h3 class="tit_login">아이디 찾기</h3>
							<div class="write_form find_view">
								<img class="thumb"
									src="/hhw/resources/images/icon/icon_findId.jpg"
									alt="아이디찾기완료">
								<p class="desc">
									고객님의 <br> 아이디 찾기가 완료되었습니다!
								</p>
								<p class="info">아이디 : <script>pwId();</script></p>
								<a href="loginView.do"
									class="btn_type1"><span class="txt_type">로그인 하기</span></a>
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