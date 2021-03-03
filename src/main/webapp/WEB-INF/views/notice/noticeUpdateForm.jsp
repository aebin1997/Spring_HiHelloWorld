<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>


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
	<hr>
	
		<section style="padding: 70px 0 60px 0;">
		
		<br><br>
		<form action="nupdate.do" method="post" enctype="multipart/form-data" style="padding-bottom: 30px;">
			<input type="hidden" name="nid" value="${ notice.nid }">
			<c:if test="${ !empty notice.n_file_name }">
				<input type="hidden" name="file_path" value="${ notice.n_file_name }">
			</c:if>
			
			<table style="padding-top: 50px" align="center" width="700" border="0" cellpadding="2">
				<tr>
					<td height="30" align="center" bgcolor="#ccc"><font color="white">공지사항 수정</font></td>
				</tr>
				<tr>
					<td bgcolor=white>
						<table class="table2">
						
							<tr>
								<td width="200px">말머리</td>
								<td width="500px"><select type="test" name="ntype">
	    											  <option value="공지사항">공지사항</option>
													  <option value="이벤트">이벤트</option>
													  <option value="긴급">긴급</option>
													  <option value="필독">필독</option>
												  </select></td>
								
							</tr>
							
							<tr>
								<td>제 목</td>
								<td><input type="text" name="ntitle"></td>
							</tr>
							
							<tr>
								<td>작성자</td>
								<td><input type="text" name="nwriter" readonly value="${ notice.nwriter }"></td>
							</tr>
	
							<tr>
								<td>첨부파일</td>
								<td>
									<%-- 원래 첨부파일이 있는 경우 --%>
									<c:if test="${ !empty notice.n_file_name }"> ${ notice.n_file_name } &nbsp;<input type="checkbox" name="delFlag" value="yes"> 파일삭제 <br>
									</c:if>
									<%-- 원래 첨부파일이 없을 경우 --%>
									<c:if test="${empty notice.n_file_name }"> <input type="file" name="upfile">
									</c:if>
								</td>
							</tr>
	
							<tr>
								<td>내 용</td>
								<td><textarea name="ncontent" rows="5" cols="50">${ notice.ncontent }</textarea></td>
							</tr>
							
							<tr>
								<th colspan="2" style="text-align: right; padding-top:20px">
									<input type="submit" value="수정하기">&nbsp;
									<input type="reset" value="수정취소"> &nbsp;
										<c:url var="nlist" value="/nlist.do">
											<c:param name="page" value="${ currentPage }" />
										</c:url>
									<button onclick="javascript:location.href='${ nlist }'; return false;">목록</button>
								</th>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</section>
	

	<jsp:include page="../common/footer.jsp" />
</body>
</html>