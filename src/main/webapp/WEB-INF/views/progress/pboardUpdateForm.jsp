<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 70px 0 60px 0;">
	
	<h1 align="center">${ p.pId }게시글 수정하기</h1>
	<br>
	
	<!-- 첨부파일도 수정할려고 하니 Multipart/form-data encType 지정!! 꼭!!!!!!-->
	<form action="pupdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pid" value="${ p.pid }">
		<input type="hidden" name="p_file_name" value="${ p.p_file_name }">
		<input type="hidden" name="p_rfile_name" value="${ p.p_rfile_name }">
		
		<table align="center" id="tb">
			<tr>
				<td>제목</td>
				<td><input type="text" name="ptitle" value="${ p.pTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" readonly name="pwriter" value="${ p.pwriter }"></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="pcontent">${ p.pcontent }</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="reloadFile">
					<c:if test="${ !empty p.p_file_name }">
						<br>현재 업로드한 파일 : 
						<a href="${ contextPath }/resources/pboard_files/${ p.p_rfile_name }" download="${ p.p_file_name }">${ p.p_file_name }</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기"> &nbsp;
					<a href="javascript:history.go(-1);">이전페이지로</a>
				</td>
			</tr>
		</table>
	</form>
	
	<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>