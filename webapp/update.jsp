<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="write.*" %>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<jsp:useBean id="sp" class="write.writeBean">
	<jsp:setProperty name="sp" property="*" />
</jsp:useBean>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href = "/CMoaMoa/css/write.css">
</head>
<body>
	<jsp:include page="/navibar.jsp"></jsp:include>
	
	<%
	try {
		  Class.forName("com.mysql.jdbc.Driver");
	}
	catch (ClassNotFoundException err) {
	}
		  
		String url = "jdbc:mysql://203.252.240.73:3306/moa";
		String id = "JSP";      
		String pw = "dblab6100!@#";
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;  
		
		String req_no = request.getParameter("no");
	%>
	
	<div class="body-box">
		<form method="post" action="updatePro.jsp?no=<%=req_no %>&&board_no=<%= request.getParameter("board_no") %>" enctype="multipart/form-data" >
			<%
				try {
				conn = DriverManager.getConnection(url, id, pw);
				sql = "select * from freeboard where no="+req_no;
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				
				Cookie[] cookies = request.getCookies();
				
				int visitor = 0;
				
				while(rs.next()) {
					sp.setImage(rs.getString("image"));
					String frist = rs.getString("write_date").substring(2,10);
					String second = rs.getString("write_date").substring(11,16);
					
			%>
			
			<input type="text" class="title" placeholder="글 제목" name="title" value="<%=rs.getString("title") %>" maxlength="50">
			<%-- <input type="text" placeholder="name" name="name" value="<%=rs.getString("name") %>" maxlength="50"> --%>			
			<hr>

			<textarea class="contain" placeholder="글 내용" name="content" maxlength="1000"  style="height: 350px;"><%=rs.getString("content") %></textarea>
			
			<input class="update-file" type="file" name="image"/>
			<div><%=rs.getString("image")%></div>
			<br><br><br>
			
			<!-- 글쓰기 버튼 생성 -->
			<div class="button_box">
				<button type="submit">수정완료</button>
				<button onclick="history.go(-1);" type="button">취 소</button>
			</div>
		</form>
	<% 
	
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<script>
		$(".body-box").on("change", ".update-file", function(){
			var filename = $(".body-box .update-file").val();
		    filename = filename.match(/[^\\/]*$/)[0]; // remove C:\fakename
			$(".body-box .update-file+div").text(filename);
		});
	</script>
	</div>
</body>
</html>