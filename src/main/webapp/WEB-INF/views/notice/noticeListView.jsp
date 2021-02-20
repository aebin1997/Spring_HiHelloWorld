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
<title>공지사항</title>

<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
	
<script type="text/javascript">
	$(function() {
		showDiv();

		$("input[name=item]").on("change", function() {
			showDiv();
		});
	});

	function showDiv() {
		if ($("input[name=item]").eq(0).is(":checked")) {
			$("#titleDiv").css("display", "block");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "none");
		}

		if ($("input[name=item]").eq(1).is(":checked")) {
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "block");
			$("#dateDiv").css("display", "none");
		}

		if ($("input[name=item]").eq(2).is(":checked")) {
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "block");
		}
	}
	
	function showWriteForm() {
		location.href = "${ nwf }";
	}
	
</script>
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

	<section class="breadcrumbs-custom-inset">
		<div class="breadcrumbs-custom context-dark bg-overlay-46">
			<div class="container">
				<h2 class="breadcrumbs-custom-title">공지사항</h2>
				<ul class="breadcrumbs-custom-path">
					<li><a class="nav-link" href="${ nlist }">공지사항</a></li>
					<li><a class="nav-link" href="${ about }">About Us</a></li>
					<li><a class="nav-link" href="${ howto }">사이트 이용 방법</a></li>
				</ul>
			</div>
			<div class="box-position-1"
				style="background-image: url(/hhw/resources/images/notice_board.jpg);"></div>
		</div>
	</section>
	
	<%-- 검색 기능 --%>
	<div>
		<div style="text-align: left; padding-left: 550px;">
			<div>
				<select name="btype" id="item">
					<option id="item" value="">검색 항목 선택</option>
					<option id="item" value="title">제목</option>
					<option id="item" value="writer">작성자</option>
					<option id="item" value="date">게시날짜</option>
				</select>
			
					<input type="radio" name="item" value="title" checked> 제목 &nbsp; &nbsp; &nbsp;
					<input type="radio" name="item" value="writer">작성자 &nbsp; &nbsp; &nbsp; 
					<input type="radio" name="item" value="date"> 날짜
			</div>
		
				
			<div id="titleDiv">
				<form action="nsearchTitle.do" method="post">
					<input type="search" name="keyword">
					<input type="submit" value="검색" class="btn btn-warning btn-round" style="color: #fff;">
					<%-- 목록 출력 --%>
					<div style="align: center; padding-left: 400px">
						<c:url var="nlist" value="/nlist.do"/>
						<button onclick="javascript:location.href='${ nlist }';" class="btn btn-warning btn-round" style="color: #fff;">전체목록 보기</button>
					</div>
				</form>
			</div>
			
			<div id="writerDiv">
				<form action="nsearchWriter.do" method="post">
					<input type="search"name="keyword">
					<input type="submit" value="검색" class="btn btn-warning btn-round" style="color: #fff;">
					<%-- 목록 출력 --%>
					<div style="align: center; padding-left: 400px">
						<c:url var="nlist" value="/nlist.do"/>
						<button onclick="javascript:location.href='${ nlist }';" class="btn btn-warning btn-round" style="color: #fff;">전체목록 보기</button>
					</div>
				</form>
			</div>
				
			<div id="dateDiv">
				<form action="nsearchDate.do" method="post">
					<input type="date" name="begin"> ~ <input type="date" name="end">
					<input type="submit" value="검색" class="btn btn-warning btn-round" style="color: #fff;">
					<%-- 목록 출력 --%>
					<div style="align: center; padding-left: 400px">
						<c:url var="nlist" value="/nlist.do"/>
						<button onclick="javascript:location.href='${ nlist }';" class="btn btn-warning btn-round" style="color: #fff;">전체목록 보기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<c:if test="${ !empty sessionScope.loginUser }">
		<div style="text-align: right; padding-right: 550px; margin-top: -20px">
			<button onclick="showWriteForm();" class="btn btn-warning btn-round"
				style="color: #fff;">글쓰기</button>
		</div>
	</c:if>
	
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="800"
							cellspacing="0" align="center" border="1" style="width:1500px; text-align: center;">
							<tr style="background-color: orange;">
								<th style="text-align: center;">번호</th>
								<th style="text-align: center;">말머리</th>
								<th style="text-align: center;">제목</th>
								<th style="text-align: center;">작성자</th>
								<th style="text-align: center;">첨부파일</th>
								<th style="text-align: center;">날짜</th>
							</tr>
							<c:forEach items="${ requestScope.list}" var="n">
								<tr>
									<td align="center" width="100">${ n.nid }</td>
									<td align="center" width="180">${ n.ntype }</td>
										<c:url value="/ndetail.do" var="und">
											<c:param name="nid" value="${ n.nid }" />
										</c:url>
									<td align="center"><a href="${und}">${n.ntitle}</a></td>
									<td align="center">${n.nwriter}</td>
									<td align="center">
										<c:if test="${!empty n.n_file_name }">◎</c:if>
										<c:if test="${empty n.n_file_name }">&nbsp;</c:if>
										</td>
									<td align="center"><fmt:formatDate value="${n.n_date}" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
						</table>


	<jsp:include page="../common/footer.jsp" />

</body>
</html>