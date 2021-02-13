<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    <%-- 응답온 페이지값 추출함 --%>
<c:set var="maxPage" value="${ requestScope.maxPage }" /> 
<c:set var="startPage" value="${ requestScope.startPage }"  /> 
<c:set var="endPage" value="${ requestScope.endPage }"  /> 
<c:set var="currentPage" value="${ requestScope.currentPage }"  /> 

<%-- 글쓰기 페이지 이동 요청 url --%>
<c:url var="qawf" value="/qawmove.do" >
	<c:param name="page" value="${ currentPage }"/>
</c:url>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function showWriterForm(){
		location.href = "${ qawf }";
	}
</script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<hr>
<%-- 로그인한 사용자만 글쓰기 기능 사용할 수 있게 함 --%>
<c:if test="${ !empty sessionScope.loginUser }">
<div style="align:center; text-align:center;">
   <button onclick="showWriteForm();">글쓰기</button>
</div>
</c:if>
<br>

<%-- 목록 출력 --%>
<div style="align:center;padding-left:400px;">
   <c:url var="qalist" value="/qalist.do" >
         <c:param name="page" value="1" />
   </c:url>

</div>
<br>
<table align="center" border="1" width="700" cellspacing="0">
<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th>
<th>첨부파일</th></tr>
<c:forEach items="${ requestScope.list }" var="qa">
<tr>
   <td align="center">${ qa.qa_id }</td>
   <td>   
   <c:url var="qadetail" value="/qadetail.do">
      <c:param name="page" value="${ currentPage }"/>
      <c:param name="qa_id" value="${ qa.qa_id }" />
   </c:url>
   <a href="${ qadetail }">${ qa.qa_title }</a>
   </td>
   <td align="center">${ qa.qa_writer }</td>
   <td align="center">${ qa.qa_create_date }</td>
   <td align="center">${ qa.qa_readcount }</td>
   <td align="center">
      <c:if test="${ !empty qa.qa_origin_file_name }">
      ◎
      </c:if>
      <c:if test="${ empty qa.qa_origin_file_name }">
      &nbsp;
      </c:if>
   </td>
</tr>
</c:forEach>
</table>
<br>



<%-- 현재 페이지가 1이 아니면 링크설정, 현재 1페이지이면 링크없음 --%>
<c:if test="${ empty action}">
<%-- 페이징 처리 
   [맨처음][이전] 숫자...........  [다음][맨끝]
--%>
<div style="text-align: center;">
<c:if test="${ currentPage <= 1}">
[맨처음]
</c:if>
<c:if test="${ currentPage > 1 }">
   <c:url var="qalist1" value="/qalist.do">
      <c:param name="page" value="1" />
   </c:url>
   <a href="${ qalist }">[맨처음]</a>
</c:if> &nbsp;
<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
   <c:url var="qalist2" value="/qalist.do">
      <c:param name="page" value="${ startPage - 10 }"/>
   </c:url>
   <a href="${ qalist2 }">[이전]</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) >= 1) }">
[이전]
</c:if> &nbsp; 
<%-- 가운데 표시할 페이지 그룹 숫자 링크 설정 --%>
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
    <c:if test="${ p eq currentPage }">
      <font size="4" color="red">[${ p }]</font>
   </c:if>
   <c:if test="${ p ne currentPage }">
      <c:url var="qalist3" value="/qalist.do">
         <c:param name="page" value="${ p }" />
      </c:url>
      <a href="${ qalist3 }">${ p }</a>
   </c:if>
</c:forEach> &nbsp;
<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
   <c:url var="qalist4" value="/qalist.do">
      <c:param name="page" value="${ startPage + 10 }"/>
   </c:url>
   <a href="${ qalist4 }">[다음그룹]</a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
   [다음그룹]&nbsp;
</c:if>
<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
   [맨끝]&nbsp;
</c:if>   
<c:if test="${ currentPage < maxPage }">
   <c:url var="qalist5" value="/qalist.do">
      <c:param name="page" value="${ maxPage }"/>
   </c:url>
   <a href="${ qalist5 }">[맨끝]</a>
</c:if>
</div>
</c:if>


	<jsp:include page="../common/footer.jsp"/>
</body>
</html>-