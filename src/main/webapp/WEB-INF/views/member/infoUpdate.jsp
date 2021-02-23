<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="Author" content="kimwoolina">
<title>내정보관리하기</title>
<link rel="styleSheet" href="/hhw/resources/css/normalize.css">
<link rel="styleSheet" href="/hhw/resources/css/common.css">
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<section style="padding: 100px 0 60px 0;">
		<div id="wrap" class="">
			<div id="pos_scroll"></div>


			<div class="page_aticle aticle_type2">
				<div id="snb" class="snb_my">

					<div class="inner_snb">
						<ul class="list_menu">
							<li></li>

							<li></li>

						</ul>
					</div>

				</div>
				<div class="page_section section_myinfo">
					<div class="head_aticle">
						<h2 align="center">${ loginUser.name }님의정보보기</h2>
					</div>


					<div class="type_form member_join member_mod">
						<form id="form" name="frmMember" method="post"
							action="https://www.kurly.com/shop/member/indb.php"
							onsubmit="return chkForm2(this)" novalidate="" enctype="multipart/form-data">
							<input type="hidden" name="mode" value="modMember"> <input
								type="hidden" name="check_mobile" value="1"> <input
								type="hidden" name="auth_finish_code" value=""> <input
								type="hidden" name="rncheck" value=""> <input
								type="hidden" name="dupeinfo" value=""> <input
								type="hidden" name="pakey" value=""> <input
								type="hidden" name="foreigner" value="1"> <input
								type="hidden" name="passwordSkin" value="Y"> <input
								type="hidden" name="m_id" value="dlsdk54">
							<table class="tbl_comm">
								<tbody>
									<tr class="fst">
										<th>*아이디<span class="ico">*<span
												class="screen_out">필수항목</span></span></th>
										<td><input type="text" value="${ loginUser.name }" readonly=""
											class="inp_read"></td>
									</tr>
									<tr>
									<tr class="member_pwd">
										<th>*새 비밀번호</th>
										<td><input type="password" name="newPassword"
											id="newPassword" label="새 비밀번호" option="regPass"
											maxlength="16" class="reg_pw"> <input type="hidden"
											name="newPasswordCheck" value="0">
											<p class="txt_guide square">
												<span class="txt txt_case4">현재 비밀번호와 다르게 입력</span> <span
													class="txt txt_case1">10자 이상 입력</span> <span
													class="txt txt_case2">영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상
													조합</span> <span class="txt txt_case3">동일한 숫자 3개 이상 연속 사용 불가</span>
											</p></td>
									</tr>
									<tr class="member_pwd">
										<th>*새 비밀번호 확인</th>
										<td><input type="password" name="confirmPassword"
											id="confirmPassword" label="새 비밀번호" option="regPass"
											maxlength="16" class="confirm_pw">
											<p class="txt_guide square">
												<span class="txt txt_case1">동일한 비밀번호를 입력해주세요.</span>
											</p></td>
									</tr>
									<tr>
										<th>* 별명</th>
										<td><input type="text" name="nickname"
											value="${ loginUser.nickname }" readonly></input></td>
									</tr>
									<tr>
										<th>*이름<span class="ico">*<span class="screen_out">필수항목</span></span></th>
										<td><input type="text" name="name" value="은영" required=""
											fld_esssential="" label="이름" placeholder="이름을 입력해주세요">
										</td>
									</tr>
									<tr>
										<th>이메일<span class="ico">*<span class="screen_out">필수항목</span></span></th>
										<td><input type="text" name="email"
											value="dmsdud2054@naver.com"
											data-email="dmsdud2054@naver.com" size="30" required=""
											option="regEmail" label="이메일"
											placeholder="예: marketkurly@kurly.com"
											onblur="chkEmailChange($(this))"> <input
											type="hidden" name="chk_email" required="" label="이메일중복체크"
											value="1"> <a href="javascript:void(0)"
											onclick="chkEmail()" class="btn default">중복확인</a></td>
									</tr>
									<tr class="field_phone">
										<th>휴대폰<span class="ico">*<span class="screen_out">필수항목</span></span></th>
										<td>
											<div class="phone_num">
												<input type="text" value="01096025462" pattern="[0-9]*"
													name="mobileInp" placeholder="숫자만 입력해주세요" class="inp"
													readonly="readonly"> <input type="hidden"
													name="mobile[]" id="mobile0" value="010" required=""
													option="regNum" label="휴대폰"> <input type="hidden"
													name="mobile[]" id="mobile1" value="9602" required=""
													option="regNum" label="휴대폰"> <input type="hidden"
													name="mobile[]" id="mobile2" value="5462" required=""
													option="regNum" label="휴대폰">
												<button id="btn_cert" class="btn default" type="button">다른번호
													인증</button>
											</div>
											<div id="codeNum" class="code_num">
												<input type="text" name="auth_code" id="auth_code" value=""
													size="6" maxlength="6" pattern="[0-9]*" label="인증번호 확인"
													disabled="" class="inp_confirm"
													oninput="if(value.length&gt;6)value=value.slice(0,6);$(this).val($(this).val().replace(/[^0-9]/g,&#39;&#39;));">
												<button id="btn_cert_confirm" class="btn default disabled"
													type="button">인증번호 확인</button>
												<p id="countdown" class="count_down"></p>
											</div>
											<p class="txt_guide">
												<span class="txt txt_case1"></span>
											</p>
										</td>
									</tr>
									<tr class="select_sex">
										<th>성별</th>
										<td><label class=""> <input type="radio"
												name="sex" value="m"> <span class="ico"></span>남자
										</label> <label class=""> <input type="radio" name="sex"
												value="w"> <span class="ico"></span>여자
										</label> <label class="checked"> <input type="radio"
												name="sex" value="n" checked="checked"> <span
												class="ico"></span>선택안함
										</label></td>
									</tr>
									<tr class="birth field_birth">
										<th>생년월일</th>
										<td>
											<div class="birth_day">
												<input type="text" name="birth_year" id="birth_year"
													pattern="[0-9]*" value="1999" label="생년월일" size="4"
													maxlength="4" placeholder="YYYY"> <span class="bar"></span>
												<input type="text" name="birth[]" id="birth_month"
													pattern="[0-9]*" value="09" label="생년월일" size="2"
													maxlength="2" placeholder="MM"> <span class="bar"></span>
												<input type="text" name="birth[]" id="birth_day"
													pattern="[0-9]*" value="14" label="생년월일" size="2"
													maxlength="2" placeholder="DD">
											</div>
											<p class="txt_guide">
												<span class="txt bad"></span>
											</p>
										</td>
									</tr>
									<c:if test="${ !empty loginUser.address }">
										<c:forTokens var="addr" items="${ loginUser.address }"
											delims="," varStatus="status">
											<c:if test="${ status.index eq 0 }">
												<tr>
													<th>우편번호</th>
													<td><input type="text" name="post"
														class="postcodify_postcode5" size="6" value="${ addr }">
														<button type="button" id="postcodify_search_button">검색</button>
													</td>
												</tr>
											</c:if>
											<c:if test="${ status.index eq 1 }">
											</c:if>
										</c:forTokens>
									</c:if>
									<tr>
										<th>도로명 주소</th>
										<td><input type="text" name="address1"
											class="postcodify_address"></td>
									</tr>
									<tr>
										<th>상세 주소</th>
										<td><input type="text" name="address2"
											class="postcodify_extra_info">
										</td>
									</tr>
									<tr>
										<th>프로필 사진</th>
										<td>
										<input type="file" name="upfile">
										</td>
									</tr>
									<tr>
										<th>내소개</th>
									<%-- 	<tr>
										<td>
										본인의 전문성을 표현할 수 있는 정보를 입력해보세요. (필수아님)<br>
										이용자가 정보를 열람할 때 참고 할 수 있습니다.
										</td>
										<td><input type="text" name="selfintro_head" placeholder="30자 이내로 작성해 주세요.">한줄 소개</td>
										<td><input type="text" name="selfintro_content" placeholder="200자 이내로 작성해 주세요.<br>근무이력, 학업, 전공, 수상이력등 더 자세히 본인을 소개하고 싶은 정보를 입력해주세요.<br>
																					의료기관 정보는 허용되지 않습니다.">상세 소개</td>
									    </tr>
									</tr>
									--%>

								</tbody>
								<div class="outer" align="center">
									<form action="mupdate.do" method="post" id="joinForm" >
										<table width="500" cellspacing="5">
											<button type="mupdate.do" class="post">회원정보수정</button>
											<th>
											<td colspan="2" align="center">
												<button>수정하기</button> <c:url var="mdelete"
													value="mdelete.do">
													<c:param name="id" value="${ loginUser.id }" />
												</c:url>
												<button type="button"
													onclick="location.href='${ mdelete }';">탈퇴하기</button> <input
												type="reset" value="취소하기">
											</td>
										</table>
								</div>
								</form>

								</div>

								<script type="text/javascript">
  $(document).ready(function() {
    $('input[name=name]').on('keyup keydown blur', function(){
      preventSpecialChars($(this), 'write');
    });

    $("#formSubmit .btn_submit").click(function(){
      $("input[type='text']").each(function(){
        var input_txt = $(this).val();
        var input_trim_txt = input_txt.replace(/(^\s*)|(\s*$)/gi, "");
        $(this).val(input_trim_txt);
      })
    });

    // PRDPJ-159 장차석 : 사용자 아이디와 추처인 아이디 중복 안되도록 처리
    var $nameRecommid = $('[name=recommid]');
    var $nameMId = $('[name=m_id]');
    $($nameRecommid , $nameMId).blur(function(){
      if ($.trim($nameMId.val()) !== '' && $.trim($nameRecommid.val()) !== '' &&
        ($nameRecommid.val() === $nameMId.attr('data-id') || $nameRecommid.val() === $nameMId.val())) {
        $nameRecommid.val('');
        alert('추천인 아이디에는 본인 아이디를 입력할 수 없습니다.');
      }
    });

    //개인정보처리방침
    function getAgreement() {
      jQuery.ajax({
        url: "/shop/service/private.php",
        cache: false,
        dataType: "html",
        type: "GET",
        contentType: 'text/html; charset=euc-kr',
        success: function(data) {
          jQuery(".agreement_box").html( jQuery(data).find('.hundred'));
        }
      });
    }
    getAgreement();

    // 레이어 열기,닫기
    $('.check_view .btn_link').on('click',function(e){
      e.preventDefault();
      var $layer1 = $(this).is('.btn_agreement');
      var $layer2 = $(this).is('.btn_essential');
      var $layer3 = $(this).is('.btn_choice');
      var bgDimd = $('.bg_dim');
      var $target = $(this).parents('.reg_agree').find('.layer');

      var $agreement = $(this).parents('.reg_agree').find('.layer_agreement');
      var $essential = $(this).parents('.reg_agree').find('.layer_essential');
      var $choice = $(this).parents('.reg_agree').find('.layer_choice');
      var topResult = null;

      if($layer1 == true){
        bgDimd.show();
        $agreement.show();
        $essential.hide();
        $choice.hide();
        topResult = $agreement;
      }else if($layer2 == true){
        bgDimd.show();
        $essential.show();
        $agreement.hide();
        $choice.hide();
        topResult = $essential;
      }else if($layer3 == true){
        bgDimd.show();
        $choice.show();
        $essential.hide();
        $agreement.hide();
        topResult = $choice;
      }
      topResult.css({
        'margin-top':-topResult.height() / 2
      });
    });
    $('.reg_agree .btn_ok,.reg_agree .btn_close').on('click',function(e){
      e.preventDefault();
      $(this).parents('.layer').hide();
      $('.bg_dim').hide();
    });

    // 이용약관전체동의
    var agree = $('.reg_agree');
    $('.check_agree input[name = agree_allcheck]').change(function(){
      if($(this).is(':checked') === true){
        $('.check_agree').addClass('checked')
        agree.find('input[type=checkbox]').attr('checked','checked');
        agree.find('input[type=checkbox]').prop('checked','checked');
        agree.find('input[type=checkbox]').val('y');
        $('#consentHidden').val('y');
      }else{
        $('.check_agree').removeClass('checked')
        agree.find('input[type=checkbox]').attr('checked','');
        agree.find('input[type=checkbox]').prop('checked','');
        agree.find('input[type=checkbox]').val('n');
        $('#consentHidden').val('n');
      }
    });
    $('.reg_agree').find('input[type=checkbox]').change(function(){
      if($(this).is(':checked')){
        $(this).parent().addClass('checked');
        $(this).attr('checked','checked');
        $(this).prop('checked','checked');
        $(this).val('y');
        if($(this).attr('name') == 'hiddenCheck') $('#consentHidden').val('y');
      }else{
        $(this).parent().removeClass('checked');
        $(this).attr('checked','');
        $(this).prop('checked','');
        $(this).val('n');
        if($(this).attr('name') == 'hiddenCheck') $('#consentHidden').val('n');
      }
      $('.reg_agree').find('input[type=checkbox]').each(function(){
        if($(this).is(':checked') === false){
          $('.label_all_check').removeClass('checked');
          return false;
        }
      });
      if($(this).attr('name') === 'marketing'){
        if($(this).is(':checked')){
          $('.email_sms').find('.check_agree').addClass('checked');
          $('.email_sms').find('input').attr('checked','checked');
          $('.email_sms').find('input').prop('checked','checked');
          $('.email_sms').find('input').val('y');
        }else{
          $('.email_sms').find('.check_agree').removeClass('checked');
          $('.email_sms').find('input').attr('checked','');
          $('.email_sms').find('input').prop('checked','');
          $('.email_sms').find('input').val('n');
        }
      }
      if($(this).attr('name') === 'mailling' || $(this).attr('name') === 'sms'){
        var emailSmsCount = 0;
        $(this).parents('.email_sms').find('input').each(function(){
          if($(this).is(':checked')) emailSmsCount++;
        });
        if(emailSmsCount === 2){
          $('input[name=marketing]').parent().addClass('checked');
          $('input[name=marketing]').attr('checked','checked');
          $('input[name=marketing]').prop('checked','checked');
        }else{
          $('input[name=marketing]').parent().removeClass('checked');
          $('input[name=marketing]').attr('checked','');
          $('input[name=marketing]').prop('checked','');
        }
      }

      // 전체동의
      if($('.reg_agree').find('.checked').length >= 7){
        $('.check_agree input[name = agree_allcheck]').parent().addClass('checked');
        $('.check_agree input[name = agree_allcheck]').prop('checked','checked');
      }else{
        $('.check_agree input[name = agree_allcheck]').parent().removeClass('checked');
        $('.check_agree input[name = agree_allcheck]').prop('checked','');
      }
    });

    function inputFocus() {
      $('#form input').focus(function () {
        var element = $(this);
        if (element.offset().top - $(window).scrollTop() < 80)
        {
          $('html, body').animate({
            scrollTop: element.offset().top - 80
          }, 0);
        }
      });
    }
    inputFocus();


    // 글자 갯수확인 + 문장조합확인
    var checkType1 = false;// 갯수
    var checkType2 = false;// 문자
    var checkType3 = false;// 문자만
    function check_confirm(characterReg, minNum){
      if(characterReg.length < minNum){
        checkType1 = false;
      }else{
        checkType1 = true;
      }

      var checkNumber = characterReg.search(/[0-9]/g); // 숫자
      var checkEnglish = characterReg.search(/[a-zA-Z]/ig); // 대소문자
      var checkSpecial = characterReg.search(/[~`!>@?/<#"'\$;:\]%\.\^,&\[*()_\+\-=|\\{}]/ig); // 특수문자
      var checkAscii = characterReg.search(/[^a-zA-Z0-9~`!>@?/<#"'\$;:\]%\.\^,&\[*()_\+\-=|\\{}]/ig); // 아스키 특수문자

      if(checkNumber >= 0 && checkEnglish >= 0 && checkAscii === -1) {
        checkType2 = true;
        checkType3 = true;
        if(checkSpecial !== -1) checkType3 = false;
      }else if(checkNumber >= 0 && checkSpecial !== -1 && checkAscii === -1){
        checkType2 = true;
        checkType3 = false;
      }else if(checkEnglish >= 0 && checkSpecial !== -1 && checkAscii === -1) {
        checkType2 = true;
        checkType3 = false;
      }else if( checkEnglish >= 0 && checkSpecial === -1 && checkAscii === -1) {
        checkType3 = true;
        if (checkNumber === -1) checkType2 = false;
      }else{
        checkType2 = false;
        checkType3 = false;
      }
    }


    // 아이디검증
    var saveId;
    $('[name=m_id]').on('focus',function(){
      saveId = $(this).val();
      $(this).parent().find('.txt_guide').show();
    });
    $('[name=m_id]').on('keyup', function(){
      var $target = $(this).parent().find('.txt_guide');
      var $chkVal =  $(this).val();
      var $numMin = 6;
      if(saveId !== $chkVal) class_change($target.eq(1),'bad');// 중복확인후 수정될때
      check_confirm($chkVal,$numMin);
      if(checkType1 === true && checkType3 === true){
        class_change($target.find('.txt_case1'), 'good');
        $(this).attr('data-validator',"true");
      }else{
        class_change($target.find('.txt_case1'),'bad');
        $(this).attr('data-validator',"false");
      }
    });

    // 비밀번호검증
    $('[name=password], [name=newPassword], [name=password2], [name=confirmPassword]').on('focus',function(){
      $(this).parent().find('.txt_guide').show();
    });
    $('[name=password], [name=newPassword], [name=password2], [name=confirmPassword]').on('blur', function () {
      if ($(this).parent().find('.txt').hasClass('bad') || $.trim($(this).val()) === "" ){
        if (!$(this).hasClass('bad')) $(this).addClass('bad');
      } else {
        if ($(this).hasClass('bad')) $(this).removeClass('bad')
      }
    });
    $('input[name=password2], [name=confirmPassword]').on('keyup', function(){
      var $target = $(this).parent().find('.txt_guide');

      if( ( $("[name=password]").val() === $('[name=password2]').val() && $.trim($("[name=password]").val()) != "") || ( $("[name=newPassword]").val() === $('[name=confirmPassword]').val() && $.trim($("[name=newPassword]").val()) != "") ) {
        class_change($target.find('.txt_case1'),'good');
      }else{
        class_change($target.find('.txt_case1'),'bad');
      }
    });

    $('input[name=password], [name=newPassword]').on('keyup', function(e){
      var $target = $(this).parent().find('.txt_guide');
      var $chkVal =  $(this).val();
      var $numMin = 10;

      check_confirm($chkVal,$numMin);

      if(checkType1 === false && checkType2 === false){
        class_change($target.find('.txt_case1'),'bad');
        class_change($target.find('.txt_case2'),'bad');
      }
      if(checkType1 === true && checkType2 === false){
        class_change($target.find('.txt_case1'),'good');
        class_change($target.find('.txt_case2'),'bad');
      }
      if(checkType1 === false && checkType2 === true){
        class_change($target.find('.txt_case1'),'bad');
        class_change($target.find('.txt_case2'),'good');
      }
      if(checkType1 === true && checkType2 === true){
        class_change($target.find('.txt_case1'),'good');
        class_change($target.find('.txt_case2'),'good');
      }

      var hasThreeOrMoreConsecutiveNumbers = pwValidate.hasThreeOrMoreConsecutiveNumbers($chkVal)
      if (hasThreeOrMoreConsecutiveNumbers) {
        class_change($target.find('.txt_case3'),'bad');
      } else {
        class_change($target.find('.txt_case3'),'good');
      }

      if($(this).attr('id') == 'newPassword'){
        if($('[name=originalPassword]').val() == $('[name=newPassword]').val() ){
          class_change($target.find('.txt_case4'),'bad');
        }else{
          class_change($target.find('.txt_case4'),'good');
        }
        $('[name=confirmPassword]').trigger('keyup');
        var newPasswordCheckNum = 0;
        $target.find('.txt').each(function(){
          if($(this).hasClass('good')) newPasswordCheckNum++;
          $('[name=newPasswordCheck]').val(newPasswordCheckNum);
        });
      }else{
        $('[name=password2]').trigger('keyup');
      }
    });

    $("#selectRecommend label").on('click', function (e) {
      var target = $(e.target)
      var wrapper = target.closest('.group_radio')

      var inputOptions = wrapper.find('label')
      var targetInput = target.closest('.radio_wrapper').find('label')

      var selectOptionId = targetInput.find('input').attr('id')
      var inputWrapper = wrapper.siblings('.input_wrapper')
      var textBox = inputWrapper.find('input')
      var defaultMessage = {
        'recommendId': '추천인 아이디를 입력해주세요.',
        'eventName': '참여 이벤트명을 입력해주세요.'
      }
      var placeholderMessage = defaultMessage[selectOptionId]

      // 라디오버튼 토글
      inputOptions.not(targetInput).removeClass('checked')
      targetInput.addClass('checked')

      // 기존 텍스트 리셋
      textBox.val("")

      // placeholder 텍스트 변경
      textBox.attr('placeholder', placeholderMessage)

      // input name, value값 변경
      var nameOptions = {
        'recommendId': 'recommid',
        'eventName': 'ex2'
      }
      textBox.attr('id', nameOptions[selectOptionId])
      inputWrapper.addClass('selected')
    })
  });

  // 클래스변경
  function class_change(obj,state){
    if(state === 'good') {
      if (obj.hasClass('bad')) obj.removeClass('bad');
      obj.addClass('good');
    }else{
      if(obj.hasClass('good')) obj.removeClass('good');
      obj.addClass('bad');
    }
  }

  // 중복확인
  function chkId()
  {
    var alertMsg = "아이디는 6자 이상의 영문 혹은 영문과 숫자 조합만 가능합니다";
    var $target = $("[name='m_id']").parent().find('.txt_case2');
    var id_txt = $("[name='m_id']").val();
    var id_trim_txt = id_txt.replace(/(^\s*)|(\s*$)/gi, "");
    $("input[name='m_id']").val(id_trim_txt);
    var form = document.frmMember;
    if ($("input[name='m_id']").val() === "") {
      alert("아이디를 입력해 주세요.");
      return;
    }
    if($("input[name='m_id']").val().length < 6){alert("아이디는 6자 이상의 영문 혹은 영문과 숫자 조합만 가능합니다");return;}
    if (!chkText(form.m_id,form.m_id.value,"아이디를 입력해주세요")) return;
    var idPattern = /^[a-zA-Z0-9]{1}[^"']{3,15}$/; // chkPatten 메소드에서 가져옴
    var isValidId = eval(idPattern);
    if (!isValidId.test(form.m_id.value)) {
      alert(alertMsg);
      return;
    }
    var $idValidator = $("[name='m_id']").attr('data-validator');
    if($idValidator === "false"){
      $("[name=chk_id]").val('');
      alert(alertMsg);
      if($target.hasClass('good')) $target.removeClass('good');
      $target.addClass('bad');
    }else{
      ifrmHidden.location.href = "indb.php?mode=chkId&m_id=" + form.m_id.value;
    }
  }
  function chkId2(num){
    var $target = $("[name='m_id']").parent().find('.txt_case2');
    var id_txt = $("[name='m_id']").val();
    if(num == 1){
      if($target.hasClass('bad')) $target.removeClass('bad');
      $target.addClass('good');
      $("[name='m_id']").attr('data-id',id_txt);
    }else{
      if($target.hasClass('good')) $target.removeClass('good');
      $target.addClass('bad');
    }
  }

  //
  function chkEmailChange($target){
    if($target.val() === $target.data('email') && $target.val().trim() !== ''){
      $('[name=chk_email]').val('1');
    }else{
      $('[name=chk_email]').val('0');
    }
  }
  // 이메일 중복확인
  function chkEmail()
  {
    var email_txt = $("input[name='email']").val();
    var trim_txt = email_txt.replace(/(^\s*)|(\s*$)/gi, "");
    var email_regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    $("input[name='email']").val(trim_txt)
    if ($("input[name='email']").val() === "") {
      alert("이메일 주소를 입력해 주세요.");
      $('[name=chk_email]').val('0');
      return false;
    }
    if(email_regex.test(trim_txt) === false) {
      alert("잘못된 이메일 형식입니다.");
      $('[name=chk_email]').val('0');
      return false;
    }

    var form = document.frmMember;
    if (!chkText(form.email,form.email.value,"이메일을 입력해주세요")){
      $('[name=chk_email]').val('0');
      return;
    }
    if (!chkPatten(form.email,form.email.getAttribute('option'),"정상적인 이메일 주소를 입력해주세요.")){
      $('[name=chk_email]').val('0');
      return;
    }

    $('[name=chk_email]').val('1');

    var chkUrl = "indb.php?mode=chkEmail&email=" + form.email.value + "&m_id=";
    chkUrl += form.m_id.value; // KM-1564 가입시는 id체킹 필요없음
    ifrmHidden.location.href = chkUrl;
  }

  $("input[name='mobileInp']").change(function() {
    $("input[name='check_mobile']").val("0");
  });

  // 생년월일 입력시 폼 포커스 이벤트
  $('.birth_day input').focus(function(){
    $(this).parent().addClass('on');
  }).keyup(function(){
    var inputText = $(this).val();
    var number = $(this).val().replace(/[^0-9]/g,'');
    $(this).val(number);
  }).blur(function(){
    $(this).parent().removeClass('on');
    // KM-1261 회원가입 14세 인증
    birthCheckAction.validatorText();
  });


  // 현재 비밀번호 확인
  function checkCurrentPassword(el) {
    var currentPassword = $(el).val();
    var errorMessage = $(el).parent().find(".txt_guide");
    if (currentPassword.trim() === "") {
      errorMessage.hide();
      $('[name=originalPasswordCheck]').val('1');
      return false;
    }
    var req = {password:currentPassword};
    kurlyApi({
      method:'post',
      // url:'/v1/users/check/password',
      url:'/v3/auth/check-password',
      data:req
    }).then(function (response) {
      if(response.status === 204){
        errorMessage.hide();
        $('[name=originalPasswordCheck]').val('1');
        return true;
      }else{
        errorMessage.show();
        $('[name=originalPasswordCheck]').val('0');
        return false;
      }
    }.bind(this)).catch(function(err){
      errorMessage.show();
      $('[name=originalPasswordCheck]').val('0');
      return false;
    });
  }

  function chkForm2(f) {
    if($('[name=originalPasswordCheck]').val() === '0'){
      alert('현재 비밀번호를 확인해주세요', function(){
        $('[name=originalPassword]').focus();
      });
      return false;
    }

    if($('#originalPassword').val() != "" || $('#newPassword').val() != "" || $('#confirmPassword').val() != ""){
      if($('[name=newPasswordCheck]').val() < 4){
        alert('새 비밀번호를 확인해주세요', function(){
          $("[name=newPassword]").focus();
        });
        return false;
      }
      if($('#confirmPassword').val() != $('#newPassword').val()){
        alert('새 비밀번호 확인을 확인해주세요', function(){
          $('#confirmPassword').focus();
        });
        return false;
      }
    }

    if($('[name=chk_email]').val() !== '1'){
      alert('이메일 중복확인을 확인해주세요', function(){
        $('[name=email]').focus();
      });
      return false;
    }

    if(! preventSpecialChars($('input[name=name]'), 'result')){
      return false;
    }

    if ($("input[name='check_mobile']").val() !== "1")
    {
      alert("휴대폰 인증을 완료해 주세요.", function () {
        $('#btn_cert').focus();
      });
      return false;
    }


    var email_txt = $("input[name='email']").val();
    var trim_txt = email_txt.replace(/(^\s*)|(\s*$)/gi, "");
    var email_regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    $("input[name='email']").val(trim_txt)
    if(email_regex.test(trim_txt) === false) {
      alert('잘못된 이메일 형식입니다.', function () {
        $('input[name=email]').focus();
      });
      return false;
    }
  }
	</script>




<jsp:include page="../common/footer.jsp" />
</body>
</html>

