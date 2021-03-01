<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    <%-- 응답온 페이지값 추출함 --%>
<c:set var="currentPage" value="${ requestScope.page }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	   <jsp:include page="../common/header.jsp"/>
	   <br><br>
	<meta name="referrer" contents="always">
	<meta name="viewport" content="width=1024">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	
	<meta name="msapplication-config" content="none" />


	<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?v=2.2">



<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.kin/static/kin-web-pc/20210209173414/css/min/common.css" />
<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.kin/static/kin-web-pc/20210209173414/css/min/components.css" />


		<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.kin/static/kin-web-pc/20210209173414/css/min/end.css"/>
	
		<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.kin/static/kin-web-pc/20210209173414/css/min/broadcast.css"/>
	
		<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.kin/static/kin-web-pc/20210209173414/css/min/answer_write.css"/>
	
		<link rel="stylesheet" type="text/css" href="https://ssl.pstatic.net/static.kin/static/kin-web-pc/20210209173414/css/min/powerlink.css"/>
	
<link rel="stylesheet"
      href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.5.0/styles/railscasts.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.5.0/highlight.min.js"></script>
<script>hljs.initHighlightingOnLoad();</script>

<script>
	var pcDomain = "kin.naver.com";
	var pcDomainWithProtocol = "https://kin.naver.com";
	var pcKinServiceProtocol = "https";

	var mobileDomain = "m.kin.naver.com";
	var mobileDomainWithProtocol = "https://m.kin.naver.com";
	var mobileKinServiceProtocol = "https";

	var uploadDomain = "upload.kin.naver.com";
	var uploadDomainWithProtocol = "https://upload.kin.naver.com";
	var uploadKinServiceProtocol = "https";
</script>


	
		<script type="text/javascript" src="https://ssl.pstatic.net/static.kin/static/kin-web-pc/20210209173414/js/min/naver.kin.pc.base.js"></script>
	
	
	

		<link type="text/css" rel="stylesheet" href="//editor-static.pstatic.net/v/kinreply/css/se.viewer.desktop.css?v=1.1.5-20201110152136">

	<script src="https://ssl.pstatic.net/tveta/libs/ssp/ssp.web.sdk.js"></script>
	
	
<script type="text/javascript">
$(function(){
   hideReplyForm();   //뷰 페이지 처음 실행시에는 댓글달기 폼이 안보이게 함
   
   //해당 게시글의 번호를 전송함
   var qa_id = ${ qa.qa_id }; //el 의 값을 변수에 대입
   var loginUser = "${ sessionScope.loginUser.id }";
   $.ajax({
        url : "${ pageContext.request.contextPath }/qarlist.do", /* 절대경로 */
        type : "post",
        data : { ref_qa_id: qa_id },   //전송값에 변수 사용
        dataType : "json",
        success : function(data) {
           console.log("success : " + data);

         //object ==> string
           var jsonStr = JSON.stringify(data);
           //string ==> json 
           var json = JSON.parse(jsonStr);

           var values = "";
           for (var i in json.list) {
              if(loginUser == json.list[i].qar_writer){
	                 values += "<tr><td>" + json.list[i].qar_writer + "</td><td>" + json.list[i].qar_create_date 
		         + "</td></tr><tr><td colspan='2'>"
                 + "<form action='qarupdate.do' method='post'>"
                 + "<input type='hidden' name='qar_id' value='" +  json.list[i].qar_id  + "'>"
                 + "<input type='hidden' name='qa_id' value='${qa.qa_id}'>"
                 + "<textarea cols='100' rows='4' name='qar_content'>"
                 + decodeURIComponent(json.list[i].qar_content).replace(/\+/gi, " ")
                 + "</textarea><input type='submit' value='수정'></form>"
                 + "<button onclick='replyDelete(" + json.list[i].qar_id + ");'>삭제</button></td></tr>"
                 + "<c:url var='qalist1' value='/qalist.do'>"
	             + "<c:param name='page' value='1'/>"
	             + "</c:url>"
	             + "<td><a href='${ qalist1 }'>[list]</a></td><br>"
           }else{
                 values += "<tr><td>" + json.list[i].qar_writer
                 + "</td><td>" + json.list[i].qar_create_date 
                 + "</td></tr><tr><td colspan='2'>" 
                 + decodeURIComponent(json.list[i].qar_content).replace(/\+/gi, " ") 
                 +"</td></tr><br>"; 
                 }
           } //for in

           $("#qarlistTbl").html($("#qarlistTbl").html() + values);
        },
        error : function(jqXHR, textstatus, errorthrown) {
           console.log("error : " + jqXHR + ", " + textstatus + ", "
                 + errorthrown);
        }
     });
});
   
   //jquery ajax 로 헤당 게시글에 대한 댓글 조회 요청 
 //jquery document ready
 

 
function replyDelete(qar_id){
   location.href = "${ pageContext.request.contextPath }/qardel.do?qar_id="  + qar_id + "&qa_id=${ qa.qa_id}";
}

function showReplyForm(){
   $("#replyDiv").css("display","block");
}

function hideReplyForm(){
   $("#replyDiv").css("display","none");
}
</script>

</head>


      
	<body class="__se-scroll-target">

		<div id="loadingIndicator" style="display:none;width:100%;height:100%;position:fixed;top:0px;left:0px;background-color:transparent;z-index:10000;">
			<img src="https://ssl.pstatic.net/static/kin/m/ico_lod2.gif" width="21" height="21" alt="데이터 요청 응답 대기중" style="position:absolute;top:49%;left:49%;">
		</div>
		<div id="wrap" class="wrap wrap_end"> 


<script type="text/javascript">
	
	
	var userAgent = navigator.userAgent;
	var isIe = (userAgent.indexOf("MSIE") > -1) || (userAgent.indexOf("Trident") > -1);

	if (isIe) {
		var version = -1;

		var versionIndex;
		var versionTokenIndex;
		
		var versionRegexResult = (new RegExp("(MSIE|rv)", "i")).exec(userAgent);

		versionTokenIndex = versionRegexResult.index;
		versionToken = versionRegexResult[0];
		if (versionTokenIndex > -1) {
			versionIndex = versionTokenIndex + versionToken.length + 1;
			version = userAgent.substring(versionIndex)
					.split(" ")[0]
					.replace(/_/g, ".")
					.replace(/\;|\)/g, "");
		}

		version = parseInt(version, 10);

		if (version > 6 && version < 9) {
			document.getElementById("ieUpdateBannerArea").style.display = "block";
		}
	}
</script>
	

					
					<div class="gnb_common_area">
						<div id="gnb">
							<script type="text/javascript">
								
								var gnb_service = "kin";
								
								var gnb_logout = encodeURIComponent("https://nid.naver.com/nidlogin.logout");
								
								var gnb_login = encodeURIComponent(location.href || 'https://kin.naver.com');
								
								var gnb_template = "gnb_utf8";
								
								var gnb_item_hide_option = 0;
								
								
								
								
							</script>
							<script type="text/javascript" charset="utf-8" src="https://ssl.pstatic.net/static.gn/templates/gnb_utf8.nhn?2021022414"></script>
						</div>
					</div>
					
				</div>

	


<script type="text/javascript">
	
	$(window).on("load", (function () {
		var oLNB = new naver.kin.pc.LNB({questionType: "NORMAL"});
		var oGNB = new naver.kin.pc.GNB({});
	}));

	var GNB_BRIGHTNESS_VALUE = {
		DARK_ICON: 0,
		DARK_ICON_AND_TRANSPARENCY: 1,
		BRIGHT_ICON_AND_TRANSPARENCY: 2,
		BRIGHT_ICON: 3
	};

	var GNB_ITEM_HIDE_OPTION_BIT_VALUE = {
		DEFAULT: 0,
		HIDE_LOGIN_BTN: 1,
		HIDE_USER_LAYER: 2,
		HIDE_NAVER_ME_AREA: 4,
		HIDE_MAIL_ALARM_AREA: 8,
		HIDE_PROFILE_IMAGE: 16,
		SHOW_BENEFIT_FOR_STAFF_MEMBER: 32
	};

	
	var smartSearch = "";
	
	var gnb_service = "kin";
	
	var gnb_logout = encodeURIComponent("https://nid.naver.com/nidlogin.logout");
	
	var gnb_login = encodeURIComponent(location.href || 'https://kin.naver.com');
	
	var gnb_template = "gnb_utf8";
	
	var gnb_item_hide_option = GNB_ITEM_HIDE_OPTION_BIT_VALUE.DEFAULT;
	
	
	
	

	$(window).on("load", (function () {
		
		getGNB();

		var bIsGnbClicked = false;

		
		$(document.body).on("click", function (we) {
			if (!bIsGnbClicked) {
				gnbAllLayerClose();
			}

			bIsGnbClicked = false;
		}.bind(this));

		$("#gnb").on("click", function (we) {
			bIsGnbClicked = true;
		}.bind(this));

		
		var expertEntryBanner = $("div.gnb_eXpertLogo div.banner");
		if (!!expertEntryBanner && expertEntryBanner.length > 0) {
			$("div.gnb_eXpertLogo div.banner button.buttonCancel").on("click", function () {
				expertEntryBanner.hide();

				var newDisabledUntil = new Date().getTime() + (3 * 1000 * 24 * 60 * 60);
				cookie.create("kin_expert_entry_banner_disabled_until", newDisabledUntil, 5);
			});

			var disabledUntilTimestamp = new Number(cookie.read("kin_expert_entry_banner_disabled_until"));
			if (!isNaN(disabledUntilTimestamp)) {
				if (new Date().getTime() > disabledUntilTimestamp) {
					cookie.erase("kin_expert_entry_banner_disabled_until");
					expertEntryBanner.show();
				}
			} else {
				expertEntryBanner.show();
			}
		}
		
	}).bind(this));

	function checkQuery ()
	{
		var aform = document.topSearch;

		try {
			aform.submit();
		} catch(e) {}

		return false;
	}

	$(window).on("load", function () {
		$.cachedScript("https://ssl.pstatic.net/static.kin/static/kin-web-pc/20210209173414/js/min/naver.kin.pc.ChatMenu.js").done(function () {
			if (typeof naver.kin.pc.ChatMenu !== "undefined") {
				window.oChatMenu = new naver.kin.pc.ChatMenu();
			}
		});
	});
</script>


		<script type="text/javascript" src="https://ssl.pstatic.net/static.kin/static/kin-web-pc/20210209173414/js/min/naver.kin.pc.detail.js"></script>
	
	





<div id="answerArea" class="answer-content">
	<div class="answer-content__inner">
		


				<div class="answer-content__list _answerList">
					
		<div id="answer_1" class="answer-content__item _contentWrap _answer">

<div class="c-heading-answer">
	
	<div class="c-heading-answer__profile">
		<div class="profile-default">
			<span class="profile-default--inner">
				<span class="profile-default__thumbnail" style="background-image: url('https://ssl.pstatic.net/static/kin/09renewal/avatar/200x200_m_gray/public.png');"><span class="blind">비공개 답변 프로필 이미지</span></span>
			</span>
		</div>
	</div>

	
	<div class="c-heading-answer__body">
		<div class="c-heading-answer__title">
			<p class="title">${ qa.qa_title }</p>
			
			<div class="c-userinfo">
	<div class="c-userinfo__left">
			<div class="c-userinfo__profile _profileArea">
			<div class="profile-default">			
							<div class="profile-default--inner">
							</div>	
						</div>
						<span class="c-userinfo__author"><span class="blind">작성자</span>${ qa.qa_writer }</span>
			</div>
			<span class="c-userinfo__info"><span class="blind">작성일</span>${ qa.qa_create_date }</span>
			<span class="c-userinfo__count"><img src="/hhw/resources/images/eye.jfif" style="width:20px;">${ qa.qa_readcount }<br>
			<img src="/hhw/resources/images/point.png" style="width:20px;"><font color="red">${ qa.qa_point }</font>

<c:if test="${ empty qa.qa_origin_file_name }">
<img src="/hhw/resources/images/nofile.png" style="width:20px;">
</c:if>
<c:if test="${ !empty qa.qa_origin_file_name }">
<c:url var="qafd" value="/qafdown.do">
   <c:param name="ofile" value="${ qa.qa_origin_file_name }"/>
   <c:param name="rfile" value="${ qa.qa_rename_file_name }"/>
</c:url>
<img src="/hhw/resources/images/yesfile.png" style="width:12px;">
<a href="${ qafd }">${ qa.qa_origin_file_name }</a>
</c:if>
			
			
			
			</span>
	</div>
			</div>
		</div>
		<div class="adopt-check-box">
	
		</div>
	

	</div>
</div>

<div class="_endContents _hashtagHighlightingContents c-heading-answer__content" data-tag="%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4">

		               
		 <div class="se-component se-text se-l-default" id="SE-0442ede1-bac0-4a49-b43c-e8a06ddc8a22">                  
		   <div class="se-component-content">                        
		   <div class="se-section se-section-text se-l-default">                            
		   <div class="se-module se-module-text">                                    <!-- SE-TEXT { -->
		   </div>                        
		   </div>                    
		   </div>                
		   </div>                
		   
		   <div class="se-component se-image se-l-default" id="SE-a48780b4-c628-455a-ba57-e71252dfb83a">                  
		   <div class="se-component-content se-component-content-fit">                        
		   <div class="se-section se-section-image se-l-default se-section-align-" >                               
		    <div class="se-module se-module-image" style="">                                    
		    <a href="#" class="se-module-image-link __se_image_link __se_link" style="" onclick="return false;" data-linktype="img" data-linkdata='{"id" : "SE-a48780b4-c628-455a-ba57-e71252dfb83a", "src" : "https://kin-phinf.pstatic.net/20210207_77/16126801519567gfaG_JPEG/20210207_154226.jpg", "linkUse" : "false", "link" : ""}'>                                        
		    <img src="/hhw/resources/qa_files/${ qa.qa_rename_file_name }" style="width:500px;">               
		     </a>                               
		     <br><br><br><br><br><br>
		     
		      </div>    
		       <pre  id="bo_v_con"><code>${ qa.qa_content }</code></pre>     
		      </div>      


	
	



		      
<div align="right">
<br><br><%-- 로그인한 상태일때 댓글 달기 사용하게 함 --%>
<c:if test="${ !empty loginUser }">
   <button onclick="showReplyForm();">댓글 달기</button>
   &nbsp; &nbsp;
</c:if>
<%-- 로그인한 상태 , 본인 글일때만 보여지게 함 --%>
<c:if test="${ !empty loginUser and loginUser.id eq qa.qa_writer }">
   <c:url var="qauv" value="/qaupview.do">
      <c:param name="qaid" value="${ qa.qa_id }"/>
      <c:param name="page" value="${ currentPage }"/>
   </c:url>
   <a href="${ qauv }">[수정페이지로 이동]</a>&nbsp; &nbsp;
   <c:url var="qadl" value="/qadelete.do">
      <c:param name="qadelete" value="${ qa.qa_id }"/>   
   </c:url>
   <a href="${ qadl }">[글삭제]</a> &nbsp; &nbsp;
</c:if>
<c:url var="qalist" value="/qalist.do">
      <c:param name="page" value="${ currentPage }"/>
</c:url>
<a href="${ qalist }">[목록]</a>
</div>

<br><br>
<%-- 댓글 달기 폼영역 --%>
<div id="replyDiv">
<hr><br><br>
<form action="qarinsert.do" method="post">
<input type="hidden" name="ref_qa_id" value="${ qa.qa_id }">
<table align="center" width="680" border="1" cellpading="5" >
<tr><th>작성자</th>
<td><input type="text" name="qar_writer" readonly value="${ sessionScope.loginUser.id }"></td></tr>
<tr><th>내용</th><td><textarea name="qar_content" rows="5" cols="50"></textarea></td></tr>
<tr><th colspan="2">
<input type="submit" value="댓글 등록"> &nbsp;
<input type="reset" value="댓글 취소" onclick="hideReplyForm(); return false;"></th></tr>
</table>
</form>
</div>

<br><br>
<%-- 댓글목록 표시 영역 --%>
<div id="qarlistView" style="border: 1px dotted gray;">
<br><br>
<table id="qarlistTbl" ></table>
</div> 
<br><br>
		       </div>
		       </div> 
		       </div>
		       </div>
		       </div>        




</div>

<!-- 질문  -->


	
		<div class="c-userinfo-answer _answerBottom">
			<div class="c-userinfo-answer__left">	
			</div>
					</div>
					
					<div class="c-heading__icon">
			
			

<br><br>

				<div class="c-heading__title">
					<div class="c-heading__title-inner">					
							<p class="c-heading__title-summary"></p>					
						<div class="title">
						</div>
					</div>
				</div>			
			</div>

			




			
		</div>
		<div class="c-opinion _commentListArea" data-answer-no="1" data-thanks-message="" style="display:none;"></div>
<div class="_loadAdditionalQnaList" data-parent-answer-no="1" data-is-answerer="N" data-answerer="" data-disable-form-yn="N"></div>
</body>



</html>
