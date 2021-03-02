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

<style>
table.table2 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table.table2 tr {
	width: 50px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.table2 td {
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>

</head>
<body>
	<c:import url="../common/header.jsp" />
	<hr>
	
 	<section style="padding: 70px 0 60px 0;">
		
		<br><br>
		<form action="binsert.do" method="post" enctype="multipart/form-data">
			<table style="padding-top: 50px" align="center" width="700" border="0" cellpadding="2">
				<tr>
					<td height="30" align="center" bgcolor="#ccc"><font color="white">게시글 등록</font></td>
				</tr>
				<tr>
					<td bgcolor=white>
						<table class="table2">
						
							<tr>	
								<td width="200px">말머리</td>
								<td width="500px"><select type="test" name="btype">
	    											  <option value="질문이요">질문이요</option>
													  <option value="일상글이요">일상글이요</option>
													  <option value="칭찬글이요">칭찬글이요</option>
													  <option value="참고글이요">참고글이요</option>
												  </select></td>
								
							</tr>
							
							<tr>
								<td>제 목</td>
								<td><input type="text" name="btitle"></td>
							</tr>
							
							<tr>
								<td>작성자</td>
								<td><input type="text" name="bwriter" readonly value="${ sessionScope.loginUser.nickname }"></td>
							</tr>
	
							<tr>
								<td>파일선택</td>
								<td><input type="file" name="upfile"></td>
							</tr>
	
							<tr>
								<td>내 용</td>
								<td><textarea name="bcontent" rows="5" cols="50"></textarea></td>
							</tr>
							
							<tr>
								<th colspan="2" style="text-align: right; padding-top: 20px">
									<input type="submit" value="등록하기">&nbsp; 
									<input type="reset" value="작성취소"> &nbsp;
									<button onclick="javascript:history.go(-1); return false;">목록</button>
								</th>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</section>
 
 
 
 

	<jsp:include page="../common/footer.jsp" />
</body>
</html>