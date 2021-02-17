<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<br><br>
<h1 align="center">${ requestScope.qa.qa_id }번의뢰 수정 페이지</h1>
<%--form에서 입력값들과 파일을 같이 전송하려면, 반드시 enctype="multipart/form-data"속성 추가해야 함 --%>
<form action="qaupdate.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="qa_id" value="${ qa.qa_id }">
<input type="hidden" name="qa_origin_file_name" value="${ qa.qa_origin_file_name }">
<input type="hidden" name="qa_rename_file_name" value="${ qa.qa_rename_file_name }">
<input type="hidden" name="page" value="${ currentPage }">
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">                   
<tr><th>제 목</th><td><input type="text" name="qa_title" value="${qa.qa_title}"></td></tr>
<tr><th>작성자</th>
<td><input type="text" name="qa_writer" readonly value="${ qa.qa_writer }"></td></tr>
<tr><th>첨부파일</th>
<td>
<!-- 첨부파일이 있는데 삭제하는 경우 -->
<c:if test="${ !empty qa.qa_origin_file_name }">
${ qa.qa_origin_file_name } &nbsp; &nbsp;
<input type="checkbox" name="delFlag" value="yes">파일삭제<br>
<!-- 다른 파일로 변경하는 경우 -->
바꿀 파일 선택 : <input type="file" name="upfile">
</c:if>
<c:if test="${ empty qa.qa_origin_file_name }">
첨부 파일 추가 : <input type="file" name="upfile">
</c:if>
</td></tr>
<tr><th>내 용</th><td>
<textarea name="qa_content" rows="5" cols="50">${ qa.qa_content }</textarea></td></tr>
<tr><th colspan="2">
<input type="submit" value="수정하기"> &nbsp;
<input type="reset"value="수정취소"> &nbsp;
<c:url var="qalist" value="/qalist.do">
	<c:param name="page" value="${ currentPage }"/>
</c:url>
<button onclick="javascript:location.href='${ qalist }'; return false;">목록</button></th></tr>
</table>
</form>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>