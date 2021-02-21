<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="currentPage" value="${ requestScope.page }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 70px 0 60px 0;">
	
	<hr>
	<%--request에 pboard값 담겨져 왔다. 그래서 그냥 ${ pboard.pid }라고 써도됨  --%>
	<h1 align="center">${ requestScope.pboard.pid }번게시글 수정 페이지</h1>
	<%--form에서 입력값들과 파일을 같이 전송하려면, 반드시 enctype="multipart/form-data"속성 추가해야 함 --%>
	<form action="pupdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pid" value="${ pboard.pid }"> <input
			type="hidden" name="p_file_name"
			value="${ pboard.p_file_name }"> <input type="hidden"
			name="p_rfile_name" value="${ pboard.p_rfile_name }"> <input
			type="hidden" name="page" value="${ currentPage }">
		<table align="center" width="500" border="1" cellspacing="0"
			cellpadding="5">
			<tr>
				<th>제 목</th>
				<td><input type="text" name="ptitle" value="${ pboard.ptitle }"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="pwriter" readonly
					value="${ pboard.pwriter }"></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<!-- 첨부파일이 있는데 삭제하는 경우 --> 
					<c:if test="${ !empty pboard.p_file_name }">
						${ pboard.p_file_name } &nbsp; &nbsp;
				<input type="checkbox" name="delFlag" value="yes">파일삭제 <br>
						<!-- 다른 파일로 변경하는 경우 -->
				바꿀 파일 선택 : <input type="file" name="upfile">
				</td>
				</tr>
				</c:if>
			<c:if test="${ empty pboard.p_file_name }">
			새로 첨부할 파일 선택 : <input type="file" name="upfile">
			</c:if>

			<tr>
				<th>내 용</th>
				<td><textarea name="pcontent" rows="5" cols="50">${ pboard.pcontent }</textarea></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="수정하기">
					&nbsp; <input type="reset" value="수정취소"> &nbsp; <c:url
						var="plist" value="/plist.do">
						<c:param name="page" value="${ currentPage }" />
					</c:url>
					<button
						onclick="javascript:location.href='${ plist }'; return false;">목록</button></th>
			</tr>
		</table>
	</form>
	
	<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>