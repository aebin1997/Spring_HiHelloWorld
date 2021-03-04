<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Author" content="kimwoolina">
<!-- 테이블 -->
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/myPage/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/profile.css" />


<style>
#apply {
	border: 1px solid #444444;
	border-collapse: collapse;
}

#apply .th, .td {
	border: none;
	padding: 10px;
}

#modal {
	display: none;
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
	position: relative;
}

#modal h2 {
	margin: 0;
}

#modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#modal .modal_content {
	width: 300px;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}

.main_left_btn {
	width: 50%;
	height: 280px;
	float: center;
}

.main_right_btn {
	width: 50%;
	height: 280px;
	float: center;
}
</style>

<script type="text/javascript"
	src="/hhw/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	$(function() {

		$("#modal_open_btn").click(function() {
			$("#modal").show();

			var offset = $("#modal").offset();
			$('html').animate({
				scrollTop : offset.top
			}, 1000);
		});

		$("#modal_close_btn").click(function() {
			$("#modal").attr("style", "display:none");
		});

		$("#UserSelectBtn").click(function() {
			$.ajax({
				url : "selectUser.do",
				data : {
					user : $("#userId").val()
				},
				type : "post",
				success : function(data) {
					if (data == "fail") {
						alert("회원 정보가 없습니다.");
					} else {
						$("#selectUser").val(data);
					}

				},
				error : function(jqxhr, textStatus, errorThrown) {
					console.log("ajax 처리 실패");

					console.log(jqxhr);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		});
		
	});
</script>

</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />
	<section style="padding: 100px 250px 60px 250px;">

		<%-- modal창(답변자 검색) --%>
		<div id="modal">
			<div class="modal_content">
				<h5>답변자 검색</h5>
				<br> <input type="text" id="userId"> <input
					type="button" id="UserSelectBtn" value="검색"> <br>
				<button type="button" id="modal_close_btn">검색 완료</button>
				<br>
			</div>
		</div>

		<div class="main_left_btn" align="center">
			<%-- 의뢰 요청 하기 --%>
			<form action="progressInsert.do" method="post">
				<table id="apply" width="280" height="160">
					<tr>
						<td>답변자 선택</td>
						<td><input type="text" name="pro_answerer" id="selectUser"
							value="" required readonly style="width: 150px;"></td>
						<td><button type="button" id="modal_open_btn">찾기</button></td>
					</tr>
					<tr>
						<td>질문 선택</td>
						<td><select name="qa_title" id="selectQa" style="width: 150px;" required>
								<option value="" selected>질문 선택</option>
								<c:if test="${ requestScope.tlist != null }">
									<c:forEach items="${ requestScope.tlist }" var="t">
										<option value="${ t }">${ t }</option>
									</c:forEach>
								</c:if>
						</select></td>
						<td></td>
					</tr>
					<tr>
						<td>마감 기한</td>
						<td><input type="date" name="pro_deadline"
							min="${ today }" data-date-format="YYYY/MM/DD" pattern="YYYY/MM/DD"
							style="width: 150px;" required></td>
						<td></td>
					</tr>
					<tr>
						<td>금액</td>
						<td><input id="pro_pay" type="number" name="pro_pay" min="1000"
							step="1000" style="width: 150px;" required></td>
						<td><button>결제</button></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" align="right"><button>의뢰 신청</button></td>
					</tr>
				</table>
			</form>
		</div>

		<%-- 의뢰 수락하기 --%>
		<c:if test="${ rlist ne null }">
			<c:forEach items="${ requestScope.rlist }" var="r">
				<form name="form" method="post">
					<div class="main_right_btn" align="center">
						<input type="hidden" name="r_pro_id" value="${ r.pro_id }">
						<table id="apply" width="280" height="160">
							<tr>
								<td>요청자</td>
								<td>${ r.pro_writer }</td>
							</tr>
							<tr>
								<td>질문 제목</td>
								<td><a href="qadetail.do?qa_id=${ r.pro_qid }">${ r.qa_title }</a></td>
							</tr>
							<tr>
								<td>마감 기한</td>
								<td>${ r.pro_deadline }</td>
							</tr>
							<tr>
								<td>금액</td>
								<td>${ r.pro_pay }</td>
							</tr>
							<tr>
								<td colspan=2 align="right">
									<input type="submit" value="의뢰 수락" onclick="javascript: form.action='/hhw/requestAccept.do';"/>
    								<input type="submit" value="의뢰 거절" onclick="javascript: form.action='/hhw/requestRefuse.do';"/>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</c:forEach>
		</c:if>

		<div class="my_info_area" align="center">
			<h4>나의 Q&A</h4>
			<br>
			<%-- 목록 출력 --%>
			<table class="boardtype2 th_border my_table" width="1000" cellspacing="0">
			<colgroup>
				<col width="100">
				<col width="1000">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="200">
			</colgroup>
			<thead>
				<tr>
					<th scope="col" class="title">바로가기</th>
					<th scope="col" class="title">제목</th>
					<th scope="col" class="title">질문자</th>
					<th scope="col" class="title">답변자</th>
					<th scope="col" class="title">마감기한</th>
					<th scope="col" class="title">금액</th>
					<th scope="col" class="title">진행도</th>
					<th scope="col" class="title">상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${ requestScope.list ne null }">
					<c:forEach items="${ requestScope.list }" var="p">
						<tr>
							<td align="center"><c:if test="${ fn:trim(p.pro_status) eq 'Y' || fn:trim(p.pro_status) eq 'N' || fn:trim(p.pro_status) eq 'C' }">
							<a href="plist.do?pro_id=${ p.pro_id }">
							<img src="/hhw/resources/images/icon/ico_go.png" width="15px" height="15px"></a></c:if></td>
							<td>${ p.qa_title }</td>
							<td align="center">${ p.pro_writer }</td>
							<td align="center">${ p.pro_answerer }</td>
							<td align="center">${ p.pro_deadline }</td>
							<td align="center">${ p.pro_pay }</td>
							<td align="center">${ p.pro_process }</td>
							<td align="center">
							<c:if test="${ fn:trim(p.pro_status) eq 'Y' }">
							진행중
							</c:if> <c:if test="${ fn:trim(p.pro_status) eq 'W' }">
							수락 대기중
							</c:if> <c:if test="${ fn:trim(p.pro_status) eq'D' }">
							거절됨
							</c:if> <c:if test="${ fn:trim(p.pro_status) eq 'N' }">
								기간 만료됨
							</c:if><c:if test="${ fn:trim(p.pro_status) eq 'C' }">
								채택 완료됨
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				</tbody>
			</table>
		</div>
		<br>



		<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>