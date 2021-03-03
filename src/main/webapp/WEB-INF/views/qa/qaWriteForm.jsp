<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/hhw/resources/writerform/css/core.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/css2.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/icon-font.min.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/style.css" />


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
	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 70px 0 60px 0; margin-left: 700px;">
		
		<br><br>
		<%--form에서 입력값들과 파일을 같이 전송하려면, 반드시 enctype="multipart/form-data"속성 추가해야 함 --%>
		<form action="qainsert.do" method="post" enctype="multipart/form-data">
			<table style="padding-top: 50px" align=center width=1100 border=0 cellpadding=2>
				<tr>
					<td height=20 align=center bgcolor=#ccc><font color=white>
					새 의뢰 등록 페이지</font></td>
				</tr>
				<tr>
					<td bgcolor=white>
						<table class="table2">
							<tr>
								<td width="150px">제 목</td>
								<td width="960px">
								<input type="text" name="qa_title"></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><input type="text" name="qa_writer" readonly
									value="${ sessionScope.loginUser.id }"></td>
							</tr>
							<tr>
								<td>포인트</td>
								<td><input type="text" name="qa_point"></td>
							</tr>
							<tr>
								<td>파일선택</td>
								<td><input type="file" name="upfile"></td>
							</tr>
							<tr>
								<td>내 용</td>
								<td><!-- <textarea name="qa_content" rows="15" cols="70"></textarea> -->
								<textarea class="textarea_editor form-control border-radius-0" name="qa_content" rows="10" cols="100"></textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				</table>
				<center>
					<th colspan="2"><input type="submit" value="등록하기">
						&nbsp; <input type="reset" value="작성취소"> &nbsp;
						<button onclick="javascript:history.go(-1); return false;">목록</button></th>
				</center>
		</form>


		<!-- 푸터 -->
	</section>
	
	
 
<script src="/hhw/resources/writerform/js/core.js"></script>
<script src="/hhw/resources/writerform/js/js.js"></script>
<script src="/hhw/resources/writerform/js/layout-settings.js"></script>
<script src="/hhw/resources/writerform/js/process.js"></script>
<script src="/hhw/resources/writerform/js/script.min.js"></script>
 
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>