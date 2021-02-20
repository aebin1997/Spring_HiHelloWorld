<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<hr>
	
	<div style="text-align: center; padding-top: 90px;">
		<div>
			<h2 style="margin: 20px 0 10px 0;">${ notice.nid }번 공지글 수정 페이지</h2>
		</div>
	</div>
	
	<form action="nupdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="nid" value="${ notice.nid }">
			<c:if test="${ !empty notice.n_file_name }">
				<input type="hidden" name="file_path" value="${ notice.n_file_name }">
			</c:if>
		<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th>제 목</th>
				<td><input type="text" name="ntitle" value="${ notice.ntitle }">
				</td>
			</tr>

			<tr>
				<th>작성자</th>
				<td><input type="text" name="nwriter" readonly value="${ notice.nwriter }"></td>
			</tr>

			<tr>
				<th>파일선택</th>
				<td>
					<%-- 원래 첨부파일이 있는 경우 --%>
					<c:if test="${ !empty notice.n_file_name }"> ${ notice.n_file_name } &nbsp;<input type="checkbox" name="delFlag" value="yes"> 파일삭제 <br>
					</c:if>
					<%-- 원래 첨부파일이 없을 경우 --%>
					<c:if test="${empty notice.n_file_name }"> <input type="file" name="upfile">
					</c:if>
				</td>
			</tr>

			<tr>
				<th>내 용</th>
				<td><textarea name="ncontent" rows="5" cols="50">${ notice.ncontent }</textarea>
				</td>
			</tr>

			<tr>
				<th colspan="2"><input type="submit" value="수정하기">
					&nbsp; <input type="reset" value="작성취소"> &nbsp;
					<button onclick="javascript:history.go(-1); return false;">이전페이지</button>
				</th>
			</tr>

		</table>
	</form>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>