<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="Author" content="aebin">

<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/myPage/common.css" />
<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.kin/static/pc/20210209151259/css/min/components.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/other.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/profile.css" />
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?v=2.2">

<script type="text/javascript" src="https://ssl.pstatic.net/static.kin/static/pc/20210209151259/js/min/kin.js"></script>

<title>	마이페이지 : Hi Hello World </title>

</head>


<body>
<jsp:include page="../common/header.jsp" />
<section style="padding: 100px 0 60px 0;">
	<div id="wrap" class="wrap wrap_my"> 
<div class="header_wrap">


<!-- nav -->
	
</div>

<script type="text/javascript">
	
	$Fn(function() {
		new naver.kin.LNB({
			'questionType' : ''
		});
	}).attach(window, 'load');

	var GNB_BRIGHTNESS_VALUE = {
		DARK_ICON : 0,
		DARK_ICON_AND_TRANSPARENCY : 1,
		BRIGHT_ICON_AND_TRANSPARENCY : 2,
		BRIGHT_ICON : 3
	};
	
	var GNB_ITEM_HIDE_OPTION_BIT_VALUE = {
		DEFAULT : 0,
		HIDE_LOGIN_BTN : 1,
		HIDE_USER_LAYER : 2,
		HIDE_NAVER_ME_AREA : 4,
		HIDE_MAIL_ALARM_AREA : 8,
		HIDE_PROFILE_IMAGE : 16,
		SHOW_BENEFIT_FOR_STAFF_MEMBER : 32
	};

	
	var smartSearch = "";
	
	var gnb_service = "kin";
	
	var gnb_logout = encodeURIComponent("https://nid.naver.com/nidlogin.logout");
	
	var gnb_login = encodeURIComponent(location.href || 'https://kin.naver.com');
	
	var gnb_template = "gnb_utf8";
	
	var gnb_item_hide_option = GNB_ITEM_HIDE_OPTION_BIT_VALUE.DEFAULT;
	
	
	
	

	$Fn(function() {
		
		getGNB();
		
		var bIsGnbClicked = false;
		
		
		$Fn(function (we) {
			if (!bIsGnbClicked) {
				gnbAllLayerClose();
			}
			
			bIsGnbClicked = false;
		}, this).attach(document.body, 'click');
		
		$Fn(function(we) {
			bIsGnbClicked = true;
		}, this).attach($('gnb'), 'click');
		
		
		try {
			$('autoFrame').src = '/static/reatcmp.html?v=4.1';
		} catch(e) {
		}
		
		smartSearch = new nhn.AjaxSuggestUS('nx_query', 'autoFrame', {
			url : 'https://ac.search.naver.com/nx/ac',
			cookieName : 'NaverSuggestUse',
			listbox : '_resultBox',
			sFromName : 'topSearch',
			triangleBtn : 'triangleBtn',
			sListMaxLength : 55,
			listMaxCount : 15,
			request_type : 'jsonp',
			request_data : {
				q : '{query}',
				st : '100',
				r_format : 'json',
				t_koreng : '1',
				q_enc : 'UTF-8',
				r_enc : 'UTF-8',
				r_unicode : '0',
				r_escape : '1',
				frm : 'kin'
			},
			sTriangleUpOn : 'https://ssl.pstatic.net/static/common/snb/090513/bu_arrow_up.gif',
			sTriangleUpOff : 'https://ssl.pstatic.net/sstatic/search/mypocket/v3/btn_atcmp_off_op2.gif',
			sTriangleDownOn : 'https://ssl.pstatic.net/static/common/snb/090513/bu_arrow_down.gif',
			sTriangleDownOff : 'https://ssl.pstatic.net/static/common/snb/090513/bu_arrow_down3.gif'
		}).attach({
			actSubmit : function() {
				try {
					top.selectAction(this._elForm);
				} catch(e) {
					try {
						selectAction(this._elForm);
					} catch(e) {
					}
				}

				this._elForm.submit();
			}
		});
		
		var expertEntryBanner = $$.getSingle("div.gnb_eXpertLogo div.banner");
		if (!!expertEntryBanner) {
			var cookie = new $Cookie();

			$Fn(function () {
				$Element(expertEntryBanner).hide();

				var newDisabledUntil = new Date().getTime() + (3 * 1000 * 24 * 60 * 60);
				cookie.set("kin_expert_entry_banner_disabled_until", newDisabledUntil, 5);
			}).attach($$.getSingle("div.gnb_eXpertLogo div.banner button.buttonCancel"), 'click');

			var disabledUntilTimestamp = new Number(cookie.get("kin_expert_entry_banner_disabled_until"));
			if (!isNaN(disabledUntilTimestamp)) {
				if (new Date().getTime() > disabledUntilTimestamp) {
					cookie.remove("kin_expert_entry_banner_disabled_until");
					$Element(expertEntryBanner).show();
				}
			} else {
				$Element(expertEntryBanner).show();
			}
		}
		

		if (typeof nhn.Kin.ChatMenu !== "undefined") {
			window.oChatMenu = new nhn.Kin.ChatMenu();
		}
	}).attach(window, 'load');
</script>



<div id="container" class="container-fluid">
	<div class="container-fluid-content">
		<div class="container-fluid-content-inner _containerFluidContentInner">
			










	


<strong class="blind">현재 페이지 경로</strong>
<ul class="location" id="au_location">
	<li><a href="/index.nhn">홈</a></li>
	<li class="last">
		
		
			<a href="/myinfo/index.nhn">프로필</a>
		
	</li>
	
</ul>
<!-- 프로모션 배너 -->








<style type="text/css">
.banner_kincommon {position:relative; float:right; width:190px; margin:-40px 0 0 0; z-index:23;}
.banner_kincommon img {vertical-align:top;}
</style>


			








	



<script>
function photoView(uri){
	var url = "/popup/photoView.nhn?photoUrl=" + encodeURIComponent(uri);
	nhn.Kin.Utility.popup(url, 'photoView', {width:100,height:100,status:0});
}
</script>
<!-- Personal_Info  -->
<h2 class="blind">프로필</h2>


<div class="my_personal" id="au_main_profile_box" style="">

	<div class="my_personal_top"></div>
	<div class="my_personal_inner">
		
		<div class="profile_section">
			<div class="profile_group">
				
					
					
					
						<a href="/people/levelup/index.nhn" class="profile_animate profile_default">
							<span class="thumbnail">
								<img src="https://ssl.pstatic.net/static/kin/09renewal/avatar/200x200/4_3d.png" width="100%" height="100%" alt="pparappi6 님의 프로필">
							</span>
							<span class="mask_bdr"></span>
						</a>
					
				
				
				
					<a href="#" onclick="#" class="edit_photo _ros" target="_blank">
						<span class="photo_edit_button">
							<span class="blind">프로필 사진 변경</span>
						</span>
					</a>
				
			</div>
			<div class="profile_info">
				

				<div class="profile_name">
					<strong class="profile_user">${ loginUser.name }</strong>
					
				</div>
			</div>
			
                <div class="btn_info cert">
				∙포인트: <a href="payInfo.do" onclick="">충전</a><br>
				∙보너스: <br>
				∙내공: <a href="myNaegong.do" onclick="">환전</a><br>
				</div>
				
				<div class="btn_info cert2">
				출석하기 | <a href="myInfoUpdate.do" onclick="">내정보관리하기</a>
				</div>
			
<script type="text/javascript" src="https://ssl.pstatic.net/static.kin/static/pc/20210209151259/js/min/nhn.Kin.Userinfo.EditorHistory.js"></script>
		</div>
		<div class="profile_section2">
			<div class="my_intro no_my_intro">
				<div class="my_title">
						<p class="sum">작성된 소개글이 없습니다.</p>
						
						<p class="no_action">
							본인을 알릴 수 있는 짤막한 소개글을 남겨 주세요.<br>
							소개글이 있으면 질문하신 분이 답변을 확인하고 채택하는데 <br>
							많은 도움이 됩니다.
						</p>
				</div>
				<dl class="my_site">
					
				</dl>
				
				
					<p class="btn_report">
						<a href="#" onclick="#" class="_ros"><img src="https://ssl.pstatic.net/static/kin/09renewal/btn_intro_edit_130927.gif" width="27" height="16" alt="수정"></a>
					</p>
				
			</div>

				<div class="my_main no_my_main _licenseList">
					<div class="tit">
						<img class="myinfo_qual_title" src="https://ssl.pstatic.net/static/kin/09renewal/h_my_qual.png" width="39" height="11" alt="취득자격" />
						<button class="tooltip_help_button _licenseHelpLayerOpenBtn" onclick="#"><img src="https://ssl.pstatic.net/static/kin/09renewal/ico_help.png" width="16" height="16" alt="도움말" /></button>

<div class="layer_base layer_balloon _licenseHelpGuideLayer" style="width:289px; top: 17px; left: -95px; display:none;">
    <div class="layer_header border_none">
        <strong>취득자격이란?</strong>
    </div>

    <div class="layer_content">
        <p>취득 자격은 <em>오프라인에서 취득한 국가자격</em>으로, 실명인증을 통해 지식iN 서비스에 노출할 수 있습니다. 나의 답변에 신뢰를 줄 수 있도록 취득 자격을 설정해보세요.</p>
    </div>

    <button class="close _closeHelpGuide" onclick="#"><img src="https://ssl.pstatic.net/static/kin/09renewal/btn_close_layer.gif" alt="레이어팝업 닫기"></button>
    <div class="edge_center"></div>
</div>
					</div>
					<p class="no_action_tit">설정된 취득 자격이 없습니다. </p>
					<p class="no_action">오프라인에서 취득한 국가기술자격이 있다면<br />프로필에 취득 자격을 노출해보세요.</p>
				</div>
				
				
				

				<div class="my_main no_my_main">
					
					<div class="tit">
						<img src="https://ssl.pstatic.net/static/kin/09renewal/h_my_main.gif" width="58" height="12" alt="주요활동분야"> <a href="#none" class="tooltip_help_button _help_major_active"><img src="https://ssl.pstatic.net/static/kin/09renewal/ico_help.gif" width="14" height="14" alt="도움말"></a>

						
						<div class="layer_base layer_balloon" style="width:288px; top:17px; left:-75px; display:none;" id="au_layer_help">
							<div class="layer_header border_none">
								<strong class="title">주요활동분야란?</strong>
							</div>

							<div class="layer_content">
								<p>주요활동분야는 <em>채택답변이 5개 이상 있는 2단계 이하<br>디렉토리 중에서</em> 최대 4개까지 선택할 수 있습니다.<br>자신을 대표할 수 있는 주로 답변하는 디렉토리로<br>설정해주세요.</p>
							</div>
							<button class="close _lookUpChildElement('img')">
								<img src="https://ssl.pstatic.net/static/kin/09renewal/btn_close_layer.gif" alt="레이어팝업 닫기" class="_close" />
							</button>
							<div class="edge_center"></div>
						</div>
					</div>
					
					
						<p class="no_action_tit">주요활동분야가 없습니다.</p>
						<p class="no_action">
							주요활동분야는 <span>채택답변이 5개 이상 있는 2단계 이하 디렉토리 중<br>에서</span> 최대 4개까지 선택할 수 있습니다. 자신을 대표할 수 있는 주로<br>답변하는 디렉토리로 설정해주세요.
						</p>
					
				</div>
			
		</div>
		
		
			<div class="profile_section3">
				<div class="lv_area grd_lv4">
					
					<div class="mylv">
						<div class="gauge" id="level_guage">
							
							<strong class="my_level"><span class="level_number">3</span>초수<a href="/people/levelup/index.nhn" target="_blank" class="guide">안내</a></strong>
							<div class="grd_wrap">
								
								<div class="inner" style="width:0%;">
									<div class="grd_bar"><span class="grd_action"></span></div>
									<div class="grd_detail">
										<div class="detail_box">
											<div class="detail_info" style="display:none"><p class="tit">내공</p><p class="sum">1,977</p><span class="tip"></span></div>
										</div>
									</div>
								</div>
							</div>
							
							
							<span class="my_level_up"><span class="level_number">4</span>중수</span>
													
						</div>
					</div>
					

					<ul class="lv_cnt">
					<li><em class="tit">전체답변</em><p class="num" id="total_answer">0</p></li>
					<li><em class="tit">채택답변</em><p class="num" id="total_best">0</p></li>
					<li><em class="tit">답변채택률</em><p class="num" id="best_rate">0.0%</p></li>
					</ul>

					
						
						<p class="lv_til"><em>중수</em><span>까지 남은 채택 답변</span><strong>17</strong></p>
						
					
				</div>
				<dl class="my_spec">
				
					<dt>내공순위</dt>
					<dd><strong>11,278,352</strong>위</dd>
				
				<dt>질문</dt>
				<dd>
					<span class="q_list">전체질문 <strong>55건</strong></span>
					<span class="q_list rec_text">답변 받은 질문 <strong>46건</strong></span>
					<span class="q_list">전체마감률 <strong>67.4%</strong></span>
					<span class="q_list rec_text">답변채택률 <strong>67.4%</strong></span>
				</dd>
				<dt>받은추천</dt>
				<dd>
					<span class="q_list">좋아요 <strong>3</strong></span>
					<span class="q_list rec_none">유익해요 <strong>0</strong></span>
					<span class="q_list">재밌어요 <strong>0</strong></span>
				</dd>
				
				
				






<div class="layer_base layer_type1 layer_editor" id="editorActivityHistory" style="display:none;">
</div>

<script type="text/template" id="editorHistryTemplate">
	<h1>활동히스토리</h1>
	<div class="history" >
		<table cellspacing="0" class="boardtype2" summary="에디터 활동히스토리" width="100%"> 
		<colgroup>
		<col width="110">
		<col width="136">
		<col width="184"> 
		<col width="17">
		</colgroup>
		<thead>
		<tr> 
		<th scope="col">활동분야</th>
		<th scope="col">활동기간</th>
		<th scope="col">우수에디터</th>
		<th scope="col"><span class="blind">상세</span></th>
		</tr>
		</thead>
		<tbody>
		{for listNo:list in result.activityHistoryList}
		<tr id="list{=listNo}">
		<td class="title">{=list.dirName}</td>
		<td class="period">{=list.startDate} ~ {=list.endDate}</td>
		<td class="hst">
			<div class="hslst">
				<ul>
				{for bestNo:best in list.bestHistory}
				
				<li class="it{=bestNo}">
					
					<a class="bd bd{=best.bestMonth}" onMouseOver="$Element('list{=listNo}').addClass('on');$Element('tooltip{=listNo}{=bestNo}').show();return false;" onMouseOut="$Element('list{=listNo}').removeClass('on');$Element('tooltip{=listNo}{=bestNo}').hide();return false;">
						<span class="bd_ly" id="tooltip{=listNo}{=bestNo}">
							{if list.isOldHistory == "N"}
							<span>{=best.bestYear}년 {=best.bestMonth}월</span> 우수활동에디터
							{else}
							<span>총 {=list.bestHitoryCount}회</span> 우수 활동 에디터로 선정되셨습니다.
							{/if}
							<em></em>
						</span>
					</a>
				</li>
				{/for}
				<span class="ttl">{if list.bestHitoryCount > 0}총{=list.bestHitoryCount}회{/if}</span>
				</ul>				
			</div>
		</td>
		{if isMyPage ==  "Y"}
		<td class="hst_b">
			
			<button type="button" onclick="nhn.Kin.Userinfo.EditorHistory.openBox('{=listNo}');"><span class="blind">상세보기</span></button>
		</td>
		{else}
		<td></td>
		{/if}
		</tr>
		{if isMyPage ==  "Y"}
		{if list.isOldHistory == "N"}
		<!-- 활동 상세정보 행 type1 -->
		<tr class="hsdtl" id="editorHistory{=listNo}" style="display:none">
		<td colspan="3">
			<div class="hsdtl_wp">
				<div class="hsdtl_wp2 _history_detail">
					<dl class="hsdtl_t">
					<dt><span class="blind">히스토리 상세</span></dt>
					<dd class="drp">
						<span>답변 (채택수)</span>
						<strong>{=list.detailHistory.totalAnswer} ({=list.detailHistory.totalAnswerSelect})</strong>
					</dd>
					<dd>
					<span>신고</span>
						<strong>{=list.detailHistory.reportCount}</strong>
					</dd>
					<dd>
						<span>디렉토리 이동</span>
						<strong>{=list.detailHistory.dirmoveCount}</strong>
					</dd>
					<dd>
						<span>댓글삭제</span>
						<strong>{=list.detailHistory.delCommentDo}</strong>
					</dd>
					</dl>
				</div>
			</div>
		</td>
		</tr>
		{else}
		<!-- 활동 상세정보 행 type2-->
		<tr class="hsdtl" id="editorHistory{=listNo}" style="display:none">
		<td colspan="3">
			<div class="hsdtl_wp">
				<div class="hsdtl_wp2 _history_detail">
					<dl class="hsdtl_t hsdtl_t_v2">
					<dt><span class="blind">히스토리 상세</span></dt>
					<dd>
						<span>에디터 추천</span>
						<strong>{=list.detailHistory.recommendCount}</strong>
					</dd>
					<dd>
						<span>답변 추천</span>
						<strong>{=list.detailHistory.evaluateCount}</strong>
					</dd>
					<dd>
						<span>신고</span>
						<strong>{=list.detailHistory.reportCount}</strong>
					</dd>
					<dd>
						<span>ID신고</span>
						<strong>{=list.detailHistory.idReportCount}</strong>
					</dd>
					<dd>
						<span>이동</span>
						<strong>{=list.detailHistory.dirmoveCount}</strong>
					</dd>
					<dd>
						<span>댓글삭제</span>
						<strong>{=list.detailHistory.delCommentCount}</strong>
					</dd>
					</dl>
				</div>
			</div>
		</td>
		</tr>
		{/if} 
		{/if} 
		{/for}
		</tbody>
		</table>
		
		<p class="hs_info">상세내역은 각 활동별 총 활동 건수만 제공합니다.</p>
	</div>
	{if pageInfo.lastPage > 1}
	<div class="paginate">
		{if pageInfo.hasPre == "Y"}
		<a href="#" onclick="nhn.Kin.Userinfo.EditorHistory.getEditorHistoryAjax('{=u}','{=pageInfo.prePage}','{=isMyPage}');">이전</a>
		{/if}
		{for p in pageInfo.pageList}
			<a href="#" onclick="nhn.Kin.Userinfo.EditorHistory.getEditorHistoryAjax('{=u}','{=p}','{=isMyPage}');"{if pageInfo.page == p} class="on" title="선택됨"{/if}>{=p}</a>
		{/for}
		{if pageInfo.hasNext == "Y"}
		<a href="#" onclick="nhn.Kin.Userinfo.EditorHistory.getEditorHistoryAjax('{=u}','{=pageInfo.nextPage}','{=isMyPage}');">다음</a>
		{/if}
	</div>
	{/if}

	<div class="btn">
		<a href="#" onclick="$Element('editorActivityHistory').hide();return false;"><img src="https://ssl.pstatic.net/static/kin/09renewal/btn_confirm3.gif" width="45" height="26" alt="확인"></a>
	</div>
	<a class="close2" href="#" onclick="$Element('editorActivityHistory').hide();return false;"><img src="https://ssl.pstatic.net/static/kin/09renewal/btn_close_layer3.gif" width="19" height="19" alt="닫기"></a>
</script>
				</dl>
				
				
				
					<div class="helper_area">
					    <div class="inner">
					        <div class="icon_area">
					            <i class="sp_common ico_helper"></i>
					        </div>
					        <div class="content_area">
					            <em class="tit">도움을 준 사람 수 <a href="#" class="_helperLayerOpenBtn" onclick="nhn.Kin.Utility.nClicks('prf.helptip', '', '', event);"><img src="https://ssl.pstatic.net/static/kin/09renewal/ico_help.png" width="16" height="16" alt="도움말" /></a></em>
					            <div class="layer_base layer_balloon" style="width:160px; top:16px; left:9px; display:none;" id="helperLayer">
					                <p><em>빠라삐융님</em>의 답변으로 도움을 받은 질문자 수 입니다.</p>
									<button class="close _lookUpChildElement('img') _helperLayerCloseBtn">
										<img src="https://ssl.pstatic.net/static/kin/09renewal/btn_close_layer.gif" alt="레이어팝업 닫기" />
									</button>
					                <div class="edge_center"></div>
					            </div>
					            <div class="count">
					                <span class="num">8</span>
					            </div>
					        </div>
					    </div>
						
						
						
					</div>
				
				
				
				
				
			</div>	
			
	</div>	
</div>
<!-- {{{ -->
<script id="tplBadgeList" type="text/template">
	{if acquiredBadgeList != null}
		{for badge in acquiredBadgeList}
		<li class="_badge">
			<a href="#"><img src="https://ssl.pstatic.net/static/common/blank.gif" width="54" height="54" alt="배지설명" style="background:url({=badge.badgeImageUrl}) no-repeat 0 0;_background:none;_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{=badge.badgeImageUrl}',sizingMethod='crop')"></a>
			<div class="badge_bl {if badge.bingoId}extend{/if}">
			{if badge.bingoId}
				<div class="badge_bl_top"></div>
			{/if}
			<div class="badge_bl_inner">
				<dl>
				<dt><strong>{=badge.eventName}</strong></dt>
				<dd>{=badge.eventDesc}</dd>
				{if badge.acquireTimeMap}
					<dd class="date">배지 획득일 : <em>{=badge.acquireTimeMap.year}년 {=badge.acquireTimeMap.month}월 {=badge.acquireTimeMap.day}일</em></dd>
				{/if}
				{if badge.bingoId}
					<dd class="button"><a href="/bingo/bingoHome.nhn?bingoId={=badge.bingoId}">빙고 바로가기</a></dd>
				{/if}
				</dl>
			</div>
			{if badge.bingoId}
				<div class="badge_bl_bottom"></div>
			{/if}
			<a href="#" class="badge_bl_clse">닫기</a>
		</li>
		{/for}
	{/if}
</script>
<!-- }}} -->
<script type="text/javascript">

$Fn(function() {
	nhn.Kin.Utility.startGradeGraph($('level_guage'), 1501, 3000, 1977, false);
	nhn.Kin.Utility.startGradeGraphNumberChange($('total_answer'), 8, $('total_best'), 3, $('best_rate'), 75.0);
}, this).attach(document, 'domready');


var elNumbers = null;
var elSpotDetail = $("profile_section3");
if (elSpotDetail) {
	elNumbers = cssquery("._numberToImage", elSpotDetail);
}

if (elNumbers){
	for (var i = 0; i < elNumbers.length; i++) {
		aParam = nhn.Kin.Utility.extractParam(elNumbers[i].className);
		elNumbers[i].innerHTML = nhn.Kin.Utility.getTagNumberString(aParam[0], aParam[1]) + elNumbers[i].innerHTML;
	}
}


$Fn(function () {
	new naver.kin.FriendAndBlockMenu({
		elRoot : $('container'),
		isProfile : true
	});
}, this).attach(document, 'domready');
</script>

<script type="text/javascript" src="https://ssl.pstatic.net/static.kin/static/pc/20210209151259/js/min/naver.kin.ProfileAnimation.js"></script>
<script type="text/javascript" src="https://ssl.pstatic.net/static.kin/static/pc/20210209151259/js/min/nhn.Kin.Userinfo.EditorHistory.js"></script>
<script type="text/javascript" src="https://ssl.pstatic.net/static.kin/static/pc/20210209151259/js/min/nhn.Kin.Userinfo.MainProfileBox.js"></script>
<script type="text/javascript" src="https://ssl.pstatic.net/static.kin/static/pc/20210209151259/js/min/naver.kin.FriendAndBlockMenu.js"></script>

			<div class="container-fluid-content__left">
				








<!--// Personal_Info  -->

<div class="snb snb_bordered snb_mykin">
	<h2 class="snb_title blind">프로필</h2>
	<ul class="snb_list">
		
		
		
		<li >
			<a href="/myinfo/answerList.nhn" class="" id="subMenuOfMykin">나의 답변 <span class="num">(8)</span></a>
			
			
		</li>
		<li ><a href="/myinfo/questionList.nhn">나의 질문 <span class="num">(55)</span></a></li>
		<li ><a href="/myinfo/userFriendList.nhn">나의 친구 <span class="num">(0)</span></a></li>
		<li class="">
			<a href="/myinfo/directQuestionList.nhn">1:1질문</a>
			<ul class="sub">
				<li ><a href="/myinfo/directQuestionList.nhn">받은 질문 <span class="num">(0)</span></a></li>
				<li ><a href="/myinfo/directQuestionSendList.nhn">보낸 질문 <span class="num">(6)</span></a></li>
			</ul>
		</li>
		<li ><a href="/myinfo/interest.nhn">나의 관심질문</a></li>
		<li ><a href="/myinfo/deletedArticleList.nhn">나의 삭제 지식 <span class="num">(0)</span></a></li>
		<li class="">
			<a href="/myinfo/namecardProfileForm.nhn">관리</a>
			<ul class="sub">
				<li ><a href="/myinfo/namecardProfileForm.nhn">기본정보</a></li>
				<li ><a href="/myinfo/tempsaveList.nhn">임시저장 <span class="num">(7)</span></a></li>
				<li ><a href="/myinfo/pointHistory.nhn" onclick="nhn.Kin.Utility.nClicks('edt*point', '', '', event);">내공</a></li>
			</ul>
		</li>
	</ul>
</div>
			</div>

			<div id="content" class="container-fluid-content__right">
				<div id="myinfoIndex_1" class="my_home">
					






<div class="interest_area">
	<div class="interest_section _interest_section">
		<h4><img src="https://ssl.pstatic.net/static/kin/09renewal/h_interest_area.gif" width="42" height="11" alt="관심분야"> <span>4개</span>
		<a href="#" class="btn_manage _ros" id="contentsOfMykin" onclick="nhn.Kin.Utility.nClicks('myh.dir', '', '', event);" target="_blank"><img src="https://ssl.pstatic.net/static/kin/09renewal/btn_manage.gif" width="28" height="16" alt="관리"></a>
		</h4>
		<ul class="tag_cloud">
		
		
			
			<li><a href="/qna/list.nhn?dirId=110812" target="_blank" class="_title">번역, 통역</a>
				<span class="bar">|</span>
				<span class="layer_base layer_prorank _layer_expert"  style="top:15px; display:none;">전문가 순위
				<em> 2,081위</em></span>
			</li>
			
			<li><a href="/qna/list.nhn?dirId=11080303" target="_blank" >영어작문</a>
				<span class="bar">|</span>
				<span class="layer_base layer_prorank _layer_expert"  style="top:15px; display:none;">전문가 순위
				<em> 0위</em></span>
			</li>
			
			<li><a href="/qna/list.nhn?dirId=11080304" target="_blank" >영어 독해, 읽기</a>
				<span class="bar">|</span>
				<span class="layer_base layer_prorank _layer_expert"  style="top:15px; display:none;">전문가 순위
				<em> 0위</em></span>
			</li>
			
			<li><a href="/qna/list.nhn?dirId=11080305" target="_blank" >생활영어, 회화</a>
				
				<span class="layer_base layer_prorank _layer_expert"  style="top:15px; display:none;">전문가 순위
				<em> 0위</em></span>
			</li>
			
		
		</ul>
		
	</div>

	<div class="interest_section interest_keyword _interest_keyword">
		<h4><img src="https://ssl.pstatic.net/static/kin/09renewal/h_interest_keyword.gif" width="51" height="11" alt="관심키워드"> <span>1개</span>
		<a href="#" class="btn_manage _ros _btn_interestKeyword" isReload="true" onclick="nhn.Kin.Utility.nClicks('myh.key', '', '', event);"><img src="https://ssl.pstatic.net/static/kin/09renewal/btn_manage.gif" width="28" height="16" alt="관리"></a>
		</h4>
		<ul class="tag_cloud">
		
		
		
			
			<li><a href="/search/noAnswerList.nhn?query=%EC%BD%94%EB%94%A9" target="_myKeywordWindow">코딩</a>
				
			</li>
			
		
		</ul>
	</div>
</div>

<!-- 관심키워드 추가 레이어 -->




<div class="layer_base layer_type1 _keywordLayer" style="width:277px; display:none;">
	<h1><label for="interestKeywordInput_mykin">관심키워드 설정</label></h1>
	<div class="find_keyword">
		<input type="text" id="interestKeywordInput_mykin" class="input_txt _keywordInput" style="width:220px" maxLength="20">
		<a href="#" class="_lookUpChildElement('img') _keywordAddBtn"><img class="_keywordAddBtn" src="https://ssl.pstatic.net/static/kin/09renewal/btn_add.gif" width="46" height="23" alt="추가"></a>
	</div>
	<p class="_defaultMsg desc">관심 키워드는 20개까지 등록할 수 있습니다.</p>
	<p class="_overMsg desc" style="display:none"><em><strong>최대 키워드 개수(20개)를 초과하였습니다.</strong></em><br/>기존에 등록한 관심키워드를 삭제하시면, 다시<br/>다른 키워드를 추가하실 수 있습니다.</p>
	<p class="_errorMsg desc" style="display:none;"></p>

	<ul class="keyword _keywordList"></ul>
	
	<div class="btn">
		<a href="#" class="_lookUpChildElement('img') _closeLayer"><img class="_closeLayer" src="https://ssl.pstatic.net/static/kin/09renewal/btn_close5.gif" width="48" height="28" alt="닫기"></a>
	</div>
	<a href="#" class="close2 _lookUpChildElement('img') _closeLayer _keywordLayerLastButton"><img class="_closeLayer" src="https://ssl.pstatic.net/static/kin/09renewal/btn_close_layer3.gif" width="19" height="19" alt="닫기"></a>
</div>
<script id="errorMsgTpl" type="text/template" >
<em><strong>{=errorMsg}</strong></em>							
</script>
<!-- //관심키워드 추가 레이어 -->

					






<script type="text/javascript" src="https://ssl.pstatic.net/static.kin/static/pc/20210209151259/js/min/nhn.Kin.Myinfo.MyKinActivity.js"></script>
<script type="text/javascript">
    $Fn(function() {
        nhn.Kin.Myinfo.MyKinActivity.initialize();
    }).attach(window, 'load');
</script>
					






<!-- 답변 -->

    
    <div class="my_info_area">
        
        <h4 class="h_my_title type_default ">
            
                <img src="https://ssl.pstatic.net/static/kin/09renewal/h_my_answer.gif" width="54" height="13" alt="나의 답변">
                <span class="eng">(8)</span>
            
            
        </h4>
        <table cellspacing="0" class="boardtype2 th_border my_table" width="100%">
            <caption><span class="blind">나의 답변 목록으로 제목, 디렉토리, 채택, 표정, 작성</span></caption>
            <colgroup>
                <col>
                <col width="105">
                <col width="54">
                <col width="54">
                <col width="90">
            </colgroup>
            <thead>
            <tr>
                <th scope="col" class="title">제목</th>
                <th scope="col">디렉토리</th>
                <th scope="col">채택</th>
                <th scope="col">표정</th>
                <th scope="col" class="title">작성</th>
            </tr>
            <tr>
                <td colspan="5" class="blank2">&nbsp;
                </th>
            </tr>
            </thead>
            <tbody>
            
                
                    <tr>
                        <td class="qna">
                            <dl class="dlist_qna">
                                <dt>
                                    <span class="ico_q"><img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="18" height="14" alt="질문"></span>
                                    <a href="/qna/mydetail.nhn?dirId=11080304&docId=186395129&answerNo=2" onclick="nhn.Kin.Utility.nClicks('myh.', '11080304_186395129', '1', event);">영어 질문 급합니다!!!!</a>
                                    
                                </dt>
                                <dd>
                                    <span class="ico_a"><img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="18" height="14" alt="답변"></span>궁금한 부분 설명 해주는것맞으니까 꼭 채택해주세여ㅠㅠㅠ
 
more than usual 저거 맞아용
 
잇 롸이스 동사다음에목적어왔는데 뭐가 잘...
                                </dd>
                            </dl>
                        </td>
                        <td class="field"><a href="/qna/list.nhn?dirId=11080304">영어 독해, 읽기</a></td>
                        <td class="field">
                            
                            
                                <em>마감</em>
                            
                            
                        </td>
                        <td class="t_num"><span class="recomm">0</span></td>
                        <td class="t_num tc">2013.12.12.</td>
                    </tr>
                
                
            
                
                    <tr>
                        <td class="qna">
                            <dl class="dlist_qna">
                                <dt>
                                    <span class="ico_q"><img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="18" height="14" alt="질문"></span>
                                    <a href="/qna/mydetail.nhn?dirId=8050103&docId=184991365&answerNo=3" onclick="nhn.Kin.Utility.nClicks('myh.', '8050103_184991365', '2', event);">강아지사료 불려줘도 되나요??(급해요ㅠㅠ)</a>
                                    
                                </dt>
                                <dd>
                                    <span class="ico_a"><img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="18" height="14" alt="답변"></span>네~되요~
강아지파는데에서 애기강아지들 사료줄때도 뿔려서 주고 그래요ㅜ 강아지어떻게요ㅜ인터넷에 쳐서 강아지간식같은거 좀 만들어...
                                </dd>
                            </dl>
                        </td>
                        <td class="field"><a href="/qna/list.nhn?dirId=8050103">사료, 먹이</a></td>
                        <td class="field">
                            
                            
                                <em>마감</em>
                            
                            
                        </td>
                        <td class="t_num"><span class="recomm">0</span></td>
                        <td class="t_num tc">2013.11.21.</td>
                    </tr>
                
                
            
                
                    <tr>
                        <td class="qna">
                            <dl class="dlist_qna">
                                <dt>
                                    <span class="ico_q"><img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="18" height="14" alt="질문"></span>
                                    <a href="/qna/mydetail.nhn?dirId=110812&docId=184773649&answerNo=1" onclick="nhn.Kin.Utility.nClicks('myh.', '110812_184773649', '3', event);">영어번역 급합니다!! 1시간안에 꼭좀 부탁드립니다!(...</a>
                                    
                                </dt>
                                <dd>
                                    <span class="ico_a"><img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="18" height="14" alt="답변"></span>Hello i currently attend Tourism food and beverage department and I’m ready for working hard at all the works than any othe...
                                </dd>
                            </dl>
                        </td>
                        <td class="field"><a href="/qna/list.nhn?dirId=110812">번역, 통역</a></td>
                        <td class="field">
                            
                                <img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif"
                                    
                                     width="16"
                                     height="20" class="medal_1"   title="질문자 채택" alt="질문자 채택">
                            
                            
                            
                        </td>
                        <td class="t_num"><span class="recomm">0</span></td>
                        <td class="t_num tc">2013.11.18.</td>
                    </tr>
                
                
            
                
                    <tr>
                        <td class="qna">
                            <dl class="dlist_qna">
                                <dt>
                                    <span class="ico_q"><img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="18" height="14" alt="질문"></span>
                                    <a href="/qna/mydetail.nhn?dirId=8030301&docId=184774097&answerNo=1" onclick="nhn.Kin.Utility.nClicks('myh.', '8030301_184774097', '4', event);">제가 미스트를 하나샀는데 미스트 손에 뿌려도 괜찮은...</a>
                                    
                                </dt>
                                <dd>
                                    <span class="ico_a"><img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif" width="18" height="14" alt="답변"></span>&#160;그럼요 아무대ㄴ ㅏ다뿌려도돼욯ㅎㅎㅎㅎ채택해주세요ㅜㅜㅜ기부할거에요ㅜ
                                </dd>
                            </dl>
                        </td>
                        <td class="field"><a href="/qna/list.nhn?dirId=8030301">기초화장</a></td>
                        <td class="field">
                            
                                <img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif"
                                    
                                     width="16"
                                     height="20" class="medal_1"   title="질문자 채택" alt="질문자 채택">
                            
                            
                            
                        </td>
                        <td class="t_num"><span class="recomm">1</span></td>
                        <td class="t_num tc">2013.11.18.</td>
                    </tr>
            
            </tbody>
        </table>
        
            <span class="more"><a href="/myinfo/answerList.nhn" onclick="nhn.Kin.Utility.nClicks('myh.amore', '', '', event);">더보기</a></span>
        
        
    </div>



					






<!-- 질문 -->


    
    <div class="my_info_area">
        <h4 class="h_my_title type_default">
            <img src="https://ssl.pstatic.net/static/kin/09renewal/h_my_question.gif" width="55" height="13" alt="나의 질문">
            <span class="eng">(55)</span>
            
                <span class="highlight">답변채택을 기다리는 질문이 <strong>15</strong>개 있습니다.</span>
                <a class="go_check" href="/myinfo/questionList.nhn?isWorry=false&dirId=0&order=noBestFlag" onclick="nhn.Kin.Utility.nClicks('myh.qpick', '', '', event);">채택하러 가기</a>
            
        </h4>
        <table cellspacing="0" class="boardtype2 th_border my_table" width="100%">
            <caption><span class="blind">나의 질문 목록으로 제목, 디렉토리, 채택, 답변, 표정, 작성</span></caption>
            <colgroup>
                <col>
                <col width="105">
                <col width="54">
                <col width="54">
                <col width="54">
                <col width="90">
            </colgroup>
            <thead>
            <tr>
                <th scope="col" class="title">제목</th>
                <th scope="col">디렉토리</th>
                <th scope="col">채택</th>
                <th scope="col">답변</th>
                <th scope="col">표정</th>
                <th scope="col" class="title">작성</th>
            </tr>
            <tr>
                <td colspan="6" class="blank">&nbsp;</td>
            </tr>
            </thead>
            <tbody id="au_board_list_1">
            
                <tr>
                    <td class="title">
                        
                        
                        <a href="/qna/detail.nhn?d1id=8&dirId=80511&docId=372170331" rel="KIN" onclick="nhn.Kin.Utility.nClicks('myh.qlist', '80511_372170331', '1', event);">강아지 사마귀</a>
                        
                        
                        
                        
                    </td>
                    <td class="field"><a href="/qna/list.nhn?dirId=80511">동물의료상담</a></td>
                    <td class="field">
                        
                        
                    </td>
                    <td class="t_num">0</td>
                    <td class="t_num"><span class="recomm">0</span></td>
                    <td class="t_num tc">2020.11.01.</td>
                </tr>
            
                <tr>
                    <td class="title">
                        
                        
                        <a href="/qna/detail.nhn?d1id=4&dirId=409&docId=338937858" rel="KIN" onclick="nhn.Kin.Utility.nClicks('myh.qlist', '409_338937858', '2', event);">그러니깐요,, 순수출값은 해외에 수출을 하고 이득을 보는건데...</a>
                        
                        
                        
                        
                    </td>
                    <td class="field"><a href="/qna/list.nhn?dirId=409">경제 동향, 이론</a></td>
                    <td class="field">
                        
                        
                            <img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif"
                            
                             width="16"
                                 height="20" class="medal_1"   title="질문자 채택" alt="질문자 채택">
                        
                    </td>
                    <td class="t_num">1</td>
                    <td class="t_num"><span class="recomm">0</span></td>
                    <td class="t_num tc">2019.10.25.</td>
                </tr>
            
                <tr>
                    <td class="title">
                        
                        
                        <a href="/qna/detail.nhn?d1id=4&dirId=409&docId=338921874" rel="KIN" onclick="nhn.Kin.Utility.nClicks('myh.qlist', '409_338921874', '3', event);">근데 그게 왜 지출이에요..? 그냥 빠져나가니까 그렇게 계산하...</a>
                        
                        
                        
                        
                    </td>
                    <td class="field"><a href="/qna/list.nhn?dirId=409">경제 동향, 이론</a></td>
                    <td class="field">
                        
                        
                            <img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif"
                            
                             width="16"
                                 height="20" class="medal_1"   title="질문자 채택" alt="질문자 채택">
                        
                    </td>
                    <td class="t_num">1</td>
                    <td class="t_num"><span class="recomm">0</span></td>
                    <td class="t_num tc">2019.10.24.</td>
                </tr>
            
                <tr>
                    <td class="title">
                        
                        
                        <a href="/qna/detail.nhn?d1id=4&dirId=409&docId=338911206" rel="KIN" onclick="nhn.Kin.Utility.nClicks('myh.qlist', '409_338911206', '4', event);">gdp에 계산 수식에 순수출이 포함되는 이유</a>
                        
                        
                        
                        
                    </td>
                    <td class="field"><a href="/qna/list.nhn?dirId=409">경제 동향, 이론</a></td>
                    <td class="field">
                        
                        
                            <img src="https://ssl.pstatic.net/static/kin/09renewal/blank.gif"
                            
                             width="16"
                                 height="20" class="medal_1"   title="질문자 채택" alt="질문자 채택">
                        
                    </td>
                    <td class="t_num">1</td>
                    <td class="t_num"><span class="recomm">0</span></td>
                    <td class="t_num tc">2019.10.24.</td>
                </tr>
            
                <tr>
                    <td class="title">
                        
                        
                        <a href="/qna/detail.nhn?d1id=10&dirId=100109&docId=337313529" rel="KIN" onclick="nhn.Kin.Utility.nClicks('myh.qlist', '100109_337313529', '5', event);">Colonial or Imperial Conflict</a>
                        
                        
                        
                        
                    </td>
                    <td class="field"><a href="/qna/list.nhn?dirId=100109">구기스포츠기타</a></td>
                    <td class="field">
                        
                        
                    </td>
                    <td class="t_num">0</td>
                    <td class="t_num"><span class="recomm">0</span></td>
                    <td class="t_num tc">2019.10.05.</td>
                </tr>
            
            </tbody>
        </table>
        <span class="more"><a href="/myinfo/questionList.nhn" onclick="nhn.Kin.Utility.nClicks('myh.qmore', '', '', event);">더보기</a></span>
    </div>
    
	<!-- footer  -->
	</section>
	<jsp:include page="../common/footer.jsp" />

	<script type="text/javascript">
		lcs_do();
	</script>
	
	

</div> 

</body>
</html>



	










