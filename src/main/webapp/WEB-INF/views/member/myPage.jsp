<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Author" content="kimwoolina">
<title>my info</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<section style="padding: 100px 0 60px 0;">
		<h1 align="center">${ loginUser.name }님의정보보기</h1>

		<div class="outer" align="center">
			<form action="mupdate.do" method="post" id="joinForm">
				<table width="500" cellspacing="5">
					<tr>
						<td width="150">* 아이디</td>
						<td><input type="text" name="id" value="${ loginUser.id }"
							readonly></td>
					</tr>
					<tr>
						<td>* 이름</td>
						<td><input type="text" name="name"
							value="${ loginUser.name }"></input></td>
					</tr>
					<tr>
						<td>* 비밀번호</td>
						<td><input type="password" id="pwd" name="pwd"></td>
					</tr>
					<tr>
						<td>* 비밀번호확인</td>
						<td><input type="password" id="pwd2" name="pwd2"></td>
					</tr>
					<tr>
						<td>* 별명</td>
						<td><input type="text" name="nickname"
							value="${ loginUser.nickname }" readonly></input></td>
					</tr>
					<tr>
						<td>성별</td>
						<c:choose>
							<c:when test="${ loginUser.sex eq 'm' }">
								<td><input type="radio" name="gender" value="m" checked>남
									<input type="radio" name="gender" value="w">여</td>
							</c:when>
							<c:when test="${ loginUser.sex eq 'w' }">
								<td><input type="radio" name="gender" value="m">남 <input
									type="radio" name="gender" value="w" checked>여</td>
							</c:when>
							<c:otherwise>
								<td><input type="radio" name="gender" value="m">남 <input
									type="radio" name="gender" value="w">여</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" name="email"
							value="${ loginUser.email }"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="tel" name="phone"
							value="${ loginUser.phone }"></td>
					</tr>
					<c:if test="${ empty loginUser.address }">
						<tr>
							<td>우편번호</td>
							<td><input type="text" name="post"
								class="postcodify_postcode5" size="6">
								<button type="button" id="postcodify_search_button">검색</button>
							</td>
						</tr>
						<tr>
							<td>도로명 주소</td>
							<td><input type="text" name="address1"
								class="postcodify_address"></td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" name="address2"
								class="postcodify_extra_info"></td>
						</tr>
					</c:if>
					<c:if test="${ !empty loginUser.address }">
						<c:forTokens var="addr" items="${ loginUser.address }" delims=","
							varStatus="status">
							<c:if test="${ status.index eq 0 }">
								<tr>
									<td>우편번호</td>
									<td><input type="text" name="post"
										class="postcodify_postcode5" size="6" value="${ addr }">
										<button type="button" id="postcodify_search_button">검색</button>
									</td>
								</tr>
							</c:if>
							<c:if test="${ status.index eq 1 }">
								<tr>
									<td>도로명 주소</td>
									<td><input type="text" name="address1"
										class="postcodify_address" value="${ addr }"></td>
								</tr>
							</c:if>
							<c:if test="${ status.index eq 2 }">
								<tr>
									<td>상세 주소</td>
									<td><input type="text" name="address2"
										class="postcodify_extra_info" value="${ addr }"></td>
								</tr>
							</c:if>
						</c:forTokens>
					</c:if>

					<!-- jQuery와 Postcodify를 로딩한다. 두개의 script 붙어있어야됨.. 왠지는 모름 -->
					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					<script>
						// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
						$(function() {
							$("#postcodify_search_button").postcodifyPopUp();
						});
						
						$(function(){
							//비밀번호 확인
								$('#pwd2').blur(function(){
								   if($('#pwd').val() != $('#pwd2').val()){
								    	if($('#pwd2').val()!=''){
									    alert("비밀번호가 일치하지 않습니다.");
								    	    $('#pwd2').val('');
								          $('#pwd2').focus();
								      }
								  }
							})  	   
						});
					</script>

					<tr>
						<td colspan="2" align="center">
							<button>수정하기</button> 
							<c:url var="mdelete" value="mdelete.do">
								<c:param name="id" value="${ loginUser.id }" />
							</c:url>
							<button type="button" onclick="location.href='${ mdelete }';">탈퇴하기</button>
							<input type="reset" value="취소하기">
						</td>
					</tr>
				</table>
			</form>
			<br> <br> <a href="home.do">시작 페이지로 이동</a>
		</div>


	</section>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>