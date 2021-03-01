<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="maxPage" value="${ requestScope.maxPage }" />
<c:set var="startPage" value="${ requestScope.startPage }" />
<c:set var="endPage" value="${ requestScope.endPage }" />
<c:set var="currentPage" value="${ requestScope.currentPage }" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 테이블 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/myPage/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/myPage/profile.css" />

<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		showDiv();

		$("input[name=item]").on("change", function() {
			showDiv();
		});
	});

	function showDiv() {
		if ($("input[name=item]").eq(0).is(":checked")) {
			$("#titleDiv").css("display", "block");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "none");
		}

		if ($("input[name=item]").eq(1).is(":checked")) {
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "block");
			$("#dateDiv").css("display", "none");
		}

		if ($("input[name=item]").eq(2).is(":checked")) {
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "block");
		}
	}
</script>
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 70px 0 60px 0;">

		<br><br>
		<%-- 검색창 --%>
		<center>
			<h3>리뷰 게시판</h3>
			<div style="text-align: right; padding-right: 300px;">
				<input type="radio" name="item" value="title" checked>제목 <input
					type="radio" name="item" value="writer" checked>작성자 <input
					type="radio" name="item" value="date" checked>날짜
			</div>
			<div id="titleDiv" style="text-align: right; padding-right: 300px;">
				<form action="revSearchTitle.do" method="post">
					<input type="hidden" name="page" value="1"> <label>제목<input
						type="search" name="keyword"></label> <input type="submit"
						value="검색">
				</form>
			</div>
			<div id="writerDiv" style="text-align: right; padding-right: 300px;">
				<form action="revSearchWriter.do" method="post">
					<input type="hidden" name="page" value="1"> <label>작성자<input
						type="search" name="keyword"></label> <input type="submit"
						value="검색">
				</form>
			</div>
			<div id="dateDiv" style="text-align: right; padding-right: 300px;">
				<form action="revSearchDate.do" method="post">
					<input type="hidden" name="page" value="1"> <label>날짜
						<input type="date" name="begin">~<input type="date"
						name="end">
					</label> <input type="submit" value="검색">
				</form>
			</div>
		</center>
		<br> <br>

		<%-- 목록 출력 --%>
		<div class="my_info_area" align="center">
			</h4>
			<table cellspacing="0" class="boardtype2 th_border my_table"
				width="1000">
				<colgroup>
					<col width="100">
					<col width="1000">
					<col width="100">
					<col width="100">
					<col width="100">
					<col width="100">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="title">번호</th>
						<th scope="col" class="title">제목</th>
						<th scope="col" class="title">작성자</th>
						<th scope="col" class="title">날짜</th>
						<th scope="col" class="title">첨부파일</th>
						<th scope="col" class="title">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ requestScope.list }" var="r">
						<tr>
							<td align="center">${ r.rid }</td>
							<td><c:url var="rdt" value="/revdetail.do">
									<c:param name="rid" value="${ r.rid }" />
								</c:url> <a href="${ rdt }">${ r.rtitle }</a></td>
							<td align="center">${ r.rwriter }</td>
							<td align="center">${ r.r_create_date }</td>
							<td align="center"><c:if test="${ !empty r.r_original_filename }">
				     					 ◎
								      </c:if> <c:if test="${ empty r.r_rename_filename }">
				      				  &nbsp;
				      				  </c:if></td>
							<td align="center">${ r.rcount }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>



		<%-- 현재 페이지가 1이 아니면 링크설정, 현재 1페이지이면 링크없음 --%>
		<c:if test="${ empty action }">
			<%-- 페이징 처리 
			   [맨처음][이전] 숫자...........  [다음][맨끝]
			--%>
			<div style="text-align: center;">
				<c:if test="${ currentPage <= 1}">
			[맨처음]
			</c:if>
				<c:if test="${ currentPage > 1 }">
					<c:url var="rls" value="/revlist.do">
						<c:param name="page" value="1" />
					</c:url>
					<a href="${ rls }">[맨처음]</a>
				</c:if>
				&nbsp;
				<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
				<c:if
					test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
					<c:url var="rls2" value="/revlist.do">
						<c:param name="page" value="${ startPage - 10 }" />
					</c:url>
					<a href="${ rls2 }">[이전]</a>
				</c:if>
				<c:if
					test="${ !((currentPage - 10) < startPage and (currentPage - 10) >= 1) }">
[이전]
</c:if>
				&nbsp;
				<%-- 가운데 표시할 페이지 그룹 숫자 링크 설정 --%>
				<c:forEach var="p" begin="${ startPage }" end="${ endPage }"
					step="1">
					<c:if test="${ p eq currentPage }">
						<font size="4" color="red">[${ p }]</font>
					</c:if>
					<c:if test="${ p ne currentPage }">
						<c:url var="rls3" value="/revlist.do">
							<c:param name="page" value="${ p }" />
						</c:url>
						<a href="${ rls3 }">${ p }</a>
					</c:if>
				</c:forEach>
				&nbsp;
				<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
				<c:if
					test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
					<c:url var="rls4" value="/revlist.do">
						<c:param name="page" value="${ endPage + 10 }" />
					</c:url>
					<a href="${ rls4 }">[다음그룹]</a>
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
					<c:url var="rls5" value="/revlist.do">
						<c:param name="page" value="${ maxPage }" />
					</c:url>
					<a href="${ rls5 }">[맨끝]</a>
				</c:if>
			</div>
		</c:if>


		<c:if test="${ !empty action}">
			<%-- 페이징 처리 
   [맨처음][이전] 숫자...........  [다음][맨끝]
--%>
			<div style="text-align: center;">
				<c:if test="${ currentPage <= 1}">
				[맨처음]
				</c:if>
				<c:if test="${ currentPage > 1 }">
					<c:url var="rsearch1" value="${ action }">
						<c:if test="${ action ne 'revsearchDate.do'}">
							<c:param name="page" value="1" />
						</c:if>
						<c:if test="${ action eq 'revsearchDate.do'}">
							<c:param name="begin" value="${ begin }" />
							<c:param name="end" value="${ end }" />
						</c:if>
					</c:url>
					<a href="${ rsearch1 }">[맨처음]</a>
				</c:if>
				&nbsp;
				<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
				<c:if
					test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
					<c:url var="rsearch2" value="/revlist.do">
						<c:param name="page" value="${ startPage - 10 }" />
					</c:url>
					<a href="${ rsearch2 }">[이전]</a>
				</c:if>
				<c:if
					test="${ !((currentPage - 10) < startPage and (currentPage - 10) >= 1) }">
				[이전]
				</c:if>
				&nbsp;
				<%-- 가운데 표시할 페이지 그룹 숫자 링크 설정 --%>
				<c:forEach var="p" begin="${ startPage }" end="${ endPage }"
					step="1">
					<c:if test="${ p eq currentPage }">
						<font size="4" color="red">[${ p }]</font>
					</c:if>
					<c:if test="${ p ne currentPage }">
						<c:url var="rsearch3" value="/revlist.do">
							<c:param name="page" value="${ p }" />
						</c:url>
						<a href="${ rsearch3 }">${ p }</a>
					</c:if>
				</c:forEach>
				&nbsp;
				<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
				<c:if
					test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
					<c:url var="rsearch4" value="/revlist.do">
						<c:param name="page" value="${ endPage + 10 }" />
					</c:url>
					<a href="${ rsearch4 }">[다음그룹]</a>
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
					<c:url var="rsearch5" value="/revlist.do">
						<c:param name="page" value="${ maxPage }" />
					</c:url>
					<a href="${ rsearch5 }">[맨끝]</a>
				</c:if>
			</div>
		</c:if>



		<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>