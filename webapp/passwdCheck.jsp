<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="member.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="sp" class="member.memberBean">
	<jsp:setProperty name="sp" property="*" />
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href = "/CMoaMoa/css/style.css">
</head>
<body>
	<jsp:include page="/navibar.jsp"></jsp:include>
	
	<div class="body-box">
		<div class="pw-check-box">
			<%
				memberPro st = memberPro.getInstance();
				System.out.println(session.getAttribute("id").getClass().getSimpleName());
				String member_id = (String)session.getAttribute("id");
				memberBean member_info = st.getMember(member_id);
			%>
			<img class="left-img" src="/CMoaMoa/image/reload.png"/>
			<div class="txt">주기적인(<span class="blue-txt">6개월</span>) 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요.</div>
			<hr>
			<form method="POST" action="passwdCheckPro.jsp">
				<div class="pw-input-box">
					<div class="txt">현재 비밀번호</div>
					<input type="password" name="passwd" placeholder="현재 비밀번호를 입력해 주세요.
					">
				</div>
				
				<hr>
				<img class="left-img" src="/CMoaMoa/image/tip.png"/>
				<ul>
					<li>비밀번호는 8~32자의 영문 대/소문자, 숫자, 특수문자를 조합하여 사용하실 수 있어요!</li>
					<li>자주 쓰는 사이트의 비밀번호가 같을 경우, 도용되기 쉬워 주기적으로 변경하여 사용하는 것이 좋습니다.</li>
					<li>비밀번호에 특수문자를 추가하여 사용하시면 비밀번호 안전도가 높아져 도용의 위험이 줄어듭니다.</li>
				</ul>
				<hr>
				<div class="btn-box">
					<button type="button" onclick="location.href='/CMoaMoa/introMypage.jsp'">이전으로</button>
					<button type="submit">확인</button>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>