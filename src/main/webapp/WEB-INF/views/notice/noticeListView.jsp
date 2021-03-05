<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="maxPage" value="${ requestScope.maxPage }" />
<c:set var="startPage" value="${ requestScope.startPage }" />
<c:set var="endPage" value="${ requestScope.endPage }" />
<c:set var="currentPage" value="${ requestScope.currentPage }" />

<c:url var="nwf" value="/nwform.do" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>


<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/myPage/common.css" />
<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.kin/static/pc/20210209151259/css/min/components.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/other.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/profile.css" />
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?v=2.2">


<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
	
<script type="text/javascript">
	 $(function() {
		showDiv();

		$("input[name=item]").on("change", function() { //on으로 이벤트 설정가능 "change"이벤트일때 function()을 실행해라
			showDiv(); // = radio버튼상태가 바뀔때 showDiv를 실행해라
		});
	});
	function showDiv() {
		if ($("input[name=item]").eq(0).is(":checked")) { //첫번째가 선택 되어 있느냐, 그러면 이 함수를 실행해라~! 라는 뜻
			$("#titleDiv").css("display", "block");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "none");
		}
		if ($("input[name=item]").eq(1).is(":checked")) { //두번째가 선택 되어 있느냐, 그러면 이 함수를 실행해라~! 라는 뜻
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "block");
			$("#dateDiv").css("display", "none");
		}
		if ($("input[name=item]").eq(2).is(":checked")) { //세번째가 선택 되어 있느냐, 그러면 이 함수를 실행해라~! 라는 뜻
			$("#titleDiv").css("display", "none");
			$("#writerDiv").css("display", "none");
			$("#dateDiv").css("display", "block");
		}
	}
	
	
	function showWriteForm() {
		location.href = "${ nwf }";
	}
	
</script>
</head>

<body>

	<jsp:include page="../common/header.jsp" />

	<c:url var="nlist" value="nlist.do">
		<c:param name="page" value="1" />
	</c:url>
	<c:url var="about" value="aboutUs.do">
		<c:param name="page" value="1" />
	</c:url>
	<c:url var="howto" value="howTo.do">
		<c:param name="page" value="1" />
	</c:url>
	<c:url var="faq" value="faq.move">
		<c:param name="page" value="1" />
	</c:url>

	<section class="breadcrumbs-custom-inset">
		<div class="breadcrumbs-custom context-dark bg-overlay-46">
			<div class="container">
				<h2 class="breadcrumbs-custom-title">공지사항</h2>
				<ul class="breadcrumbs-custom-path">
					<li><a class="nav-link" href="${ nlist }">공지사항</a></li>
					<li><a class="nav-link" href="${ about }">About Us</a></li>
					<li><a class="nav-link" href="${ howto }">사이트 이용 방법</a></li>
					<li><a class="nav-link" href="${ faq }">FAQ</a></li>
				</ul>
			</div>
			<div class="box-position-1"
				style="background-image: url(/hhw/resources/images/5F5F5F.jpg);"></div>
		</div>
	</section>
	
	
	<div style="text-align: center; padding-top: 30px;">
		<div>
			<h3 style="margin: 10px 0 10px 0;">공지사항</h3>
		</div>
	</div>
	
	<%-- 검색기능 --%>
	<div>
		<div style="text-align: left; padding-left: 550px;">
			<div>
				<select name="btype" id="item">
					<option id="item" value="">검색 항목 선택</option>
					<option id="item" value="title">제목</option>
					<option id="item" value="writer">작성자</option>
					<option id="item" value="date">게시날짜</option>
				</select>
	
				<input type="radio" name="item" value="title" checked> 제목&nbsp; &nbsp; &nbsp; 
				<input type="radio" name="item" value="writer">	 작성자 &nbsp; &nbsp; &nbsp; 
				<input type="radio" name="item" value="date"> 날짜
			</div>
	
			<div id="titleDiv">
				<form action="nsearchTitle.do" method="post">
					<input type="search" name="keyword">
					<input type="submit" value="검색" class="btn btn-warning btn-round" style="color: #fff;">
					<%-- 목록 출력 --%>
					<div style="align: center; padding-left: 400px">
						<c:url var="nlist" value="/nlist.do"/>
						<button onclick="javascript:location.href='${ nlist }';" class="btn btn-warning btn-round" style="color: #fff;">전체목록 보기</button>
					</div>
				</form>
			</div>
			
			<div id="writerDiv">
				<form action="nsearchWriter.do" method="post">
					<input type="search"name="keyword">
					<input type="submit" value="검색" class="btn btn-warning btn-round" style="color: #fff;">
					<%-- 목록 출력 --%>
					<div style="align: center; padding-left: 400px">
						<c:url var="nlist" value="/nlist.do"/>
						<button onclick="javascript:location.href='${ nlist }';" class="btn btn-warning btn-round" style="color: #fff;">전체목록 보기</button>
					</div>
				</form>
			</div>
				
			<div id="dateDiv">
				<form action="nsearchDate.do" method="post">
					<input type="date" name="begin"> ~ <input type="date" name="end">
					<input type="submit" value="검색" class="btn btn-warning btn-round" style="color: #fff;">
					<%-- 목록 출력 --%>
					<div style="align: center; padding-left: 400px">
						<c:url var="nlist" value="/nlist.do"/>
						<button onclick="javascript:location.href='${ nlist }';" class="btn btn-warning btn-round" style="color: #fff;">전체목록 보기</button>
					</div>
				</form>
			</div>
		</div>
		
		<%-- 관리자가 로그인 했을 때 --%>
		<c:if test="${  !empty sessionScope.loginUser and loginUser.user_lv eq 'B' }">
			<div style="text-align: right; padding-right: 550px; margin-top: -20px">
				<button onclick="showWriteForm();" class="btn btn-warning btn-round" style="color: #fff;">글쓰기</button>
			</div>
		</c:if>
		
	</div>
	
	
	<div class="my_info_area" align="center" style="padding-top:30px; padding-bottom:30px ">
		<table cellspacing="0" class="boardtype2 th_border my_table" width="1000" >
			<colgroup>
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
			</colgroup>
			<thead>
				<tr>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col" class="title">번호</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">말머리</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">작성자</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">작성날짜</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">조회수</th>
				</tr>
				
				<tr>
					<td colspan="7" class="blank2">&nbsp;
			    </tr>
            </thead>
            <tbody>
                <tr>
                	<c:forEach items="${ requestScope.list}" var="n">
	                <tr>
						<td align="center" width="80" style="font-size:15px; color: black;">${ n.nid }</td>
	
						<td align="center" width="150" style="font-size:15px; color: black;">${ n.ntype }</td>
	
						<td align="left" width="550" style="font-size:15px;">
							<c:url value="/ndetail.do" var="und">
								<c:param name="nid" value="${ n.nid }" />
							</c:url>
							<a href="${und}" style="color: black;">${n.ntitle}</a>
								<c:if test="${ !empty n.n_file_name }"><img src="/hhw/resources/images/file.png" style="width:20px;"> </c:if>
								<c:if test="${ empty n.n_file_name }"> &nbsp; </c:if></td>
					
						<td align="center" width="150" style="font-size:15px; color: black;">${n.nwriter}</td>
	
						<td align="center" width="130" style="font-size:15px; color: black;"><fmt:formatDate value="${n.n_date}" pattern="yyyy-MM-dd"/></td>
	
						<td align="center" width="80" style="font-size:15px; color: black;">${ n.ncount }</td>
						
					</tr>
					</c:forEach>
            </tbody>
        </table>
    </div>
    
    
    
	<%-- 현재 페이지가 1이 아니면 링크설정, 현재 1페이지이면 링크없음 --%>
	<c:if test="${ empty action}">
		<%-- 페이징 처리  [맨처음][이전] 숫자...........  [다음][맨끝] --%>
		<div style="text-align: center; margin-bottom: 50px;">
			<c:if test="${ currentPage <= 1}">
            [맨처음]
         </c:if>
			<c:if test="${ currentPage > 1 }">
				<c:url var="nls" value="/nlist.do">
					<c:param name="page" value="1" />
				</c:url>
				<a href="${ nls }">[맨처음]</a>
			</c:if>
			&nbsp;
			<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
				<c:url var="nls2" value="/nlist.do">
					<c:param name="page" value="${ startPage - 10 }" />
				</c:url>
				<a href="${ nls2 }">[이전]</a>
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
					<c:url var="nls3" value="/nlist.do">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ nls3 }">${ p }</a>
				</c:if>
			</c:forEach>
			&nbsp;
			<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
				<c:url var="nls4" value="/nlist.do">
					<c:param name="page" value="${ endPage + 10 }" />
				</c:url>
				<a href="${ nls4 }">[다음그룹]</a>
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
				<c:url var="nls5" value="/nlist.do">
					<c:param name="page" value="${ maxPage }" />
				</c:url>
				<a href="${ nls5 }">[맨끝]</a>
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
				<c:url var="nsearch1" value="${ action }">
					<c:if test="${ action ne 'nsearchDate.do'}">
						<c:param name="page" value="1" />
					</c:if>
					<c:if test="${ action eq 'nsearchDate.do'}">
						<c:param name="begin" value="${ begin }" />
						<c:param name="end" value="${ end }" />
					</c:if>
				</c:url>
				<a href="${ nsearch1 }">[맨처음]</a>
			</c:if>
			&nbsp;
			<%-- 이전 그룹이 있으면 링크설정, 이전 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage - 10) < startPage and (currentPage - 10) >= 1 }">
				<c:url var="nsearch2" value="/nlist.do">
					<c:param name="page" value="${ startPage - 10 }" />
				</c:url>
				<a href="${ nsearch2 }">[이전]</a>
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
					<c:url var="nsearch3" value="/nlist.do">
						<c:param name="page" value="${ p }" />
					</c:url>
					<a href="${ nsearch3 }">${ p }</a>
				</c:if>
			</c:forEach>
			&nbsp;
			<%-- 다음 그룹이 있으면 링크설정, 다음 그룹 없으면 링크없음 --%>
			<c:if
				test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
				<c:url var="nsearch4" value="/nlist.do">
					<c:param name="page" value="${ endPage + 10 }" />
				</c:url>
				<a href="${ nsearch4 }">[다음그룹]</a>
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
				<c:url var="nsearch5" value="/nlist.do">
					<c:param name="page" value="${ maxPage }" />
				</c:url>
				<a href="${ nsearch5 }">[맨끝]</a>
			</c:if>
		</div>
	</c:if>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>