/*
 * 소켓 관련 함수 & 메세지 함수 자바스크립트
 */
// DOM TREE 생성 후 connetWS 실행
var socket = null;
var loginId = null;
var loginName = null;
var mImage = null;
var contextPath = getContextPath();
var jsonData = {
      mId : null,
      mIdYou : null,
      msg : null,
      msgDate : null,
      dmNo : null,
      dmContentsImage : null,
      dmChatRead : null
};

function getContextPath(){
   var lastIndexCount = location.href.lastIndexOf('/');
   var ctx = location.href.substr(0,lastIndexCount).replace('http', 'ws');
   return ctx;
}
// 접속중인 본인 아이디 얻기
function getLoginId(){
   $.ajax({
      url:'sessionCheck',
      method:'POST',
      dataType: 'text',
      success:function(memberInfo){
         loginId = memberInfo.split(",")[0];
         mImage = memberInfo.split(",")[1];
         loginName= memberInfo.split(",")[2];
      }
   });
}

// 메시지 채팅창 출력 콜백함수
function message_send_form(target){
   mIdYou = target.find('h3').text();
   var htmlData = "";
   htmlData +="<div class='message-bar-head'>";
   htmlData +="   <div class='usr-msg-details'>";
   htmlData +=         "<div class='usr-ms-img'>";
   htmlData +=            "<img src='' alt=''>";
   htmlData +=         "</div>";
   htmlData +=      "<div class='usr-mg-info'>";
   htmlData +=         "<h3>"+mIdYou+"</h3>";
   htmlData +=         "<p>Online</p>";
   htmlData +=      "</div>";
   htmlData +=   "</div>";
   htmlData +=   " <a href ='#' span class ='glyphicon glyphicon-remove'>x</span></a>";
   htmlData += "";
   htmlData +=   "</div>";
   htmlData +=   "<div class='messages-line' id = 'messageContents' style='overflow:auto'>";
   htmlData +=   "</div>";
   htmlData +=   "<div class='message-send-area'>";
   htmlData +=      "<form>";
   htmlData +=         "<div class='mf-field'>";
   htmlData +=         "<input type='text' id='msg' placeholder='Type a message here'>";
   htmlData +=         "<button type='submit' id='btnSend'>Send</button>";
   htmlData +=         "</div>";
   htmlData +=         "<ul>";
   htmlData +=         "</ul>";
   htmlData +=      "</form>";
   htmlData +=   "</div>";
   htmlData +=   "</div>";
   $('.main-conversation-box').append(htmlData);
}

// 메시지 송신시 채팅창에 출력하는 콜백함수
function message_leftInsert_html(jsonData){
   var htmlData ="";
   htmlData +=   "<div class='main-message-box st3'>";
   htmlData +=      "<div class='message-dt st3'>";
   htmlData +=         "<div class='message-inner-dt'>";
   htmlData +=            "<p>"+jsonData.msg+"</p>";
   htmlData +=         "</div>";
   htmlData +=         "<span>"+jsonData.msgDate+"</span>";
   htmlData +=      "</div>";
   htmlData +=      "<div class='messg-usr-img'>";
   htmlData +=         "<img src='contents/member_image/"+jsonData.dmContentsImage+"' alt='' width='35px' height='35px'>"
   htmlData +=      "</div>";
   htmlData +=   "</div>";
   $('.messages-line').append(htmlData);
   $('#messageContents').scrollTop($('#messageContents').prop('scrollHeight'));
}
// 메시지 수신시 채팅창에 출력하는 콜백함수
function message_rightInsert_html(jsonData){
   var htmlData ="";
   htmlData +=   "<div class='main-message-box'>";
   htmlData +=        "<div class='ta-right'>";
   htmlData +=            "<div class='message-inner-dt'>";
   htmlData +=               "<p style='width:auto'>"+jsonData.msg+"</p>";
   htmlData +=            "</div>";
   htmlData +=            "<p style='float:right;'>"+jsonData.msgDate+"</p>";
   htmlData +=         "</div>";
   htmlData +=   "</div>";
   
   $('.messages-line').append(htmlData);
   $('#messageContents').scrollTop($('#messageContents').prop('scrollHeight'));
}

// 메시지 전송 버튼 클릭 시 작동하는 콜백함수
function message_send_function(target){
   $('#btnSend').on('click', function(event) {
      event.preventDefault();
      var d = new Date();
      //jsonData 만들어지는 시점
      jsonData.mId = loginId;                                    //보낸사람
      jsonData.mIdYou = $(target).find('.usr-mg-info h3').text();         //받는사람
      jsonData.msg = $('#msg').val();                              //내용
      jsonData.msgDate = d.getHours() + "시" + d.getMinutes() +"분";         //보낸시간
      jsonData.dmNo = $(target).attr('dmno');                        //방번호
      jsonData.dmContentsImage = mImage;                           //보낸사람 프로필 이미지
      jsonData.dmChatRead = 0;                                 //메세지 read 유무 flag
      if(jsonData.msg != null && jsonData.msg != "" && jsonData.msg != '&nbsp'){
            socket.send(jsonData.mId+","+jsonData.mIdYou+","+jsonData.msg+","+jsonData.msgDate+","+jsonData.dmNo+","+jsonData.dmContentsImage+","+jsonData.dmChatRead);
            $("#msg").val("");
            message_rightInsert_html(jsonData);
            message_send_insert_function(jsonData);
      }
   });
}

// 메시지 전송 버튼 클릭 후 메시지를 저장하는 콜백함수
function message_send_insert_function(jsonData){
   var messages = jsonData.mId+","+jsonData.mIdYou+","+jsonData.msg+","+jsonData.msgDate+","+jsonData.dmNo+","+jsonData.dmContentsImage+","+jsonData.dmChatRead;
   var params = "messages="+messages;
   $.ajax({
      url : 'messages_insert',
      method : 'POST',
      data : params,
      dataType : 'text',
      success : function(rowCount) {
      }
   });
}

//메세지 유저 클릭 시 작동하는 콜백함수
function message_detail_function(target){
   var dmNo = $(target).attr('dmno');
   var params = "dmNo=" + dmNo;
   
   $.ajax({
      url : 'messageRoom_detail',
      method : 'GET',
      data : params,
      dataType : 'json',
      success : function(jsonArrayData) {
         message_list_function(jsonArrayData);
         for (var i = 0; i < jsonArrayData.length; i++) {
            if(!(jsonArrayData[i].dmSenderId == loginId && jsonArrayData[i].dmChatRead == 1)){
               jsonData.mId = loginId;
               jsonData.dmNo = jsonArrayData[i].dmNo;
               jsonData.dmChatRead = 0;
               messages_readChat_function(jsonData);
               break;
            } 
         }
      }
   });
}

// 메세지 readCount 저장 
function messages_readChat_function(jsonData){
   jsonData.dmChatRead = 1;
   var messages = jsonData.mId+","+jsonData.mIdYou+","+jsonData.msg+","+jsonData.msgDate+","+jsonData.dmNo+","+jsonData.dmContentsImage+","+jsonData.dmChatRead;
   var params = "messages="+messages;
   $.ajax({
      url:'messages_readChat',
      method : 'POST',
      data : params,
      dataType : 'text',
      success : function(rowCount){
      }
   });
}

//유저 채팅리스트 출력 콜백함수
function message_list_function(jsonArrayData){
   for (var i = 0; i < jsonArrayData.length; i++) {
      var date = jsonArrayData[i].dmContentsDate;
      jsonData.msg = jsonArrayData[i].dmContentsMessage;
      jsonData.msgDate = date;
      jsonData.dmContentsImage = jsonArrayData[i].dmContentsImage;
      var dmSenderId = jsonArrayData[i].dmSenderId;
      if(loginId == dmSenderId){
         message_rightInsert_html(jsonData);
      } else {
         message_leftInsert_html(jsonData);
      }
   }
      /* jsonData.msg, jsonData.msgDate, dmSenderId */
}
//  채팅방 생성 콜백함수
function message_profile_create_function(mIdYou){
       if(loginId != null && mIdYou != null){
          var params="mId="+loginId+"&"+"mIdYou="+mIdYou;
             $.ajax({
                url:'messages_room_create',
                method:'GET',
                data : params,
                dataType:'text',
                success:function(isSuccess){
                   location.href = contextPath.replace('ws','http')+'/messages';
                }
          });
       }
}
// 채팅 수신 시 작동되는 콜백함수
function message_receive(event){
   var d = new Date();
   var msgArray = (event.data).split(",");
   jsonData.mIdYou = msgArray[0];   // 보낸사람 (너)
   jsonData.mId = msgArray[1];      // 받는사람 (나)
   jsonData.msg = msgArray[2];   // 내용
   jsonData.msgDate = d.getHours() + "시" + d.getMinutes()+ "분"; // 시간
   jsonData.dmContentsImage = msgArray[5];   // 보낸사람 프로필 이미지
   if(jsonData.msg != null || jsonData.msg != ""){
      message_leftInsert_html(jsonData);
      }
   }
// 메세지 수신 시 알람 탭에 출력
function message_receive_noty(event){
   var msgArray = (event.data).split(",");
   var d = new Date();
   jsonData.mIdYou = msgArray[0];   // 보낸사람 (너)
   jsonData.mId = msgArray[1];      // 받는사람 (나)
   jsonData.msg = msgArray[2];   // 내용
   jsonData.msgDate = d.getHours() + "시" + d.getMinutes()+ "분"; // 시간
   jsonData.dmContentsImage = msgArray[5];
   var htmlData = "";
   htmlData +="<div class='notfication-details'>";
   htmlData +=      "<div class='noty-user-img'>";
   htmlData +=         "<img src='contents/member_image/"+jsonData.dmContentsImage+"' alt=''>";
   htmlData +=      "</div>";
   htmlData +=      "<div class='notification-info'>";
   htmlData +=         "<h3><a href='messages' title=''>"+jsonData.mIdYou+"</a> </h3>";
   htmlData +=         "<p>"+jsonData.msg+"</p>";
   htmlData +=         "<span>"+jsonData.msgDate+"</span>";
   htmlData +=      "</div>";
   htmlData +="</div>";
   $('.nott-list').append(htmlData);
}
function message_room_open(e) {
   var nodeName = e.target.nodeName;
   var target=null;
   
   $('div.messages-list > ul > li.active').removeClass('active');
   if(nodeName=='H3'){
      target = $(e.target).parents('.usr-msg-details');
      $(target).parent().addClass('active');
      $(target).find('.msg-counts').text('0');
   }else if(nodeName=='SPAN'){
      target = $(e.target).parents('.usr-msg-details');
      $(target).parent().addClass('active');
      $(target).find('.msg-counts').text('0');
    }else if(nodeName=='LI'){
       target = $(e.target).find('.usr-msg-details');
       $(e.target).addClass('active');
       $(target).find('.msg-counts').text('0');
    }else if(nodeName=='DIV'){
       target = $(e.target);
       $(target).parent().addClass('active');
       $(target).find('.msg-counts').text('0');
    } else if(nodeName =='IMG'){
       target = $(e.target).parents('.usr-msg-details');
       $(target).find('.msg-counts').text('0');
    }
   $('.main-conversation-box').html("");
   message_send_form(target);
   message_detail_function(target);
   message_send_function(target);
   
   $('.message-bar-head').find('.glyphicon').on('click', function(e){
      var messagebar = $('.message-bar-head');
      messagebar.css('display', 'none');
      e.preventDefault();
   });
}
$(document).ready(function(){
      connectWS();
      getLoginId();
      //채팅방 오픈
      $(document).find('div.messages-list > ul > li').on('click', function(e) {
         message_room_open(e);
         setTimeout(function(){
        	 var messagebar = $('.message-bar-head');
        	 messagebar.css('display', 'none');
         },1000);
      });
      $('.user_pro_status').find('.message-us').on('click',function(e){
         var url = decodeURIComponent(location.href);
         url = decodeURIComponent(url);
         var mIdYou = url.substring( url.indexOf('=')+1, url.length );
         message_profile_create_function(mIdYou);
      });
      //profile 탭에서 유저의 메세지 버튼 클릭시 방 생성
      $(document).on('click','.message-us',function(e){
         e.preventDefault();
         var mIdYou = $(e.target).parents('.company-up-info').attr('mIdYou');
         message_profile_create_function(mIdYou);
      });
});   
function connectWS() {
   var ws = new WebSocket(contextPath+"/replyEcho");
   socket = ws;
   ws.onopen = function() { // connection이 open 되었을때 실행
      // connection 이 close 되었을때 실행
      ws.onclose = function(event) { 
      setTimeout(function() {
               connectWS();
         }, 1000);
      };
      // connection 이 error가 나왔을때
   ws.onerror = function(event) { 
      };
      ws.onmessage = function(event) { // socket.send() 후 ReplyEchoHandler가 handleTextMessage메소드로부터 메시지를 받아옴                                 
    	 var senderId = (event.data).split(',')[0];
    	 var mIdYou = (event.data).split(",")[1];
    	 var dmNo = (event.data).split(",")[4];
    	 if($('.main-conversation-box h3').text() == senderId){
             message_receive(event);
    	 }
    	 message_receive_noty(event);
         let socketAlert = $('a#socketAlert');
         socketAlert.text("메세지가 도착했습니다.");
         socketAlert.css('display', 'block');
         setTimeout(function() {
            socketAlert.css('display', 'none');
         },3000);	 
      };
   };   
}