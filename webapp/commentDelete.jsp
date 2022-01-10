<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "comment.*" %>
<%@ page import="java.sql.*" %>
    
<% 
	request.setCharacterEncoding("UTF-8");
%>

<%
	String prevpage = request.getHeader("Referer");

	String req_no = request.getParameter("no");

	int no = Integer.parseInt(req_no);
	
	commentPro Delete = commentPro.getInstance();
	Delete.deleteComment(no);
	
	response.sendRedirect(prevpage);
%>

<%= no %>