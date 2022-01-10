<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reply.*" %>
<%@ page import="java.sql.*" %> 
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String rep_no = request.getParameter("rep_no");
	String rep_name = request.getParameter("rep_name");
	String rep_content = request.getParameter("rep_content");
	
	String prevpage = request.getHeader("Referer");

	int rep_no_int = Integer.parseInt(rep_no);
	
	replyPro reply = replyPro.getInstance();
	
	reply.wirteReply(rep_no_int, rep_name, rep_content);
	response.sendRedirect(prevpage);

	
%>


