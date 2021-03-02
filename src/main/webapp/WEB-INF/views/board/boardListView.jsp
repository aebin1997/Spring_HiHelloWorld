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
<c:url var="bwf" value="/bwmove.do" />
<c:url var="login" value="/loginView.do" />
<c:url var="blamelist" value="/b.blame.list.do" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>

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
		location.href = "${ bwf }";
	}
	
	function login() {
		location.href = "${ login }";
	} 

	function testBlame() {
		location.href = "${ blamelist }";
	}
	
</script>

</head>

<body>
	<jsp:include page="../common/header.jsp" />
	
	<div style="text-align: center; padding-top: 100px;">
		<div>
			<h3 style="margin: 10px 0 10px 0;">자유게시판</h3>
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
				<form action="bsearchTitle.do" method="post">
					<input type="hidden" name="page" value="1">
					<input type="search" name="keyword" placeholder="제목">
					<input type="submit" value="검색" class="btn btn-warning btn-round" style="color: #fff;">
					<%-- 목록 출력 --%>
					<c:url var="blist" value="/blist.do">
						<c:param name="page" value="1" />
					</c:url>
					<button onclick="javascript:location.href='${ blist }';" class="btn btn-warning btn-round" style="color: #fff;">전체 목록</button>
				</form>
			</div>
	
			<div id="writerDiv">
				<form action="bsearchWriter.do" method="post">
					<input type="hidden" name="page" value="1">
					<input type="search" name="keyword" placeholder="닉네임">
					<input type="submit" value="검색" class="btn btn-warning btn-round" style="color: #fff;">
					<%-- 목록 출력 --%>
					<c:url var="blist" value="/blist.do">
						<c:param name="page" value="1" />
					</c:url>
					<button onclick="javascript:location.href='${ blist }';" class="btn btn-warning btn-round" style="color: #fff;">전체 목록</button>
				</form>
			</div>
	
			<div id="dateDiv">
				<form action="bsearchDate.do" method="post">
					<input type="hidden" name="page" value="1">
					<input type="date" name="begin"> ~ <input type="date" name="end">
					<input type="submit" value="검색" class="btn btn-warning btn-round" style="color: #fff;">
					<%-- 목록 출력 --%>
					<c:url var="blist" value="/blist.do">
						<c:param name="page" value="1" />
					</c:url>
					<button onclick="javascript:location.href='${ blist }';" class="btn btn-warning btn-round" style="color: #fff;">전체 목록</button>
				</form>
			</div>
		</div>
		
				
		<%-- 관리자가 로그인 했을 때 --%>
		<c:if test="${  !empty sessionScope.loginUser and loginUser.user_lv eq 'B' }">
			<div style="text-align: right; padding-right: 550px; margin-top: -40px;">
					<c:url var="blame" value="/b.blame.list.do">
						<c:param name="page" value="1" />
					</c:url>
				<button onclick="javascript:location.href='${ blame }';" class="btn btn-warning btn-round" style="color: #fff;">신고자 현황</button>
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
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col" class="title">번 호</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">말머리</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">작성자</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">작성날짜</th>
					<th style="text-align:center; font-size:15px; font-family:sans-serif; color: black;" scope="col">조회수</th>
				</tr>
				
				<tr>
					<td colspan="6" class="blank2">&nbsp;
			    </tr>
            </thead>
            <tbody>
                <tr>
                	<c:forEach items="${ requestScope.list }" var="b" >
	                <tr>
						<td align="center" width="80" style="font-size:15px; color: black;">${ b.bid }</td>
	
						<td align="center" width="150" style="font-size:15px; color: black;">${ b.btype }</td>
	
						<td align="left" width="550" style="font-size:15px; color: black;"><c:url var="bdt" value="/bdetail.do">
								<c:param name="page" value="${ currentPage }" />
								<c:param name="bid" value="${ b.bid }" />
							</c:url> <a href="${ bdt }" style="color: black;">${ b.btitle }</a>&nbsp;[${ b.b_ref_bid }]
								<c:if test="${ !empty b.b_original_filename }"><img src="/hhw/resources/images/file.png" style="width:20px;"> </c:if>
								<c:if test="${ empty b.b_original_filename }"> &nbsp; </c:if></td>
					
						<td align="center" width="150" style="font-size:15px; color: black;">${ b.bwriter }
							 <c:if test="${ b.bwriter ne '' and b.bwriter ne null and b.grade lt 0}"> <%-- 불량회원 --%>
							 <img src="/hhw/resources/images/i_0.png" style="width:20px; float:left;">
							 </c:if>
							 <c:if test="${ b.bwriter ne '' and b.bwriter ne null and b.grade ge 1  &&  b.grade lt 10}">  <%-- 신규회원 --%>
							 <img src="/hhw/resources/images/i_1.png" style="width:20px; float:left;">
							 </c:if>
							 <c:if test="${ b.bwriter ne '' and b.bwriter ne null and b.grade ge 11 && b.grade lt 20}">  <%-- 우수회원 --%>
							 <img src="/hhw/resources/images/i_2.png" style="width:20px; float:left;">
							 </c:if>
							 <c:if test="${ b.bwriter ne '' and b.bwriter ne null and b.grade ge 21 && b.grade lt 30}">  <%-- 최우수회원 --%>
							 <img src="/hhw/resources/images/i_3.png" style="width:20px; float:left;">
							 </c:if>
							 <c:if test="${ b.bwriter ne '' and b.bwriter ne null and b.grade eq 0}">  <%-- 관리자 --%>
							 <img src="/hhw/resources/images/i_admin.png" style="width:20px; float:left;">
							 </c:if>
							 </td>
	
						<td align="center" width="130" style="font-size:15px; color: black;">${ b.b_create_date }</td>
	
						<td align="center" width="80" style="font-size:15px; color: black;">${ b.bcount }</td>
						
					</tr>
					</c:forEach>
				</tr>
            </tbody>
        </table>
    </div>


		<%-- 로그인한 사용자만 글쓰기 기능 사용할 수 있게 함 --%>
		<c:if test="${ !empty sessionScope.loginUser }">
			<div style="text-align: right; padding-right: 550px;">
				<button onclick="showWriteForm();" class="btn btn-warning btn-round" style="color: #fff;">글쓰기</button>
			</div>
		</c:if>
		
		
		<%-- 로그인 안한 사람이 글쓰기 할 때 --%>
		<c:if test="${ empty sessionScope.loginUser }">
			<div style="text-align: right; padding-right: 550px; margin-top: -20px">
				<button class="btn btn-warning btn-round"
					style="color: #fff;" data-toggle="modal" data-target="#Medium-modal">글쓰기</button>
				<div class="col-md-4 col-sm-12 mb-30">
							<div class="pd-20 card-box height-100-p">
								<div class="modal fade" id="Medium-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title" id="myLargeModalLabel">게시판 글쓰기 이용 안내</h4>
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
											</div>
											<div class="modal-body">
												<h6 style="text-align: center;">자유게시판 이용은 로그인 후 글쓰기가 가능합니다</h6>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>&nbsp;
												<button type="button" class="btn btn-primary" onclick="login();">Login</button>
											</div>
										</div>
									</div>
								</div>
							</div>
				</div>
			</div>
		</c:if>
	
	<br>
	

	<%-- 현재 페이지가 1이 아니면 링크설정, 현재 1페이지이면 링크없음 --%>
	<c:if test="${ empty action}">
		<%-- 페이징 처리  [맨처음][이전] 숫자...........  [다음][맨끝] --%>
		<div style="text-align: center; margin-bottom: 50px; margin-top: -50px">
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
			<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
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
		<%-- 페이징 처리  [맨처음][이전] 숫자...........  [다음][맨끝] --%>
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
			<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
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

	<jsp:include page="../common/footer.jsp" />
</body>
</html>