<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    <%-- 응답온 페이지값 추출함 --%>
<c:set var="currentPage" value="${ requestScope.page }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<hr>
	<h2 align="center">${ requestScope.qa.qa_id }번 게시글 상세보기</h2>
	<br>
<table align="center" cellpadding="10" cellspacing="0" border="1" width="500">
<tr><th>제 목</th><td>${ qa.qa_title }</td></tr>
<tr><th>작성자</th><td>${ qa.qa_writer }</td></tr>
<tr><th>내 용</th><td>${ qa.qa_content }</td></tr>
<tr><th>첨부파일</th>
<td>
<c:if test="${ empty qa.qa_origin_file_name }">
첨부파일 없음
</c:if>
<c:if test="${ !empty qa.qa_origin_file_name }">
<c:url var="qafd" value="/qafdown.do">
	<c:param name="ofile" value="${ qa.qa_origin_file_name }"/>
	<c:param name="rfile" value="${ qa.qa_rename_file_name }"/>
</c:url>	
<a href="${ qafd }">${ qa.qa_origin_file_name }</a>
</c:if>
</td></tr>
<tr align="center" valign="middle" ><th colspan="2">
<%-- 로그인한 상태일때 댓글 달기 사용하게 함 --%>
<c:if test="${ !empty loginUser }">
	<button onclick="showReplyForm();">댓글 달기</button>
	&nbsp; &nbsp;
</c:if>
<%-- 로그인한 상태 , 본인 글일때만 보여지게 함 --%>
<c:if test="${ !empty loginUser and loginUser.id eq qa.qa_writer }">
	<c:url var="qauv" value="/qaupview.do">
		<c:param name="qaid" value="${ qa.qa_id }"/>
		<c:param name="page" value="${ currentPage }"/>
	</c:url>
	<a href="${ qauv }">[수정페이지로 이동]</a>&nbsp; &nbsp;
	<c:url var="qadl" value="/qadelete.do">
		<c:param name="qadelete" value="${ qa.qa_id }"/>	
	</c:url>
	<a href="${ qadl }">[글삭제]</a> &nbsp; &nbsp;
</c:if>
<c:url var="qalist" value="/qalist.do">
		<c:param name="page" value="${ currentPage }"/> 
</c:url>
<a href="${ qalist }">[목록]</a>
</th></tr>
</table>
<hr>
<%-- 댓글목록 표시 영역 --%>

<hr>
<%-- 댓글 달기 폼영역 --%>
<div id="replyDiv">
<form action="qarinsert.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="ref_qa_id" value="${ qa.qa_id }">
<table align="center" width="500" border="1" cellpading="5" cellspacing="0">
<tr><th>제 목</th><td><input type="text" name="qar_title"></td></tr>
<tr><th>작성자</th>
<td><input type="text" name="qar_writer" readonly value="${ sessionScope.loginUser.id }"></td></tr>
<tr><th>파일선택</th>
<td><input type="file" name="upfile"></td></tr>
<tr><th>내용</th><td><textarea name="qar_content" rows="5" cols="50"></textarea></td></tr>
<tr><th colspan="2">
<input type="submit" value="댓글 등록"> &nbsp;
<input type="reset" value="댓글 취소" onclick="hideReplyForm(); return false;"></th></tr>
</table>
</form>
</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>




