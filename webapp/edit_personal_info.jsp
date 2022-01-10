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
		
		<form method="POST" action="edit_personal_infoPro.jsp">
			<table>
				<tr>
					<td class="info-title">ID(수정불가)</td>
					<td>
						<input type="text" name="id" value=<%= member_info.getId() %> disabled>
					</td>
				</tr>
				<tr>
					<td class="info-title">Name</td>
					<td>
						<input type="text" name="name" value=<%= member_info.getName() %>>
					</td>
				</tr>
				<tr>
					<td class="info-title">Nickname</td>
					<td>
						<input type="text" name="nickname" value=<%= member_info.getNickname() %>>
					</td>
				</tr>
				<tr>
					<td class="info-title">Email</td>
					<td>
						<input type="email" name="email" value=<%= member_info.getEmail() %>>
					</td>
				</tr>
				<tr>
					<td class="info-title">Major</td>
					<td>
						<select id="selectbox" name="major">
							<option value="1">경영학부</option>
							<option value="2">글로벌경제통상학부</option>
							<option value="3">관광호텔경영학부</option>
							<option value="4">미디어콘텐츠학부</option>
							<option value="5">사회과학부</option>
							<option value="6">인문학부</option>
							<option value="7">에너지광기술융합학부</option>
							<option value="8">BT융합학부</option>
							<option value="9">소프트웨어융합학부</option>
							<option value="10">휴먼환경디자인학부</option>
							<option value="11">융합전자공학부</option>
							<option value="12">국어교육과</option>
							<option value="13">수학교육과</option>
							<option value="14">교직과</option>
							<option value="15">디자인조형학부</option>
							<option value="16">연극영화학부</option>
							<option value="17">간호학과</option>
							<option value="18">치위생학과</option>
							<option value="19">방사선학과</option>
							<option value="20">물리치료학과</option>
							<option value="21">작업치료학과</option>
							<option value="22">임상병리학과</option>
							<option value="23">보건행정헬스케어학부</option>
							<option value="24">교양학부</option>
							<option value="25">의사소통교육부</option>
							<option value="26">기초교육클리닉부</option>
							<option value="27">항공학부</option>
							<option value="28">군사학과</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="info-title">Grade</td>
					<td>
						<div class="class_radio_box">
						<% if(member_info.getYear() == 1) { %>
							<input type="radio" name="year" value="1" required checked>1학년&nbsp;
							<input type="radio" name="year" value="2" required>2학년&nbsp;
							<input type="radio" name="year" value="3" required>3학년&nbsp;
							<input type="radio" name="year" value="4" required>4학년
						<% } else if(member_info.getYear() == 2) { %>
							<input type="radio" name="year" value="1" required>1학년&nbsp;
							<input type="radio" name="year" value="2" required checked>2학년&nbsp;
							<input type="radio" name="year" value="3" required>3학년&nbsp;
							<input type="radio" name="year" value="4" required>4학년
						<% } else if(member_info.getYear() == 3) { %>
							<input type="radio" name="year" value="1" required>1학년&nbsp;
							<input type="radio" name="year" value="2" required>2학년&nbsp;
							<input type="radio" name="year" value="3" required checked>3학년&nbsp;
							<input type="radio" name="year" value="4" required>4학년
						<% } else if(member_info.getYear() == 4) { %>
							<input type="radio" name="year" value="1" required>1학년&nbsp;
							<input type="radio" name="year" value="2" required>2학년&nbsp;
							<input type="radio" name="year" value="3" required>3학년&nbsp;
							<input type="radio" name="year" value="4" required checked>4학년
						<% } %>
						</div>
					</td>
				</tr>
			</table>
			
			<button id="submit-btn" type="submit">저장</button>
		</form>
	</div>
		
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>