<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">


</head>
<body>
	<c:import url="../common/header.jsp" />
	<hr>
	
	
	<div style="text-align: center; padding-top: 90px;">
		<div>
			<h2 style="margin: 20px 0 10px 0;">게시글 등록</h2>
		</div>
	</div>
	
	<br>
	<%--form에서 입력값들과 파일을 같이 전송하려면, 반드시 enctype="multipart/form-data"속성 추가해야 함 --%>
	<form action="binsert.do" method="post" enctype="multipart/form-data">
	
		<table align="center" width="500" border="1" cellspacing="0"
			cellpadding="5">
			<tr>
				<th>말머리</th>
				<td><select type="test" name="btype">
					<option value="1">질문이요</option>
					<option value="2">일상글이요</option>
					<option value="3">칭찬글이요</option>
					<option value="4">참고글이요</option>
				</select></td>
			</tr>
			<tr>
				<th>제 목</th>
				<td><input type="text" name="btitle"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="bwriter" readonly value="${ sessionScope.loginUser.nickname }"></td>
			</tr>
			<tr>
				<th>파일선택</th>
				<td><input type="file" name="upfile"></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea name="bcontent" rows="5" cols="50" id="summernote"></textarea></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="등록하기">
					&nbsp; <input type="reset" value="작성취소"> &nbsp;
					<button onclick="javascript:history.go(-1); return false;">목록</button></th>
			</tr>
		</table>
	</form>


<div class="container">
  <textarea class="summernote" name="editordata"></textarea>    
</div>
<script>

$('.summernote').summernote({
	  height: 150,
	  lang: "ko-KR"
	});
</script>
 

	<jsp:include page="../common/footer.jsp" />
</body>
</html>