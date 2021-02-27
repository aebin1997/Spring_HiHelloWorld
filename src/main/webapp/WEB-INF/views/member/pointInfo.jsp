<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Author" content="aebin">
<title>포인트 관리</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pay/base.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pay/default.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pay/main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pay/jquery-ui.css" />
	
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
	<div id="contents" class="contents" style="width:48%; margin-left:26%; ">

		<ul class="title_wrap">
			<li class="title_l">포인트관리</li>
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
					<td onclick="location.href='payInfo.do'">
				<div>캐시관리</div>
			</td>
						<td class="on">
							<div>포인트관리</div>
							<div>
								<script>if(loginData.isLogin) document.write("("+util_setComma(loginData.myPoint)+" 포인트)")</script>
								(0 포인트)
							</div>
						</td>
					<td onclick="location.href='myNaegong.do'">
						<div>내공관리</div>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="table_box3 mt20">
			<ul class="table_box3_set">
				<li class="table_box3_set_L ml3"><span>조회기간</span> <span>
						<!-- 달력 -->
						<link href="${pageContext.request.contextPath}/resources/css/myPage/jquery-ui.css" rel="stylesheet" type="text/css">
						<script	src="${pageContext.request.contextPath}/resources/css/myPage/jquery-1.8.ui.min.js"></script> <select
						id="searchStartYear" class="input_select03">
							<option value="2020">2020</option>
							<option value="2021" selected="">2021</option>
					</select> <label>년</label> <select id="searchStartMonth"
						class="input_select">
							<option value="01">01</option>
							<option value="02" selected="">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
					</select> <label>월</label> <select id="searchStartDay" class="input_select">
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05" selected="">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
					</select> <label>일</label> <input name="fromDt" type="hidden" id="fromDt"
						class="input_txt02 hasDatepicker" maxlength="10" title="시작일자">
						<img class="ui-datepicker-trigger"
						src="${pageContext.request.contextPath}/resources/images/pay/calendar_icon.png"
						alt="달력선택" title="달력선택"
						style="vertical-align: middle; cursor: pointer; position: relative; top: -1px; *z-index: 0;">
						<label class="chrome_txt01">&nbsp;~&nbsp;</label> <select
						id="searchEndYear" class="input_select03">
							<option value="2020">2020</option>
							<option value="2021" selected="">2021</option>
					</select> <label>년</label> <select id="searchEndMonth" class="input_select">
							<option value="01">01</option>
							<option value="02" selected="">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
					</select> <label>월</label> <select id="searchEndDay" class="input_select">
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18" selected="">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
					</select> <label>일</label> <input name="toDt" type="hidden" id="toDt"
						class="input_txt02 hasDatepicker" maxlength="10" title="종료일자"
						value="2021-02-18"><img class="ui-datepicker-trigger"
						src="${pageContext.request.contextPath}/resources/images/pay/calendar_icon.png"
						alt="달력선택" title="달력선택"
						style="vertical-align: middle; cursor: pointer; position: relative; top: -1px; *z-index: 0;">
						<script type="text/javascript">
							$(function() {
								var clareCalendar = {
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									weekHeader : 'Wk',
									dateFormat : 'yy-mm-dd', // 형식(2012-03-03)
									autoSize : false, // 오토리사이즈(body등 상위태그의 설정에 따른다)
									changeMonth : true, // 월변경가능
									changeYear : true, // 년변경가능
									showMonthAfterYear : true, // 년 뒤에 월 표시
									buttonImageOnly : true, // 이미지표시
									buttonText : '달력선택', // 버튼 텍스트 표시
									buttonImage : '/common/images/common/calendar_icon.gif', // 이미지주소
									showOn : "both", // 엘리먼트와 이미지 동시 사용(both,button)
									maxDate : 0,
									yearRange : '-1:+0' // 작년:올해
								};

								$("#fromDt").datepicker(clareCalendar);

								$("input[id=fromDt]").unbind();
								$("input[id=fromDt]").bind(
										"change",
										function() {
											var dateFrom = $(this).val().split(
													"-");

											$("select[id=searchStartYear]")
													.val(dateFrom[0]);
											$("select[id=searchStartMonth]")
													.val(dateFrom[1]);
											$("select[id=searchStartDay]").val(
													dateFrom[2]);
										});

								$("#toDt").datepicker(clareCalendar);

								$("input[id=toDt]").unbind();
								$("input[id=toDt]").bind(
										"change",
										function() {
											var dateTo = $(this).val().split(
													"-");

											$("select[id=searchEndYear]").val(
													dateTo[0]);
											$("select[id=searchEndMonth]").val(
													dateTo[1]);
											$("select[id=searchEndDay]").val(
													dateTo[2]);
										});

								$("img.ui-datepicker-trigger")
										.attr(
												"style",
												"vertical-align:middle; cursor:pointer; position:relative; top:-1px; *z-index:0;"); //이미지버튼 style적용
								$("#ui-datepicker-div").hide(); // 자동으로 생성되는 div객체 숨김

							});
						</script>
				</span></li>
				<li class="table_box3_set_R"><span class="btn_01 medium"
					onclick="#"><em>조회</em></span> <span
					class="btn_01 medium" onclick="#"><em>삭제</em></span>
				</li>
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
					<th scope="col">일자</th>
					<th scope="col">구분</th>
					<th scope="col" class="cashViewType2">입금</th>
					<th scope="col" class="cashViewType1">출금</th>
					<th scope="col">잔액</th>
					<th scope="col">비고</th>
				</tr>
			</thead>
			<tbody>
				<tr class="">
					<td colspan="7">캐시 내역이 없습니다.</td>
				</tr>
			</tbody>
		</table>

		<script>
			function commonPage(pg) {
				myCashFN.goPage(pg);
			}

			var myCashFN = (function() {
				var searchStartDate = $("#searchStartYear").val()
						+ $("#searchStartMonth").val()
						+ $("#searchStartDay").val();
				var searchEndDate = $("#searchEndYear").val()
						+ $("#searchEndMonth").val() + $("#searchEndDay").val();
				var viewType = 0;
				var viewPoint = 1;

				$("#mycash").addClass("on");
				$("#cashViewType" + viewType).addClass("on");
				$("#cashList .cashViewType" + viewType).remove();
				$("#cashList tbody tr").hover(function() {
					$(this).addClass('on');
				}, function() {
					$(this).removeClass('on');
				});
				$("input[name=chkAll]").off("click").on("click", function() {
					if ($(this).is(":checked")) {
						$("input[name=seq_no]").attr("checked", true);
					} else {
						$("input[name=seq_no]").attr("checked", false);
					}
				});

				function goList() {
					searchStartDate = $("#searchStartYear").val()
							+ $("#searchStartMonth").val()
							+ $("#searchStartDay").val();
					searchEndDate = $("#searchEndYear").val()
							+ $("#searchEndMonth").val()
							+ $("#searchEndDay").val();

					var goURL = "/MyInfo/myCashList.do?&pp=" + viewPoint
							+ "&vt=" + viewType + "&sd=" + searchStartDate
							+ "&ed=" + searchEndDate;
					goContents(goURL, null, true);
				}

				function goDel() {
					var chkCnt = 0;
					var seqNo = new Array();

					chkCnt = $("input[name=seq_no]:checked").length

					if (chkCnt > 0) {
						for (var i = 0; i < chkCnt; i++) {
							seqNo[i] = $("input[name=seq_no]:checked").eq(i)
									.val();
						}
					} else {
						alert("선택하신 컨텐츠가 없습니다.");
						return;
					}

					if (confirm("삭제하시겠습니까?")) {
						$.post("/noriNew/MyInfo/myCashDel.do", {
							arrSeqNO : seqNo
						}, function(data) {
							if (data) {
								alert("정상적으로 삭제 되었습니다.");
								window.location.reload(true);
							} else {
								alert("삭제가 정상적으로 이루어지지 않았습니다.");
								return false;
							}
						});
					}
				}

				function goView(vt) {
					viewType = vt;
					viewPoint = 1;
					goList();
				}

				function goPage(vp) {
					viewPoint = vp;
					goList()
				}

				return {
					goList : goList,
					goDel : goDel,
					goPage : goPage,
					goView : goView
				};
			})();
		</script>
	</div>

	<div id="ui-datepicker-div"
		class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"
		style="position: absolute; top: 373px; left: 902px; z-index: 1; display: block;">
		<div
			class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all">
			<a class="ui-datepicker-prev ui-corner-all" data-handler="prev"
				data-event="click" title="Prev"><span
				class="ui-icon ui-icon-circle-triangle-w">Prev</span></a><a
				class="ui-datepicker-next ui-corner-all ui-state-disabled"
				title="Next"><span class="ui-icon ui-icon-circle-triangle-e">Next</span></a>
			<div class="ui-datepicker-title">
				<select class="ui-datepicker-year" data-handler="selectYear"
					data-event="change"><option value="2020">2020</option>
					<option value="2021" selected="selected">2021</option></select><select
					class="ui-datepicker-month" data-handler="selectMonth"
					data-event="change"><option value="0">1월</option>
					<option value="1" selected="selected">2월</option></select>
			</div>
		</div>
		<table class="ui-datepicker-calendar">
			<thead>
				<tr>
					<th class="ui-datepicker-week-end"><span title="Sunday">일</span></th>
					<th><span title="Monday">월</span></th>
					<th><span title="Tuesday">화</span></th>
					<th><span title="Wednesday">수</span></th>
					<th><span title="Thursday">목</span></th>
					<th><span title="Friday">금</span></th>
					<th class="ui-datepicker-week-end"><span title="Saturday">토</span></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td
						class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
					<td class=" " data-handler="selectDay" data-event="click"
						data-month="1" data-year="2021"><a class="ui-state-default"
						href="#">1</a></td>
					<td class=" " data-handler="selectDay" data-event="click"
						data-month="1" data-year="2021"><a class="ui-state-default"
						href="#">2</a></td>
					<td class=" " data-handler="selectDay" data-event="click"
						data-month="1" data-year="2021"><a class="ui-state-default"
						href="#">3</a></td>
					<td class=" " data-handler="selectDay" data-event="click"
						data-month="1" data-year="2021"><a class="ui-state-default"
						href="#">4</a></td>
					<td class=" " data-handler="selectDay" data-event="click"
						data-month="1" data-year="2021"><a class="ui-state-default"
						href="#">5</a></td>
					<td class=" ui-datepicker-week-end " data-handler="selectDay"
						data-event="click" data-month="1" data-year="2021"><a
						class="ui-state-default" href="#">6</a></td>
				</tr>
				<tr>
					<td class=" ui-datepicker-week-end " data-handler="selectDay"
						data-event="click" data-month="1" data-year="2021"><a
						class="ui-state-default" href="#">7</a></td>
					<td class=" " data-handler="selectDay" data-event="click"
						data-month="1" data-year="2021"><a class="ui-state-default"
						href="#">8</a></td>
					<td class=" " data-handler="selectDay" data-event="click"
						data-month="1" data-year="2021"><a class="ui-state-default"
						href="#">9</a></td>
					<td class=" " data-handler="selectDay" data-event="click"
						data-month="1" data-year="2021"><a class="ui-state-default"
						href="#">10</a></td>
					<td class=" " data-handler="selectDay" data-event="click"
						data-month="1" data-year="2021"><a class="ui-state-default"
						href="#">11</a></td>
					<td class=" " data-handler="selectDay" data-event="click"
						data-month="1" data-year="2021"><a class="ui-state-default"
						href="#">12</a></td>
					<td class=" ui-datepicker-week-end " data-handler="selectDay"
						data-event="click" data-month="1" data-year="2021"><a
						class="ui-state-default" href="#">13</a></td>
				</tr>
				<tr>
					<td class=" ui-datepicker-week-end " data-handler="selectDay"
						data-event="click" data-month="1" data-year="2021"><a
						class="ui-state-default" href="#">14</a></td>
					<td class=" " data-handler="selectDay" data-event="click"
						data-month="1" data-year="2021"><a class="ui-state-default"
						href="#">15</a></td>
					<td class=" " data-handler="selectDay" data-event="click"
						data-month="1" data-year="2021"><a class="ui-state-default"
						href="#">16</a></td>
					<td class=" " data-handler="selectDay" data-event="click"
						data-month="1" data-year="2021"><a class="ui-state-default"
						href="#">17</a></td>
					<td class=" ui-datepicker-days-cell-over  ui-datepicker-today"
						data-handler="selectDay" data-event="click" data-month="1"
						data-year="2021"><a
						class="ui-state-default ui-state-highlight" href="#">18</a></td>
					<td class=" ui-datepicker-unselectable ui-state-disabled "><span
						class="ui-state-default">19</span></td>
					<td
						class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span
						class="ui-state-default">20</span></td>
				</tr>
				<tr>
					<td
						class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span
						class="ui-state-default">21</span></td>
					<td class=" ui-datepicker-unselectable ui-state-disabled "><span
						class="ui-state-default">22</span></td>
					<td class=" ui-datepicker-unselectable ui-state-disabled "><span
						class="ui-state-default">23</span></td>
					<td class=" ui-datepicker-unselectable ui-state-disabled "><span
						class="ui-state-default">24</span></td>
					<td class=" ui-datepicker-unselectable ui-state-disabled "><span
						class="ui-state-default">25</span></td>
					<td class=" ui-datepicker-unselectable ui-state-disabled "><span
						class="ui-state-default">26</span></td>
					<td
						class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span
						class="ui-state-default">27</span></td>
				</tr>
				<tr>
					<td
						class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span
						class="ui-state-default">28</span></td>
					<td
						class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
					<td
						class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
					<td
						class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
					<td
						class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
					<td
						class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
					<td
						class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- 푸터 -->
</section>
<jsp:include page="../common/footer.jsp" />

</body>
</html>