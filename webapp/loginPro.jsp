<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.*"%>
 
<% request.setCharacterEncoding("utf-8");%>

<%
    String id = request.getParameter("id");
	String passwd  = request.getParameter("passwd");
	
	memberPro member = memberPro.getInstance();
    int check= member.userCheck(id,passwd);

	if(check==1){ 
		session.setAttribute("id",id);  
		String nickname = member.getNickname(id); 
		System.out.println(nickname);
		response.sendRedirect("main.jsp?nickname=" + nickname);
	}else if(check==0){%>
    <script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1); 
	</script>
<%}else{ %>  
	<script>
	  alert("아이디가 맞지 않습니다..");
	  history.go(-1);
	</script>
<%}%>