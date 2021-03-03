<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지글 작성</title>

<link rel="stylesheet" href="/hhw/resources/writerform/css/core.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/css2.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/icon-font.min.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/style.css" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  

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
	<jsp:include page="../common/header.jsp" />
	<hr>
	
	<section style="padding: 70px 0 60px 0; margin-left: 700px;">
		
		<br><br>
		<form action="ninsert.do" method="post" enctype="multipart/form-data">
			<table style="padding-top: 50px" align="center" width="1100" border="0" cellpadding="2">
				<tr>
					<td height="30" align="center" bgcolor="#ccc"><font color="white">공지사항 등록</font></td>
				</tr>
				<tr>
					<td bgcolor=white>
						<table class="table2">
							<tr>
								<td width="150px">말머리</td>
								<td width="960px"><select type="test" name="ntype">
	    											  <option value="공지사항">공지사항</option>
													  <option value="이벤트">이벤트</option>
													  <option value="긴급">긴급</option>
													  <option value="필독">필독</option>
												  </select></td>
								
							</tr>
							
							<tr>
								<td>제 목</td>
								<td><input type="text" name="ntitle"></td>
							</tr>
							
							<tr>
								<td>작성자</td>
								<td><input type="text" name="nwriter" readonly value="${ sessionScope.loginUser.nickname }"></td>
							</tr>
	
							<tr>
								<td>파일선택</td>
								<td><input type="file" name="upfile"></td>
							</tr>
	
							<tr>
								<td>내 용</td>
								<td><!-- <textarea name="ncontent" rows="5" cols="50"></textarea> -->
								<textarea class="textarea_editor form-control border-radius-0" name="ncontent" rows="10" cols="100"></textarea>
								</td>
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



 
<script src="/hhw/resources/writerform/js/core.js"></script>
<script src="/hhw/resources/writerform/js/js.js"></script>
<script src="/hhw/resources/writerform/js/layout-settings.js"></script>
<script src="/hhw/resources/writerform/js/process.js"></script>
<script src="/hhw/resources/writerform/js/script.min.js"></script>
 

	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>