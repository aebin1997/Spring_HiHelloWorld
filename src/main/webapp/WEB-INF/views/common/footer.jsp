<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<!-- START FOOTER -->
	<footer>
		<!--Footer top -->
		<div class="footer-top overlay section-back-image-2"
			data-background="#">
			<div class="auto-container">
				<div class="row">
					<div
						class="col-lg-3 col-md-6 col-sm-12 col-12 mb-lg-0 mb-md-5 mb-5 footer-widget">
						<div class="footer-logo col-12 p-0">
								<div class="footer-logo-text">
									<h3>Hi Hello World!</h3>
									<p>Developer Community</p>
								</div>
						</div>
						<div class="about mb-2">
							<p>개발자 또는 개발에 관심이 있는<br> 사람들이 의견을 주고 받는<br> 커뮤니티 사이트</p>
						</div>
					</div>
					<!-- End Widget -->
					<div
						class="col-lg-3 col-md-6 col-sm-12 col-12 mb-lg-0 mb-md-5 mb-5 footer-widget">
						<div class="footer-section-title col-12 no-padding">
							<h3>Quick Links</h3>
						</div>
						<!-- END SECTION TITLE -->
																	
																	
												<c:url var="qalist" value="qalist.do">
													<c:param name="page" value="1"/>
												</c:url>
												<c:url var="blist" value="blist.do">
													<c:param name="page" value="1" />
												</c:url>
												<c:url var="nlist" value="nlist.do">
													<c:param name="page" value="1" />
												</c:url>
												<c:url var="revlist" value="revlist.do">
													<c:param name="page" value="1" />
												</c:url>
												<c:url var="admin" value="admin.do">
													<c:param name="page" value="1" />
												</c:url>
												<c:url var="blame" value="b.blame.list.do">
													<c:param name="page" value="1" />
												</c:url>
												<c:url var="about" value="aboutUs.do">
													<c:param name="page" value="1" />
												</c:url>
		
						<div class="col-12 footer-widget-inner">
							<ul class="quick-link-list">
								<li><a href="${ nlist }"><i class="fa fa-chevron-circle-right"></i>
										공지사항</a></li>
								<li><a href="${ blist }"><i class="fa fa-chevron-circle-right"></i>
										자유게시판</a></li>
								<li><a href="${ revlist }"><i class="fa fa-chevron-circle-right"></i>
										리뷰게시판</a></li>
								<li><a href="${ qalist }"><i class="fa fa-chevron-circle-right"></i>
										코딩의뢰</a></li>
								<li><a href="${ about }"><i class="fa fa-chevron-circle-right"></i>
										About Us</a></li>
								<li><a href="contact.move"><i class="fa fa-chevron-circle-right"></i>
										CONTACT </a></li>
							</ul>
						</div>
					</div>
					<!-- End Widget -->
					<br><br><br><br><br>
					<!-- End Widget -->
					<div class="col-lg-3 col-md-6 col-sm-12 col-12 mb-0 footer-widget">
						<div class="footer-section-title col-12 no-padding">
							<h3>Stay With Us</h3>
						</div>
						<!-- END SECTION TITLE -->
						<div class="col-12 footer-widget-inner">
							<div class="single-fcontact mb-2">
								<div class="single-fcontact-icon">
									<i class="icofont icofont-pin"></i>
								</div>
								<div class="single-fcontact-des">
									<h6>Compnay Name:</h6>
									<p>서울시 마포구 양화로 127, 첨단빌딩 7층 </p>
								</div>
							</div>
							<div class="single-fcontact mb-2">
								<div class="single-fcontact-icon">
									<i class="icofont icofont-mobile-phone"></i>
								</div>
								<div class="single-fcontact-des">
									<h6>Phone Number:</h6>
									<p>123-456-0975</p>
								</div>
							</div>
							<div class="single-fcontact">
								<div class="single-fcontact-icon">
									<i class="icofont icofont-eye-alt"></i>
								</div>
								<div class="single-fcontact-des">
									<h6>Door Open:</h6>
									<p>Mon - Sun : 09:00 - 18:00</p>
								</div>
							</div>
						</div>
						<div class="col-12 mt-4 footer-social-war">
							<div class="footer-social">
								<ul>
									<li><a href="#"><i
											class="fa fa-youtube-play"></i></a></li>
									<li><a href="#"><i
											class="fa fa-github"></i></a></li>
									<li><a href="#"><i
											class="fa fa-facebook-official"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Widget -->
				</div>
			</div>
		</div>


		<div class="copyright">
			<div class="auto-container">
				<div class="row">
					
				</div>
			</div>
		</div>
		</div>
	</footer>

</body>
</html>