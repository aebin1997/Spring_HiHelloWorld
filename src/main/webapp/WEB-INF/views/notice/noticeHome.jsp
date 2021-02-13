<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<section class="breadcrumbs-custom-inset">
		<div class="breadcrumbs-custom context-dark bg-overlay-46">
			<div class="container">
				<h2 class="breadcrumbs-custom-title">공지사항</h2>
				<ul class="breadcrumbs-custom-path">
					<li><a class="nav-link" href="noticeHome.do">공지사항</a></li>
					<li><a class="nav-link" href="aboutUs.do">about Us</a></li>
					<li><a class="nav-link" href="howTo.do">사이트 이용 방법</a></li>
				</ul>
			</div>
			<div class="box-position-1"
				style="background-image: url(/hhw/resources/images/notice_board.jpg);"></div>
		</div>
	</section>

	<div style="padding: 90px; text-align: center;">
		<h1> 공지사항 내용 들어갈 곳 </h1>
	</div>
	

	<jsp:include page="../common/footer.jsp" />

</body>
</html>