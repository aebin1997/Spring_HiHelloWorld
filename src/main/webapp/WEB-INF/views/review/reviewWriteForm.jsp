<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<section style="padding: 70px 0 60px 0;">
		
		<br><br>
		<form action="revinsert.do" method="post" >
		<input type=hidden name="ref_proid" value=${ qplist.pro_id }>
		<input type=hidden name="ref_qid" value=${ qplist.pro_qid }>
			<table style="padding-top: 50px" align=center width=700 border=0 cellpadding=2>
				<tr>
					<td height=20 align=center bgcolor=#ccc><font color=white>
					Approve this order</font></td>
				</tr>
				<tr>
					<td bgcolor=white>
						<table class="table2">
							<tr>	
								<td width="200px">질문 제목</td>
								<td width="500px"><input type=text value=${ qplist.qa_title } readonly></td>
								
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
								<td><input type=range name=range size=500></td>
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
								<td><textarea name=rcontent cols=85 rows=15></textarea></td>
							</tr>

						</table>

						<center>
							<input type="submit" value="Approve & Release final payment">
						</center>
					</td>
				</tr>
			</table>
		</form>


		<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />


</body>
</html>