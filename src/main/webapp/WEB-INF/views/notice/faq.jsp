<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FaQ</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



</head>
<body>
<!-- 헤더 -->
   
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
				<h2 class="breadcrumbs-custom-title">FAQ</h2>
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
	
   
	<div class="container-fluid" style="min-height: calc(100vh - 136px); margin-top:20px;">
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			<div class="panel panel-default" style="width:500px; margin-left:400px;">
				<div class="panel-heading" role="tab">
					<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false" style="color:black; font-size:25px;">자주하는 질문 1</a>
				</div>
				
				<div id="collapse1" class="panel-collapse collapse" role="tabpanel">
					<div class="panel-body" style="color:black; font-size:20px;">사이트 이용방법은 아래 링크를 클릭하세요</div>
				</div>
			</div>
			
			<div class="panel panel-default" style="width:500px; margin-left:400px;">
				<div class="panel-heading" role="tab">
					<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false" style="color:black; font-size:25px;">자주하는 질문 1</a>
				</div>
				
				<div id="collapse2" class="panel-collapse collapse" role="tabpanel">
					<div class="panel-body" style="color:black; font-size:20px;">사이트 이용방법은 아래 링크를 클릭하세요</div>
				</div>
			</div>
			
			<div class="panel panel-default" style="width:500px; margin-left:400px;">
				<div class="panel-heading" role="tab">
					<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="false" style="color:black; font-size:25px;">자주하는 질문 1</a>
				</div>
				
				<div id="collapse3" class="panel-collapse collapse" role="tabpanel">
					<div class="panel-body" style="color:black; font-size:20px;">사이트 이용방법은 아래 링크를 클릭하세요</div>
				</div>
			</div>
			
		</div>
	</div>


   
   
   
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>