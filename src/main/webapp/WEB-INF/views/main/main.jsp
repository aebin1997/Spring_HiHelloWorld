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

<style>

.container11 {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #fff;
  flex-direction: column;
}

.title11 {
  font-size: 38px;
  color: #616161;
  font-style: italic;
  font-weight: 800;
}

.timeline {
  width: 100%;
  background-color: #fff;
  box-shadow: 0 5px 25px 5px rgba(0, 0, 0, 0.2);
}
.timeline .swiper-container {
  height: 600px;
  width: 100%;
  position: relative;
}
.timeline .swiper-wrapper {
  transition: 2s cubic-bezier(0.68, -0.4, 0.27, 1.34) 0.2s;
}
.timeline .swiper-slide {
  position: relative;
  color: #fff;
  overflow: hidden;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
}
.timeline .swiper-slide::after {
  content: "";
  position: absolute;
  z-index: 1;
  right: -115%;
  bottom: -10%;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
  box-shadow: -230px 0 150px 60vw rgba(0, 0, 0, 0.7);
  border-radius: 100%;
}
.timeline .swiper-slide-content {
  position: absolute;
  text-align: center;
  width: 80%;
  max-width: 310px;
  right: 50%;
  top: 13%;
  transform: translate(50%, 0);
  font-size: 12px;
  z-index: 2;
}
.timeline .swiper-slide .timeline-year {
  display: block;
  font-style: italic;
  font-size: 42px;
  margin-bottom: 50px;
  transform: translate3d(20px, 0, 0);
  color: #d4a024;
  font-weight: 300;
  opacity: 0;
  transition: 0.2s ease 0.4s;
}
.timeline .swiper-slide .timeline-title {
  font-weight: 800;
  font-size: 34px;
  margin: 0 0 30px;
  opacity: 0;
  transform: translate3d(20px, 0, 0);
  transition: 0.2s ease 0.5s;
}
.timeline .swiper-slide .timeline-text {
  line-height: 1.5;
  opacity: 0;
  transform: translate3d(20px, 0, 0);
  transition: 0.2s ease 0.6s;
}
.timeline .swiper-slide-active .timeline-year {
  opacity: 1;
  transform: translate3d(0, 0, 0);
  transition: 0.4s ease 1.6s;
}
.timeline .swiper-slide-active .timeline-title {
  opacity: 1;
  transform: translate3d(0, 0, 0);
  transition: 0.4s ease 1.7s;
}
.timeline .swiper-slide-active .timeline-text {
  opacity: 1;
  transform: translate3d(0, 0, 0);
  transition: 0.4s ease 1.8s;
}
.timeline .swiper-pagination {
  right: 15% !important;
  height: 100%;
  display: none;
  flex-direction: column;
  justify-content: center;
  font-style: italic;
  font-weight: 300;
  font-size: 18px;
  z-index: 1;
}
.timeline .swiper-pagination::before {
  content: "";
  position: absolute;
  left: -30px;
  top: 0;
  height: 100%;
  width: 1px;
  background-color: rgba(255, 255, 255, 0.2);
}
.timeline .swiper-pagination-bullet {
  width: auto;
  height: auto;
  text-align: center;
  opacity: 1;
  background: transparent;
  color: #d4a024;
  margin: 15px 0 !important;
  position: relative;
}
.timeline .swiper-pagination-bullet::before {
  content: "";
  position: absolute;
  top: 8px;
  left: -32.5px;
  width: 6px;
  height: 6px;
  border-radius: 100%;
  background-color: #d4a024;
  transform: scale(0);
  transition: 0.2s;
}
.timeline .swiper-pagination-bullet-active {
  color: #d4a024;
}
.timeline .swiper-pagination-bullet-active::before {
  transform: scale(1);
}
.timeline .swiper-button-next,
.timeline .swiper-button-prev {
  background-size: 20px 20px;
  top: 15%;
  width: 20px;
  height: 20px;
  margin-top: 0;
  z-index: 2;
  transition: 0.2s;
}
.timeline .swiper-button-prev {
  left: 10%;
  background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23d4a024'%2F%3E%3C%2Fsvg%3E");
}
.timeline .swiper-button-prev:hover {
  transform: translateX(-10px);
}
.timeline .swiper-button-next {
  right: 10%;
  background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23d4a024'%2F%3E%3C%2Fsvg%3E");
}
.timeline .swiper-button-next:hover {
  transform: translateX(5px);
}
@media screen and (min-width: 768px) {
  .timeline .swiper-slide::after {
    right: -30%;
    bottom: -8%;
    width: 240px;
    height: 50%;
    box-shadow: -230px 0 150px 50vw rgba(0, 0, 0, 0.7);
  }
  .timeline .swiper-slide-content {
    right: 30%;
    top: 50%;
    transform: translateY(-50%);
    width: 310px;
    font-size: 11px;
    text-align: right;
  }
  .timeline .swiper-slide .timeline-year {
    margin-bottom: 0;
    font-size: 32px;
  }
  .timeline .swiper-slide .timeline-title {
    font-size: 46px;
    margin: 0;
  }
  .timeline .swiper-pagination {
    display: flex;
  }
  .timeline .swiper-button-prev {
    top: 15%;
    left: auto;
    right: 15%;
    transform: rotate(90deg) translate(0, 10px);
  }
  .timeline .swiper-button-prev:hover {
    transform: rotate(90deg) translate(-3px, 10px);
  }
  .timeline .swiper-button-next {
    top: auto;
    bottom: 15%;
    right: 15%;
    transform: rotate(90deg) translate(0, 10px);
  }
  .timeline .swiper-button-next:hover {
    transform: rotate(90deg) translate(3px, 10px);
  }
}
@media screen and (min-width: 1024px) {
  .timeline .swiper-slide::after {
    right: -20%;
    bottom: -12%;
    width: 240px;
    height: 50%;
    box-shadow: -230px 0 150px 39vw rgba(0, 0, 0, 0.7);
  }
  .timeline .swiper-slide-content {
    right: 25%;
  }
}
</style>

  <script>
  window.console = window.console || function(t) {};
</script>

  
  
  <script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>



<style>
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
	
	
   
   
<script type="text/javascript">
   $(function() {
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
                           + "' style='color:black; float:left'>"
                           + decodeURIComponent(json.list[i].qa_title)
                                 .replace(/\+/gi, " ") /* 디코딩하면 공백이 +로 되기때문에  " " 공백으로 바꿔준다*/
                           + "</a></td><td> "+ json.list[i].qa_writer +" </td><td> "+ json.list[i].qa_create_date +" </td><td>"
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
      
</script>

<script type="text/javascript">
   $(function() {
      // 최근 등록된 공지글 3개 자동 출력되게 함
            $.ajax({
               url : "${ pageContext.request.contextPath }/ntop3.do", /* 절대경로 */
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
                           + json.list[i].nid
                           + "</td><td> "+ json.list[i].ntype +" </td><td><a href='${ pageContext.request.contextPath }/ndetail.do?nid="
                           + json.list[i].nid
                           + "' style='color:black; float:left'>"
                           + decodeURIComponent(json.list[i].ntitle)
                                 .replace(/\+/gi, " ") /* 디코딩하면 공백이 +로 되기때문에  " " 공백으로 바꿔준다*/
                           + "</a></td><td>"
                           + json.list[i].n_create_date + "</td><td> "+ json.list[i].ncount +" </td></tr>";
                  } //for in
                  $("#new_notice").html($("#new_notice").html() + values);
               },
               error : function(jqXHR, textstatus, errorthrown) {
                  console.log("error : " + jqxHHR + ", " + textstatus
                        + ", " + errorthrown);
               }
            });
   }); // jquery document ready
   //조회수 많은 인기 게시글출력되게 함
         $.ajax({
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
                        + "</td><td>"
                        + json.list[i].btype 
                        + "</td><td>"
                        + json.list[i].bwriter 
                        + "</td><td><a href='${ pageContext.request.contextPath }/bdetail.do?bid="
                        + json.list[i].bid
                        + "' style='color:black; float:left'>"
                        + decodeURIComponent(json.list[i].btitle)
                              .replace(/\+/gi, " ") /* 디코딩하면 공백이 +로 되기때문에  " " 공백으로 바꿔준다*/
                        + "</a></td><td>" + json.list[i].b_create_date
                        + "</td><td>" + json.list[i].bcount
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


<style>
table.table2 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}
table.table2 tr {
	width: 50px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
table.table2 td {
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>


<link rel="stylesheet" href="/hhw/resources/main/css/core.css" />
<link rel="stylesheet" href="/hhw/resources/main/css/icon-font.min.css" />
<link rel="stylesheet" href="/hhw/resources/main/css/style.css" />

<link rel="stylesheet" href="/hhw/resources/main/normalize.min.css" />
<link rel="stylesheet" href="/hhw/resources/main/swiper.min.css" />

<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />


</head>
<body>


	<jsp:include page="../common/header.jsp" />


	<div id="carouselExampleCaptions" class="carousel slide pointer-event" data-ride="carousel" style="margin-bottom:-250px;">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="/hhw/resources/images/pink.jpg" alt="First slide" style="width:100%; height:400px;">
					<div class="carousel-caption d-none d-md-block">
						<div class="home-single-slide-dec" style="width:1000px; top:-180px;">
							<h3 style="color:black; margin-left:80px;">Hi Hello World에 방문해주셔서 감사드립니다!</h3>
							<p class="text-capitalize" style="color:black; margin-left:-280px;"><b>저희 사이트에서는 자유롭게 코딩에 대한 문의를 할 수 있습니다.</b></p>
							<div class="home-single-slide-button" style="margin-top:20px; margin-left:-350px;">
								<a href="#" class="btn-style btn-filled" style="color:black;">코딩의뢰 하기</a>
								<a href="#" class="btn-style btn-filled" style="color:black;">포인트 충전하기</a>
							</div>
						</div>
					</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/hhw/resources/images/star.png" alt="Second slide" style="width:100%; height:400px;">
					<div class="carousel-caption d-none d-md-block">
						<div class="home-single-slide-dec" style="width:1000px; top:-180px;">
							<h3 style="color:white; margin-left:80px;">Hi Hello World에 방문해주셔서 감사드립니다!</h3>
							<p class="text-capitalize" style="color:white; margin-left:-280px;"><b>저희 사이트에서는 자유롭게 코딩에 대한 문의를 할 수 있습니다.</b></p>
							<div class="home-single-slide-button" style="margin-top:20px; margin-left:-350px;">
								<a href="#" class="btn-style btn-filled" style="color:white;">코딩의뢰 하기</a>
								<a href="#" class="btn-style btn-filled" style="color:white;">포인트 충전하기</a>
							</div>
						</div>
					</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/hhw/resources/images/qwer.png" alt="Third slide" style="width:100%; height:400px;">
				<div class="carousel-caption d-none d-md-block">
					<div class="home-single-slide-dec" style="width:1000px; top:-180px;">
							<h3 style="color:black; margin-left:80px;">Hi Hello World에 방문해주셔서 감사드립니다!</h3>
							<p class="text-capitalize" style="color:black; margin-left:-280px;"><b>저희 사이트에서는 자유롭게 코딩에 대한 문의를 할 수 있습니다.</b></p>
							<div class="home-single-slide-button" style="margin-top:20px; margin-left:-350px;">
								<a href="#" class="btn-style btn-filled" style="color:black;">코딩의뢰 하기</a>
								<a href="#" class="btn-style btn-filled" style="color:black;">포인트 충전하기</a>
							</div>
						</div>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">다음</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">이전</span>
		</a>
	</div>

	


<br>
<br>
		<!-- <hr style="clear: both; margin-top:20px;">
		float되있는거 해제
 -->
 
 


<style>
/* our services */
.section-title {
	position: relative
   position: relative
}
.section-title p {
	font-size: 16px;
	margin-bottom: 5px;
	font-weight: 400;
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
   padding-top: 100px;
}
.pb-100 {
	padding-bottom: 100px;
   padding-bottom: 100px;
}
.mb-100 {
	margin-bottom: 100px;
   margin-bottom: 100px;
}
.services {
	background-color: #FBFBFB;
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
   width: 50%;
   height: 2px;
   -webkit-transition: .3s;
   transition: .3s
}
.single-service:hover {
	box-shadow: 1px 3px 10px 0 rgba(0, 0, 0, 0.10)
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
   font-size: 20px;
   font-weight: 400;
   margin-bottom: 15px;
   text-transform: capitalize;
}
.single-service p {
	font-size: 15px;
	line-height: 1.8;
   font-size: 15px;
   line-height: 1.8;
}
</style>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<!-- our services -->
   <section class="services pt-100 pb-50" id="services">
      <div class="container">
         <div class="row" style="margin-bottom:-20px;">
            <div class="col-xl-6 mx-auto text-center" style="margin-bottom:-20px;">
               <div class="section-title mb-100">
                  <p>Hi Hello World</p>
                  <h4>OUR SERVICES</h4>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-lg-4 col-md-6">
               <!-- Single Service -->
               <div class="single-service">
                  <i class="fa fa fa-question"></i>
                  <h4>커뮤니티에 질문하세요!</h4>
                  <p>수정이 필요한 코드 또는 만들고 싶은 프로젝트를 게시하세요!</p>
               </div>
            </div>
            <div class="col-lg-4 col-md-6">
               <!-- Single Service -->
               <div class="single-service">
                  <i class="fa fa-handshake-o"></i>
                  <h4>질문에 답하고 point 얻자!</h4>
                  <p>의뢰인의 게시글을 확인하고 목표기한과 금액을 확인하고 컨텍하세요!</p>
               </div>
            </div>
            <div class="col-lg-4 col-md-6">
               <!-- Single Service -->
               <div class="single-service">
                  <i class="fa fa-commenting-o"></i>
                  <h4>의뢰자는 답변자의 경력 확인!</h4>
                  <p>의뢰자는 요청이 온 답변자의 정보를 확인하고 1:1 대화를 보내세요!</p>
               </div>
            </div>
            <div class="col-lg-4 col-md-6">
               <!-- Single Service -->
               <div class="single-service">
                  <i class="fa fa-users"></i>
                  <h4>구체적인 토의를 통해 목표 설정!</h4>
                  <p>의뢰자와 답변자는 목표기한과 기능, 포인트를 구체적으로 상의하세요!</p>
               </div>
            </div>
            <div class="col-lg-4 col-md-6">
               <!-- Single Service -->
               <div class="single-service">
                  <i class="fa fa-weixin"></i>
                  <h4>진행사항을 수시로 확인하고 검토!</h4>
                  <p>답변자는 수시로 진행사항을 요구자에게 알려주며 수정사항을 최소화 하세요!</p>
               </div>
            </div>
            <div class="col-lg-4 col-md-6">
               <!-- Single Service -->
               <div class="single-service">
                  <i class="fa fa-thumbs-o-up"></i>
                  <h4>답변자의 평점을 작성하세요!</h4>
                  <p>의뢰자는 답변자의 평점과 만족도를 점수를 주어 답변자의 경력을 올려주세요!</p>
               </div>
            </div>
         </div>
      </div>
   </section>

			<!-- 사이트 정보 퍼센트로 나타내보앗음 -->
			<section style="background-color:#f2f0f0; padding-top:30px; padding-bottom:50px;">
				<div class="row" style="margin-top:30px; margin-bottom:-100px;">
		            <div class="col-xl-6 mx-auto text-center" style="margin-bottom:-20px;">
		               <div class="section-title mb-100">
		                  <p>Hi Hello World</p>
		                  <h4>사이트 이용자 만족도 조사</h4>
		               </div>
		            </div>
	         	</div>
	         	<div style="width:1200px; margin-top:50px; margin-left:400px;">
					<div class="row clearfix progress-box">
						<div class="col-lg-3 col-md-6 col-sm-12 mb-30" style="float:left;">
							<div class="card-box pd-30 height-100-p">
								<div class="progress-box text-center">
									 <input type="text" class="knob dial1" value="95" data-width="200" data-height="200" data-linecap="round" data-thickness="0.12" data-bgColor="#fff" data-fgColor="#1b00ff" data-angleOffset="180" readonly style="color:#f2e9e9;">
									<h3 class="text-blue padding-top-10 h3" style="margin-top:20px;">코딩의뢰 답변률</h3>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-12 mb-30" style="float:left;">
							<div class="card-box pd-30 height-100-p">
								<div class="progress-box text-center">
									 <input type="text" class="knob dial2" value="70" data-width="200" data-height="200" data-linecap="round" data-thickness="0.12" data-bgColor="#fff" data-fgColor="#00e091" data-angleOffset="180" readonly>
									<h3 class="text-light-green padding-top-10 h3" style="margin-top:20px;">프로젝트 매칭률</h3>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-12 mb-30" style="float:left;">
							<div class="card-box pd-30 height-100-p">
								<div class="progress-box text-center">
									 <input type="text" class="knob dial3" value="90" data-width="200" data-height="200" data-linecap="round" data-thickness="0.12" data-bgColor="#fff" data-fgColor="#f56767" data-angleOffset="180" readonly>
									<h3 class="text-light-orange padding-top-10 h3" style="margin-top:20px;">프로젝트 성공률</h3>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-12 mb-30" style="float:left;">
							<div class="card-box pd-30 height-100-p">
								<div class="progress-box text-center">
									 <input type="text" class="knob dial4" value="65" data-width="200" data-height="200" data-linecap="round" data-thickness="0.12" data-bgColor="#fff" data-fgColor="#a683eb" data-angleOffset="180" readonly>
									<h3 class="text-light-purple padding-top-10 h3" style="margin-top:20px;">만족도</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			
						
			<div style="padding-top:30px;padding-bottom:30px; width:100%;">
			  <div class="container11" >
			  <h1 class="title11" style="padding-bottom:30px;">Our Team Project Timeline</h1>
			  <div class="timeline">
			    <div class="swiper-container">
			      <div class="swiper-wrapper" >
			        <div class="swiper-slide" style="background-image: url(/hhw/resources/images/t-1.jpg); background-size:contain;" data-year="2021-01">
			          <div class="swiper-slide-content"><span class="timeline-year">1.11. ~ 1.15.</span>
			            <h4 class="timeline-title" style="color:#fff;">프로젝트 기획 회의</h4>
			          </div>
			        </div>
			        <div class="swiper-slide" style="background-image: url(/hhw/resources/images/t-2.jpg);background-size:contain;" data-year="2021-01">
			          <div class="swiper-slide-content"><span class="timeline-year">1.18. ~ 1.11.</span>
			            <h4 class="timeline-title" style="color:#fff;">UI 설계 기간</h4>
			          </div>
			        </div>
			        <div class="swiper-slide" style="background-image: url(/hhw/resources/images/t-3.jpg);background-size:contain;" data-year="2021-01">
			          <div class="swiper-slide-content"><span class="timeline-year">1.25. ~ 1.29.</span>
			            <h4 class="timeline-title" style="color:#fff;">DB 설계 기간</h4>
			          </div>
			        </div>
			        <div class="swiper-slide" style="background-image: url(/hhw/resources/images/t-4.png);background-size:contain;" data-year="2021-02">
			          <div class="swiper-slide-content"><span class="timeline-year">2. 1. ~ 2. 5.</span>
			            <h4 class="timeline-title" style="color:#fff;">클래스 설계 기간</h4>
			          </div>
			        </div>
			        <div class="swiper-slide" style="background-image: url(/hhw/resources/images/t-5.jpeg);background-size:contain;" data-year="2021-03">
			          <div class="swiper-slide-content"><span class="timeline-year">2. 8. ~ 3. 4.</span>
			            <h4 class="timeline-title" style="color:#fff;">프로젝트 구현</h4>
			          </div>
			        </div>
			        <div class="swiper-slide" style="background-image: url(/hhw/resources/images/t-6.png);background-size:contain;" data-year="2021-03">
			          <div class="swiper-slide-content"><span class="timeline-year">3. 5.</span>
			            <h4 class="timeline-title" style="color:#fff;">프로젝트 발표</h4>
			          </div>
			        </div>
			      </div>
			      <div class="swiper-button-prev"></div>
			      <div class="swiper-button-next"></div>
			      <div class="swiper-pagination"></div>
			    </div>
			  </div>
			</div>
			</div>
  
  
  <!-- START TEAM SECTION -->
    <section id="team" class="section-padding bg-gray">
        <div class="container">
			<div class="row" style="margin-bottom:-100px;">
				<div class="col-12 text-center">
					<div class="section-title">
						<h5>our masters</h5>
						<h3>TEAM <span>COCA</span></h3>
					</div>
				</div>
			</div>
			<!-- end section title -->	 
			<div class="row text-center">
				<div class="team-slider owl-carousel owl-theme">
					<div class="single-team-wrapper">
						<div class="single-team">
							<div class="single-team-img">
								<img class="img-fluid" src="/hhw/resources/images/profile/kimwoolina.jpg" alt="">
								<div class="single-team-social">
									<ul>
									   <li><a class="sicon1" href="https://www.instagram.com/kimwoolina/"><i class="fa fa-instagram"></i></a></li>
									   <li><a class="sicon2" href="https://github.com/kimwoolina"><i class="fa fa-github"></i></a></li>
									   <li><a class="sicon3" href="#"><i class="fa fa-facebook-official"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="single-team-meta">
								<h4>LINA</h4>
								<span>Lead Developer</span>
								<p>회원가입, 로그인, 로그아웃, 마이페이지,<br> 아이디찾기, 비밀번호 찾기(임시 비밀번호<br> 생성, 임시 비밀번호 메일로 전송),<br> 소셜 계정으로 로그인, 진행 페이지, <br>리뷰게시판, 실시간 채팅, 팀 로고 디자인</p>
							</div>	
						</div>							
					</div>
					<!-- end col -->
					<div class="single-team-wrapper">
						<div class="single-team">
							<div class="single-team-img">
								<img class="img-fluid" src="/hhw/resources/images/profile/hwangkyungpil.jpg" alt="">
								<div class="single-team-social">
									<ul>
									   <li><a class="sicon1" href="#"><i class="fa fa-instagram"></i></a></li>
									   <li><a class="sicon2" href="https://github.com/powrober"><i class="fa fa-github"></i></a></li>
									   <li><a class="sicon3" href="#"><i class="fa fa-facebook-official"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="single-team-meta">
								<h4>PHILIP</h4>
								<span>UI/UX Developer</span>
								<p>메인페이지, 신고 기능, 공지사항,<br> 자유게시판, CSS</p>
							</div>	
						</div>							
					</div>
					<!-- end col -->
					<div class="single-team-wrapper">
						<div class="single-team">
							<div class="single-team-img">
								<img class="img-fluid" src="/hhw/resources/images/profile/choieunyoung.jpg" alt="">
								<div class="single-team-social">
									<ul>
									   <li><a class="sicon1" href="#"><i class="fa fa-instagram"></i></a></li>
									   <li><a class="sicon2" href="https://github.com/eunyoung2054"><i class="fa fa-github"></i></a></li>
									   <li><a class="sicon3" href="#"><i class="fa fa-facebook-official"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="single-team-meta">
								<h4>ELLA</h4>
								<span>Markup Engineer</span>
								<p>메인페이지, about us, 사이트 사용법,<br> 에러페이지, 사이트 로고 디자인</p>
							</div>	
						</div>							
					</div>
					<!-- end col -->
					<div class="single-team-wrapper">
						<div class="single-team">
							<div class="single-team-img">
								<img class="img-fluid" src="/hhw/resources/images/profile/kangseonlee.jpg" alt="">
								<div class="single-team-social">
									<ul>
									   <li><a class="sicon1" href="#"><i class="fa fa-instagram"></i></a></li>
									   <li><a class="sicon2" href="https://github.com/leekangseon4954"><i class="fa fa-github"></i></a></li>
									   <li><a class="sicon3" href="#"><i class="fa fa-facebook-official"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="single-team-meta">
								<h4>JAMES</h4>
								<span>Software Engineer</span>
								<p>의뢰페이지, FAQ, contact페이지</p>
							</div>	
						</div>							
					</div>
					<!-- end col -->
					<div class="single-team-wrapper">
						<div class="single-team">
							<div class="single-team-img">
								<img class="img-fluid" src="/hhw/resources/images/profile/aebinpark.jpg" alt="">
								<div class="single-team-social">
									<ul>
									   <li><a class="sicon1" href="#"><i class="fa fa-instagram"></i></a></li>
									   <li><a class="sicon2" href="https://github.com/aebin"><i class="fa fa-github"></i></a></li>
									   <li><a class="sicon3" href="#"><i class="fa fa-facebook-official"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="single-team-meta">
								<h4>AEBIN</h4>
								<span>Software Engineer</span>
								<p>마이페이지, 결제 , 포인트 관리</p>
							</div>	
						</div>							
					</div>
					<!-- end col -->	
				</div>
			</div>
			<!-- end row -->
        </div>
        <!--- END CONTAINER -->
    </section>
    <!-- END TEAM SECTION -->
  
  <!-- 	<hr style="clear: both;">
 -->	<!-- float되있는거 해제 -->
	
		<section style="margin: 250px; padding-top: 40px; float: center; color:#fff;">
			
			<%-- 최근 공지글 3개 자동 조회 출력 : ajax 사용 --%>
		      <div style="width: 600px; height: 280px; float: left; /* border: 1px solid navy; */ disply: block;">
		         <h4 style="text-align: center; margin-bottom:15px; margin-top:20px;">새로운 공지글</h4>
		         <table id="new_notice" border="1" align="center" cellpadding="2" cellspacing="0" width="550" style="text-align: center; color:black; font-size:15px;">
		            <tr >
		            	<th style="text-align: center;" width="50px">번호</th>
		            	<th style="text-align: center;" width="80px">말머리</th>
		            	<th style="text-align: center;" width="300px">제           목</th>
		            	<th style="text-align: center;" width="90px">날짜</th>	
		            	<th style="text-align: center;" width="60px">조회수</th>	
		            </tr>
		         </table>
		      </div>
				
			<!-- <hr style="clear: both; color:#fff; opacity:0;">	 -->
			<%-- 자주묻는 코딩 3개 자동 조회 출력 : ajax 사용 --%>
			<div style="width: 600px; height: 280px; float: left; /* border: 1px solid navy;  */disply: block; margin-left:10px;">
				<h4 style="text-align: center; margin-bottom:15px; margin-top:20px;">자주 묻는 코딩</h4>
				<table id="top_qa" border="1" align="center" cellpadding="2" cellspacing="0" width="550" style="text-align: center; color:black; font-size:15px;">
					<tr>
						<th style="text-align: center;" >번호</th>
						<th style="text-align: center;" >제목</th>
						<th style="text-align: center;" >작성자</th>
						<th style="text-align: center;" >날짜</th>
						<th style="text-align: center;" >조회수</th>
					</tr>
				</table>
			</div>
		
		    <hr style="clear: both; opacity:0;">
			<%-- 인기 게시글 3개 자동 조회 출력 : ajax 사용 --%>
			<div style="width: 600px; height: 280px; float: left; /* border: 1px solid navy; */ disply: block; margin-top:10px;">
				<h4 style="text-align: center; margin-bottom:15px; margin-top:20px;">인기 게시글</h4>
				<table id="top_board" border="1" align="center" cellpadding="2" cellspacing="0" width="550" style="text-align: center; color:black; font-size:15px;">
					<tr>
						<th style="text-align: center;" >번호</th>
						<th style="text-align: center;" >말머리</th>
						<th style="text-align: center;">작성자</th>
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">작성일</th>
						<th style="text-align: center;">조회수</th>
					</tr>
				</table>
			</div>
		</section>


<script src="/hhw/resources/main/core.js"></script>
<script src="/hhw/resources/main/layout-settings.js"></script>
<script src="/hhw/resources/main/process.js"></script>
<script src="/hhw/resources/main/script.min.js"></script>
<script src="/hhw/resources/main/jquery.knob.min.js"></script>
<script src="/hhw/resources/main/knob-chart-setting.js"></script>

<script src="/hhw/resources/main/swiper.min.js"></script>
<script src="/hhw/resources/main/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

   <script id="rendered-js" >
var timelineSwiper = new Swiper('.timeline .swiper-container', {
  direction: 'vertical',
  loop: false,
  speed: 1600,
  pagination: '.swiper-pagination',
  paginationBulletRender: function (swiper, index, className) {
    var year = document.querySelectorAll('.swiper-slide')[index].getAttribute('data-year');
    return '<span class="' + className + '">' + year + '</span>';
  },
  paginationClickable: true,
  nextButton: '.swiper-button-next',
  prevButton: '.swiper-button-prev',
  breakpoints: {
    768: {
      direction: 'horizontal' } } });
//# sourceURL=pen.js
    </script>

		<jsp:include page="../common/footer.jsp" />
</body>
</html>