<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<jsp:include page="../common/header.jsp" />

	<div class="loginArea" align="right">
		<c:if test="${ empty sessionScope.loginUser }">
			<form action="login.do" method="post">
				<table id="loginTable" style="text-align: center">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id"></td>
						<td rowspan="2">
							<button id="loginBtn">로그인</button>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<td colspan="3"><a href="enrollView.do">회원가입</a> <a href="#">아이디/비밀번호
								찾기</a></td>
					</tr>
				</table>
			</form>
		</c:if>
		<c:if test="${ !empty sessionScope.loginUser }">
			<h3 align="center">
				<c:out value="${ loginUser.name }님 환영합니다!!" />
				<c:url var="myInfo" value="myInfo.do" />
				<c:url var="logout" value="logout.do" />
				<button onclick="location.href='${myInfo}'">정보수정</button>
				<button onclick="location.href='${logout}'">로그아웃</button>
			</h3>
		</c:if>
	</div> 


	<jsp:include page="../common/footer.jsp" />



</body>
</html>