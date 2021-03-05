<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이트 이용 방법</title>
<style>
body {
  background: #e6e6e6;
  font-family: "Roboto", sans-serif;
  font-weight: 400;
}

/*===== Vertical Timeline =====*/
#conference-timeline {
  position: relative;
  max-width: 920px;
  width: 100%;
  margin: 0 auto;
}
#conference-timeline .timeline-start,
#conference-timeline .timeline-end {
  display: table;
  font-family: "Roboto", sans-serif;
  font-size: 18px;
  font-weight: 900;
  text-transform: uppercase;
  background: #f7921a;
  padding: 15px 23px;
  color: #fff;
  max-width: 5%;
  width: 100%;
  text-align: center;
  margin: 0 auto;
}
#conference-timeline .conference-center-line {
  position: absolute;
  width: 3px;
  height: 100%;
  top: 0;
  left: 50%;
  margin-left: -2px;
  background: #f7921a;
  z-index: -1;
}
#conference-timeline .conference-timeline-content {
  padding-top: 67px;
  padding-bottom: 67px;
}
.timeline-article {
  width: 100%;
  height: 100%;
  position: relative;
  overflow: hidden;
  margin: 20px 0;
}
.timeline-article .content-left-container,
.timeline-article .content-right-container {
  max-width: 44%;
  width: 100%;
}
.timeline-article .timeline-author {
  display: block;
  font-weight: 400;
  font-size: 14px;
  line-height: 24px;
  color: #242424;
  text-align: right;
}
.timeline-article .content-left,
.timeline-article .content-right {
  position: relative;
  width: auto;
  border: 1px solid #ddd;
  background-color: #fff;
  box-shadow: 0 1px 3px rgba(0,0,0,.03);
  padding: 27px 25px;
}
.timeline-article p {
  margin: 0 0 0 60px;
  padding: 0;
  font-weight: 400;
  color: #242424;
  font-size: 14px;
  line-height: 24px;
  position: relative;
}
.timeline-article p span.article-number {
  position: absolute;
  font-weight: 300;
  font-size: 44px;
  top: 10px;
  left: -60px;
  color: #f7921a;
}
.timeline-article .content-left-container {
  float: left;
}
.timeline-article .content-right-container {
  float: right;
}
.timeline-article .content-left:before,
.timeline-article .content-right:before{
  position: absolute;
  top: 20px;
  font-size: 23px;
  font-family: "FontAwesome";
  color: #fff;
}
.timeline-article .content-left:before {
  content: "\f0da";
  right: -8px;
}
.timeline-article .content-right:before {
  content: "\f0d9";
  left: -8px;
}
.timeline-article .meta-date {
  position: absolute;
  top: 0;
  left: 50%;
  width: 62px;
  height: 62px;
  margin-left: -31px;
  color: #fff;
  border-radius: 100%;
  background: #f7921a;
}
.timeline-article .meta-date .date,
.timeline-article .meta-date .month {
  display: block;
  text-align: center;
  font-weight: 900;
}
.timeline-article .meta-date .date {
  font-size: 30px;
  line-height: 40px;
}
.timeline-article .meta-date .month {
  font-size: 18px;
  line-height: 10px;
}
/*===== // Vertical Timeline =====*/

/*===== Resonsive Vertical Timeline =====*/
@media only screen and (max-width: 830px) {
  #conference-timeline .timeline-start,
  #conference-timeline .timeline-end {
    margin: 0;
  }
  #conference-timeline .conference-center-line {
    margin-left: 0;
    left: 50px;
  }
  .timeline-article .meta-date {
    margin-left: 0;
    left: 20px;
  }
  .timeline-article .content-left-container,
  .timeline-article .content-right-container {
    max-width: 100%;
    width: auto;
    float: none;
    margin-left: 110px;
    min-height: 53px;
  }
  .timeline-article .content-left-container {
    margin-bottom: 20px;
  }
  .timeline-article .content-left,
  .timeline-article .content-right {
    padding: 10px 25px;
    min-height: 65px;
  }
  .timeline-article .content-left:before {
    content: "\f0d9";
    right: auto;
    left: -8px;
  }
  .timeline-article .content-right:before {
    display: none;
  }
}
@media only screen and (max-width: 400px) {
  .timeline-article p {
    margin: 0;
  }
  .timeline-article p span.article-number {
    display: none;
  }
  
}
/*===== // Resonsive Vertical Timeline =====*/
</style>
</head>
<body>


	<jsp:include page="../common/header.jsp" />

	<c:url var="nlist" value="nlist.do">
		<c:param name="page" value="1" />
	</c:url>
	<c:url var="about" value="aboutUs.do">
		<c:param name="page" value="1" />
	</c:url>
	<c:url var="howto" value="howTo.do">
		<c:param name="page" value="1" />
	</c:url>
	<c:url var="faq" value="faq.move">
		<c:param name="page" value="1" />
	</c:url>

	<section class="breadcrumbs-custom-inset">
		<div class="breadcrumbs-custom context-dark bg-overlay-46">
			<div class="container">
				<h2 class="breadcrumbs-custom-title">사이트 이용 방법</h2>
				<ul class="breadcrumbs-custom-path">
					<li><a class="nav-link" href="${ nlist }">공지사항</a></li>
					<li><a class="nav-link" href="${ about }">About Us</a></li>
					<li><a class="nav-link" href="${ howto }">사이트 이용 방법</a></li>
					<li><a class="nav-link" href="${ faq }">FAQ</a></li>
				</ul>
			</div>
			<div class="box-position-1"
				style="background-image: url(/hhw/resources/images/5F5F5F.jpg);"></div>
		</div>
	</section>
	

  
  <!-- Fonts -->
  <link href='https://fonts.googleapis.com/css?family=Roboto:400,300,400italic,700,900' rel='stylesheet' type='text/css'>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- // Fonts -->
</head>
<body>
  <!-- Vertical Timeline -->
  <br>
  <section id="conference-timeline">
    <div class="timeline-start">START</div>
     <div class="conference-center-line"></div>
    <div class="conference-timeline-content">
      <!-- Article -->
      <div class="timeline-article">
        <div class="content-left-container">
          <div class="content-left">
            <p>수정이 필요한 코딩 또는 원하는 프로젝트, 목표기한, 임무 완료시 제공할 금액을 명시<span class="article-number">01</span></p>
          </div>
          <br><br><br>
        </div>
        <br>
        <div class="content-right-container">
          <div class="content-right">
            <p>의뢰인의 글을 확인하고 목표기한 내 기능을 구현할 수 있으면 댓글로 의사를 표현<span class="article-number">02</span></p>
          </div>               
        </div>
         <br>
        <div class="meta-date">
        <br>
          <span class="date"></span>
          <span class="month"></span>
        </div>
      </div>
      <!-- // Article -->
      
      <!-- Article -->
      
      <div class="timeline-article">
        <div class="content-left-container">
          <div class="content-left">          
            <p> 댓글을 작성한 답변자의 개인 스펙(평점)을 확인하고 1 : 1 대화를 보낼 수 있어요 <span class="article-number">03</span></p>
          </div>   
           <br><br><br>       
        </div>
        <br>
        <div class="content-right-container">
          <div class="content-right">
            <p>1 : 1 대화를 통해서 구체적인 구현 기능과 목표 기한, 금액을 의논하고 진행합니다.<span class="article-number">04</span></p>
          </div>         
        </div>
        <br>
        <div class="meta-date">
        <br>
          <span class="date"></span>
          <span class="month"></span>
        </div>
      </div>
      <!-- // Article -->
      
      <!-- Article -->
      <div class="timeline-article">
        <div class="content-left-container">
          <div class="content-left">
            <p>1 : 1 대화를 통해서 구체적인 구현 기능과 목표 기한, 금액을 의논하고 진행합니다.<span class="article-number">05</span></p>
          </div>  
           <br><br><br>        
        </div>
        <br>
        <div class="content-right-container">
          <div class="content-right">
            <p>목표기한에 원하는 기능이 구현되었으면, 결제를 통해 답변자에게 포인트가 지급되며, 평점을 작성해주세요<span class="article-number">06</span></p>
          </div>          
        </div>
        <br>   
        <div class="meta-date">        
          <span class="date"></span>
          <span class="month"></span>
        </div>
      </div>
      <!-- // Article -->
    </div>
    <div class="timeline-end">End</div>
  </section>
  <br>
  <!-- // Vertical Timeline -->
</body>
</html>
   <jsp:include page="../common/footer.jsp" />


</body>
</html>