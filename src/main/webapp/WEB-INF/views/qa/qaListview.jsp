<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/myPage/common.css" />
<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.kin/static/pc/20210209151259/css/min/components.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/other.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/profile.css" />
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?v=2.2">
    
    <%-- 응답온 페이지값 추출함 --%>
<c:set var="maxPage" value="${ requestScope.maxPage }" /> 
<c:set var="startPage" value="${ requestScope.startPage }"  /> 
<c:set var="endPage" value="${ requestScope.endPage }"  /> 
<c:set var="currentPage" value="${ requestScope.currentPage }"  /> 

<%-- 글쓰기 페이지 이동 요청 url --%>
<c:url var="qawf" value="/qawmove.do" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	showDiv();
	
	$("input[name=item]").on("change", function(){
		showDiv();
	});
});

function showDiv(){
	if($("input[name=item]").eq(0).is(":checked")){
		$("#titleDiv").css("display", "block");
		$("#writerDiv").css("display", "none");
		$("#dateDiv").css("display", "none");
	}
	
	if($("input[name=item]").eq(1).is(":checked")){
		$("#titleDiv").css("display", "none");
		$("#writerDiv").css("display", "block");
		$("#dateDiv").css("display", "none");
	}
	
	if($("input[name=item]").eq(2).is(":checked")){
		$("#titleDiv").css("display", "none");
		$("#writerDiv").css("display", "none");
		$("#dateDiv").css("display", "block");
	}
}



	function showWriteForm(){
		location.href = "${ qawf }";
	}
</script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<hr>
	<br><br><br>




<br>
<%-- 검색창 --%>
<center>
<h2>의뢰 게시판</h2>
	<div style="text-align: right; padding-right: 300px;">
			<input type="radio" name="item" value="title" checked>제목
			<input type="radio" name="item" value="writer" checked>작성자
			<input type="radio" name="item" value="date" checked>날짜
	</div>
	<div id="titleDiv" style="text-align: right; padding-right: 300px;">
		<form action="qaSearchTitle.do" method="post">
		<input type="hidden" name="page" value="1">
		<label>제목<input type="search" name="keyword"></label>
		<input type="submit" value="검색"> 
		</form>
	</div>
	<div id="writerDiv" style="text-align: right; padding-right: 300px;">
		<form action="qaSearchWriter.do" method="post">
		<input type="hidden" name="page" value="1">
		<label>작성자<input type="search" name="keyword"></label>
		<input type="submit" value="검색"> 
		</form>
	</div>
	<div id="dateDiv" style="text-align: right; padding-right: 300px;">
		<form action="qaSearchDate.do" method="post">
		<input type="hidden" name="page" value="1">
		<label>날짜
		<input type="date" name="begin">~<input type="date" name="end"></label>
		<input type="submit" value="검색"> 
		</form>
	</div>
</center>
<br><br>



<%-- 목록 출력 --%>



	<div class="my_info_area" align="center">
		</h4>
		<table cellspacing="0" class="boardtype2 th_border my_table"
			width="1000" >
			<caption>
				<span class="blind">나의 답변 목록으로 제목, 디렉토리, 채택, 표정, 작성</span>
			</caption>
			<colgroup>
				<col width="1000">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
			</colgroup>
			<thead>
				<tr>
					<th scope="col" class="title" >제목</th>
					<th scope="col">포인트</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
					<th scope="col" class="title">작성</th>
				</tr>
				<tr>
					<td colspan="5" class="blank2">&nbsp; </th>
            </tr>
            </thead>
            <tbody>
            
                
                    <tr>
                    <c:forEach items="${ requestScope.list }" var="qa" >
                    <tr></tr>
                        <td class="qna">
                            <dl class="dlist_qna">
                                <dt>
                                    <span class="ico_q"><img
									src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif"
									width="18" height="14" alt="질문"></span>
										   <c:url var="qadetail" value="/qadetail.do">
										      <c:param name="page" value="${ currentPage }"/>
										      <c:param name="qa_id" value="${ qa.qa_id }" />
										   </c:url>
										   <a href="${ qadetail }" style="color: black;">${ qa.qa_title }</a>
                                </dt>
                                <dd>
                                    <span class="ico_a"><img
									src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif"
									width="18" height="14" alt="답변"></span>
                                </dd>
                            </dl>
                        </td>
                        <td class="field" ><font color="red">${ qa.qa_point }</font></td>
                        <td  class="field">${ qa.qa_writer } &nbsp; </td>
                        <td  class="t_num">${ qa.qa_readcount }</td>
                        <td class="t_num tc">${ qa.qa_create_date }</td>
                        </c:forEach>
                    </tr>
            </tbody>
        </table>
  
    </div>



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
   <a href="${ qalist1 }">[맨처음]</a>
</c:if> &nbsp;
<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
<c:if
									test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
   <c:url var="qalist2" value="/qalist.do">
      <c:param name="page" value="${ startPage - 10 }" />
   </c:url>
   <a href="${ qalist2 }">[이전]</a>
</c:if>
<c:if
									test="${ !((currentPage - 10) < startPage and (currentPage - 10) >= 1) }">
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
<c:if
									test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
   <c:url var="qalist4" value="/qalist.do">
      <c:param name="page" value="${ startPage + 10 }" />
   </c:url>
   <a href="${ qalist4 }">[다음그룹]</a>
</c:if>
<c:if
									test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
   [다음그룹]&nbsp;
</c:if>
<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
   [맨끝]&nbsp;
</c:if>
<c:if test="${ currentPage < maxPage }">
   <c:url var="qalist5" value="/qalist.do">
      <c:param name="page" value="${ maxPage }" />
   </c:url>
   <a href="${ qalist5 }">[맨끝]</a>
</c:if>
</div>
</c:if>

<c:if test="${ !empty action}">
<%-- 검색후 페이징 처리 
   [맨처음][이전] 숫자...........  [다음][맨끝]
--%>
<div style="text-align: center;">
<c:if test="${ currentPage <= 1}">
[맨처음]
</c:if>
<c:if test="${ currentPage > 1 }">
   <c:url var="qasearch1" value="/${ action }">
   		<c:if test="${ action ne 'qasearchDate.do' }">
      <c:param name="page" value="1" />
      </c:if>
      <c:if test="${ action eq 'qasearchDate.do' }">
      		<c:param name="begin" value="${ begin }" />
      		<c:param name="end" value="${ end }" />
      </c:if>
   </c:url>
   <a href="${ qasearch1 }">[맨처음]</a>
</c:if> &nbsp;
<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
<c:if
									test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
   <c:url var="qasearch2" value="/qalist.do">
      <c:param name="page" value="${ startPage - 10 }" />
   </c:url>
   <a href="${ qasearch2 }">[이전]</a>
</c:if>
<c:if
									test="${ !((currentPage - 10) < startPage and (currentPage - 10) >= 1) }">
[이전]
</c:if> &nbsp;  
<%-- 가운데 표시할 페이지 그룹 숫자 링크 설정 --%>
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
    <c:if test="${ p eq currentPage }">
      <font size="4" color="red">[${ p }]</font>
   </c:if>
   <c:if test="${ p ne currentPage }">
      <c:url var="qasearch3" value="/qalist.do">
         <c:param name="page" value="${ p }" />
      </c:url>
      <a href="${ qasearch3 }">${ p }</a>
   </c:if>
</c:forEach> &nbsp;
<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
<c:if
									test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
   <c:url var="qasearch4" value="/qalist.do">
      <c:param name="page" value="${ endPage + 10 }" />
   </c:url>
   <a href="${ qasearch4 }">[다음그룹]</a>
</c:if>
<c:if
									test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
   [다음그룹]&nbsp;
</c:if>
<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
   [맨끝]&nbsp;
</c:if>   
<c:if test="${ currentPage < maxPage }">
   <c:url var="qasearch5" value="/qalist.do">
      <c:param name="page" value="${ maxPage }" />
   </c:url>
   <a href="${ qasearch5 }">[맨끝]</a>
</c:if>
</div>
</c:if>

	<%-- 로그인한 사용자만 글쓰기 기능 사용할 수 있게 함 --%>
	<c:if test="${ !empty sessionScope.loginUser }">
		<div
								style="text-align: right; padding-right: 500px; margin-top: -30px">
			<button onclick="showWriteForm();" class="btn btn-warning btn-round"
									style="color: #fff;">글쓰기</button>
		</div>
	</c:if>
	<br>


	<jsp:include page="../common/footer.jsp" />

					</body>
</html>