<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 응답온 페이지값 추출함 --%>
<c:set var="currentPage" value="${ requestScope.page }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		hideReplyForm(); //뷰 페이지 처음 실행시에는 댓글달기 폼이 안 보이게 함

		//jquery ajax 로 해당 게시글에 대한 댓글 조회 요청
		//해당 게시글의 번호를 전송함
		var pid = $
		{
			pboard.pid
		}
		; //el 의 값을 변수에 대입
		var loginUser = "${ sessionScope.loginUser.id }"; //로그인한 회원 아이디 변수에 대입
		$
				.ajax({
					url : "${ pageContext.request.contextPath }/rlist.do",
					type : "post",
					data : {
						ref_pid : pid
					}, //전송값에 변수 사용
					dataType : "json",
					success : function(data) {
						console.log("success : " + data);

						//object ==> string
						var jsonStr = JSON.stringify(data);
						//string ==> json 
						var json = JSON.parse(jsonStr);

						var values = "";
						for ( var i in json.list) {
							//본인이 등록한 댓글일 때는 수정/삭제 가능하게 함
							if (loginUser == json.list[i].rwriter) {
								values += "<tr><td>"
										+ json.list[i].rwriter
										+ "</td><td>"
										+ json.list[i].r_create_date
										+ "</td></tr><tr><td colspan='2'>"
										+ "<form action='rupdate.do' method='post'>"
										+ "<input type='hidden' name='rid' value='" +  json.list[i].rid  + "'>"
										+ "<input type='hidden' name='pid' value='${pboard.pid}'>"
										+ "<textarea name='rcontent'>"
										+ decodeURIComponent(
												json.list[i].rcontent).replace(
												/\+/gi, " ")
										+ "</textarea><input type='submit' value='수정'></form>"
										+ "<button onclick='replyDelete("
										+ json.list[i].rid
										+ ");'>삭제</button></td></tr>";
							} else { //본인 댓글이 아닐 때
								values += "<tr><td>"
										+ json.list[i].rwriter
										+ "</td><td>"
										+ json.list[i].r_create_date
										+ "</td></tr><tr><td colspan='2'>"
										+ decodeURIComponent(
												json.list[i].rcontent).replace(
												/\+/gi, " ") + "</td></tr>";
							}
						} //for in

						$("#rlistTbl").html($("#rlistTbl").html() + values);
					},
					error : function(jqXHR, textstatus, errorthrown) {
						console.log("error : " + jqXHR + ", " + textstatus
								+ ", " + errorthrown);
					}
				}); //notice top3 ajax

	}); //jquery document ready

	function replyDelete(rid) {
		location.href = "${ pageContext.request.contextPath }/rdel.do?rid="
				+ rid + "&pid=${ pboard.pid}";
	}

	function showReplyForm() {
		$("#replyDiv").css("display", "block");
	}

	function hideReplyForm() {
		$("#replyDiv").css("display", "none");
	}
</script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 70px 0 60px 0;">
		<hr>
		<h2 align="center">${ requestScope.pboard.pid }번 게시글 상세보기</h2>
		<br>
		<table align="center" cellpadding="10" cellspacing="0" border="1"
			width="500">
			<tr>
				<th>제 목</th>
				<td>${ pboard.btitle }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${ pboard.pwriter }</td>
			</tr>
			<tr>
				<th>내 용</th>
				<td>${ pboard.pcontent }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><c:if test="${ empty pboard.p_file_name }">
				첨부파일 없음
				</c:if> <c:if test="${ !empty pboard.p_file_name }">
						<c:url var="pfd" value="/pfdown.do">
							<c:param name="ofile" value="${ pboard.p_file_name }" />
							<c:param name="rfile" value="${ pboard.p_rfile_name }" />
						</c:url>
						<a href="${ pfd }">${ pboard.p_file_name }</a>
					</c:if></td>
			</tr>
			<tr align="center" valign="middle">
				<th colspan="2">
					<%-- 로그인한 상태일 때 댓글달기 사용하게 함 --%> <c:if test="${ !empty loginUser }">
						<button onclick="showReplyForm();">댓글달기</button>
   						&nbsp; &nbsp;
						</c:if> <%-- 로그인한 상태이면서, 본인 글일때만 보여지게 함 --%> <c:if
						test="${ !empty loginUser and loginUser.id eq pboard.pwriter }">
						<c:url var="puv" value="/pupview.do">
							<c:param name="pid" value="${pboard.pid }" />
							<c:param name="page" value="${ currentPage }" />
						</c:url>
						<a href="${ puv }">[수정페이지로 이동]</a> &nbsp; &nbsp; 
   						<c:url var="pdl" value="/pdelete.do">
							<c:param name="pid" value="${ pboard.pid }" />
						</c:url>
						<a href="${ pdl }">[글삭제]</a> &nbsp; &nbsp; 
						</c:if> <c:url var="pls" value="/plist.do">
						<c:param name="page" value="${ currentPage }" />
					</c:url> <a href="${ pls }">[목록]</a>
				</th>
			</tr>
		</table>
		<hr>
		<%-- 댓글목록 표시 영역 --%>
		<div id="rlistView" style="border: 1px dotted gray;">
			<table id="rlistTbl" align="center" cellspacing="0" cellpadding="5"
				border="1"></table>
		</div>
		<hr>
		<%-- 댓글달기 폼 영역 --%>
		<div id="replyDiv">
			<form action="rinsert.do" method="post">
				<input type="hidden" name="ref_pid" value="${ pboard.pid }">
				<table align="center" width="500" border="1" cellspacing="0"
					cellpadding="5">
					<tr>
						<th>작성자</th>
						<td><input type="text" name="rwriter" readonly
							value="${ sessionScope.loginUser.id }"></td>
					</tr>
					<tr>
						<th>내 용</th>
						<td><textarea name="rcontent" rows="5" cols="50"></textarea></td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="댓글등록">
							&nbsp; <input type="reset" value="댓글취소"
							onclick="hideReplyForm(); return false;"></th>
					</tr>
				</table>
			</form>
		</div>

		<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>





