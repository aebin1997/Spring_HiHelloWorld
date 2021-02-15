<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comingsoon</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

header {
	background-image: linear-gradient(rgba(0, 0, 0, 0.5),
		rgba(0, 0, 0, 0.5)), url(/hhw/resources/images/comingsoon.jpg);
	height: 100vh;
	background-position: center;
	background-size: cover;	
}

.hero
{
	top: 50%;
	left:50%;
	position: absolute;
	transform: translate(-50%, -50%);
	color: #fff;
	text-align: center;
	font-family: 'Architects Daughter', cursive;
	font-family: 'Open Sans', sans-serif;
}

h1
{
	font-size: 60px;
	letter-spacing: 15px;
}

hr
{
	width: 50%;
	margin: 30px auto;
	borber: 1.5px solid #fff;
}

p
{
	font-size: 20px;
	margin-bottom:30px;
}

#launch
{
	font-size: 50px;
	word-spacing: 20px;
}

</style>

</head>
<body>

	<header>
		<div class="hero">
			<p></p>
			<h1>중간점검</h1>
			<hr>
			<p id="launch"></p>
		</div>
	</header>

</body>

	<script>
	
		var countDownDate = new Date("Feb 22, 2021 00:00:00").getTime();
		/* var countDownDate = new Date("Feb 13, 2021 00:00:00").getTime(); */

		var x = setInterval(function() {

					var now = new Date().getTime();

					var distance = countDownDate - now;

					var days = Math.floor(distance / (1000 * 60 * 60 * 24));
					var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
					var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
					var seconds = Math.floor((distance % (1000 * 60)) / 1000);

					document.getElementById("launch").innerHTML = "D-day : " + days + "D "	+ hours + "H " + minutes + "M " + seconds + "S";

					if (distance < 0) {
						clearInterval(x);
						document.getElementById("launch").innerHTML = "EXPIRED";
					}

				}, 1000);
		
	</script>


</body>
</html>