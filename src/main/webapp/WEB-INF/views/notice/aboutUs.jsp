<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href='/hhw/resources/css/reboot.css' rel='stylesheet' type='text/css'>
<meta charset="UTF-8">
<meta name="Author" content="eunyouung and kimwoolina">
<title>About us</title>
<style>
.how-section1 {
	margin-top: -15%;
	padding: 10%;
	margin-left: 10%;
	margin-right: 10%;
}

.how-section1 h4 {
	color: #ffa500;
	font-weight: bold;
	font-size: 30px;
}

.how-section1 .subheading {
	color: #3931af;
	font-size: 20px;
}

.how-section1 .row {
	margin-top: 10%;
}

.how-img {
	text-align: center;
}

.how-img img {
	width: 40%;
}
</style>
<style>
.row.heading h2 {
	color: #fff;
	font-size: 52.52px;
	line-height: 95px;
	font-weight: 400;
	text-align: center;
	margin: 0 0 40px;
	padding-bottom: 20px;
	text-transform: uppercase;
}

ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

.heading.heading-icon {
	display: block;
}

.padding-lg {
	display: block;
	padding-top: 60px;
	padding-bottom: 60px;
}

.practice-area.padding-lg {
	padding-bottom: 55px;
	padding-top: 55px;
}

.practice-area .inner {
	border: 1px solid #999999;
	text-align: center;
	margin-bottom: 28px;
	padding: 40px 25px;
}

.our-webcoderskull .cnt-block:hover {
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
	border: 0;
}

.practice-area .inner h3 {
	color: #3c3c3c;
	font-size: 24px;
	font-weight: 500;
	font-family: 'Poppins', sans-serif;
	padding: 10px 0;
}

.practice-area .inner p {
	font-size: 14px;
	line-height: 22px;
	font-weight: 400;
}

.practice-area .inner img {
	display: inline-block;
}

.our-webcoderskull {
	background:
		url("http://www.webcoderskull.com/img/right-sider-banner.png")
		no-repeat center top/cover;
}

.our-webcoderskull .cnt-block {
	float: left;
	width: 100%;
	background: #fff;
	padding: 30px 20px;
	text-align: center;
	border: 2px solid #d5d5d5;
	margin: 0 0 28px;
}

.our-webcoderskull .cnt-block figure {
	width: 148px;
	height: 148px;
	border-radius: 100%;
	display: inline-block;
	margin-bottom: 15px;
}

.our-webcoderskull .cnt-block img {
	width: 148px;
	height: 148px;
	border-radius: 100%;
}

.our-webcoderskull .cnt-block h3 {
	color: #2a2a2a;
	font-size: 20px;
	font-weight: 500;
	padding: 6px 0;
	text-transform: uppercase;
}

.our-webcoderskull .cnt-block h3 a {
	text-decoration: none;
	color: #2a2a2a;
}

.our-webcoderskull .cnt-block h3 a:hover {
	color: #337ab7;
}

.our-webcoderskull .cnt-block p {
	color: #2a2a2a;
	font-size: 13px;
	line-height: 20px;
	font-weight: 400;
}

.our-webcoderskull .cnt-block .follow-us {
	margin: 20px 0 0;
}

.our-webcoderskull .cnt-block .follow-us li {
	display: inline-block;
	width: auto;
	margin: 0 5px;
}

.our-webcoderskull .cnt-block .follow-us li .fa {
	font-size: 24px;
	color: #767676;
}

.our-webcoderskull .cnt-block .follow-us li .fa:hover {
	color: #025a8e;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<c:url var="nlist" value="nlist.do">
		<c:param name="page" value="1" />
	</c:url>
	<c:url var="about" value="aboutUs.do">
		<c:param name="page" value="1" />
	</c:url>
	<c:url var="howto" value="howTo.do">
		<c:param name="page" value="1" />
	</c:url>
	<c:url var="faq" value="faq.move">
		<c:param name="page" value="1" />
	</c:url>

	<section class="breadcrumbs-custom-inset">
		<div class="breadcrumbs-custom context-dark bg-overlay-46">
			<div class="container">
				<h2 class="breadcrumbs-custom-title">About Us</h2>
				<ul class="breadcrumbs-custom-path">
					<li><a class="nav-link" href="${ nlist }">공지사항</a></li>
					<li><a class="nav-link" href="${ about }">About Us</a></li>
					<li><a class="nav-link" href="${ howto }">사이트 이용 방법</a></li>
					<li><a class="nav-link" href="${ faq }">FAQ</a></li>
				</ul>
			</div>
			<div class="box-position-1"
				style="background-image: url(/hhw/resources/images/5F5F5F.jpg);"></div>
		</div>
	</section>
	<!-- 중간 메뉴 바 끝-->

	<section style="padding: 100px 0 60px 0;">
		<!-- <link
			href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
			rel="stylesheet" id="bootstrap-css">
		<script
			src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script
			src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		---- Include the above in your HEAD tag -------- -->

		<div class="how-section1">
			<div class="row">
				<div class="col-md-6 how-img">
					<img
						src="https://image.ibb.co/dDW27U/Work_Section2_freelance_img1.png"
						class="rounded-circle img-fluid" alt="" />
				</div>
				<div class="col-md-6">					
					<h4>Find rewarding projects</h4>
                                        <h4 class="subheading">GetLance is a great place to find more clients, and to run and grow your own freelance business.</h4>
                        <p class="text-muted">Freedom to work on ideal projects. On GetLance, you run your own business and choose your own clients and projects. Just complete your profile and we’ll highlight ideal jobs. Also search projects, and respond to client invitations.
                                            Wide variety and high pay. Clients are now posting jobs in hundreds of skill categories, paying top price for great work.
                                            More and more success. The greater the success you have on projects, the more likely you are to get hired by clients that use GetLance.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<h4>Get hired quickly</h4>
					<h4 class="subheading">GetLance makes it easy to connect with clients and begin doing great work.</h4>
                                        <p class="text-muted">Streamlined hiring. GetLance’s sophisticated algorithms highlight projects you’re a great fit for.
                                            Top Rated and Rising Talent programs. Enjoy higher visibility with the added status of prestigious programs.
                                            Do substantial work with top clients. GetLance pricing encourages freelancers to use GetLance for repeat relationships with their clients.</p>
				</div>
				<div class="col-md-6 how-img">
					<img
						src="https://image.ibb.co/cHgKnU/Work_Section2_freelance_img2.png"
						class="rounded-circle img-fluid" alt="" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 how-img">
					<img
						src="https://image.ibb.co/ctSLu9/Work_Section2_freelance_img3.png"
						class="rounded-circle img-fluid" alt="" />
				</div>
				<div class="col-md-6">
					<h4>Work efficiently, effectively.</h4>
                                        <h4 class="subheading">With GetLance, you have the freedom and flexibility to control when, where, and how you work. Each project includes an online workspace shared by you and your client, allowing you to:</h4>
                                        <p class="text-muted">Send and receive files. Deliver digital assets in a secure environment.
                                            Share feedback in real time. Use GetLance Messages to communicate via text, chat, or video.
                                            Use our mobile app. Many features can be accessed on your mobile phone when on the go.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<h4>Get paid on time</h4>
					<h4 class="subheading">All projects include GetLance Payment
						Protection — helping ensure that you get paid for all work
						successfully completed through the freelancing website.</h4>
					<p class="text-muted">All invoices and payments happen through
						GetLance. Count on a simple and streamlined process. Hourly and
						fixed-price projects. For hourly work, submit timesheets through
						GetLance. For fixed-price jobs, set milestones and funds are
						released via GetLance escrow features. Multiple payment options.
						Choose a payment method that works best for you, from direct
						deposit or PayPal to wire transfer and more.</p>
				</div>
				<div class="col-md-6 how-img">
					<img
						src="https://image.ibb.co/gQ9iE9/Work_Section2_freelance_img4.png"
						class="rounded-circle img-fluid" alt="" />
				</div>
			</div>
		</div>
			<!-- <link
				href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
				rel="stylesheet" id="bootstrap-css">
			<script
				src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
			<script
				src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			---- Include the above in your HEAD tag --------

			<link rel="stylesheet"
				href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->

			<section class="our-webcoderskull padding-lg">
				<div class="container">
					<div class="row heading heading-icon">
						<h2>MEET OUR TEAM</h2>
					</div>
					<ul class="row">
						<li class="col-12 col-md-6 col-lg-3">
							<div class="cnt-block equal-hight" style="height: 349px;">
								<figure>
									<img src="/hhw/resources/images/profile/kimwoolina.jpg"
										class="img-responsive" alt="">
								</figure>
								<h3>
									<a href="http://www.webcoderskull.com/">LINA</a>
								</h3>
								<p>Lead Developer</p>
								<ul class="follow-us clearfix">
									<li><a href="https://www.instagram.com/kimwoolina/"><i class="fa fa-instagram"
											aria-hidden="true"></i></a></li>
									<li><a href="https://github.com/kimwoolina"><i class="fa fa-github"
											aria-hidden="true"></i></a></li>
									<li><a href="https://www.linkedin.com/in/lina-kim-3ba138198/"><i class="fa fa-linkedin"
											aria-hidden="true"></i></a></li>
								</ul>
							</div>
						</li>
						<li class="col-12 col-md-6 col-lg-3">
							<div class="cnt-block equal-hight" style="height: 349px;">
								<figure>
									<img src="/hhw/resources/images/profile/hwangkyungpil.jpg"
										class="img-responsive" alt="">
								</figure>
								<h3>
									<a href="#">PHILIP</a>
								</h3>
								<p>UI/UX Developer</p>
								<ul class="follow-us clearfix">
									<li><a href="https://www.instagram.com/hellokovi_koviin/"><i class="fa fa-instagram"
											aria-hidden="true"></i></a></li>
									<li><a href="https://github.com/powrober"><i class="fa fa-github"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-linkedin"
											aria-hidden="true"></i></a></li>
								</ul>
							</div>
						</li>
						<li class="col-12 col-md-6 col-lg-3">
							<div class="cnt-block equal-hight" style="height: 349px;">
								<figure>
									<img src="/hhw/resources/images/profile/choieunyoung.jpg"
										class="img-responsive" alt="">
								</figure>
								<h3>
									<a href="#">ELLA</a>
								</h3>
								<p>Markup Engineer</p>
								<ul class="follow-us clearfix">
									<li><a href="https://www.instagram.com/eun_0_99/"><i class="fa fa-instagram"
											aria-hidden="true"></i></a></li>
									<li><a href="https://github.com/eunyoung2054"><i class="fa fa-github"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-linkedin"
											aria-hidden="true"></i></a></li>
								</ul>
							</div>

						</li>
						<li class="col-12 col-md-6 col-lg-3">
							<div class="cnt-block equal-hight" style="height: 349px;">
								<figure>
									<img src="/hhw/resources/images/profile/kangseonlee.jpg"
										class="img-responsive" alt="">
								</figure>
								<h3>
									<a href="http://www.webcoderskull.com/">JAMES</a>
								</h3>
								<p>Software Engineer</p>
								<ul class="follow-us clearfix">
									<li><a href="https://www.instagram.com/rkdtjs4954/"><i class="fa fa-instagram"
											aria-hidden="true"></i></a></li>
									<li><a href="https://github.com/leekangseon4954"><i class="fa fa-github"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-linkedin"
											aria-hidden="true"></i></a></li>
								</ul>
							</div>
						</li>
						<li class="col-12 col-md-6 col-lg-3">
							<div class="cnt-block equal-hight" style="height: 349px;">
								<figure>
									<img src="/hhw/resources/images/profile/aebinpark.jpg"
										class="img-responsive" alt="">
								</figure>
								<h3>
									<a href="http://www.webcoderskull.com/">AEBIN</a>
								</h3>
								<p>Software Engineer</p>
								<ul class="follow-us clearfix">
									<li><a href="https://www.instagram.com/aebin.park/"><i class="fa fa-instagram"
											aria-hidden="true"></i></a></li>
									<li><a href="https://github.com/aebin"><i class="fa fa-github"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-linkedin"
											aria-hidden="true"></i></a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</section>
	</section>
	
	<!-- 푸터 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>