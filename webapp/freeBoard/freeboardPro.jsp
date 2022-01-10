<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="write.*" %>
<%@ page import = "java.util.List" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="sp" class="write.writeBean">
	<jsp:setProperty name="sp" property="*" />
</jsp:useBean>

<% 
	String req_board_no = request.getParameter("board_no");
	System.out.println(req_board_no);
	writePro st = writePro.getInstance();
	
	sp.setBoard_no(req_board_no);
	
	List<writeBean> writeLists = null;
	writeBean writeList = null; 
	    
	%>
	   <h3><b>장바구니</b></h3>
	   <table> 
	     <tr><td >장바구니에 담긴 물품이 없습니다.</td> </tr>
	   </table>
	<%
// 	     writeLists = st.getCart(); 
	 %>
	   <h3><b>장바구니</b></h3>
	   <form name="cartform">
	   <table> 
	     <tr> 
	       <td width="50">번호</td> 
	       <td width="300">책이름</td> 
	       <td width="100">판매가격</td>
	       <td width="150">수량</td> 
	       <td width="150">금액</td>
	     </tr>
<%-- 	     <%=writeLists.get(0) %> --%>
	      
	<%
// 	   for(int i=0;i<writeLists.size();i++){
// 	     writeList = (writeBean)writeLists.get(i);
	%>
	     
	     <tr> 
	       <td width="50"></td> 
	       <td  width="300" align="left">
<%-- 	             <%=writeList.getTitle()%> --%>
	       </td> 
	     </tr>
<%-- 	<%} %> --%>

