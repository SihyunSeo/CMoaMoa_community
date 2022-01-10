<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<jsp:useBean id ="sp" class="write.writeBean">
	<jsp:setProperty name="sp" property="*" />
</jsp:useBean>
<html>
<head>
	<meta charset="UTF-8">
	<title>MoaMoa</title>
	<link rel="stylesheet" href = "/CMoaMoa/css/style.css">
</head>
<body>
	<jsp:include page="/navibar.jsp"></jsp:include>
	
	<div class="body-box">
		<div class = "mypage-box">
			<img src="/CMoaMoa/image/logo.png"/>
			<p class="title">프로필</p>
			<p class="contain">'나'를 표현하는 프로필 정보입니다.
			수정 화면에서 나의 정보를 변경해보세요.</p>
			<button onclick="location.href='/CMoaMoa/mypage.jsp'">수정</button>
		</div>
		
		<div class = "mypage-box">
			<img src="/CMoaMoa/image/logo.png"/>
			<p class="title">비밀번호</p>
			<p class="contain">로그인 시 사용하는 비밀번호를 변경하거나 안전한 로그인을 위한 기능을 설정할 수 있습니다.<br>
			주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요.</p>
			<button onclick="location.href='/CMoaMoa/passwdCheck.jsp'">변경</button>
		</div>
		
		<div class = "mypage-box">
			<img src="/CMoaMoa/image/logo.png"/>
			<p class="title">내 활동 내역</p>
			<p class="contain">내 활동내역을 한번에 확인해보세요.</p>
			<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=131&&maxPage=1&&nowPage=1'">조회</button>
		</div>
	</div>
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>