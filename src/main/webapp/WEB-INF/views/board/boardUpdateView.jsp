<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="currentPage" value="${ requestScope.page }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<hr>
	<%--request에 board값 담겨져 왔다. 그래서 그냥 ${ board.bid }라고 써도됨  --%>

	<div style="text-align: center; padding-top: 90px;">
		<div>
			<h4 style="margin: 20px 0 10px 0;">${ board.btitle }</h4>
		</div>
	</div>

	<br>

	
	<%--form에서 입력값들과 파일을 같이 전송하려면, 반드시 enctype="multipart/form-data"속성 추가해야 함 --%>
	<form action="bupdate.do" method="post" enctype="multipart/form-data" style="padding-bottom: 30px;">
		<input type="hidden" name="bid" value="${ board.bid }">
		<input type="hidden" name="b_original_filename" value="${ board.b_original_filename }">
		<input type="hidden" name="b_rename_filename" value="${ board.b_rename_filename }">
		<input type="hidden" name="page" value="${ currentPage }">
		
		<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th style="text-align: center;">제 목</th>
					<td>
						<input type="text" name="btitle" value="${ board.btitle }">
					</td>
			</tr>
			<tr>
				<th style="text-align: center;">작성자</th>
					<td>
						<input type="text" name="bwriter" readonly value="${ board.bwriter }">
					</td>
			</tr>
			<tr>
				<th style="text-align: center;">첨부파일</th>
					<td>
						<!-- 첨부파일이 있는데 삭제하는 경우 -->
						<c:if test="${ !empty board.b_original_filename }">
							${ board.b_original_filename } &nbsp; &nbsp; <input type="checkbox" name="delFlag" value="yes">파일삭제 <br>
						</c:if>
						<!-- 다른 파일로 변경하는 경우 -->
						<c:if test="${ empty board.b_original_filename }"> 
						<input type="file" name="upfile">
						</c:if>
					</td>
			</tr>
						
			<tr>
				<th style="text-align: center;">내 용</th>
				<td><textarea name="bcontent" rows="5" cols="50">${ board.bcontent }</textarea></td>
			</tr>
			<tr>
				<th colspan="2" style="text-align: right;">
				<input type="submit" value="수정하기">&nbsp;
				<input type="reset" value="수정취소"> &nbsp;
					<c:url var="blist" value="/blist.do">
						<c:param name="page" value="${ currentPage }" />
					</c:url>
				<button onclick="javascript:location.href='${ blist }'; return false;">목록</button></th>
			</tr>
		</table>
	</form>
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>
