<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comment.*" %>
<%@ page import="java.sql.*" %> 

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="sp" class="comment.commentBean">
	<jsp:setProperty name="sp" property="*" />
</jsp:useBean>

<%
	commentPro Comment = commentPro.getInstance();

	String prevpage = request.getHeader("Referer");
	String req_no = request.getParameter("no");
	int no = Integer.parseInt(req_no);
	
	String form_name = request.getParameter("name");
	System.out.print(form_name);
// 	String form_com_content = request.getParameter("commentText");
// 	String form_com_write_date = request.getParameter("name");
// 	String test = request.getParameter("test");

	
	sp.setName(form_name);
// 	sp.setCom_content(test);
// 	sp.setCom_content(com_content);
	
	Comment.writeComment(sp, no); 
// 	System.out.print(test);
%>

<%
	response.sendRedirect(prevpage);
%>