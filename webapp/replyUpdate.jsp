<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reply.*" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="sp" class="reply.replyBean">
	<jsp:setProperty name="sp" property="*" />
</jsp:useBean>
<%
 
replyPro st = replyPro.getInstance();
String prevpage = request.getHeader("Referer");

String req_no = request.getParameter("auto_no"); 

int auto_no = Integer.parseInt(req_no); 

String rep_content = request.getParameter("rep_content");

sp.setRep_content(rep_content);
st.updateReply(sp, auto_no);

response.sendRedirect(prevpage);

 %>

