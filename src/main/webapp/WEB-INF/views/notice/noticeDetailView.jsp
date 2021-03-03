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
<title>공지사항 열람 페이지</title>


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
	
	<jsp:include page="../common/header.jsp" />
	
	
	<div style="text-align: center; padding-top: 120px;">
		<div>
			<h4 style="margin: 20px 0 10px 0;">${ notice.ntitle }</h4>
		</div>
	</div>
	
	<br>
	
	<table align="center" cellpadding="2" cellspacing="0" width="700" style="margin-bottom:30px">
		<tr>
			<td bgcolor=white>
				<table class="table2">
					<tr>
						<td width="200px">작성자</td>
						<td width="500px">${ notice.nwriter } 님</td>
					</tr>
					<tr>
						<td width="200px">첨부파일</td>
						<td width="500px">
							<c:if test="${ empty notice.n_file_name }">첨부파일 없음</c:if>
							<c:if test="${ !empty notice.n_file_name }">
								<c:url var="nfd" value="/nfdown.do">
									<c:param name="ofile" value="${ notice.n_file_name }" />
									<c:param name="rfile" value="${ notice.n_rfile_name }" />
								</c:url>
							<a href="${ nfd }">${ notice.n_file_name }</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td width="200px">내 용</td>
						<td width="500px" height="200">${ notice.ncontent }</td>
					</tr>
				</table>
			</td>
		</tr>

		<tfoot>
          <td colspan="4" style="text-align: right; margin-bottom:30px">
          	<%-- 관리자가 접속했을 때 --%>
			<c:if test="${ !empty sessionScope.loginUser and loginUser.nickname eq notice.nwriter and loginUser.user_lv eq 'B' }">
				<c:url var="nuv" value="/upmove.do">
					<c:param name="nid" value="${ notice.nid }" />
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ nuv }'" style='float:center'>수정</button>
							 
				<c:url var="ndl" value="/ndel.do">
					<c:param name="nid" value="${ notice.nid }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ ndl }'" style='float:center'>글삭제</button>
			
				<c:url var="nls" value="/nlist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ nls }'" style='float:center'>목록</button>
			
			</c:if> 
			
			<%-- 로그인한 유저라면 --%>
			<c:if test="${ !empty sessionScope.loginUser and loginUser.user_lv eq 'A' }">
							
				<c:url var="nls" value="/nlist.do">
						<c:param name="page" value="${ currentPage }" />
					</c:url>
				<button type="button" onclick="javascript:location.href='${ nls }'" style='float:right'>목록</button>
			</c:if> 
			
			
			<%-- 비로그인일때 --%> 
			<c:if test="${ empty sessionScope.loginUser }">  
				<c:url var="nls" value="/nlist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href= '${ nls }';">목록</button>
			</c:if>
				
			</td>
		</tfoot>
		
	</table>

	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>