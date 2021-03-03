<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/hhw/resources/writerform/css/core.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/css2.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/icon-font.min.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/style.css" />

<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'UA-119386393-1');
</script>

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
	<section style="padding: 70px 0 60px 0; margin-left: 400px;">

		<br>
		<br>
		<%--form에서 입력값들과 파일을 같이 전송하려면, 반드시 enctype="multipart/form-data"속성 추가해야 함 --%>
		<form action="pinsert.do" method="post" enctype="multipart/form-data">
			<table style="padding-top: 50px; float:center; text-align: center;" align=center width=1100 border="0" cellpadding="2">
				<tr>
					<td height=20 align=center bgcolor=#ccc><font color=white>
							새 게시글 등록 페이지</font></td>
				</tr>
				<tr>
					<td bgcolor=white>
						<table class="table2" align=center width=1100 border="0" cellpadding="2">
							<tr>
								<td width="150px">제 목</td>
								<td width="950px"><input type="hidden" name="p_proid"
									value="${ pro_id }"> <input type="text" name="ptitle"></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><input type="text" name="pwriter" readonly
									value="${ sessionScope.loginUser.nickname }"></td>
							</tr>
							<tr>
								<td>파일선택</td>
								<td><input type="file" name="upfile"></td>
							</tr>
							<tr>
								<td>내 용</td>
								<td><textarea class="textarea_editor form-control border-radius-0" name="pcontent" rows="15" cols="50"></textarea>
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

<script src="/hhw/resources/writerform/js/core.js"></script>
<script src="/hhw/resources/writerform/js/js.js"></script>
<script src="/hhw/resources/writerform/js/layout-settings.js"></script>
<script src="/hhw/resources/writerform/js/process.js"></script>
<script src="/hhw/resources/writerform/js/script.min.js"></script>

		<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>