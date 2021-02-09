<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" /> 
	
	<section style="padding: 100px 0 60px 0;">
	<h3 align="center">에러 페이지</h3>
	<hr>
	<h1 align="center">${ msg }</h1>
	</section>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>