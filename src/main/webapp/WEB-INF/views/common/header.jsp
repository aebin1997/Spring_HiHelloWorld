<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hi Hello World</title>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 

<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link rel="stylesheet" href="/hhw/resources/css/bootstrap.min.css" />
<!-- Google Font  -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|PT+Serif:400,400i,700,700i" />
<!-- icofont icon -->
<link rel="stylesheet" href="/hhw/resources/css/icofont.css" />
<!-- font awesome icon -->
<link rel="stylesheet" href="/hhw/resources/css/fontawesome-all.min.css" />
<!-- animate CSS -->
<link rel="stylesheet" href="/hhw/resources/css/animate.css" />
<!--- meanmenu Css-->
<link rel="stylesheet" href="/hhw/resources/css/meanmenu.min.css"
	media="all" />
<!--- owl carousel Css-->
<link rel="stylesheet" href="/hhw/resources/css/owl.carousel.min.css" />
<link rel="stylesheet"
	href="/hhw/resources/css/owl.theme.default.min.css" />
<!-- venobox -->
<link rel="stylesheet" href="/hhw/resources/css/venobox.css" />
<!-- Style CSS -->
<link rel="stylesheet" href="/hhw/resources/css/style.css" />
<!-- Style CSS -->
<link rel="stylesheet" href="/hhw/resources/css/coca.css" />
<!-- Responsive  CSS -->
<link rel="stylesheet" href="/hhw/resources/css/responsive.css" />

<!-- 아이콘 불러오는 사이트 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- Latest jQuery -->
<script src="/hhw/resources/js/jquery-2.2.4.min.js"></script>
<!-- popper js -->
<script src="/hhw/resources/js/popper.min.js"></script>
<!-- Latest compiled and minified Bootstrap -->
<script src="/hhw/resources/js/bootstrap.min.js"></script>
<!-- meanmenu min js  -->
<script src="/hhw/resources/js/jquery.meanmenu.min.js"></script>
<!-- Sticky JS -->
<script src="/hhw/resources/js/jquery.sticky.js"></script>
<!-- owl-carousel min js  -->
<script src="/hhw/resources/js/owl.carousel.min.js"></script>
<!-- jquery appear js  -->
<script src="/hhw/resources/js/jquery.appear.js"></script>
<!-- countTo js -->
<script src="/hhw/resources/js/jquery.inview.min.js"></script>
<!-- venobox js -->
<script src="/hhw/resources/js/venobox.min.js"></script>
<script src="/hhw/resources/js/masonry.pkgd.min.js"></script>
<!-- scroll to top js -->
<script src="/hhw/resources/js/scrolltopcontrol.js"></script>
<!-- WOW - Reveal Animations When You Scroll -->
<script src="/hhw/resources/js/wow.min.js"></script>
<!-- scripts js -->
<script src="/hhw/resources/js/scripts.js"></script>
<!-- chart js -->
<script src="/hhw/resources/js/canvasjs.min.js"></script>
<script src="/hhw/resources/js/canvasjs.activeone.js"></script>
<script type="text/javascript"
	src="//themera.net/embed/themera.js?id=73733"></script>


</head>
<body>

	<!-- START PRELOADER -->
	<div id="page-preloader">
		<div class="theme-loader">coca</div>
	</div>
	<!-- END PRELOADER -->

	<!-- START HEADER SECTION -->
	<header class="main-header header-1">
		<!-- START LOGO AREA -->
		<div class="logo-area">
			<div class="auto-container">
				<div class="row">
					<div
						class="col-lg-5 col-md-3 col-sm-6 col-7 mx-auto pl-0 mb-lg-0 mb-5">
						<div class="logo">
							<a href="index.jsp"> <img class="img-fluid"
								src="/hhw/resources/images/testLogo.jpg" alt=">Hi Hello World!_" style="width:180px; height:70px">
							</a>
						</div>
					</div>
					<div class="col-lg-7 col-md-12 col-sm-12 col-12"
						style="float: left;">
						<!-- <div class="header-info-box"> -->
							<!-- <div class="header-info-icon">
														<i class="fa fa-envelope-open"></i>
													</div>
													<p>Email Us</p>
													<h6>info@yoursite.com</h6> -->
						<!-- </div> -->
						<div class="header-info-box" style="position: absolute; right:10px;">
							<!-- <div class="header-info-icon">
														<i class="fa fa-phone"></i>
													</div>
													<p>Call Us</p>
													<h6>123-456-0975</h6> -->
							
							<c:if test="${ !empty sessionScope.loginUser }">
								<c:out value="${ loginUser.name }님 환영합니다!!" />
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END LOGO AREA -->

	<c:url var="qalist" value="qalist.do">
		<c:param name="page" value="1"/>
	</c:url>
	<c:url var="blist" value="blist.do">
		<c:param name="page" value="1" />
	</c:url>

		<!-- START NAVIGATION AREA -->
		<div class="sticky-menu">
			<div class="mainmenu-area">
				<div class="auto-container">
					<div class="row">
						<div class="col-lg-9">
							<nav class="navbar navbar-expand-lg justify-content-left">
								<ul class="navbar-nav">
									<li><a class="active nav-link" href="index.jsp">Home</a></li>
									<li><a class="nav-link" href="noticeHome.do">공지사항</a></li>
									<li><a class="nav-link" href="${ qalist }">코딩의뢰</a></li>
									<li><a class="nav-link" href="${ blist }">자유게시판</a></li>
									<li><a class="nav-link" href="#">CONTACT</a></li>
									<li><a class="nav-link" href="#">진행페이지</a></li>
								</ul>
							</nav>
						</div>
						<section>
							<nav class="navbar navbar-expand-lg justify-content-left">
								<ul class="navbar-nav">
									<c:if test="${ empty sessionScope.loginUser }">
										<li><a class="nav-link" href="loginView.do">로그인</a></li>
										<li><a class="nav-link" href="enrollView.do">회원가입</a></li>
									</c:if>
									<c:if test="${ !empty sessionScope.loginUser }">
										<li><a class="nav-link" href="logout.do">로그아웃</a></li>
										<li><a class="nav-link" href="myInfo.do">마이페이지</a></li>
									</c:if>
								</ul>
							</nav>
						</section>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- END HEADER SECTION -->



</body>
</html>