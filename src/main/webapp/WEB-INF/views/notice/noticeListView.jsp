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

	<section class="breadcrumbs-custom-inset">
		<div class="breadcrumbs-custom context-dark bg-overlay-46">
			<div class="container">
				<h2 class="breadcrumbs-custom-title">공지사항</h2>
				<ul class="breadcrumbs-custom-path">
					<li><a class="nav-link" href="${ nlist }">공지사항</a></li>
					<li><a class="nav-link" href="${ about }">About Us</a></li>
					<li><a class="nav-link" href="${ howto }">사이트 이용 방법</a></li>
				</ul>
			</div>
			<div class="box-position-1"
				style="background-image: url(/hhw/resources/images/notice_board.jpg);"></div>
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
		<table cellspacing="0" class="boardtype2 th_border my_table" width="1200" >
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
					<th style="text-align:center; font-size:15px; font-family:sans-serif;" scope="col" class="title">번호</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif;" scope="col">말머리</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif;" scope="col">제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif;" scope="col">작성자</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif;" scope="col">작성날짜</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif;" scope="col">조회수</th>
				</tr>
				
				<tr>
					<td colspan="7" class="blank2">&nbsp;
			    </tr>
            </thead>
            <tbody>
                <tr>
                	<c:forEach items="${ requestScope.list}" var="n">
	                <tr>
						<td align="center" width="80" style="font-size:15px;">${ n.nid }</td>
	
						<td align="center" width="150" style="font-size:15px;">${ n.ntype }</td>
	
						<td align="left" width="550" style="font-size:15px;">
							<c:url value="/ndetail.do" var="und">
								<c:param name="nid" value="${ n.nid }" />
							</c:url>
							<a href="${und}">${n.ntitle}</a>
								<c:if test="${ !empty b.b_original_filename }"><img src="/hhw/resources/images/file.png" style="width:20px;"> </c:if>
								<c:if test="${ empty b.b_original_filename }"> &nbsp; </c:if></td>
					
						<td align="center" width="150" style="font-size:15px;">${n.nwriter}</td>
	
						<td align="center" width="130" style="font-size:15px;"><fmt:formatDate value="${n.n_date}" pattern="yyyy-MM-dd"/></td>
	
						<td align="center" width="80" style="font-size:15px;">${ n.ncount }</td>
						
					</tr>
					</c:forEach>
            </tbody>
        </table>
    </div>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>