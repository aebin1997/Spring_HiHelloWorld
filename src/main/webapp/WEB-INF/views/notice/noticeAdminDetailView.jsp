<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 절대경로로 처리한 경우 --%>
	<jsp:include page="../common/header.jsp" />
	<hr>
	<h2 align="center">${notice.nid}번 공지상세보기</h2>
	<br>
	<table align="center" width="500" border="1" cellspacing="0"
		cellpadding="5">
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
			<th colspan="2">
				<%-- 수정페이지로 이동 버튼 --%> <c:url var="nup" value="/upmove.do">
					<c:param name="nid" value="${ notice.nid }" />
				</c:url>
				<button onclick="javascript:location.href='${ nup }';">수정페이지로
					이동</button>&nbsp; <%-- 삭제하기 버튼 --%> <c:url var="ndel" value="/ndel.do">
					<c:param name="nid" value="${ notice.nid }" />
					<c:if test="${ !empty notice.n_file_name }">
						<c:param name="file_path" value="${ notice.n_file_name }" />
					</c:if>
				</c:url>
				<button onclick="javascript:location.href='${ ndel }';">글삭제</button>&nbsp;
				<%-- 이전페이지로 이동 --%>
				<button onclick="javascript:history.go(-1);">목록</button>
			</th>
		</tr>
	</table>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>