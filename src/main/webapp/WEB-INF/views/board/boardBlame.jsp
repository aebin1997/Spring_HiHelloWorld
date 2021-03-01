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
<title>신고 페이지</title>
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>


</head>
<body>
	
	<c:import url="../common/header.jsp" />

	<div style="text-align: center; padding-top: 90px;">
		<div>
			<h2 style="margin: 20px 0 10px 0;">${ requestScope.board.bid }번게시글 상세보기</h2>
		</div>
	</div>

	<br>

	<table align="center" cellpadding="10" cellspacing="0" border="1" width="500">
		<tr>
			<th>제 목</th>
			<td>${ board.btitle }</td>
		</tr>
	
		<tr>
			<th>작성자</th>
			<td>${ board.bwriter }</td>
		</tr>
		
		<tr>
			<th>내 용</th>
			<td>${ board.bcontent }</td>
		</tr>
	
		<tr>
			<th>첨부파일</th>
			<td>
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
		
		
		<tr valign="middle">
			<th style="text-align: right;" colspan="2">
			
			<%-- 로그인한 상태이면서, 본인이 작성한 게시글 일 때 --%>
			<c:if test="${ !empty loginUser and sessionScope.loginUser.nickname eq board.bwriter }">
				<c:url var="buv" value="/bupview.do">
					<c:param name="bid" value="${ board.bid }" />
					<c:param name="page" value="${ currentPage }" />
				</c:url>
				<button type="button" onclick="javascript:location.href='${ buv }'">수정</button> &nbsp; &nbsp;
								 
					<c:url var="bdl" value="/bdelete.do">
					<c:param name="bid" value="${ board.bid }" />
					</c:url>
					<button type="button" onclick="javascript:location.href='${ bdl }'">글삭제</button> &nbsp; &nbsp;
				
				<c:url var="boardBlame" value="/b.blame.insert.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
				<button type="button" onclick="javascript:location.href='${ boardBlame }'">신고</button> &nbsp; &nbsp;
				
				<c:url var="bls" value="/blist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
				<button type="button" onclick="javascript:location.href='${ bls }'">목록</button> &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
				
				</c:if> 
				
				
				<%-- 비로그인일때 --%> 
				<c:if test="${ empty loginUser }">  
				<c:url var="bls" value="/blist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
				<button type="button" onclick="javascript:location.href= '${ bls }';">목록</button>
				</c:if>
				
			</th>
		</tr>
	</table>
	
	<%-- 로그인한 상태일 때 댓글달기 사용하게 함 --%> 
			<c:if test="${ !empty loginUser }">
			
				<%-- 댓글달기 폼 영역 --%>
				<div id="replyDiv" style="padding-bottom: 30px;">
					<form action="rinsert.do" method="post">
						<input type="hidden" name="b_ref_bid" value="${ board.bid }">
						<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
						
						
							<tr>
								<th>작성자</th>
								<td><input type="text" name="b_rwriter" readonly value="${ sessionScope.loginUser.nickname }"></td>
							</tr>
							
							<tr>
								<th>내 용</th>
								<td><textarea name="b_rcontent" rows="5" cols="50"></textarea></td>
							</tr>
							
							<tr>
								<th colspan="2"  style="text-align: right;">
								<input type="submit" value="댓글등록">&nbsp;
							</tr>
						</table>
					</form>
				</div>
			</c:if> 
			
	
	
			
		
		<%-- 신고하기 폼 영역  --%>
		<%-- <c:if test="${ !empty loginUser }"> --%>
		<c:if test="${ !empty loginUser and loginUser.nickname ne B_Reply.b_rwriter }">
			<div id="blameDiv" style="padding-bottom: 30px;">
				<form action="b.blame.insert.do" method="post">
					<input type="hidden" name="blame_bid" value="${ board.bid }">
					<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
					
						<tr>
							<th>신고유형</th>
							<td><select type="test" name="blame_type">
								<option value="부적절">부적절</option>
								<option value="욕설">욕설</option>
								<option value="사기">사기</option>
								<option value="음란물">음란물</option>
								</select></td>
						</tr>
					
						<tr>
							<th>작성자</th>
							<td><input type="text" name="mm_nickname" readonly value="${ sessionScope.loginUser.nickname }"></td>
						</tr>
						
						<tr>
							<th>신고대상</th>
							<td><input type="text" name="target_nickname" readonly value=" ${ B_Reply.b_rwriter } "></td>
						</tr>
						
						<tr>
							<th>내 용</th>
							<td><textarea name="blame_content" rows="5" cols="50"></textarea></td>
						</tr>
						
						<tr>
							<th colspan="2">
							<input type="submit" value="신고">&nbsp;
							<input type="reset" value="신고취소"  onclick="hideBlameForm(); return false;"></th>
						</tr>
					</table>
				</form>
			</div>
			<!-- <button onclick="showBlameForm()">신고</button> -->
 		</c:if>
 
	<%-- 댓글목록 표시 영역 --%>
	<div id="rlistView" style="padding-bottom: 30px;">
		<table id="rlistTbl" align="center" cellspacing="0" cellpadding="20" border="1" width="500"></table>
	</div>



	<jsp:include page="../common/footer.jsp" />

</body>
</html>





