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
	if(sp.getMajor().equals("1")) {
		sp.setMajor("경영학부");
	}
	else if(sp.getMajor().equals("2")) {
		sp.setMajor("글로벌경제통상학부");
	}
	else if(sp.getMajor().equals("3")) {
		sp.setMajor("관광호텔경영학부");
	}
	else if(sp.getMajor().equals("4")) { 
		sp.setMajor("미디어콘텐츠학부");
	}
	else if(sp.getMajor().equals("5")) {
		sp.setMajor("사회과학부");
	}
	else if(sp.getMajor().equals("6")) {
		sp.setMajor("인문학부");
	}
	else if(sp.getMajor().equals("7")) {
		sp.setMajor("에너지광기술융합학부");
	}
	else if(sp.getMajor().equals("8")) {
		sp.setMajor("BT융합학부");
	}
	else if(sp.getMajor().equals("9")) {
		sp.setMajor("소프트웨어융합학부");
	}
	else if(sp.getMajor().equals("10")) {
		sp.setMajor("휴먼환경디자인학부");
	}
	else if(sp.getMajor().equals("11")) {
		sp.setMajor("융합전자공학부");
	}
	else if(sp.getMajor().equals("12")) {
		sp.setMajor("국어교육과");
	}
	else if(sp.getMajor().equals("13")) {
		sp.setMajor("수학교육과");
	}
	else if(sp.getMajor().equals("14")) {
		sp.setMajor("교직과");
	}
	else if(sp.getMajor().equals("15")) {
		sp.setMajor("디자인조형학부");
	}
	else if(sp.getMajor().equals("16")) {
		sp.setMajor("연극영화학부");
	}
	else if(sp.getMajor().equals("17")) {
		sp.setMajor("간호학과");
	}
	else if(sp.getMajor().equals("18")) {
		sp.setMajor("치위생학과");
	}
	else if(sp.getMajor().equals("19")) {
		sp.setMajor("방사선학과");
	}
	else if(sp.getMajor().equals("20")) {
		sp.setMajor("물리치료학과");
	}
	else if(sp.getMajor().equals("21")) {
		sp.setMajor("작업치료학과");
	}
	else if(sp.getMajor().equals("22")) {
		sp.setMajor("임상병리학과");
	}
	else if(sp.getMajor().equals("23")) {
		sp.setMajor("보건행정헬스케어학부");
	}
	else if(sp.getMajor().equals("24")) {
		sp.setMajor("교양학부");
	}
	else if(sp.getMajor().equals("25")) {
		sp.setMajor("의사소통교육부");
	}
	else if(sp.getMajor().equals("26")) {
		sp.setMajor("기초교육클리닉부");
	}
	else if(sp.getMajor().equals("27")) {
		sp.setMajor("항공학부");
	}
	else if(sp.getMajor().equals("28")) {
		sp.setMajor("군사학과");
	}
	
	st.insertMember(sp);
	
	response.sendRedirect("main.jsp");
%>


