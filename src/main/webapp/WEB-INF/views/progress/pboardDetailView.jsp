<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		var pid = ${ pboard.pid};
		
		var loginUser = "${ sessionScope.loginUser.nickname }"; //로그인한 회원 아이디 변수에 대입
		$
				.ajax({
					url : "${ pageContext.request.contextPath }/prlist.do",
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
							if (loginUser == json.list[i].prwriter) {
								values += "<tr><td>"
										+ json.list[i].prwriter
										+ "</td><td>"
										+ json.list[i].pr_date
										+ "</td></tr><tr><td colspan='2'>"
										+ "<form action='prupdate.do' method='post'>"
										+ "<input type='hidden' name='prid' value='" +  json.list[i].prid  + "'>"
										+ "<input type='hidden' name='pid' value='${pboard.pid}'>"
										+ "<textarea name='prcontent' rows='5' cols='50'>"
										+ decodeURIComponent(
												json.list[i].prcontent)
												.replace(/\+/gi, " ")
										+ "</textarea><br><input type='submit' value='수정'></form>"
										+ "<button onclick='replyDelete("
										+ json.list[i].prid
										+ ");'>삭제</button></td></tr>";
							} else { //본인 댓글이 아닐 때
								values += "<tr><td>"
										+ json.list[i].prwriter
										+ "</td><td>"
										+ json.list[i].pr_date
										+ "</td></tr><tr><td colspan='2'>"
										+ decodeURIComponent(
												json.list[i].prcontent)
												.replace(/\+/gi, " ")
										+ "</td></tr>";
							}
						} //for in

						$("#prlistTbl").html($("#prlistTbl").html() + values);
					},
					error : function(jqXHR, textstatus, errorthrown) {
						console.log("error : " + jqXHR + ", " + textstatus
								+ ", " + errorthrown);
					}
				}); //notice top3 ajax

	}); //jquery document ready

	function replyDelete(prid) {
		location.href = "${ pageContext.request.contextPath }/prdel.do?prid="
				+ prid + "&pid=${ pboard.pid }";
	}

	function showReplyForm() {
		$("#replyDiv").css("display", "block");
	}

	function hideReplyForm() {
		$("#replyDiv").css("display", "none");
	}
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
	<section style="padding: 70px 0 60px 0;">

		<br>
		<br>
		<br>
		<table style="padding-top: 50px" align=center width=700 border=0
			cellpadding=2>
			<tr>
				<td height=20 align=center bgcolor=#ccc><font color=white>
						${ requestScope.pboard.pid }번게시글상세보기</font></td>
			</tr>

			<tr>
				<td bgcolor=white>
					<table class="table2">
						<tr>
							<td width="200px">제 목</td>
							<td width="500px">${ pboard.ptitle }</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${ pboard.pwriter }</td>
						</tr>
						<tr>
							<td>내 용</td>
							<td>${ pboard.pcontent }</td>
						</tr>
						<tr>
							<td>첨부파일</td>
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
					</table>
					
					<center>
								<%-- 로그인한 상태일 때 댓글달기 사용하게 함 --%> <c:if
									test="${ !empty loginUser }">
									<button onclick="showReplyForm();">댓글달기</button>
   						&nbsp; &nbsp;
						</c:if> <%-- 로그인한 상태이면서, 본인 글일때만 보여지게 함 --%> <c:if
									test="${ !empty loginUser and loginUser.nickname eq pboard.pwriter }">
									<c:url var="puv" value="/pupview.do">
										<c:param name="pid" value="${ pboard.pid }" />
										<c:param name="pro_id" value="${ pboard.p_proid }" />
									</c:url>
									<a href="${ puv }">[수정페이지로 이동]</a> &nbsp; &nbsp; 
   						<c:url var="pdl" value="/pdelete.do">
										<c:param name="pid" value="${ pboard.pid }" />
										<c:param name="pro_id" value="${ pboard.p_proid }" />
									</c:url>
									<a href="${ pdl }">[글삭제]</a> &nbsp; &nbsp; 
						</c:if> <c:url var="pls" value="/plist.do">
									<c:param name="pro_id" value="${ pboard.p_proid }" />
								</c:url> <a href="${ pls }">[목록]</a>
						</center>
				</td>
			</tr>
		</table>
		<br>
		<%-- 댓글달기 폼 영역 --%>
		<div id="replyDiv">
			<form action="prinsert.do" method="post">
				<input type="hidden" name="ref_pid" value="${ pboard.pid }">
				<table align="center" width="500" border="1" cellspacing="0"
					cellpadding="5">
					<tr>
						<th>작성자</th>
						<td><input type="text" name="prwriter" readonly
							value="${ sessionScope.loginUser.nickname }"></td>
					</tr>
					<tr>
						<th>내 용</th>
						<td><textarea name="prcontent" rows="5" cols="50"></textarea></td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="댓글등록">
							&nbsp; <input type="reset" value="댓글취소"
							onclick="hideReplyForm(); return false;"></th>
					</tr>
				</table>
			</form>
		</div>
		<br>
		
		<%-- 댓글목록 표시 영역 --%>
		<div id="prlistView">
			<table id="prlistTbl" align="center" cellspacing="0" cellpadding="20"
				border="1" width="500"></table>
		</div>
		<br> <br>


		<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>
