<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%> 
<%@ page import = "likey.*" %>
<%@ page import="java.sql.*" %>
    
<%
	request.setCharacterEncoding("UTF-8");
%>

<% String no = request.getParameter("no");
	String id = request.getParameter("hakbun");
	String no_id = no+"/"+id;
	int board_no = Integer.parseInt(no);
	String prevpage = request.getHeader("Referer");

	LikeyDAO like = LikeyDAO.getInstance();
	
	int x = like.check(no_id);
	int count = like.likey(board_no);	
	System.out.println(prevpage);
	if (x==1){%>
	
		<script>
		alert("이미 추천한 게시물입니다.");	
		window.location.href = "<%=prevpage%>"
		</script>
		<%
		} else if (x==0){
		like.like(no_id, board_no, id);
		%>
		<script>	
		alert("추천하였습니다.");	
		window.location.href = "<%=prevpage%>"

		</script>
		<%
	
	}
	

%>

