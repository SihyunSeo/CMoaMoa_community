<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comment.*" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="sp" class="comment.commentBean">
	<jsp:setProperty name="sp" property="*" />
</jsp:useBean>
<%
 
commentPro st = commentPro.getInstance();
String prevpage = request.getHeader("Referer");

String req_no = request.getParameter("auto_no"); 

int auto_no = Integer.parseInt(req_no); 

String com_content = request.getParameter("com_content");

sp.setCom_content(com_content);
st.updateComment(sp, auto_no);

response.sendRedirect(prevpage);

 %>

