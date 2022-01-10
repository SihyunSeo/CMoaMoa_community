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
	int result = st.checkMemberPasswd(sp, member_id);
	
// 	out.println(sp);
// 	out.println(result);
	
	if (result == 1) {%>
		<script>
			location.href="edit_personal_passwd.jsp";
		</script>
	<%}
	else {%>
		<script> 
		  alert("비밀번호를 확인해주세요."); 
	      history.go(-1); 
		</script>
	<%}
%>


