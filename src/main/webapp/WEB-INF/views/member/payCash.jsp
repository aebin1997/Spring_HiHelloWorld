<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<script>document.write('\x3Cscript src="/common/js/baseHeadMeta.js?v='+Math.random()+'">\x3C/script>');</script>
<script src="/common/js/baseHeadMeta.js?v=0.24566896202895272"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pay/base.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pay/default.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pay/main.css" type="text/css">
<script src="/common/js/jquery-1.12.4.min.js"></script>
<script src="/common/js/jquery-migrate-1.4.1.min.js"></script>
<script src="/common/js/jquery.base64.js"></script><script src="/common/js/jquery.cookie.js">
</script><script src="/common/js/json3.min.js"></script><script src="/common/js/modal/jquery.bpopup.min.js"></script><script src="/common/js/global.js?v=20200421"></script><script src="/common/js/util.js?v=20201207" charset="UTF-8"></script><link href="/common/js/Swiper/2.7.6/idangerous.swiper.css" rel="stylesheet"><script src="/common/js/Swiper/2.7.6/idangerous.swiper.js"></script><script src="/common/js/contentsListScroll.js?v=20171101"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pay/popup.css" type="text/css">

</head>

<body style="overflow-y:scroll">
<!-- 팝업사이즈 700 x 900 -->
<div class="popup_wrap">
	<div class="popup_header">
		<ul class="poptitle">
			<li class="title fl"><strong>Hi Hello World 포인트 충전</strong></li>
			<li class="url fr">www.hihelloworld.com</li>
			<div class="cb"></div>
		</ul>
	</div>
	<div class="popup_container">
		<div class="popup_contents">
			<!-- 내용 & 값 가져오기 -->
			<div id="eventCashBanner"><div class="mb10">
<img src="${pageContext.request.contextPath}/resources/images/pay/web_cash_popup_bn.jpg" style="width:100%">
</div></div>
			<div class="cash_text_contents">
				<div class="text"><strong><span class="font_395ec4 font_s14">충전금액</span>을 선택해 주세요.</strong></div>
			</div>

			<!-- table list -->
			<table class="tbl_typeA_cash_popup" summary="충전금액">
				<caption>충전금액</caption>
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="70%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">충전포인트</th>
						<th scope="col">적립혜택</th>
					</tr>
				</thead>
				<tbody id="payCashBenefitView">
					
						<tr onclick="payCashViewFN.productSelect(5)" class="cursor" id="pno5">
							<td><input class="radio" type="radio" name="productNO" id="productID5" value="5"></td>
							<td>5,000 포인트</td>
							<td><div class="ac pos_r">
<ul class="cash_benefit">
<li class="ePicon"><img class="icon_sortL" alt="" src="/common/images/cash/point_1.gif"></li>
<li class="eCash"></li>
<li class="eEventor"></li>
<li class="ePoint"><strong>250 P</strong></li>
<li class="eEventor"></li>
<li class="eCoupon"></li>
<li class="eCoupon_num ar" style="color:#90a133;"></li>
</ul>
</div></td>
						</tr>
					
						<tr onclick="payCashViewFN.productSelect(6)" class="cursor" id="pno6">
							<td><input class="radio" type="radio" name="productNO" id="productID6" value="6"></td>
							<td>10,000 포인트</td>
							<td><div class="ac pos_r">
<ul class="cash_benefit">
<li class="ePicon"><img class="icon_sortL" alt="" src="/common/images/cash/point_2.gif"></li>
<li class="eCash" style="color:#e16452;"><strong>1,000포인트</strong></li>
<li class="eEventor">or</li>
<li class="ePoint"><strong>2,000 P</strong></li>
<li class="eEventor">or</li>
<li class="eCoupon" style="color:#90a133;"><strong>쿠폰</strong></li>
<li class="eCoupon_num ar" style="color:#90a133;"><strong>3장</strong></li>
</ul>
</div></td>
						</tr>
					
						<tr onclick="payCashViewFN.productSelect(7)" class="cursor" id="pno7">
							<td><input class="radio" type="radio" name="productNO" id="productID7" value="7"></td>
							<td>20,000 포인트</td>
							<td><div class="ac pos_r">
<ul class="cash_benefit">
<li class="ePicon"><img class="icon_sortL" alt="" src="/common/images/cash/point_3.gif"></li>
<li class="eCash" style="color:#e16452;"><strong>2,000포인트</strong></li>
<li class="eEventor">or</li>
<li class="ePoint"><strong>6,000 P</strong></li>
<li class="eEventor">or</li>
<li class="eCoupon" style="color:#90a133;"><strong>쿠폰</strong></li>
<li class="eCoupon_num ar" style="color:#90a133;"><strong>9장</strong></li>
</ul>
</div></td>
						</tr>
					
						<tr onclick="payCashViewFN.productSelect(8)" class="cursor" id="pno8">
							<td><input class="radio" type="radio" name="productNO" id="productID8" value="8"></td>
							<td>30,000 포인트</td>
							<td><div class="ac pos_r">
<ul class="cash_benefit">
<li class="ePicon"><img class="icon_sortL" alt="" src="/common/images/cash/point_4.gif"></li>
<li class="eCash" style="color:#e16452;"><strong>3,000포인트</strong></li>
<li class="eEventor">or</li>
<li class="ePoint"><strong>10,000 P</strong></li>
<li class="eEventor">or</li>
<li class="eCoupon" style="color:#90a133;"><strong>쿠폰</strong></li>
<li class="eCoupon_num ar" style="color:#90a133;"><strong>24장</strong></li>
</ul>
</div></td>
						</tr>
					
						<tr onclick="payCashViewFN.productSelect(9)" class="cursor" id="pno9">
							<td><input class="radio" type="radio" name="productNO" id="productID9" value="9"></td>
							<td>50,000 포인트</td>
							<td><div class="ac pos_r">
<ul class="cash_benefit">
<li class="ePicon"><img class="icon_sortL" alt="" src="/common/images/cash/point_5.gif"></li>
<li class="eCash" style="color:#e16452;"><strong>5,000포인트</strong></li>
<li class="eEventor">or</li>
<li class="ePoint"><strong>20,000 P</strong></li>
<li class="eEventor">or</li>
<li class="eCoupon" style="color:#90a133;"><strong>쿠폰</strong></li>
<li class="eCoupon_num ar" style="color:#90a133;"><strong>45장</strong></li>
</ul>
</div></td>
						</tr>
					
						<tr onclick="payCashViewFN.productSelect(10)" class="cursor" id="pno10">
							<td><input class="radio" type="radio" name="productNO" id="productID10" value="10"></td>
							<td>90,000 포인트</td>
							<td><div class="ac pos_r">
<ul class="cash_benefit">
<li class="ePicon"><img class="icon_sortL" alt="" src="/common/images/cash/point_6.gif"></li>
<li class="eCash" style="color:#e16452;"><strong>9,000포인트</strong></li>
<li class="eEventor">or</li>
<li class="ePoint"><strong>40,000 P</strong></li>
<li class="eEventor">or</li>
<li class="eCoupon" style="color:#90a133;"><strong>쿠폰</strong></li>
<li class="eCoupon_num ar" style="color:#90a133;"><strong>90장</strong></li>
</ul>
</div></td>
						</tr>
					
						<tr onclick="payCashViewFN.productSelect(57)" class="cursor" id="pno57" style="">
							<td><input class="radio" type="radio" name="productNO" id="productID57" value="57"></td>
							<td>200,000 포인트 <select style="height:17px" id="fullTVAddNO"><option value="57">1</option><option value="58">2</option><option value="59">3</option><option value="60">4</option><option value="61">5</option></select></td>
							<td><div class="ac pos_r">
<ul class="cash_benefit">
<li class="ePicon"><img class="icon_sortL" alt="" src="/common/images/cash/point_6.gif"></li>
<li class="eCash" style="color:#e16452;"><strong>20,000포인트</strong></li>
<li class="eEventor">or</li>
<li class="ePoint"><strong>90,000 P</strong></li>
<li class="eEventor">or</li>
<li class="eCoupon" style="color:#90a133;"><strong>쿠폰</strong></li>
<li class="eCoupon_num ar" style="color:#90a133;"><strong>210장</strong></li>
</ul>
</div></td>
						</tr>
					
						<tr onclick="payCashViewFN.productSelect(58)" class="cursor" id="pno58" style="display:none">
							<td><input class="radio" type="radio" name="productNO" id="productID58" value="58"></td>
							<td>400,000 포인트</td>
							<td><div class="ac pos_r">
<ul class="cash_benefit">
<li class="ePicon"><img class="icon_sortL" alt="" src="/common/images/cash/point_6.gif"></li>
<li class="eCash" style="color:#e16452;"><strong>40,000포인트</strong></li>
<li class="eEventor">or</li>
<li class="ePoint"><strong>180,000 P</strong></li>
<li class="eEventor">or</li>
<li class="eCoupon" style="color:#90a133;"><strong>쿠폰</strong></li>
<li class="eCoupon_num ar" style="color:#90a133;"><strong>420장</strong></li>
</ul>
</div></td>
						</tr>
					
						<tr onclick="payCashViewFN.productSelect(59)" class="cursor" id="pno59" style="display:none">
							<td><input class="radio" type="radio" name="productNO" id="productID59" value="59"></td>
							<td>600,000 포인트</td>
							<td><div class="ac pos_r">
<ul class="cash_benefit">
<li class="ePicon"><img class="icon_sortL" alt="" src="/common/images/cash/point_6.gif"></li>
<li class="eCash" style="color:#e16452;"><strong>60,000포인트</strong></li>
<li class="eEventor">or</li>
<li class="ePoint"><strong>270,000 P</strong></li>
<li class="eEventor">or</li>
<li class="eCoupon" style="color:#90a133;"><strong>쿠폰</strong></li>
<li class="eCoupon_num ar" style="color:#90a133;"><strong>630장</strong></li>
</ul>
</div></td>
						</tr>
					
						<tr onclick="payCashViewFN.productSelect(60)" class="cursor" id="pno60" style="display:none">
							<td><input class="radio" type="radio" name="productNO" id="productID60" value="60"></td>
							<td>800,000 포인트</td>
							<td><div class="ac pos_r">
<ul class="cash_benefit">
<li class="ePicon"><img class="icon_sortL" alt="" src="/common/images/cash/point_6.gif"></li>
<li class="eCash" style="color:#e16452;"><strong>80,000포인트</strong></li>
<li class="eEventor">or</li>
<li class="ePoint"><strong>360,000 P</strong></li>
<li class="eEventor">or</li>
<li class="eCoupon" style="color:#90a133;"><strong>쿠폰</strong></li>
<li class="eCoupon_num ar" style="color:#90a133;"><strong>840장</strong></li>
</ul>
</div></td>
						</tr>
					
						<tr onclick="payCashViewFN.productSelect(61)" class="cursor" id="pno61" style="display:none">
							<td><input class="radio" type="radio" name="productNO" id="productID61" value="61"></td>
							<td>1,000,000 포인트</td>
							<td><div class="ac pos_r">
<ul class="cash_benefit">
<li class="ePicon"><img class="icon_sortL" alt="" src="/common/images/cash/point_6.gif"></li>
<li class="eCash" style="color:#e16452;"><strong>100,000포인트</strong></li>
<li class="eEventor">or</li>
<li class="ePoint"><strong>450,000 P</strong></li>
<li class="eEventor">or</li>
<li class="eCoupon" style="color:#90a133;"><strong>쿠폰</strong></li>
<li class="eCoupon_num ar" style="color:#90a133;width: 50px"><strong>1,050장</strong></li>
</ul>
</div></td>
						</tr>
					
				</tbody>
				<tfoot>
					<tr id="payInfoDiv">
						<td class="cash_total" colspan="3" align="center">
							<div id="payInfoView" class="cash_total02">실제결제금액(부가세10% 포함) : <strong class="font_395ec4">33,000원</strong><br>적립내역 : <strong>30,000포인트</strong> + 포인트 <strong>10,000P</strong></div>
						</td>
					</tr>
				</tfoot>
			</table>
			<!-- //table list  -->

			<table id="selectBonusView" width="100%" cellpadding="0" cellspacing="0" align="center" border="0"><tbody><tr>
	<td align="center">
		<table cellpadding="0" cellspacing="0" align="center" border="0">
			<tbody><tr>
				<td height="16"></td>
			</tr>
			<tr>
				<td>
					<table border="0" align="center">
						<tbody><tr height="45">
							<td colspan="5" style="font-weight:bold;color:#666;font-size:12px;text-align:center;">※ 추가로 적립 받으실 혜택을 선택해 주시기 바랍니다.</td>
						</tr>
						<tr>
							<td width="133">
								<table id="cashTable" border="0" width="100%" cellpadding="0" cellspacing="0" class="cursor" onclick="payCashViewFN.selectBonusFN(1);$('#checkCash').prop('checked',true);">
									<tbody><tr align="center">
										<td>
											<div style="background:url(${pageContext.request.contextPath}/resources/images/pay/benefit_cash.gif) no-repeat; width:87px; height:81px;">
												<div style="padding-top:39px; text-align:center; color:#ffffff; font-weight:bold; font-size:12px;">
													<div>포인트</div>
													<div id="eventSelectCash" class="mt5">3,000</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td height="5"></td>
									</tr>
									<tr align="center">
										<td>
											<input name="selectBonus" id="checkCash" class="radio" type="radio" value="1">
										</td>
									</tr>
								</tbody></table>
							</td>
							<td width="10">&nbsp;</td>
							<td width="133">
								<table id="pointTable" border="0" width="100%" cellpadding="0" cellspacing="0" class="cursor" onclick="payCashViewFN.selectBonusFN(2);$('#checkPoint').prop('checked',true);">
									<tbody><tr align="center">
										<td>
											<div style="background:url(${pageContext.request.contextPath}/resources/images/pay/benefit_point.gif) no-repeat; width:87px; height:81px;">
												<div style="padding-top:39px; text-align:center; color:#ffffff; font-weight:bold; font-size:12px;">
													<div>포인트</div>
													<div id="eventSelectPoint" class="mt5">10,000</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td height="5"></td>
									</tr>
									<tr align="center">
										<td>
										<input name="selectBonus" id="checkPoint" class="radio" type="radio" value="2" checked="checked">
										</td>
									</tr>
								</tbody></table>
							</td>
							<td width="10">&nbsp;</td>
							<td width="133">
								<table id="couponTable" border="0" width="100%" cellpadding="0" cellspacing="0" class="cursor" onclick="payCashViewFN.selectBonusFN(3);$('#checkCoupon').prop('checked',true);">
									<tbody><tr align="center">
										<td>
											<div style="background:url(${pageContext.request.contextPath}/resources/images/pay/benefit_coupon.gif) no-repeat; width:87px; height:81px;">
												<div style="padding-top:39px; text-align:center; color:#ffffff; font-weight:bold; font-size:12px;">
													<div>쿠폰</div>
													<div id="eventSelectCoupon" class="mt5">24장</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td height="5"></td>
									</tr>
									<tr align="center">
										<td>
											<input name="selectBonus" id="checkCoupon" class="radio" type="radio" value="3">
										</td>
									</tr>
								</tbody></table>
							</td>
						</tr>
					</tbody></table>
				</td>
			</tr>
		</tbody></table>
	</td>
</tr></tbody></table>

			<div id="freepassBanner" style="margin:10px  0px -10px 0px;cursor: pointer;display:none" onclick="if (!loginData.isLogin){ location.href='/common/html/member/popupLogin.html?v='+Math.random(); return false; } util_dataAnalysis({option:'freeTicketMarketingBanner',value:'1'}); util_popupwindow('/common/html/pay/popupFreepass.html', 'popupFreepass', 630, 492, true, 5);self.close()">
				<img src="/common/images/event/2017/20170601_freepass/freepass02_bn.jpg" style="width:100%;vertical-align:top;">
				<script>if("on" != "on") $("#freepassBanner").show()</script>
			</div>
			
			<div class="nf_paymentSelect3">	
				<div class="cash_text_contents mt20 mb10 textBg">
					<div class="textTitle pr10"><strong><span class="font_395ec4 font_s14">충전방법</span>을 선택해 주세요.</strong></div>
				</div>
				<ul class="nf_select2">
					<li class="selectLine group1">
						<ul class="payBtnArea">
							<li class="payBtn b01 pay_36" onclick="location.href='kakao.do'">카카오페이</li>
							<li class="payBtn b00 pay_32" onclick="payCashViewFN.paySelect('32', '핸드폰', 0)">핸드폰</li>
						</ul>
						<div class="cb"></div>
					</li>
					<li class="selectLine group2">
						<ul class="payBtnArea">
							<li class="payBtn b02 pay_31" onclick="payCashViewFN.paySelect('31', '신용카드', 0)">신용카드</li>
							<li class="payBtn b03 pay_3D" onclick="payCashViewFN.paySelect('3D', '해외신용카드', 0)">신용카드(해외)</li>
							<li class="payBtn b04 pay_33" onclick="payCashViewFN.paySelect('33', '계좌이체', 0)">계좌이체</li>
							<li class="payBtn b05 pay_3I" onclick="payCashViewFN.paySelect('3I', '가상계좌', 1)">가상계좌</li>
						</ul>
						<div class="cb"></div>
					</li>
					<li class="selectLine group3">
						<ul class="payBtnArea">
							<li class="payBtn b06 pay_3T" onclick="payCashViewFN.paySelect('3T', '토스(toss)', 0)">토스</li>
							<li class="payBtn b07 pay_3F" onclick="payCashViewFN.paySelect('3F', '페이코', 0)">페이코</li>
							<li class="payBtn b18 pay_77" onclick="payCashViewFN.paySelect('77', '케이뱅크', 0)">케이뱅크</li>
						</ul>
						<div class="cb"></div>
					</li>
					<li class="selectLine group4">
						<ul class="payBtnArea">
							<li class="payBtn b09 pay_3G" onclick="payCashViewFN.paySelect('3G', '티머니', 0)">모바일티머니</li>
							<li class="payBtn b10 pay_74" onclick="payCashViewFN.paySelect('74', '포인트다모아', 0)">포인트다모아</li>
							<li class="payBtn b15 pay_00" onclick="payCashViewFN.paySelect('00', '포인트선물', 0)">포인트선물</li>
						</ul>
						<div class="cb"></div>
					</li>
					<li class="selectLine group5">
						<ul class="payBtnArea">
							<li class="payBtn b11 pay_37" onclick="payCashViewFN.paySelect('37', '컬처랜드', 1)">컬쳐랜드</li>
							<li class="payBtn b12 pay_3E" onclick="payCashViewFN.paySelect('3E', '해피머니', 1)">해피머니</li>
							<li class="payBtn b13 pay_3M" onclick="payCashViewFN.paySelect('3M', '스마트문상', 1)">스마트(문화상품권)</li>
							<li class="payBtn b14 pay_38" onclick="payCashViewFN.paySelect('38', '도서상품권', 1)">도서(문화상품권)</li>
						</ul>
						<div class="cb"></div>
					</li>
				</ul>
			</div>

			<div id="payGiftInfoDiv" style="display:none;">
				<div class="cash_text_contents mt20 mb5">
					<div class="text" id="pca_Intro110"><strong><span class="font_395ec4 font_s14">충전 내용</span>을 확인하신 후 <span class="font_red font_s14">결제하기 버튼을 클릭</span>해주세요.</strong></div>
				</div>
				<div class="cash_total02 bg" id="payGiftInfoView"></div>
			</div>
			<!-- //내용 -->
		</div>
	</div>
	<div class="popup_footer">
		<span class="btn_02 medium cursor" onclick="self.close()"><em>닫기</em></span>
	</div>
</div>

<div id="cashFormDiv" class="skip"></div>

</body>
</html>

