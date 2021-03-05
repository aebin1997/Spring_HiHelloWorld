<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 응답온 페이지값 추출함 --%>
<c:set var="currentPage" value="${ requestScope.page }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의뢰 열람 페이지</title>
<script type="text/javascript"
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script> 


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
	   $("#replyDiv").css("display","display");
	}

	function hideReplyForm(){
	   $("#replyDiv").css("display","display");
	}

</script>

<style>
table.table2 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table.table2 tr {
	width: 50px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.table2 td {
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>


</head>
<body>
	
	<c:import url="../common/header.jsp" />

	<div style="text-align: center; padding-top: 120px;">
		<div>
			<h4 style="margin: 20px 0 10px 0;">${ qa.qa_title }</h4>
		</div>
	</div>
				
	<br>

	<table align="center" cellpadding="2" cellspacing="0" width="700">
		<tr>
			<td bgcolor=white>
				<table class="table2">
					<tr>
						<td width="200px">작성자</td>
						<td width="500px">${ qa.qa_writer } 님</td>
					</tr>
					<tr>
						<td width="200px">첨부파일</td>
						<td width="500px">
							<c:if test="${ empty qa.qa_origin_file_name }">
								<img src="/hhw/resources/images/nofile.png" style="width:20px;">
							</c:if>
							<c:if test="${ !empty qa.qa_origin_file_name }">
								<c:url var="qafd" value="/qafdown.do">
									<c:param name="ofile" value="${ qa.qa_origin_file_name }" />
									<c:param name="rfile" value="${ qa.qa_origin_file_name }" />
								</c:url>
										<img src="/hhw/resources/images/yesfile.png" style="width:12px;">
										<span class="c-userinfo__count"><img src="/hhw/resources/images/eye.jfif" style="width:20px;">${ qa.qa_readcount }<br>
										<a href="${ qafd }">${ qa.qa_origin_file_name }</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<img src="/hhw/resources/images/point.png" style="width:20px;"><font color="red">${ qa.qa_point }</font>
					</tr>
					<tr>
						<td width="200px">내 용</td>
						<img src="/hhw/resources/qa_files/${ qa.qa_rename_file_name }" style="width:500px;"> 
						<td width="500px" height="200">${ qa.qa_content }</td>
					</tr>
				</table>
			</td>
		</tr>

		<tfoot>
          <td colspan="4" style="text-align: right;">
          	<%-- 로그인한 상태이면서, 본인이 작성한 게시글 일 때 --%>
			<c:if test="${  !empty loginUser and loginUser.id eq qa.qa_writer }">
				<c:url var="qauv" value="/qaupview.do">
					<c:param name="qaid" value="${ qa.qa_id }" />
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ qauv }'" style='float:center'>수정</button>
							 
				<c:url var="qadl" value="/qadelete.do">
					<c:param name="qaid" value="${ qa.qa_id }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ qadl }'" style='float:center'>글삭제</button>
			
				<c:url var="qals" value="/qalist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ qals }'" style='float:center'>목록</button>
			
			</c:if> 
			
			<%-- 로그인한 상태이면서, 본인이 작성한 게시글이 아닐 때 --%>
			<c:if test="${ !empty loginUser and loginUser.id ne qa.qa_writer}">	
			
				<c:url var="qals" value="/qalist.do">
					<c:param name="page" value="${ currentPage }" />
				</c:url>
			<button type="button" onclick="javascript:location.href='${ qals }'">목록</button> &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
			</c:if> 
			
			
			
			

				
			</td>
		</tfoot>
	</table>


	

			<c:if test="${ !empty loginUser }">
			   <button onclick="showReplyForm();">댓글 달기</button>
			   &nbsp; &nbsp;
			</c:if>
				<%-- 댓글달기 폼 영역 --%>
				<br>
				<div id="replyDiv" style="padding-bottom: 30px;  padding-top: 20px;">
					<form action="qarinsert.do" method="post">
						<input type="hidden" name="ref_qa_id" value="${ qa.qa_id }">
						<table align="center" width="700" border="0" cellpadding="2">
						
						<tr>
							<td height="20" align="center" bgcolor="#ccc"><font color="white">댓글작성</font></td>
						</tr>
						
						
							<tr>
								<td bgcolor=white>
									<table class="table2">
										
										<tr>
											<td width="200px">작성자</td>
											<td width="500px"><input type="text" name="qar_writer" readonly value="${ sessionScope.loginUser.nickname }"></td>
										</tr>
										
										<tr>
											<td width="200px">내 용</td>
											<td width="500px"><textarea name="qar_content" rows="5" cols="60"></textarea></td>
										</tr>
										
										<tr>
											<td colspan="2"  style="text-align: right;">
											<input type="submit" value="댓글등록">&nbsp;
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</form>
				</div>

			
			
			
 
	<%-- 댓글목록 표시 영역 --%>
	<div id="qarlistView" style="padding-bottom: 30px;">
		<table id="qarlistTbl" align="center" cellspacing="0" cellpadding="20" border="1" width="500"></table>
	</div>



	<jsp:include page="../common/footer.jsp" />

</body>
</html>