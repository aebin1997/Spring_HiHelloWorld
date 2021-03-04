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


	<div id="carouselExampleCaptions" class="carousel slide pointer-event" data-ride="carousel">
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

	
	<hr style="clear: both;">
	<!-- float되있는거 해제 -->
	<section style="margin: 250px; margin-top: 40px; float: center; color:#fff;">
		
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
	
	    <hr style="clear: both; color:#fff; opacity:0;">
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
		<hr style="clear: both; margin-top:20px;">
		<!-- float되있는거 해제 -->


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
         <div class="row">
            <div class="col-xl-6 mx-auto text-center">
               <div class="section-title mb-100">
                  <p>what i can do</p>
                  <h4>OUR SERVICES</h4>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-lg-4 col-md-6">
               <!-- Single Service -->
               <div class="single-service">
                  <i class="fa fa-laptop"></i>
                  <h4>Practical Design</h4>
                  <p>Lorem Ipsum is simply dummy text of the printing and
                     typesetting industry typesetting industry</p>
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

<script src="/hhw/resources/main/core.js"></script>
<script src="/hhw/resources/main/layout-settings.js"></script>
<script src="/hhw/resources/main/process.js"></script>
<script src="/hhw/resources/main/script.min.js"></script>

		<jsp:include page="../common/footer.jsp" />
</body>
</html>