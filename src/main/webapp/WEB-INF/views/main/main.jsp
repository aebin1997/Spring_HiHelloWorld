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
				<img class="d-block w-100" src="/hhw/resources/images/test1.jpg" alt="First slide" style="width:100%; height:400px;">
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
				<img class="d-block w-100" src="/hhw/resources/images/test2.jpg" alt="Second slide" style="width:100%; height:400px;">
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
				<img class="d-block w-100" src="/hhw/resources/images/test1.jpg" alt="Third slide" style="width:100%; height:400px;">
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
				<table id="new_notice" border="1" align="center" cellpadding="2" cellspacing="0" width="550" style="text-align: center; color:black; font-size:15px;">
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
				<table id="new_notice" border="1" align="center" cellpadding="2" cellspacing="0" width="550" style="text-align: center; color:black; font-size:15px;">
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

<br>
<br>
		<!-- <hr style="clear: both; margin-top:20px;">
		float되있는거 해제
 -->

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

<style>

/*===== Vertical Timeline =====*/
#conference-timeline {
  position: relative;
  max-width: 920px;
  width: 100%;
  margin: 0 auto;
}
#conference-timeline .timeline-start,
#conference-timeline .timeline-end {
  display: table;
  font-family: "Roboto", sans-serif;
  font-size: 18px;
  font-weight: 900;
  text-transform: uppercase;
  background: #f7921a;
  padding: 15px 23px;
  color: #fff;
  max-width: 5%;
  width: 100%;
  text-align: center;
  margin: 0 auto;
}
#conference-timeline .conference-center-line {
  position: absolute;
  width: 3px;
  height: 100%;
  top: 0;
  left: 50%;
  margin-left: -2px;
  background: #f7921a;
  z-index: -1;
}
#conference-timeline .conference-timeline-content {
  padding-top: 67px;
  padding-bottom: 67px;
}
.timeline-article {
  width: 100%;
  height: 100%;
  position: relative;
  overflow: hidden;
  margin: 20px 0;
}
.timeline-article .content-left-container,
.timeline-article .content-right-container {
  max-width: 44%;
  width: 100%;
}
.timeline-article .timeline-author {
  display: block;
  font-weight: 400;
  font-size: 14px;
  line-height: 24px;
  color: #242424;
  text-align: right;
}
.timeline-article .content-left,
.timeline-article .content-right {
  position: relative;
  width: auto;
  border: 1px solid #ddd;
  background-color: #fff;
  box-shadow: 0 1px 3px rgba(0,0,0,.03);
  padding: 27px 25px;
}
.timeline-article p {
  margin: 0 0 0 60px;
  padding: 0;
  font-weight: 400;
  color: #242424;
  font-size: 14px;
  line-height: 24px;
  position: relative;
}
.timeline-article p span.article-number {
  position: absolute;
  font-weight: 300;
  font-size: 44px;
  top: 10px;
  left: -60px;
  color: #f7921a;
}
.timeline-article .content-left-container {
  float: left;
}
.timeline-article .content-right-container {
  float: right;
}
.timeline-article .content-left:before,
.timeline-article .content-right:before{
  position: absolute;
  top: 20px;
  font-size: 23px;
  font-family: "FontAwesome";
  color: #fff;
}
.timeline-article .content-left:before {
  content: "\f0da";
  right: -8px;
}
.timeline-article .content-right:before {
  content: "\f0d9";
  left: -8px;
}
.timeline-article .meta-date {
  position: absolute;
  top: 0;
  left: 50%;
  width: 62px;
  height: 62px;
  margin-left: -31px;
  color: #fff;
  border-radius: 100%;
  background: #f7921a;
}
.timeline-article .meta-date .date,
.timeline-article .meta-date .month {
  display: block;
  text-align: center;
  font-weight: 900;
}
.timeline-article .meta-date .date {
  font-size: 30px;
  line-height: 40px;
}
.timeline-article .meta-date .month {
  font-size: 18px;
  line-height: 10px;
}
/*===== // Vertical Timeline =====*/

/*===== Resonsive Vertical Timeline =====*/
@media only screen and (max-width: 830px) {
  #conference-timeline .timeline-start,
  #conference-timeline .timeline-end {
    margin: 0;
  }
  #conference-timeline .conference-center-line {
    margin-left: 0;
    left: 50px;
  }
  .timeline-article .meta-date {
    margin-left: 0;
    left: 20px;
  }
  .timeline-article .content-left-container,
  .timeline-article .content-right-container {
    max-width: 100%;
    width: auto;
    float: none;
    margin-left: 110px;
    min-height: 53px;
  }
  .timeline-article .content-left-container {
    margin-bottom: 20px;
  }
  .timeline-article .content-left,
  .timeline-article .content-right {
    padding: 10px 25px;
    min-height: 65px;
  }
  .timeline-article .content-left:before {
    content: "\f0d9";
    right: auto;
    left: -8px;
  }
  .timeline-article .content-right:before {
    display: none;
  }
}
@media only screen and (max-width: 400px) {
  .timeline-article p {
    margin: 0;
  }
  .timeline-article p span.article-number {
    display: none;
  }
  
}
/*===== // Resonsive Vertical Timeline =====*/
</style>
 <!-- Vertical Timeline -->
  <br>
  <section id="conference-timeline">
    <div class="timeline-start">START</div>
     <div class="conference-center-line"></div>
    <div class="conference-timeline-content">
      <!-- Article -->
      <div class="timeline-article">
        <div class="content-left-container">
          <div class="content-left">
            <p>수정이 필요한 코딩 또는 원하는 프로젝트, 목표기한, 임무 완료시 제공할 금액을 명시<span class="article-number">01</span></p>
          </div>
          <br><br><br>
        </div>
        <br>
        <div class="content-right-container">
          <div class="content-right">
            <p>의뢰인의 글을 확인하고 목표기한 내 기능을 구현할 수 있으면 댓글로 의사를 표현<span class="article-number">02</span></p>
          </div>               
        </div>
         <br>
        <div class="meta-date">
        <br>
          <span class="date"></span>
          <span class="month"></span>
        </div>
      </div>
      <!-- // Article -->
      
      <!-- Article -->
      
      <div class="timeline-article">
        <div class="content-left-container">
          <div class="content-left">          
            <p> 댓글을 작성한 답변자의 개인 스펙(평점)을 확인하고 1 : 1 대화를 보낼 수 있어요 <span class="article-number">03</span></p>
          </div>   
           <br><br><br>       
        </div>
        <br>
        <div class="content-right-container">
          <div class="content-right">
            <p>1 : 1 대화를 통해서 구체적인 구현 기능과 목표 기한, 금액을 의논하고 진행합니다.<span class="article-number">04</span></p>
          </div>         
        </div>
        <br>
        <div class="meta-date">
        <br>
          <span class="date"></span>
          <span class="month"></span>
        </div>
      </div>
      <!-- // Article -->
      
      <!-- Article -->
      <div class="timeline-article">
        <div class="content-left-container">
          <div class="content-left">
            <p>진행사항을 수시로 확인하며 수정사항을 최소화 하세요.<span class="article-number">05</span></p>
          </div>  
           <br><br><br>        
        </div>
        <br>
        <div class="content-right-container">
          <div class="content-right">
            <p>목표기한에 원하는 기능이 구현되었으면, 결제를 통해 답변자에게 포인트가 지급되며, 평점을 작성해주세요<span class="article-number">06</span></p>
          </div>          
        </div>
        <br>   
        <div class="meta-date">        
          <span class="date"></span>
          <span class="month"></span>
        </div>
      </div>
      <!-- // Article -->
    </div>
    <div class="timeline-end">End</div>
  </section>
  
  <hr style="clear: both; margin-top:20px;">
  
  
  
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
  


<script src="/hhw/resources/main/core.js"></script>
<script src="/hhw/resources/main/layout-settings.js"></script>
<script src="/hhw/resources/main/process.js"></script>
<script src="/hhw/resources/main/script.min.js"></script>
<script src="/hhw/resources/main/jquery.knob.min.js"></script>
<script src="/hhw/resources/main/knob-chart-setting.js"></script>

		<jsp:include page="../common/footer.jsp" />
</body>
</html>