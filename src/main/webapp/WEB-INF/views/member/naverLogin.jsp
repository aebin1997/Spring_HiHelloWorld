<%@ page import="java.util.StringTokenizer"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Author" content="kimwoolina">
<title>네이버 : 로그인</title>
<link rel="stylesheet" type="text/css" href="/hhw/resources/css/e_w.css">
<link rel="stylesheet" type="text/css" href="/hhw/resources/css/e_e.css">
</head>
<body class="chrome" style="overflow: hidden;">
	<%
	String clientId = "BtKnvM1SxZzIcTukJJbO";// 애플리케이션 클라이언트 아이디값";
	String clientSecret = "RIA79leRyX";// 애플리케이션 클라이언트 시크릿값";
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	String redirectURI = URLEncoder.encode("http://localhost:8888/hhw/naverLogin.move", "UTF-8");
	String apiURL;
	apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	apiURL += "client_id=" + clientId;
	apiURL += "&client_secret=" + clientSecret;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&code=" + code;
	apiURL += "&state=" + state;
	String access_token = "";
	String refresh_token = "";
	System.out.println("apiURL=" + apiURL);
	String tokenStr = null;
	try {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		BufferedReader br;
		System.out.print("responseCode=" + responseCode);
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		
		//토큰 값 추출
		String resStr = res.toString();
		StringTokenizer stok = new StringTokenizer(resStr, ":");
		for (int i=0; i<2; i++) {
			if(i==1) {
				tokenStr = stok.nextToken();
			}else {
				stok.nextToken();
			}
        }
		
		String[] array = tokenStr.split("\"");
		for(int i=1; i<2;i++){
			 tokenStr = array[i];
			 System.out.println(tokenStr);
		}
		
		if (responseCode == 200) {
			System.out.println(resStr);
			System.out.println("토큰값 추출 : " + tokenStr);
			System.out.println("===================NaverLogin.jsp========================");
		}
	} catch (Exception e) {
		System.out.println(e);
	}
	%>
	<div id="wrap">
		<!-- header -->
		<div id="header" align="center">
			<h1>
				<a href="http://www.naver.com/"><img
					src="/hhw/resources/images/icon/NAVER.png" width="240px"
					height="44px" align="center"></a>
			</h1>
		</div>
		<!-- //header -->
		<!-- container -->
		<div id="container">
			<!-- content -->
			<div id="content">
				<div class="warning">
					<div class="warning_title">
						<h2>네이버 아이디로 로그인하기</h2>
					</div>
					<div class="warning_box">
						<p class="warning_info">Hi Hello World 서비스에 네이버 계정으로 로그인 합니다.
							일부 환경에서는 동작하지 않을 수 있습니다. 문제가 발생하면 Hi Hello World 서비스의 관리자에게 문의해
							주세요.</p>
					</div>

					<br><br>
					<form action="naverLogin.do" method="post">
						<input type="hidden" name="token" value="<%= tokenStr %>">
						<button type="submit" style="border: none;">
							<img src="/hhw/resources/images/icon/naverBtn.PNG" width="100%"
							height="59px">
						</button>
					</form>



					<div class="error error_nearo" id="some_browser_bug"
						style="display: none;">
						일부 환경에서는 '확인' 버튼이 동작하지 않을 수 있습니다. <br>브라우저의 닫기 버튼을 이용해 주세요.
					</div>
				</div>
				<!--/div//-->
			</div>
		</div>
		<div id="footer">
			<ul>
				<li><a target="_blank"
					href="http://www.naver.com/rules/service.html" id="fot.agreement">이용약관</a></li>
				<li><strong><a target="_blank"
						href="http://www.naver.com/rules/privacy.html" id="fot.privacy">개인정보처리방침</a></strong></li>
				<li><a target="_blank"
					href="http://www.naver.com/rules/disclaimer.html"
					id="fot.disclaimer">책임의 한계와 법적고지</a></li>
				<li><a target="_blank"
					href="https://help.naver.com/support/service/main.nhn?serviceNo=532"
					id="fot.help">회원정보 고객센터</a></li>
			</ul>
			<address>
				<em><a href="http://www.naver.com/"><img
						src="/hhw/resources/images/icon/NAVER.png" width="63px"
						height="11px" align="center"></a> </em><em class="copy">Copyright</em>
				<em class="u_cri">©</em> <a target="_blank"
					href="http://www.navercorp.com/" class="u_cra" id="fot.navercorp">NAVER
					Corp.</a> <span class="all_r">All Rights Reserved.</span>
			</address>
		</div>







	</div>
</body>
</html>