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
	<title>MoaMoa</title>
    <link rel="stylesheet" href="/CMoaMoa/css/mypage.css">
</head>
<body>
	<jsp:include page="/navibar.jsp"></jsp:include>

	<%
	   memberPro st = memberPro.getInstance();
	   String member_id = (String)session.getAttribute("id");
	   memberBean member_info = st.getMember(member_id);
	%>
	
	<div class="body-box">
		<div class="txt">내 정보를 <span class="blue-txt">최신정보로 관리</span>해 주세요.</div>
		<div class="txt">아이디/비밀번호 분실 및 보호조치 해제를 위해 최신 정보로 내정보를 관리하세요.</div>
		
		<table>
			<tr>
				<td class="info-title">ID(수정불가)</td>
				<td>
					<%= member_info.getId() %>
				</td>
			</tr>
			<tr>
				<td class="info-title">Name</td>
				<td>
					<%= member_info.getName() %>
				</td>
			</tr>
			<tr>
				<td class="info-title">Nickname</td>
				<td>
					<%= member_info.getNickname() %>
				</td>
			</tr>
			<tr>
				<td class="info-title">Email</td>
				<td>
					<%= member_info.getEmail() %>
				</td>
			</tr>
			<tr>
				<td class="info-title">Major</td>
				<td>
					<%= member_info.getMajor() %>
				</td>
			</tr>
			<tr>
				<td class="info-title">Grade</td>
				<td>
					<div class="class_radio_box">
					<% if(member_info.getYear() == 1) { %>
						<input type="radio" name="year" value="1" required checked disabled>1학년&nbsp;
						<input type="radio" name="year" value="2" required disabled>2학년&nbsp;
						<input type="radio" name="year" value="3" required disabled>3학년&nbsp;
						<input type="radio" name="year" value="4" required disabled>4학년
					<% } else if(member_info.getYear() == 2) { %>
						<input type="radio" name="year" value="1" required disabled>1학년&nbsp;
						<input type="radio" name="year" value="2" required checked disabled>2학년&nbsp;
						<input type="radio" name="year" value="3" required disabled>3학년&nbsp;
						<input type="radio" name="year" value="4" required disabled>4학년
					<% } else if(member_info.getYear() == 3) { %>
						<input type="radio" name="year" value="1" required disabled>1학년&nbsp;
						<input type="radio" name="year" value="2" required disabled>2학년&nbsp;
						<input type="radio" name="year" value="3" required checked disabled>3학년&nbsp;
						<input type="radio" name="year" value="4" required disabled>4학년
					<% } else if(member_info.getYear() == 4) { %>
						<input type="radio" name="year" value="1" required disabled>1학년&nbsp;
						<input type="radio" name="year" value="2" required disabled>2학년&nbsp;
						<input type="radio" name="year" value="3" required disabled>3학년&nbsp;
						<input type="radio" name="year" value="4" required checked disabled>4학년
					<% } %>
					</div>
				</td>
			</tr>
		</table>
		
		<button id="submit-btn" type="button" onclick="location.href='edit_personal_info.jsp'">수정</button>
	</div>
		
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>