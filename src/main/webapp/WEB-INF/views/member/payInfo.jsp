<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Author" content="aebin">
<title>캐시 관리</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pay/base.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pay/default.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pay/main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pay/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pay/bootstrap.min.css" />
<script src="/common/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
function popupOpen(){ //자바스크립트
	var popUrl = "payCash.do";	//팝업창에 출력될 페이지 URL
	/* 그냥 띄우는 법
	var popOption = "width=460, height=690, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	window.open(popUrl,"", popOption); 
	*/ 
	
	//팝업창을 중앙에 정렬(모니터 화면 기준)
	var popupWidth =700;
	var popupHeight =900;
	var popupX =(window.screen.width/2)-(popupWidth/2);
	var popupY =(window.screen.height/2)-(popupHeight/2);
	window.open(popUrl,"", 'status=no, height=900, width=700, left='+ popupX + ', top='+ popupY);
	
	/*  팝업창을 중앙에 정렬(브라우저 화면 기준)
	var popupX = (document.body.offsetWidth / 2) - (200 / 2);
	//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (300 / 2);
	//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	window.open('', '', 'status=no, height=300, width=200, left='+ popupX + ', top='+ popupY);
    */
}
</script>
</head>


<body>

	<jsp:include page="../common/header.jsp" />
	<section style="padding: 100px 0 60px 0;">
		<div id="contents" class="contents"
			style="width: 48%; margin-left: 26%;">

			<ul class="title_wrap">
				<li class="title_l">캐시관리</li>
				<li class="title_r">* 오늘을 포함하여 14일간의 데이터만 유지됩니다.</li>
			</ul>
			<table class="tab_face_b" summary="탭메뉴">
				<colgroup>
					<col width="33%">
					<col width="">
					<col width="33%">
				</colgroup>
				<tbody>
					<tr>
						<td class="on">
							<div>캐시관리</div>
							<div>
								<!-- <script>
								if (loginData.isLogin)
									document.write("("+ util_setComma(loginData.myCash)	+ " 포인트)")
							</script> -->
								(0 포인트)
							</div>
							<div>
								<a class="btn_s01" href="javascript:popupOpen();">충전하기</a>
							</div>
						</td>
						<td onclick="location.href='myPoint.do'">
							<div>포인트관리</div>
						</td>
						<td onclick="location.href='myNaegong.do'">
							<div>내공관리</div>
						</td>
					</tr>
				</tbody>
			</table>

			<div class="table_box3 mt20">
				<ul class="table_box3_set">
					<li class="table_box3_set_L ml3"><span></span> <span> <!-- 달력 -->
							<div id="dateDiv">
								<form action="paysearchDate.do" method="post">
									<label>조회기간 
									<input type="date" name="begin"> ~
										<input type="date" name="end"><input type="hidden" name="member" value="${ loginUser.nickname }"></label>
										<input type="submit" value="검색">
								</form>
							</div>
							<li class="table_box3_set_R"><span class="btn_01 medium"
								onclick="#"><em>조회</em></span> <span class="btn_01 medium"
								onclick="#"><em>삭제</em></span></li>
				</ul>
			</div>

			<table class="tab_face2 mt20" summary="탭메뉴">
				<colgroup>
					<col width="33%">
					<col width="">
					<col width="33%">
				</colgroup>
				<tbody>
					<tr>
						<td id="cashViewType0" onclick="#" class="on">전체보기</td>
						<td id="cashViewType1" onclick="#">입금</td>
						<td id="cashViewType2" onclick="#">출금</td>
					</tr>
				</tbody>
			</table>

			<table id="cashList" class="tbl_typeA" border="1" cellspacing="0"
				summary="캐시관리">
				<caption>캐시관리</caption>
				<colgroup>
					<col width="5%">
					<col width="16%">
					<col width="20%">
					<col width="8%" class="cashViewType2">
					<col width="8%" class="cashViewType1">
					<col width="8%">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><input class="checkbox" type="checkbox"
							name="chkAll"></th>
						<th scope="col" align="center">일자</th>
						<th scope="col">구분</th>
						<th colspan="2" scope="col" class="cashViewType2">충전∙사용</th>
						<th scope="col">잔액</th>
						<th scope="col">비고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ requestScope.list }" var="p">
						<tr class="">
							<td colspan="2"><c:out value="${ p.paydate }" /></td>
							<td><c:out value="${ p.sort }" /></td>
							<td><c:out value="${ p.price }" /></td>
							<td></td>
							<td></td>
							<td><c:out value="${ p.paypg }" /></td>
							<!-- <td colspan="7">캐시 내역이 없습니다.</td> -->
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>