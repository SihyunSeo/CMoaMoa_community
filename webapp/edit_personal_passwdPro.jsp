<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="member.memberPro" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="sp" class="member.memberBean">
	<jsp:setProperty name="sp" property="*" />
</jsp:useBean>

<% 
	memberPro st = memberPro.getInstance(); 
	String member_id = ((String)session.getAttribute("id"));
	
	sp.setId(member_id);
	st.updateMemberPasswd(sp);
%>

<script>
    alert("비밀번호가 변경되었습니다.");
	location.href="introMypage.jsp";
</script>


