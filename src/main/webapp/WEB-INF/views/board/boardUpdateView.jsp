<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="currentPage" value="${ requestScope.page }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>


<link rel="stylesheet" href="/hhw/resources/writerform/css/core.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/css2.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/icon-font.min.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/style.css" />


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
	<c:import url="../common/header.jsp"/>
	<hr>

	<section style="padding: 70px 0 60px 0;">
		
		<br><br>
		<form action="bupdate.do" method="post" enctype="multipart/form-data" style="padding-bottom: 30px;">
			<input type="hidden" name="bid" value="${ board.bid }">
			<input type="hidden" name="btitle" value="${ board.btitle }">
			<input type="hidden" name="b_original_filename" value="${ board.b_original_filename }">
			<input type="hidden" name="b_rename_filename" value="${ board.b_rename_filename }">
			<input type="hidden" name="page" value="${ currentPage }">
			
			<table style="padding-top: 50px" align="center" width="700" border="0" cellpadding="2">
				<tr>
					<td height="30" align="center" bgcolor="#ccc"><font color="white">게시글 수정</font></td>
				</tr>
				<tr>
					<td bgcolor=white>
						<table class="table2">
						
							<tr>	
								<td width="200px">말머리</td>
								<td width="500px"><select type="test" name="btype">
	    											  <option value="질문이요">질문이요</option>
													  <option value="일상글이요">일상글이요</option>
													  <option value="칭찬글이요">칭찬글이요</option>
													  <option value="참고글이요">참고글이요</option>
												  </select></td>
								
							</tr>
							
							<tr>
								<td>작성자</td>
								<td><input type="text" name="bwriter" readonly value="${ board.bwriter }"></td>
							</tr>
	
							<tr>
								<td>첨부파일</td>
								<td>
									<!-- 첨부파일이 있는데 삭제하는 경우 -->
									<c:if test="${ !empty board.b_original_filename }">
										${ board.b_original_filename } &nbsp; &nbsp; <input type="checkbox" name="delFlag" value="yes">파일삭제 <br>
									</c:if>
									<!-- 다른 파일로 변경하는 경우 -->
									<c:if test="${ empty board.b_original_filename }"> 
										<input type="file" name="upfile">
									</c:if>
								</td>
							</tr>
	
							<tr>
								<td>내 용</td>
								<td>
								<%-- <textarea name="bcontent" rows="5" cols="50">${ board.bcontent }</textarea> --%>
								<textarea class="textarea_editor form-control border-radius-0" name="bcontent" rows="10" cols="100">${ board.bcontent }</textarea>
								</td>
							</tr>
							
							<tr>
								<th colspan="2" style="text-align: right; padding-top:20px">
									<input type="submit" value="수정하기">&nbsp;
									<input type="reset" value="수정취소"> &nbsp;
										<c:url var="blist" value="/blist.do">
											<c:param name="page" value="${ currentPage }" />
										</c:url>
									<button onclick="javascript:location.href='${ blist }'; return false;">목록</button>
								</th>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	
	
<script src="/hhw/resources/writerform/js/core.js"></script>
<script src="/hhw/resources/writerform/js/js.js"></script>
<script src="/hhw/resources/writerform/js/layout-settings.js"></script>
<script src="/hhw/resources/writerform/js/process.js"></script>
<script src="/hhw/resources/writerform/js/script.min.js"></script>
 
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>
