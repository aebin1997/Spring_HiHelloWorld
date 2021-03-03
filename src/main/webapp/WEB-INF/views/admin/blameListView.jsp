<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="maxPage" value="${ requestScope.maxPage }" />
<c:set var="startPage" value="${ requestScope.startPage }" />
<c:set var="endPage" value="${ requestScope.endPage }" />
<c:set var="currentPage" value="${ requestScope.currentPage }" />

<%-- 글쓰기 페이지 이동 요청 url --%>
<c:url var="bll" value="/b.blame.list.do" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 신고회원 관리페이지</title>

<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/myPage/common.css" />
<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.kin/static/pc/20210209151259/css/min/components.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/other.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/profile.css" />
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?v=2.2">

<script type="text/javascript" src="/hhw/resources/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	 $(function() {
		showDiv();

		$("input[name=item]").on("change", function() { //on으로 이벤트 설정가능 "change"이벤트일때 function()을 실행해라
			showDiv(); // = radio버튼상태가 바뀔때 showDiv를 실행해라
		});
	});
	function showDiv() {
		if ($("input[name=item]").eq(0).is(":checked")) { //첫번째가 선택 되어 있느냐, 그러면 이 함수를 실행해라~! 라는 뜻
			$("#target_nickname").css("display", "block");
			$("#blame_type").css("display", "none");
			$("#blame_date").css("display", "none");
		}
		if ($("input[name=item]").eq(1).is(":checked")) { //두번째가 선택 되어 있느냐, 그러면 이 함수를 실행해라~! 라는 뜻
			$("#target_nickname").css("display", "none");
			$("#blame_type").css("display", "block");
			$("#blame_date").css("display", "none");
		}
		if ($("input[name=item]").eq(2).is(":checked")) { //세번째가 선택 되어 있느냐, 그러면 이 함수를 실행해라~! 라는 뜻
			$("#target_nickname").css("display", "none");
			$("#blame_type").css("display", "none");
			$("#blame_date").css("display", "block");
		}
	}
	 
	
</script>

</head>

<body>
	<jsp:include page="../common/header.jsp" />
	
	
	
<%-- 	<c:url var="nlist" value="nlist.do">
		<c:param name="page" value="1" />
	</c:url>
	<c:url var="about" value="aboutUs.do">
		<c:param name="page" value="1" />
	</c:url>--%>
	<c:url var="blame" value="b.blame.list.do">
		<c:param name="page" value="1" />
	</c:url>
 
	<section class="breadcrumbs-custom-inset">
		<div class="breadcrumbs-custom context-dark bg-overlay-46">
			<div class="container">
				<h2 class="breadcrumbs-custom-title">관리자 페이지</h2>
				<ul class="breadcrumbs-custom-path">
					<!-- <li><a class="nav-link" href="#">회원리스트</a></li> -->
					<li><a class="nav-link" href="${ blame }">신고회원 리스트</a></li>
					<!-- <li><a class="nav-link" href="#">??????</a></li> -->
				</ul>
			</div>
			<div class="box-position-1"
				style="background-image: url(/hhw/resources/images/notice_board.jpg);"></div>
		</div>
	</section>
	
	<div style="text-align: center; padding-top: 30px;">
		<div>
			<h2 style="margin: 20px 0 10px 0;">신고회원 관리페이지</h2>
		</div>
	</div>
	
	
	<%-- 검색기능 --%>
	<div>
		<div style="text-align: left; padding-left: 550px; padding-top: 10px;">
			<div>
				<select name="blame" id="item">
					<option id="item" value="">검색 항목 선택</option>
					<option id="item" value="target_nickname">불량회원</option>
					<option id="item" value="blame_type">신고유형</option>
					<option id="item" value="blame_date">신고날짜</option>
				</select>
	
				<input type="radio" name="item" value="target_nickname" checked> 불량회원&nbsp; &nbsp; &nbsp; 
				<input type="radio" name="item" value="blame_type">	신고유형&nbsp; &nbsp; &nbsp; 
				<input type="radio" name="item" value="blame_date"> 신고날짜
			</div>
	
			<div id="target_nickname">
				<form action="b.blame.searchWriter.do" method="post">
					<input type="hidden" name="page" value="1">
					<input type="search" name="keyword" placeholder="불량회원 이름으로 검색">
					<input type="submit" value="검색" class="btn btn-warning btn-round" style="color: #fff;">
					<%-- 목록 출력 --%>
					<c:url var="blamelist" value="/b.blame.list.do">
						<c:param name="page" value="1" />
					</c:url>
					<button onclick="javascript:location.href='${ blamelist }';" class="btn btn-warning btn-round" style="color: #fff;">전체 목록</button>
				</form>
			</div>
	
			<div id="blame_type">
				<form action="b.blame.searchTitle.do" method="post">
					<input type="hidden" name="page" value="1">
					<input type="search" name="keyword" placeholder="신고유형으로 검색">
					<input type="submit" value="검색" class="btn btn-warning btn-round" style="color: #fff;">
					<%-- 목록 출력 --%>
					<c:url var="blamelist" value="/b.blame.list.do">
						<c:param name="page" value="1" />
					</c:url>
					<button onclick="javascript:location.href='${ blamelist }';" class="btn btn-warning btn-round" style="color: #fff;">전체 목록</button>
				</form>
			</div>
	
			<div id="blame_date">
				<form action="b.blame.searchDate.do" method="post">
					<input type="hidden" name="page" value="1">
					<input type="date" name="begin"> ~ <input type="date" name="end">
					<input type="submit" value="검색" class="btn btn-warning btn-round" style="color: #fff;">
					<%-- 목록 출력 --%>
					<c:url var="blamelist" value="/b.blame.list.do">
						<c:param name="page" value="1" />
					</c:url>
					<button onclick="javascript:location.href='${ blamelist }';" class="btn btn-warning btn-round" style="color: #fff;">전체 목록</button>
				</form>
			</div>
		</div>
		
		<%-- 관리자가 로그인 했을 때 --%>
		<c:if test="${  !empty sessionScope.loginUser and loginUser.user_lv eq 'B' }">
			<div style="text-align: right; padding-right: 550px; margin-top: -40px;">
					<c:url var="blist" value="/blist.do">
						<c:param name="page" value="1" />
					</c:url>
				<button onclick="javascript:location.href='${ blist }';" class="btn btn-warning btn-round" style="color: #fff;">자유게시판 이동</button>
			</div>
		</c:if>
		
	</div>

	
	<div class="my_info_area" align="center" style="padding-top:30px; padding-bottom:30px ">
		<table cellspacing="0" class="boardtype2 th_border my_table" width="1000" >
			<colgroup>
				<col width="50">
				<col width="80">
				<col width="80">
				<col width="80">
				<col width="350">
				<col width="80">
			</colgroup>
			<thead>
				<tr>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col" class="title">번 호</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">게시글 번호</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">신고유형</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">신고자</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">불량회원</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">신고내용</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">신고접수일</th>
				</tr>
				
				<tr>
					<td colspan="7" class="blank2">&nbsp;
			    </tr>
            </thead>
            <tbody>
                <tr>
            	    <c:forEach items="${ requestScope.list }" var="b" >
	                <tr>
						<td align="center" width="80"  style="font-size:15px; color: black;">${ b.blame_no }</td>
	
						<td align="center" width="100"  style="font-size:15px; color: black;">${ b.blame_bid }</td>
						
						<td align="center" width="80"  style="font-size:15px; color: black;">${ b.blame_type }</td>
						
						<td align="center" width="100"  style="font-size:15px; color: black;">${ b.mm_nickname }</td>
	
						<td align="center" width="100"  style="font-size:15px; color: black;">${ b.target_nickname }</td>
	
						<td align="center" width="350" style="font-size:15px; color: black;">${ b.blame_content }</td>
						
						<td align="center" width="100" style="font-size:15px; color: black;">${ b.blame_date }</td>
						
					</tr>
					</c:forEach>
            </tbody>
        </table>
    </div>
	

	<br>
	<br>
	<br>
	

	<%-- 현재 페이지가 1이 아니면 링크설정, 현재 1페이지이면 링크없음 --%>
	<c:if test="${ empty action}">
		<%-- 페이징 처리  [맨처음][이전] 숫자...........  [다음][맨끝] --%>
		<div style="text-align: center; margin-bottom: 50px; margin-top: -80px">
			<c:if test="${ currentPage <= 1}">
            [맨처음]
         </c:if>
			<c:if test="${ currentPage > 1 }">
				<c:url var="bbls" value="/b.blame.list.do">
					<c:param name="page" value="1" />
				</c:url>
				<a href="${ bbls }">[맨처음]</a>
			</c:if>
			&nbsp;
			<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
				<c:url var="bbls2" value="/b.blame.list.do">
					<c:param name="page" value="${ startPage - 10 }" />
				</c:url>
				<a href="${ bbls2 }">[이전]</a>
			</c:if>
			<c:if
				test="${ !((currentPage - 10) < startPage and (currentPage - 10) >= 1) }">
               [이전]
         </c:if>
			&nbsp;
			<%-- 가운데 표시할 페이지 그룹 숫자 링크 설정 --%>
			<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
				<c:if test="${ p eq currentPage }">
					<font size="4" color="red">[${ p }]</font>
				</c:if>
				<c:if test="${ p ne currentPage }">
					<c:url var="bbls3" value="/b.blame.list.do">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ bbls3 }">${ p }</a>
				</c:if>
			</c:forEach>
			&nbsp;
			<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
				<c:url var="bbls4" value="/b.blame.list.do">
					<c:param name="page" value="${ endPage + 10 }" />
				</c:url>
				<a href="${ bbls4 }">[다음그룹]</a>
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
				<c:url var="bbls5" value="/b.blame.list.do">
					<c:param name="page" value="${ maxPage }" />
				</c:url>
				<a href="${ bbls5 }">[맨끝]</a>
			</c:if>
		</div>
	</c:if>


	<c:if test="${ !empty action}">
		<%-- 페이징 처리  [맨처음][이전] 숫자...........  [다음][맨끝] --%>
		<div style="text-align: center;">
			<c:if test="${ currentPage <= 1}">
            [맨처음]
         </c:if>
			<c:if test="${ currentPage > 1 }">
				<c:url var="search1" value="${ action }">
					<c:if test="${ action ne 'bsearchDate.do'}">'}">
						<c:param name="page" value="1" />
					</c:if>
					<c:if test="${ action eq 'bsearchDate.do'}">'}">
						<c:param name="begin" value="${ begin }" />
						<c:param name="end" value="${ end }" />
					</c:if>
				</c:url>
				<a href="${ search1 }">[맨처음]</a>
			</c:if>
			&nbsp;
			<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
				<c:url var="search2" value="/blist.do">
					<c:param name="page" value="${ startPage - 10 }" />
				</c:url>
				<a href="${ search2 }">[이전]</a>
			</c:if>
			<c:if
				test="${ !((currentPage - 10) < startPage and (currentPage - 10) >= 1) }">
               [이전]
         </c:if>
			&nbsp;
			<%-- 가운데 표시할 페이지 그룹 숫자 링크 설정 --%>
			<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
				<c:if test="${ p eq currentPage }">
					<font size="4" color="red">[${ p }]</font>
				</c:if>
				<c:if test="${ p ne currentPage }">
					<c:url var="search3" value="/b.blame.list.do">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ search3 }">${ p }</a>
				</c:if>
			</c:forEach>
			&nbsp;
			<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
				<c:url var="search4" value="/b.blame.list.do">
					<c:param name="page" value="${ endPage + 10 }" />
				</c:url>
				<a href="${ search4 }">[다음그룹]</a>
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
				<c:url var="search5" value="/b.blame.list.do">
					<c:param name="page" value="${ maxPage }" />
				</c:url>
				<a href="${ search5 }">[맨끝]</a>
			</c:if>
		</div>
	</c:if>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>