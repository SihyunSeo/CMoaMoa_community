<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MoaMoa</title>
    <link rel="stylesheet" href="/CMoaMoa/css/signup-login.css">
</head>
<body>
	<jsp:include page="/navibar.jsp"></jsp:include>
	
	<div class="body-box">
		<div class="signup-logo-box">
			<img onclick="location.href='/CMoaMoa/main.jsp'" src="/CMoaMoa/image/logo.png"/>
		</div>
		<form name="login_form" method="POST" action="loginPro.jsp">
			<input type="text" name="id" placeholder="ID" autocomplete="off">
			<input type="password" name="passwd" placeholder="Password" autocomplete="off">
			<button id="submit-btn" type="submit">로그인</button>
		</form>
	</div>
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>