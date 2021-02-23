<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<hr>
<br><br>
<h1 align="center">의뢰 등록 페이지</h1>
<%--form에서 입력값들과 파일을 같이 전송하려면, 반드시 enctype="multipart/form-data"속성 추가해야 함 --%>
<form action="qainsert.do" method="post" enctype="multipart/form-data">
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">                   
<tr><th>제 목</th><td><input type="text" name="qa_title"></td></tr>
<tr><th>작성자</th><td><input type="text" name="qa_writer" readonly value="${ sessionScope.loginUser.id }"></td></tr>
<tr><th>포인트</th><td><input type="text" name="qa_point"></td></tr>
<tr><th>파일선택</th>
<td><input type="file" name="upfile"></td></tr>
<tr><th>내 용</th><td><textarea name="qa_content" rows="5" cols="50"></textarea></td></tr>

<div class="inputArea">
 <label for="gdsImg">이미지</label>
 <input type="file" id="gdsImg" name="iupfile" />
 <div class="select_img"><img src="" /></div>
 
 <script>
  $("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
 
 <%= request.getRealPath("/") %>
 
</div>

<tr><th colspan="2">
<input type="submit" value="등록하기"> &nbsp;
<input type="reset"value="작성취소"> &nbsp;
<button onclick="javascript:history.go(-1); return false;">목록</button></th></tr>
</table>
</form>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>