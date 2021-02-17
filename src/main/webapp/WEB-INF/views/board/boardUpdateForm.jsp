<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
	<h1 align="center">${ b.bid }게시글 수정하기</h1>
	<br>
	
	<!-- 첨부파일도 수정할려고 하니 Multipart/form-data encType 지정!! 꼭!!!!!!-->
	<form action="bupdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bid" value="${ b.bid }">
		<input type="hidden" name="b_original_filename" value="${ b.b_original_FileName }">
		<input type="hidden" name="b_rename_filename" value="${ b.b_rename_FileName }">
		
		<table align="center" id="tb">
			<tr>
				<td>제목</td>
				<td><input type="text" name="btitle" value="${ b.bTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" readonly name="bwriter" value="${ b.bWriter }"></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="bcontent">${ b.bContent }</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="b_rename_filename">
					<c:if test="${ !empty b.b_original_FileName }">
						<br>현재 업로드한 파일 : 
						<a href="${ contextPath }/resources/buploadFiles/${ b.b_rename_FileName }" download="${ b.b_original_FileName }">${ b.b_original_FileName }</a>
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
	<jsp:include page="../common/footer.jsp" />
</body>
</html>