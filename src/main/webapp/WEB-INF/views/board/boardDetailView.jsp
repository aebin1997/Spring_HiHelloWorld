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
<title>게시글 열람 페이지</title>
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script> 


<script type="text/javascript">
	$(function() {
		
		/* hideReplyForm(); */  //뷰 페이지 처음 실행시에는 댓글달기 폼이 안 보이게 함
		hideBlameForm1();  //뷰 페이지 처음 실행시에는 댓글달기 폼이 안 보이게 함
		hideBlameForm2();  //뷰 페이지 처음 실행시에는 댓글달기 폼이 안 보이게 함
		
		
		//jquery ajax 로 해당 게시글에 대한 댓글 조회 요청
		//해당 게시글의 번호를 전송함
		var bid = ${ board.bid };//el 의 값을 변수에 대입
		var loginUser = "${ sessionScope.loginUser.nickname }"; //로그인한 회원 아이디 변수에 대입
		$.ajax({
		url : "${ pageContext.request.contextPath }/rlist.do",
		type : "post",
		data : { b_ref_bid : bid }, //전송값에 변수 사용
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
/* 				if (loginUser == json.list[i].b_rwriter) {
					values += "<table align='center' width='700' border='0' cellpadding='2'>"
							+ "<tr>"
							+ "<td bgcolor='white'>"
							+ "<table class='table2'>"
							+ "<tr>"
							+ "<td width='200px'><"+ json.list[i].b_rwriter"> 님 댓글</td>"
							+ "<td width='500px'>"	+ json.list[i].b_create_date "</td>"
							+ "</tr>"
							+ "<tr>"
							+ "<td colspan='2' width='200px'>"
							+ "<form action='rupdate.do' method='post'>"
							+ "<input type='hidden' name='b_rid' value='" +  json.list[i].b_rid  + "'>"
							+ "<input type='hidden' name='bid' value='${board.bid}'>"
							+ "<textarea name='b_rcontent' rows='2' cols='70'>"
							+ decodeURIComponent(json.list[i].b_rcontent).replace(/\+/gi, " ") "</textarea><br>"
							+ "<input type='submit' value='수정' style='width:50px;float:right;'></form>"
							+ "</tr>"
							+ "<button onclick='replyDelete("+ json.list[i].b_rid+ ");' style='width:50px;float:right;margin-right:10px'>삭제</button>"
							+ "</table></td></tr></table>";
				} else { //본인 댓글이 아닐 때
 					values += "<table align='center' width='700' border='0' cellpadding='2'>"
 							+ "<tr>"
							+ "<td bgcolor='white'>"
							+ "<table class='table2'>"
							+ "<tr>"
							+ "<td width='200px'><"+ json.list[i].b_rwriter"> 님 댓글</td>"
							+ "<td width='500px'>"	+ json.list[i].b_create_date "</td>"
							+ "</tr>"
							+ "<tr>"
							+ "<td colspan='2' width='200px'>"
							+ decodeURIComponent(json.list[i].b_rcontent).replace(/\+/gi, " ") 
							+ "<button onclick='showBlamForm2();' style='float:right'>신고</button>"
							+ "</td></tr></table></td></tr></table>"; */
							if (loginUser == json.list[i].b_rwriter) {
								values += "<tr><td><"+ json.list[i].b_rwriter
										+ "> 님 댓글</td><td>"	+ json.list[i].b_create_date
										+ "</td></tr><tr><td colspan='2'>"
										+ "<form action='rupdate.do' method='post'>"
										+ "<input type='hidden' name='b_rid' value='" +  json.list[i].b_rid  + "'>"
										+ "<input type='hidden' name='bid' value='${board.bid}'>"
										+ "<textarea name='b_rcontent' rows='2' cols='70'>"
										+ decodeURIComponent(json.list[i].b_rcontent).replace(/\+/gi, " ")
										+ "</textarea><br><input type='submit' value='수정' style='width:50px;float:right;'></form>"
										+ "<button onclick='replyDelete("+ json.list[i].b_rid+ ");' style='width:50px;float:right;margin-right:10px'>삭제 </button></td></tr>";
							} else { 
			 					values += "<tr><td><"+ json.list[i].b_rwriter
										+ "> 님 댓글</td><td>"+ json.list[i].b_create_date
										+ "</td></tr><tr><td colspan='2'>"
										+ decodeURIComponent(json.list[i].b_rcontent).replace(/\+/gi, " ") 
										+ "<button onclick='showBlamForm2();' style='float:right'>신고</button></td></tr>";
				}
			} //for in
			$("#rlistTbl").html($("#rlistTbl").html() + values);
			
		}, // success
		
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
		} // 에러
		
	}); //notice top3 ajax
}); //jquery document ready
	function replyDelete(b_rid) {
		location.href = "${ pageContext.request.contextPath }/rdel.do?b_rid="
				+ b_rid + "&bid=${ board.bid }";
	}
	function showReplyForm() {
		$("#replyDiv").css("display", "block");
	}
	
	function hideReplyForm() {
		$("#replyDiv").css("display", "none");
	} 
	function showBlamForm1() {
		$("#blameDiv1").css("display", "block");
	}
	
	function hideBlameForm1() {
		$("#blameDiv1").css("display", "none");
	}
	function showBlamForm2() {
		$("#blameDiv2").css("display", "block");
	}
	
	function hideBlameForm2() {
		$("#blameDiv2").css("display", "none");
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
	
	<c:import url="../common/header.jsp" />

	<div style="text-align: center; padding-top: 120px;">
		<div>
			<h4 style="margin: 20px 0 10px 0;">${ board.btitle }</h4>
		</div>
	</div>
				
	<br>

	<table align="center" cellpadding="2" cellspacing="0" width="700">
		<tr>
			<td bgcolor=white>
				<table class="table2">
					<tr>
						<td width="200px">작성자</td>
						<td width="500px">${ board.bwriter } 님</td>
					</tr>
					<tr>
						<td width="200px">첨부파일</td>
						<td width="500px">
							<c:if test="${ empty board.b_original_filename }">첨부파일 없음</c:if>
							<c:if test="${ !empty board.b_original_filename }">
								<c:url var="bfd" value="/bfdown.do">
									<c:param name="ofile" value="${ board.b_original_filename }" />
									<c:param name="rfile" value="${ board.b_rename_filename }" />
								</c:url>
							<a href="${ bfd }">${ board.b_original_filename }</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td width="200px">내 용</td>
						<td width="500px" height="200">${ board.bcontent }</td>
					</tr>
				</table>
			</td>
		</tr>

		<tfoot>
          <td colspan="4" style="text-align: right;">
          	<%-- 로그인한 상태이면서, 본인이 작성한 게시글 일 때 --%>
			<c:if test="${ !empty sessionScope.loginUser and loginUser.nickname eq board.bwriter }">
				<c:url var="buv" value="/bupview.do">
					<c:param name="bid" value="${ board.bid }" />
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ buv }'" style='float:center'>수정</button>
							 
				<c:url var="bdl" value="/bdelete.do">
					<c:param name="bid" value="${ board.bid }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ bdl }'" style='float:center'>글삭제</button>
			
				<c:url var="bls" value="/blist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ bls }'" style='float:center'>목록</button>
			
			</c:if> 
			
			<%-- 로그인한 상태이면서, 본인이 작성한 게시글이 아닐 때 --%>
			<c:if test="${ !empty sessionScope.loginUser and loginUser.nickname ne board.bwriter and loginUser.user_lv eq 'A' }">
							
				<c:url var="boardBlame" value="/b.blame.insert.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="showBlamForm1();">신고</button> &nbsp; &nbsp;
			
				<c:url var="bls" value="/blist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ bls }'">목록</button> &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
			</c:if> 
			
			
			<%-- 관리자가 로그인 했을일 때  --%>
			
			<c:if test="${ !empty sessionScope.loginUser and loginUser.nickname ne board.bwriter and loginUser.user_lv eq 'B' }">
				<c:url var="buv" value="/bupview.do">
					<c:param name="bid" value="${ board.bid }" />
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ buv }'">수정</button> &nbsp; &nbsp;
							 
				<c:url var="bdl" value="/bdelete.do">
					<c:param name="bid" value="${ board.bid }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ bdl }'">글삭제</button> &nbsp; &nbsp;
			
				<c:url var="bls" value="/blist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ bls }'">목록</button> &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
			</c:if> 
			
			<%-- 비로그인일때 --%> 
			<c:if test="${ empty sessionScope.loginUser }">  
				<c:url var="bls" value="/blist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href= '${ bls }';">목록</button>
			</c:if>
				
			</td>
		</tfoot>
	</table>

		<%-- 게시글 신고하기 폼 영역  --%>
			<div id="blameDiv1" style="padding-bottom: 30px; padding-top: 20px;">
				<form action="b.blame.insert.do" method="post">
					<input type="hidden" name="blame_bid" value="${ board.bid }">
					<table align=center width=700 border=0 cellpadding=2>
					
						<tr>
							<td height="20" align="center" bgcolor="#ccc"><font color=white>게시글 신고</font></td>
						</tr>
					
						<tr>
							<td bgcolor=white>
								<table class="table2">
									<tr>
										<td width="200px">신고유형</td>
										<td width="500px"><select type="test" name="blame_type">
														  <option value="부적절">부적절</option>
														  <option value="욕설">욕설</option>
														  <option value="사기">사기</option>
														  <option value="음란물">음란물</option>
														  </select></td>
									</tr>
								
									<tr>
										<td width="200px">작성자</td>
										<td width="500px"><input type="text" name="mm_nickname" readonly value="${ sessionScope.loginUser.nickname }"></td>
									</tr>
									
									<tr>
										<td width="200px">신고대상</td>
										<td width="500px"><input type="text" name="target_nickname" readonly value="${ board.bwriter }"></td>
									</tr>
									
									<tr>
										<td width="200px">내 용</td>
										<td width="500px"><textarea name="blame_content" rows="5" cols="50"></textarea></td>
									</tr>
									
									<tr>
										<th colspan="2" style="text-align: right;">
										<input type="submit" value="신고">&nbsp;
										<input type="reset" value="신고취소"  onclick="hideBlameForm1(); return false;"></th>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</div>		
	
	<%-- 로그인한 상태일 때 댓글달기 사용하게 함 --%> 
			<c:if test="${ !empty loginUser }">
			
				<%-- 댓글달기 폼 영역 --%>
				<br>
				<div id="replyDiv" style="padding-bottom: 30px;  padding-top: 20px;">
					<form action="rinsert.do" method="post">
						<input type="hidden" name="b_ref_bid" value="${ board.bid }">
						<table align="center" width="700" border="0" cellpadding="2">
						
						<tr>
							<td height="20" align="center" bgcolor="#ccc"><font color="white">댓글작성</font></td>
						</tr>
						
						
							<tr>
								<td bgcolor=white>
									<table class="table2">
										
										<tr>
											<td width="200px">작성자</td>
											<td width="500px"><input type="text" name="b_rwriter" readonly value="${ sessionScope.loginUser.nickname }"></td>
										</tr>
										
										<tr>
											<td width="200px">내 용</td>
											<td width="500px"><textarea name="b_rcontent" rows="5" cols="60"></textarea></td>
										</tr>
										
										<tr>
											<td colspan="2"  style="text-align: right;">
											<input type="submit" value="댓글등록">&nbsp;
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</c:if> 
			
		<%-- 게시글 신고하기 폼 영역  --%>
			<div id="blameDiv2" style="padding-bottom: 30px;">
				<form action="b.blame.insert.do" method="post">
					<input type="hidden" name="blame_bid" value="${ board.bid }">
					<table align="center" width="700" border="0" cellpadding="2">
					
						<tr>
							<td height="20" align="center" bgcolor="#ccc"><font color=white>댓글 신고</font></td>
						</tr>
					
						<tr>
							<td bgcolor=white>
								<table class="table2">
									<tr>
										<td width="200px">신고유형</td>
										<td width="500px"><select type="test" name="blame_type">
														  <option value="부적절">부적절</option>
														  <option value="욕설">욕설</option>
														  <option value="사기">사기</option>
														  <option value="음란물">음란물</option>
														  </select></td>
									</tr>
								
									<tr>
										<td width="200px">작성자</td>
										<td width="500px"><input type="text" name="mm_nickname" readonly value="${ sessionScope.loginUser.nickname }"></td>
									</tr>
									
									<tr>
										<td width="200px">신고대상</td>
										<td width="500px"><input type="text" name="target_nickname" readonly value="${ board.bwriter }"></td>
									</tr>
									
									<tr>
										<td width="200px">내 용</td>
										<td width="500px"><textarea name="blame_content" rows="5" cols="50"></textarea></td>
									</tr>
									
									<tr>
										<th colspan="2" style="text-align: right; padding-top: 20px;">
										<input type="submit" value="신고">&nbsp;
										<input type="reset" value="신고취소"  onclick="hideBlameForm2(); return false;"></th>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</div>		
			
 
	<%-- 댓글목록 표시 영역 --%>
	<div id="rlistView" style="padding-bottom: 30px;">
		<table id="rlistTbl" align="center" cellspacing="0" cellpadding="20" border="1" width="500"></table>
	</div>



	<jsp:include page="../common/footer.jsp" />

</body>
</html>