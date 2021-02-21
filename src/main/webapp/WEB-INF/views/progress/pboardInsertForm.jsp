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
	
	<h1 align="center">게시글 작성하기</h1>
	<br>
	
	<!-- 첨부파일도 등록할려고 하니 Multipart/form-data encType 지정!! 꼭!-->
	<form action="pinsert.do" method="post" enctype="multipart/form-data">
		
		<table align="center" id="tb">
			<tr>
				<td>제목</td>
				<td><input type="text" name="ptitle"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" readonly name="pwriter" value="${ loginUser.nickname }"></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="pcontent"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록하기"> &nbsp;
					<a href="plist.do">목록으로</a>
				</td>
			</tr>
		</table>
	</form>
	
	<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>