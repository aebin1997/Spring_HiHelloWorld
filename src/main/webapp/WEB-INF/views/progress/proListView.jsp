<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Author" content="kimwoolina">
<link rel="stylesheet" href="/hhw/resources/css/default.css">
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 70px 0 60px 0;">

		<div id="wrapper" class="wrapper-pad ">
			<!-- 콘텐츠 시작 { -->
			<div id="bo_qa" class="container">
				<div id="con_lf">
					<article id="sir_qav" class="sir_vbo">
						<header id="qav_head" class="vbo_head">
							<h2>질문제목</h2>
							<div id="qav_info">
								<span class="info_span info_name"><span class="sv_wrap">
										<span class="member">질문자닉네임</span>
								</span></span><span class="info_span info_date"><time
										datetime="2021-02-18T14:58:09+09:00">질문작성시간</time></span><span
									class="info_span info_ip"></span>
							</div>
						</header>
						<div class="vbo_wr">
							<ul class="sir_vbo_com">
								<li><a href="#"
									onclick="javascript:history.go(-1); return false;"
									class="sir_b01">목록</a></li>
							</ul>
						</div>
					</article>

					<%-- 리스트 출력  ({)--%>
					<br>
					<%-- 목록 출력 --%>
					<div style="align: center; padding-left: 400px;">
						<c:url var="blist" value="/blist.do">
							<c:param name="page" value="1" />
						</c:url>
						<button onclick="javascript:location.href='${ blist }';">전체
							목록 보기</button>
					</div>
					<br>
					<table align="center" border="1" width="700" cellspacing="0">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>조회수</th>
							<th>첨부파일</th>
						</tr>
						<c:forEach items="${ requestScope.list }" var="b">
							<tr>
								<td align="center">${ b.bid }</td>
								<td><c:url var="bdt" value="/bdetail.do">
										<c:param name="page" value="${ currentPage }" />
										<c:param name="bid" value="${ b.bid }" />
									</c:url> <a href="${ bdt }">${ b.btitle }</a></td>
								<td align="center">${ b.bwriter }</td>
								<td align="center">${ b.b_create_date }</td>
								<td align="center">${ b.bcount }</td>
								<td align="center"><c:if
										test="${ !empty b.original_filename }">
      ◎
      </c:if> <c:if test="${ empty b.original_filename }">
      &nbsp;
      </c:if></td>
							</tr>
						</c:forEach>
					</table>
					<br>



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
								<c:url var="bls" value="/blist.do">
									<c:param name="page" value="1" />
								</c:url>
								<a href="${ bls }">[맨처음]</a>
							</c:if>
							&nbsp;
							<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
							<c:if
								test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
								<c:url var="bls2" value="/blist.do">
									<c:param name="page" value="${ startPage - 10 }" />
								</c:url>
								<a href="${ bls2 }">[이전]</a>
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
									<c:url var="bls3" value="/blist.do">
										<c:param name="page" value="${ p }" />
									</c:url>
									<a href="${ bls3 }">${ p }</a>
								</c:if>
							</c:forEach>
							&nbsp;
							<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
							<c:if
								test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
								<c:url var="bls4" value="/blist.do">
									<c:param name="page" value="${ endPage + 10 }" />
								</c:url>
								<a href="${ bls4 }">[다음그룹]</a>
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
								<c:url var="bls5" value="/blist.do">
									<c:param name="page" value="${ maxPage }" />
								</c:url>
								<a href="${ bls5 }">[맨끝]</a>
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
								<c:url var="bsearch1" value="${ action }">
									<c:if test="${ action ne 'bsearchDate.do'}">
										<c:param name="page" value="1" />
									</c:if>
									<c:if test="${ action eq 'bsearchDate.do'}">
										<c:param name="begin" value="${ begin }" />
										<c:param name="end" value="${ end }" />
									</c:if>
								</c:url>
								<a href="${ bsearch1 }">[맨처음]</a>
							</c:if>
							&nbsp;
							<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
							<c:if
								test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
								<c:url var="bsearch2" value="/blist.do">
									<c:param name="page" value="${ startPage - 10 }" />
								</c:url>
								<a href="${ bsearch2 }">[이전]</a>
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
									<c:url var="bsearch3" value="/blist.do">
										<c:param name="page" value="${ p }" />
									</c:url>
									<a href="${ bsearch3 }">${ p }</a>
								</c:if>
							</c:forEach>
							&nbsp;
							<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
							<c:if
								test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
								<c:url var="bsearch4" value="/blist.do">
									<c:param name="page" value="${ endPage + 10 }" />
								</c:url>
								<a href="${ bsearch4 }">[다음그룹]</a>
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
								<c:url var="bsearch5" value="/blist.do">
									<c:param name="page" value="${ maxPage }" />
								</c:url>
								<a href="${ bsearch5 }">[맨끝]</a>
							</c:if>
						</div>
					</c:if>
					<%-- 리스트 출력(}) --%>
				</div>
			</div>
		</div>

		<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>