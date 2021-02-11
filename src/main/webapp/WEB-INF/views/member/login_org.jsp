<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in</title>
</head>
<body>


	<jsp:include page="../common/header.jsp" />

	<section style="padding: 100px 0 60px 0;">
			<form action="login.do" method="post" style="margin-left:500px;">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id"></td>
						<td rowspan="2">
							<button>로그인</button>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<a href="findIdView.do">아이디 찾기</a> | <a href="findPwView.do">비밀번호 찾기</a>
					</tr>
				</table>
			</form>
	</section>


	<jsp:include page="../common/footer.jsp" />


</body>
</html>