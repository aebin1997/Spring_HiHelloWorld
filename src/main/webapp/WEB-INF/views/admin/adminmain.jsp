<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="maxPage" value="${ requestScope.maxPage }" />
<c:set var="startPage" value="${ requestScope.startPage }" />
<c:set var="endPage" value="${ requestScope.endPage }" />
<c:set var="currentPage" value="${ requestScope.currentPage }" />

<c:url var="nwf" value="/nwform.do" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
</head>

<body>

	<jsp:include page="../common/header.jsp" />

<%-- 	<c:url var="nlist" value="nlist.do">
		<c:param name="page" value="1" />
	</c:url>
	<c:url var="about" value="aboutUs.do">
		<c:param name="page" value="1" />
	</c:url>--%>
	<c:url var="blame" value="blamelist.do">
		<c:param name="page" value="1" />
	</c:url>
 
	<section class="breadcrumbs-custom-inset">
		<div class="breadcrumbs-custom context-dark bg-overlay-46">
			<div class="container">
				<h2 class="breadcrumbs-custom-title">관리자 페이지</h2>
				<ul class="breadcrumbs-custom-path">
					<li><a class="nav-link" href="#">회원리스트</a></li>
					<li><a class="nav-link" href="${ blame }">신고회원 리스트</a></li>
					<li><a class="nav-link" href="#">??????</a></li>
				</ul>
			</div>
			<div class="box-position-1"
				style="background-image: url(/hhw/resources/images/notice_board.jpg);"></div>
		</div>
	</section>
	
	


	<jsp:include page="../common/footer.jsp" />

</body>
</html>