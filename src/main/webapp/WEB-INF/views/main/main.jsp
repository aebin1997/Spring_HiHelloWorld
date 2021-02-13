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




		<jsp:include page="../common/footer.jsp" />
</body>
</html>