<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Author" content="kimwoolina">
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 70px 0 60px 0;">
	
	<!-- 의뢰 요청 form -->
	<div>
	<form>
	<table>
		<tr><td>답변자 선택</td><td><input type="text"></td><td><button>검색</button></td></tr>
		<tr><td>질문 선택</td><td><input type="text"></td><td></td></tr>
		<tr><td>마감 기한</td><td><input type="text"></td><td></td></tr>
		<tr><td>금액</td><td><input type="text"></td><td><button>결제</button></td></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>
	<button>의뢰 신청</button>
	</form>
	</div>
	<br>
	<br>
	<h4>진행 중인 Q&A</h4>
	
	
	
	
	
	<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>