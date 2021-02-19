<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    <%-- 응답온 페이지값 추출함 --%>
<c:set var="currentPage" value="${ requestScope.page }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	hideReplyForm();	//뷰 페이지 처음 실행시에는 댓글달기 폼이 안보이게 함
	
	//해당 게시글의 번호를 전송함
	var qa_id = ${ qa.qa_id }; //el 의 값을 변수에 대입
	$.ajax({
        url : "${ pageContext.request.contextPath }/qarlist.do", /* 절대경로 */
        type : "post",
        data : { ref_qa_id: qa_id },	//전송값에 변수 사용
        dataType : "json",
        success : function(data) {
           console.log("success : " + data);

           // object ==> string
           var jsonStr = JSON.stringify(data);
           // string ==> json
           var json = JSON.parse(jsonStr);

           var values = "";
           for ( var i in json.list) {
              values += "<tr><td>" + json.list[i].qar_id + "</td><td>" + json.list[i].qar_create_date+ "</td><td>"+json.list[i].qar_writer+"</td></tr>"
              + "<tr><td colspan='3'>" + decodeURIComponent(json.list[i].qar_content).replace(/\+/gi, " ") +"</td></tr>"; 
           } //for in

           $("#qarlistTbl").html($("#qarlistTbl").html() + values);
        },
        error : function(jqXHR, textstatus, errorthrown) {
           console.log("error : " + jqXHR + ", " + textstatus + ", "
                 + errorthrown);
        }
     });
});
	
	//jquery ajax 로 헤당 게시글에 대한 댓글 조회 요청 
 //jquery document ready

function showReplyForm(){
	$("#replyDiv").css("display","block");
}

function hideReplyForm(){
	$("#replyDiv").css("display","none");
}
</script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<hr>
	<h2 align="center">${ requestScope.qa.qa_id }번 게시글 상세보기</h2>
	<br>
<table align="center" cellpadding="10" cellspacing="0" border="1" width="500">
<tr><th>제 목</th><td>${ qa.qa_title }</td></tr>
<tr><th>작성자</th><td>${ qa.qa_writer }</td></tr>
<tr><th>내 용</th><td>${ qa.qa_content }</td></tr>
<tr><th>첨부파일</th>
<td>
<c:if test="${ empty qa.qa_origin_file_name }">
첨부파일 없음
</c:if>
<c:if test="${ !empty qa.qa_origin_file_name }">
<c:url var="qafd" value="/qafdown.do">
	<c:param name="ofile" value="${ qa.qa_origin_file_name }"/>
	<c:param name="rfile" value="${ qa.qa_rename_file_name }"/>
</c:url>	
<a href="${ qafd }">${ qa.qa_origin_file_name }</a>
</c:if>
</td></tr>
<tr align="center" valign="middle" ><th colspan="2">
<%-- 로그인한 상태일때 댓글 달기 사용하게 함 --%>
<c:if test="${ !empty loginUser }">
	<button onclick="showReplyForm();">댓글 달기</button>
	&nbsp; &nbsp;
</c:if>
<%-- 로그인한 상태 , 본인 글일때만 보여지게 함 --%>
<c:if test="${ !empty loginUser and loginUser.id eq qa.qa_writer }">
	<c:url var="qauv" value="/qaupview.do">
		<c:param name="qaid" value="${ qa.qa_id }"/>
		<c:param name="page" value="${ currentPage }"/>
	</c:url>
	<a href="${ qauv }">[수정페이지로 이동]</a>&nbsp; &nbsp;
	<c:url var="qadl" value="/qadelete.do">
		<c:param name="qadelete" value="${ qa.qa_id }"/>	
	</c:url>
	<a href="${ qadl }">[글삭제]</a> &nbsp; &nbsp;
</c:if>
<c:url var="qalist" value="/qalist.do">
		<c:param name="page" value="${ currentPage }"/> 
</c:url>
<a href="${ qalist }">[목록]</a>
</th></tr>
</table>

<%-- 댓글목록 표시 영역 --%>
<div id="qarlistView" style="border: 1px dotted gray;">
<table id="qarlistTbl"  align="center" cellspacing="0" cellspacing="5" border="1"></table>
</div>

<br><br><br>
<%-- 댓글 달기 폼영역 --%>
<div id="replyDiv">
<form action="qarinsert.do" method="post">
<input type="hidden" name="ref_qa_id" value="${ qa.qa_id }">
<table align="center" width="500" border="1" cellpading="5" cellspacing="0">
<tr><th>작성자</th>
<td><input type="text" name="qar_writer" readonly value="${ sessionScope.loginUser.id }"></td></tr>
<tr><th>내용</th><td><textarea name="qar_content" rows="5" cols="50"></textarea></td></tr>
<tr><th colspan="2">
<input type="submit" value="댓글 등록"> &nbsp;
<input type="reset" value="댓글 취소" onclick="hideReplyForm(); return false;"></th></tr>
</table>
</form>
</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>




