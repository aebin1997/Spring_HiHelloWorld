<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/hhw/resources/writerform/css/core.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/css2.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/icon-font.min.css" />
<link rel="stylesheet" href="/hhw/resources/writerform/css/style.css" />


	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
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
	<hr>
	
 	<section style="padding: 70px 0 60px 0; margin-left: 700px;">
		
		<br>
		<br>
		<form action="binsert.do" method="post" enctype="multipart/form-data">
			<table style="padding-top: 50px; float:center; text-align: center;" align="center" width="1100" border="0" cellpadding="2">
				<tr>
					<td height="30" align="center" bgcolor="#ccc"><font color="white">게시글 등록</font></td>
				</tr>
				<tr>
					<td bgcolor=white>
						<table class="table2">
						
							<tr>	
								<td width="150px">말머리</td>
								<td width="900px"><select type="test" name="btype">
	    											  <option value="질문이요">질문이요</option>
													  <option value="일상글이요">일상글이요</option>
													  <option value="칭찬글이요">칭찬글이요</option>
													  <option value="참고글이요">참고글이요</option>
												  </select></td>
								
							</tr>
							
							<tr>
								<td>제 목</td>
								<td><input type="text" name="btitle"></td>
							</tr>
							
							<tr>
								<td>작성자</td>
								<td><input type="text" name="bwriter" readonly value="${ sessionScope.loginUser.nickname }"></td>
							</tr>
	
							<tr>
								<td>파일선택</td>
								<td><input type="file" name="upfile"></td>
							</tr>
	
							<tr>
								<td>내 용</td>
								<td>
								<!-- <textarea name="bcontent" rows="5" cols="50"></textarea> -->
								<textarea class="textarea_editor form-control border-radius-0" name="bcontent" rows="5" cols="50"></textarea>
								</td>
							</tr>
							
							<tr>
								<th colspan="2" style="text-align: right; padding-top: 20px">
									<input type="submit" value="등록하기">&nbsp; 
									<input type="reset" value="작성취소"> &nbsp;
									<button onclick="javascript:history.go(-1); return false;">목록</button>
								</th>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</section>
 
 <!-- 
 <div class="main-container" style="float: center;">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>Form</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Form</li>
								</ol>
							</nav>
						</div>
						<div class="col-md-6 col-sm-12 text-right">
							<div class="dropdown">
								<a class="btn btn-primary dropdown-toggle" href="#" role="button" data-toggle="dropdown">
									January 2018
								</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a class="dropdown-item" href="#">Export List</a>
									<a class="dropdown-item" href="#">Policies</a>
									<a class="dropdown-item" href="#">View Assets</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="html-editor pd-20 card-box mb-30">
					<h4 class="h4 text-blue">bootstrap wysihtml5</h4>
					<p>Simple, beautiful wysiwyg editors</p>
					<textarea class="textarea_editor form-control border-radius-0" placeholder="Enter text ..."></textarea>
				</div>
			</div>
			<div class="footer-wrap pd-20 mb-20 card-box">
				DeskApp - Bootstrap 4 Admin Template By <a href="https://github.com/dropways" target="_blank">Ankit Hingarajiya</a>
			</div>
		</div>
	</div>
  -->
 
 
<script src="/hhw/resources/writerform/js/core.js"></script>
<script src="/hhw/resources/writerform/js/js.js"></script>
<script src="/hhw/resources/writerform/js/layout-settings.js"></script>
<script src="/hhw/resources/writerform/js/process.js"></script>
<script src="/hhw/resources/writerform/js/script.min.js"></script>
 

	<jsp:include page="../common/footer.jsp" />
	
	
</body>
</html>