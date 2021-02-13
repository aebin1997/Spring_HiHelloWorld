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
	 $(function(){
		 $.ajax({
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
	                        + "</td><td><a href='${ pageContext.request.contextPath }/qadetail.do?qa_id="
	                        + json.list[i].qa_id
	                        + "'>"
	                        + decodeURIComponent(json.list[i].qa_title).replace(/\+/gi, " ") /* 디코딩하면 공백이 +로 되기때문에  " " 공백으로 바꿔준다*/
	                        + "</a></td><td>" + json.list[i].qa_readcount
	                        + "</td></tr>";
	               } //for in

	               $("#top_qa").html($("#top_qa").html() + values);
	            },
	            error : function(jqXHR, textstatus, errorthrown) {
	               console.log("error : " + jqXHR + ", " + textstatus + ", "
	                     + errorthrown);
	            }
	         });
	 });
		</script>


<style type="text/css">
.neon {
	text-shadow: -2px -2px 10px #fff, 2px 2px 10px #fff, 0 0 20px #f10, 0 0
		40px #f10, 0 0 60px #f10, 0 0 80px #f10, 0 0 100px #f10;
	box-shadow: 0 0 5px #fff, inset 0 0 5px #fff, 0 0 20px #08f, inset 0 0
		20px #08f, 0 0 40px #08f, inset 0 0 40px #08f;
}

/* our services */
.section-title {
	position: relative
}

.section-title p {
	font-size: 16px;
	margin-bottom: 5px;
	font-weight: 400;
}

.section-title h4 {
	font-size: 40px;
	font-weight: 600;
	text-transform: capitalize;
	position: relative;
	padding-bottom: 20px;
	display: inline-block
}

.section-title h4:before {
	position: absolute;
	content: "";
	width: 80px;
	height: 2px;
	background-color: #d8d8d8;
	bottom: 0;
	left: 50%;
	margin-left: -40px;
}

.section-title h4:after {
	position: absolute;
	content: "";
	width: 50px;
	height: 2px;
	background-color: #FF7200;
	left: 0;
	bottom: 0;
	left: 50%;
	margin-left: -25px;
}

.pt-100 {
	padding-top: 100px;
}

.pb-100 {
	padding-bottom: 100px;
}

.mb-100 {
	margin-bottom: 100px;
}

.services {
	background-color: #FBFBFB;
}

.single-service {
	position: relative;
	text-align: center;
	margin-bottom: 50px;
	-webkit-transition: .3s;
	transition: .3s;
	padding: 30px 20px;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.16)
}

.single-service:before {
	position: absolute;
	width: 0;
	height: 0;
	background-color: #FF7200;
	left: 0;
	top: 0;
	content: "";
	-webkit-transition: .3s;
	transition: .3s
}

.single-service:after {
	position: absolute;
	width: 0;
	height: 0;
	background-color: #FF7200;
	right: 0;
	bottom: 0;
	content: "";
	-webkit-transition: .3s;
	transition: .3s
}

.single-service:hover:after, .single-service:hover:before {
	width: 50%;
	height: 2px;
	-webkit-transition: .3s;
	transition: .3s
}

.single-service:hover {
	box-shadow: 1px 3px 10px 0 rgba(0, 0, 0, 0.10)
}

.single-service i.fa {
	font-size: 20px;
	width: 60px;
	height: 60px;
	border: 1px solid #ddd;
	line-height: 60px;
	margin-bottom: 30px;
	border-radius: 50%;
	-webkit-transition: .3s;
	transition: .3s
}

.single-service:hover i.fa {
	background-color: #FF7200;
	color: #fff;
	border-color: #FF7200;
	border-radius: 0;
}

.single-service h4 {
	font-size: 20px;
	font-weight: 400;
	margin-bottom: 15px;
	text-transform: capitalize;
}

.single-service p {
	font-size: 15px;
	line-height: 1.8;
}
</style>


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
      <div style="board:1px solid olive; padding: 5px; margin: 5px;">
         <h4>자주 묻는 코딩</h4>
         <table id="top_qa" border="1" cellspacing="0">
            <tr><th>번호</th><th>제목</th><th>조회수</th>
            </tr>
         </table>
      </div>
   </section>
<br style="clear:both;">

		<div style="text-align: center;justify-content:center;align-items:center;min-height:100vh;">
			<div>
				<h1 id="btn"
					style="font-size: 130px; font-weight: 200px; weight: 150px; padding: 40px 60px 55px; border: 4px solid #fff; cursor: pointer;">클릭하지마세요</h1>
				<script>
					var btn = document.getElementById("btn");

					btn.onclick = function() {
						if (btn.classList.contains("neon")) {
							btn.classList.remove("neon");
							btn.innerHTML = "클릭하지마세요";
						} else {
							btn.classList.add("neon");
							btn.innerHTML = "내 낙서장임";
						}
					}
				</script>
			</div>
		</div>
	
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