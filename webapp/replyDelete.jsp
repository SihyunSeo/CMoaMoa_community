<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "reply.*" %>
<%@ page import="java.sql.*" %>
    
<% 
	request.setCharacterEncoding("UTF-8");
%>

<%
	String prevpage = request.getHeader("Referer");

	String req_no = request.getParameter("no");

	int no = Integer.parseInt(req_no);
	
	replyPro Delete = replyPro.getInstance();
	Delete.deleteReply(no);
	
	response.sendRedirect(prevpage);
%>

