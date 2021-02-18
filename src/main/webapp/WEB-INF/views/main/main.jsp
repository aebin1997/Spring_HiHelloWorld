<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hi Hello World</title>
<!-- 많이 묻는 질문 -->
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$
				.ajax({
					url : "${ pageContext.request.contextPath }/qatop3.do", /* 절대경로 */
					type : "post",
					dataType : "json",
					success : function(data) {
						console.log("success : " + data);

						// object ==> string
						var jsonStr = JSON.stringify(data);
						// string ==> json
						var json = JSON.parse(jsonStr);

						var values = "";
						for ( var i in json.list) {
							values += "<tr><td>"
									+ json.list[i].qa_id
									+ "</td><td><a href='${ pageContext.request.contextPath }/qadetail.do?qadetail="
									+ json.list[i].qa_id
									+ "'>"
									+ decodeURIComponent(json.list[i].qa_title)
											.replace(/\+/gi, " ") /* 디코딩하면 공백이 +로 되기때문에  " " 공백으로 바꿔준다*/
									+ "</a></td><td>"
									+ json.list[i].qa_readcount + "</td></tr>";
						} //for in

						$("#top_qa").html($("#top_qa").html() + values);
					},
					error : function(jqXHR, textstatus, errorthrown) {
						console.log("error : " + jqXHR + ", " + textstatus
								+ ", " + errorthrown);
					}
				});
	});

	//조회수 많은 인기 게시글출력되게 함
	$
			.ajax({
				url : "${ pageContext.request.contextPath }/btop3.do", /* 절대경로 */
				type : "post",
				dataType : "json",
				success : function(data) {
					console.log("success : " + data);
					// object ==> string
					var jsonStr = JSON.stringify(data);
					// string ==> json
					var json = JSON.parse(jsonStr);
					var values = "";
					for ( var i in json.list) {
						values += "<tr><td>"
								+ json.list[i].bid
								+ "</td><td><a href='${ pageContext.request.contextPath }/bdetail.do?bid="
								+ json.list[i].bid
								+ "'>"
								+ decodeURIComponent(json.list[i].btitle)
										.replace(/\+/gi, " ") /* 디코딩하면 공백이 +로 되기때문에  " " 공백으로 바꿔준다*/
								+ "</a></td><td>" + json.list[i].bcount
								+ "</td></tr>";
					} //for in
					$("#top_board").html($("#top_board").html() + values);
				},
				error : function(jqXHR, textstatus, errorthrown) {
					console.log("error : " + jqxHHR + ", " + textstatus + ", "
							+ errorthrown);
				}
			});
</script>

</head>
<body>


	<jsp:include page="../common/header.jsp" />


	<!-- START SLIDER SECTION -->
	<section class="slider-section">
		<div class="home-slides-2 owl-carousel owl-theme ">
			<div class="home-single-slide"
				data-background="/hhw/resources/images/test1.jpg">
				<div class="home-slide-overlay"></div>
				<div class="home-single-slide-inner">
					<div class="container">
						<div class="row">
							<div class="col-lg-7 col-md-10 col-12 mr-auto text-left">
								<div class="home-single-slide-dec">
									<h2>Hi Hello World에 방문해주셔서 감사드립니다!</h2>
									<p class="text-capitalize">저희 사이트에서는 자유롭게 코딩에 대한 문의를 할 수
										있습니다.</p>
									<div class="home-single-slide-button">
										<a href="#" class="btn-style btn-filled">코딩의뢰 하기</a> <a
											href="#" class="btn-style btn-border">포인트 충전하기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end single slider -->
			<div class="home-single-slide"
				data-background="/hhw/resources/images/test2.jpg">
				<div class="home-slide-overlay"></div>
				<div class="home-single-slide-inner">
					<div class="container">
						<div class="row">
							<div class="col-lg-7 col-md-10 col-12 mr-auto text-left">
								<div class="home-single-slide-dec">
									<h2>Hi Hello World에 방문해주셔서 감사드립니다!</h2>
									<p class="text-capitalize">저희 사이트에서는 자유롭게 코딩에 대한 문의를 할 수
										있습니다.</p>
									<div class="home-single-slide-button">
										<a href="#" class="btn-style btn-filled">코딩의뢰 하기</a> <a
											href="#" class="btn-style btn-border">포인트 충전하기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end single slider -->
			<div class="home-single-slide"
				data-background="/hhw/resources/images/test3.jpg">
				<div class="home-slide-overlay"></div>
				<div class="home-single-slide-inner">
					<div class="container">
						<div class="row">
							<div class="col-lg-7 col-md-10 col-12 mr-auto text-left">
								<div class="home-single-slide-dec">
									<h2>Hi Hello World에 방문해주셔서 감사드립니다!</h2>
									<p class="text-capitalize">저희 사이트에서는 자유롭게 코딩에 대한 문의를 할 수
										있습니다.</p>
									<div class="home-single-slide-button">
										<a href="#" class="btn-style btn-filled">코딩의뢰 하기</a> <a
											href="#" class="btn-style btn-border">포인트 충전하기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end single slider -->
		</div>


		<hr style="clear: both;">
		<!-- float되있는거 해제 -->
		<section>
			<%-- 인기 게시글 3개 자동 조회 출력 : ajax 사용 --%>
			<div style="float: left; board: 1px solid olive; padding: 5px; margin: 5px;">
				<h4>자주 묻는 코딩</h4>
				<table id="top_qa" border="1" cellspacing="0">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>조회수</th>
					</tr>
				</table>
			</div>

			<%-- 인기 게시글 3개 자동 조회 출력 : ajax 사용 --%>
			<div
				style="float: left; border: 1px solid navy; padding: 5px; margin: 5px;">
				<h4>인기 게시글</h4>
				<table id="top_board" border="1" cellspacing="0">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>조회수</th>
					</tr>
				</table>
			</div>

		</section>


		<br>

		<!-- our services -->
		<section class="services pt-100 pb-50" id="services">
			<div class="container">
				<div class="row">
					<div class="col-xl-6 mx-auto text-center">
						<div class="section-title mb-100">
							<p>who we are</p>
							<h4>OUR SERVICES</h4>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 col-md-6">
						<!-- Single Service -->
						<div class="single-service">
							<i class="fa fa-laptop"></i>
							<h4>반갑습니다</h4>
							<p>새해복많이받으세요 모두 건강한 한해 되시길 바라겠습니다 happy new year good day
								수고하세요</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<!-- Single Service -->
						<div class="single-service">
							<i class="fa fa-gears"></i>
							<h4>Web Development</h4>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry typesetting industry</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<!-- Single Service -->
						<div class="single-service">
							<i class="fa fa-mobile"></i>
							<h4>Responsive Design</h4>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry typesetting industry</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<!-- Single Service -->
						<div class="single-service">
							<i class="fa fa-magic"></i>
							<h4>Graphic Design</h4>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry typesetting industry</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<!-- Single Service -->
						<div class="single-service">
							<i class="fa fa-pencil"></i>
							<h4>Creative Design</h4>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry typesetting industry</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<!-- Single Service -->
						<div class="single-service">
							<i class="fa fa-fa fa-lightbulb-o"></i>
							<h4>Branding</h4>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry typesetting industry</p>
						</div>
					</div>
				</div>
			</div>
		</section>

		<jsp:include page="../common/footer.jsp" />
</body>
</html>