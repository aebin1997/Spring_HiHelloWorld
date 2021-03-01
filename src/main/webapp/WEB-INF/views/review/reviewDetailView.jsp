<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

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
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 70px 0 60px 0;">

		<br>
		<br>
		<br>
		<table style="padding-top: 50px" align=center width=700 border=0
			cellpadding=2>
			<tr>
				<td height=20 align=center bgcolor=#ccc><font color=white>
						${ requestScope.review.rid }번 리뷰 상세보기</font></td>
			</tr>

			<tr>
				<td bgcolor=white>
					<table class="table2">
						<tr>
							<td width="200px">제 목</td>
							<td width="500px">${ review.rtitle }</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${ review.rwriter }</td>
						</tr>
						<tr>
							<td>내 용</td>
							<td>${ review.rcontent }</td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td><c:if test="${ empty review.r_original_filename }">
							첨부파일 없음
							</c:if> <c:if test="${ !empty review.r_original_filename }">
									<c:url var="rfd" value="/revfdown.do">
										<c:param name="ofile" value="${ review.r_original_filename }" />
										<c:param name="rfile" value="${ review.r_rename_filename }" />
									</c:url>
									<a href="${ rfd }">${ review.r_original_filename }</a>
								</c:if></td>
						</tr>
					</table>
					
					<center>
						<c:if test="${ !empty sessionScope.loginUser and loginUser.user_lv eq 'B'}">		
   						<c:url var="rdl" value="/revdelete.do">
										<c:param name="rid" value="${ review.rid }" />
									</c:url>
									<a href="${ rdl }">[글삭제]</a> &nbsp; &nbsp; 
						</c:if>
								<a href="javascript:history.go(-1);">[목록]</a>
					</center>
				</td>
			</tr>
		</table>
		<br>

		<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>
