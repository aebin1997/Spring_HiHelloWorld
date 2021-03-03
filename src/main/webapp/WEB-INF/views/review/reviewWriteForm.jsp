<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
	<section style="padding: 70px 0 60px 0;  margin-left: 400px;">
		
		<br><br>
		<form action="revinsert.do" method="post" >
		<input type=hidden name="ref_proid" value=${ qplist.pro_id }>
		<input type=hidden name="ref_qid" value=${ qplist.pro_qid }>
			<table style="padding-top: 50px; float:center; text-align: center;" align=center width=1100 border="0" cellpadding="2">
				<tr>
					<td height=20 align=center bgcolor=#ccc><font color=white>
					Approve this order</font></td>
				</tr>
				<tr>
					<td bgcolor=white>
						<table class="table2" align=center width=1100 border="0" cellpadding="2">
							<tr>	
								<td width="150px">질문 제목</td>
								<td width="950px"><input type=text value=${ qplist.qa_title } readonly></td>
								
							</tr>
							
							<tr>
								<td>작성자</td>
								<td><input type=text name=rwriter size=20
									value="${ sessionScope.loginUser.nickname }" readonly>
								</td>
							</tr>
							
							<tr>
								<td>답변자</td>
								<td><input type=text value=${ qplist.pro_answerer } readonly></td>
							</tr>

							<tr>
								<td>Quality of the answer</td>
								<td><input type=range name=range size=100 style="width:447px;"></td>
							</tr>

							<tr>
								<td>리뷰 제목</td>
								<td><input type=text name=rtitle size=60></td>
							</tr>
							<tr>
								<td>파일선택</td>
								<td><input type="file" name="upfile"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea name=rcontent class="textarea_editor form-control border-radius-0" rows="15" cols="50"></textarea></td>
							</tr>

						</table>

						<center>
							<input type="submit" value=" Approve & Release final payment ">
						</center>
					</td>
				</tr>
			</table>
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