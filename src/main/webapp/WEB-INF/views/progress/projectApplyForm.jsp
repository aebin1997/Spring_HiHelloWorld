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
	float: left;
}

.main_right_btn {
	width: 50%;
	height: 280px;
	float: left;
}
</style>
<script type="text/javascript"
	src="/hhw/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("#modal_open_btn").click(function() {
			$("#modal").show();
			
			var offset = $("#modal" + seq).offset();
	        $('html, body').animate({scrollTop : offset.top}, 50);
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
					<button type="button" id="modal_close_btn">모달 창 닫기</button>
					<br>
				</div>
			</div>
		
		<div class="main_left_btn" align="center">
			<!-- 의뢰 요청 form -->
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
						<td><select name="qa_title" style="width: 150px;" required>
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
							id="date_timepicker_end" min="${ today }"
							data-date-format="YYYY/MM/DD" pattern="YYYY/MM/DD"
							style="width: 150px;" required></td>
						<td></td>
					</tr>
					<tr>
						<td>금액</td>
						<td><input type="number" name="pro_pay" min="1000"
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


		<div class="main_right_btn" align="center">
			<form action="" method="post">
				<table id="apply" width="280" height="160">
					<tr>
						<td>요청자</td>
						<td></td>
					</tr>
					<tr>
						<td>질문 제목</td>
						<td></td>
					</tr>
					<tr>
						<td>기한</td>
						<td></td>
					</tr>
					<tr>
						<td>금액</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td align="right"><button>의뢰 수락</button></td>
					</tr>
				</table>
			</form>
		</div>

		<div align="center">
			<h4>나의 Q&A</h4>

			<%-- 목록 출력 --%>
			<br>
			<table border="1" width="700" cellspacing="0"
				style="text-align: center;">
				<tr>
					<th align="center">번호</th>
					<th align="center">답변자</th>
					<th align="center">마감기한</th>
					<th align="center">금액</th>
					<th align="center">진행도</th>
					<th align="center">상태</th>
				</tr>
				<c:forEach items="${ requestScope.list }" var="p">
					<tr>
						<td align="center">${ p.pro_id }</td>
						<td align="center">${ p.pro_answerer }</td>
						<td align="center">${ p.pro_deadline }</td>
						<td align="center">${ p.pro_pay }</td>
						<td align="center">${ p.pro_process }</td>
						<c:choose>
							<c:when test="${ p.pro_status eq 'Y' }">
								<td align="center">진행중</td>
							</c:when>
							<c:when test="${ p.pro_status eq 'W' }">
								<td align="center">수락 대기중</td>
							</c:when>
							<c:when test="${ p.pro_status eq 'N' }">
								<td align="center">거절됨</td>
							</c:when>
							<c:otherwise>
								<td align="center">기간 만료됨</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>



		<!-- 푸터 -->
	</section>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>