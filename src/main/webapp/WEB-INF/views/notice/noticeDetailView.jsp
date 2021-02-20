<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 응답온 페이지값 추출함 --%>
<c:set var="currentPage" value="${ requestScope.page }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 열람 페이지</title>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	
	<div style="text-align: center; padding-top: 90px;">
		<div>
			<h2 style="margin: 20px 0 10px 0;">${notice.nid}번 공지상세보기</h2>
		</div>
	</div>
	
	<br>
	<table align="center" cellpadding="10" cellspacing="0" border="1" width="500">
		<tr>
			<th>제 목</th>
			<td>${ notice.ntitle }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${ notice.nwriter }</td>
		</tr>
		<tr>
			<th>날 짜</th>
			<td><fmt:formatDate value="${notice.n_date}"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td><c:if test="${ !empty notice.n_file_name }">
					<%-- 첨부파일이 있다면 다운로드 설정함 --%>
					<c:url var="unf" value="/nfdown.do">
						<c:param name="file_path" value="${notice.n_file_name}" />
					</c:url>
					<a href="${unf}">${notice.n_file_name}</a>
				</c:if> <c:if test="${empty notice.n_file_name }">&nbsp;</c:if></td>
		</tr>
		<tr>
			<th>내 용</th>
			<td>${ notice.ncontent }</td>
		</tr>
		<tr>
			<th colspan="2"><button onclick="javascript:history.go(-1);">목록</button></th>
		</tr>
	</table>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>