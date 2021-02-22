<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Author" content="kimwoolina">
<style>
#apply {
	border: 1px solid #444444;
	border-collapse: collapse;
}

#apply .th, .td {
	border: none;
	padding: 10px;
}
</style>
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 100px 250px 60px 250px;">

		<!-- 의뢰 요청 form -->
		<div>
			<form>
				<table id="apply">
					<tr>
						<td>답변자 선택</td>
						<td><input type="text"></td>
						<td><button>검색</button></td>
					</tr>
					<tr>
						<td>질문 선택</td>
						<td><input type="text"></td>
						<td></td>
					</tr>
					<tr>
						<td>마감 기한</td>
						<td><input type="text"></td>
						<td></td>
					</tr>
					<tr>
						<td>금액</td>
						<td><input type="text"></td>
						<td><button>결제</button></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" align="right"><button>의뢰 신청</button></td>
					</tr>
				</table>
			</form>
		</div>
		<br> <br>
		<div align="center">
		<h4>진행 중인 Q&A</h4>
		<%-- 목록 출력 --%>

		<br>
		<table border="1" width="700" cellspacing="0">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>첨부파일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${ requestScope.list }" var="p">
				<tr>
					<td align="center">${ p.pid }</td>
					<td><c:url var="pdt" value="/pdetail.do">
							<c:param name="page" value="${ currentPage }" />
							<c:param name="pid" value="${ p.pid }" />
						</c:url> <a href="${ pdt }">${ p.ptitle }</a></td>
					<td align="center">${ p.pwriter }</td>
					<td align="center">${ p.p_date }</td>
					<td align="center">${ p.pcount }</td>
					<td align="center"><c:if test="${ !empty p.p_file_name }">
			     				◎
							    </c:if> <c:if test="${ empty p.p_file_name }">
				      			&nbsp;
				      			</c:if></td>
				</tr>
			</c:forEach>
		</table>
		</div>
		<br>



		<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>