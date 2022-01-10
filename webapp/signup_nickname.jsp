<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="member.memberPro" %>

<% request.setCharacterEncoding("utf-8"); 
	String id = request.getParameter("nickname");

	memberPro mdao = memberPro.getInstance();
	boolean result = mdao.confirmId(id);
	
	if(result){%>
	<center>
	<br>
	<h4>이미 사용중인 아이디입니다.</h4>
	
	</center>

	<%}else { %>
	<center>
	<br>
	<h4>입력하신 <%= id %>는 사용하실 수 있는 ID입니다.</h4>
	
	</center> 
	
	<%} %>
	<button onclick="window.close()"> 확인 </button>
