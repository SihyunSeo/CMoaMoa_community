<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="member.*" %>
<!DOCTYPE html>
<jsp:useBean id="sp" class="write.writeBean">
	<jsp:setProperty name="sp" property="*" />
</jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>MoaMoa</title>
<link rel="stylesheet" href = "/CMoaMoa/css/style.css">
<jsp:include page="navibar.jsp"></jsp:include>
</head>
<body>
<!------------------------------------ 게시판 상단 버튼 부분 ------------------------------------>
<div>
	<h2>내 활동 내역</h2>
</div>
<!-- ------------------------------------------------------------------------------------- -->

<div class = "board">
	<%
		memberPro st = memberPro.getInstance();
		
		String nickname = st.getNickname((String)session.getAttribute("id"));
		
		System.out.println("---------------------------------");
		System.out.println(nickname);
		System.out.println("---------------------------------");	
	%>
	<%
		try {
			  Class.forName("com.mysql.jdbc.Driver");
			  System.out.println("성공");
			} catch (ClassNotFoundException err) {
				System.out.println("실패");
			}
			  
			String url = "jdbc:mysql://203.252.240.73:3306/moa";
			String id = "JSP";      
			String pw = "dblab6100!@#";    
			 
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			String sql = null;
			
			try {
				System.out.println("혹씌 들어왔늬?0");
				conn = DriverManager.getConnection(url, id, pw);
				System.out.println("혹씌 들어왔늬?0-1");
				sql = "select * from freeboard where name='"+nickname+"'";
				System.out.println("혹씌 들어왔늬?0-2");
				ps = conn.prepareStatement(sql);
				System.out.println("혹씌 들어왔늬?0-3");
				rs = ps.executeQuery();
				while(rs.next()) {
					System.out.println("혹씌 들어왔늬?2");
					sp.setImage(rs.getString("image"));
					String frist = rs.getString("write_date").substring(2,10);
					String second = rs.getString("write_date").substring(11,16);
					%>
					<div class = "board_list_body">
						<div class = "item">
							<div>
						        <%if (rs.getString("image") != null){%>
						       		<img src="/CMoaMoa/imageFile/<%=sp.getImage() %>" border="0" width="80" height="100"/>
						        <%
						        }
						        else {
						        	%> <img src="/CMoaMoa/image/logo.png" border="0" width="80" height="100"/> <%
						        }
						        	%>
					        </div>
							<div class="tit"> <a href='freeboardDetail.jsp?no=<%=rs.getInt("no")%>'> <%=rs.getString("title") %></a> </div>
							<div><%= rs.getString("name") %></div>
							<div class="date"> <%=frist %> <%=second %> </div>
							<br><br><br><br><br><br>
							<div><%= rs.getString("content") %></div>
						</div>
					</div>
				<%} %>
		<% 
			} catch (SQLException sqlerr){
				sqlerr.printStackTrace();
			}
		%>
</div>
<!-- ----------------------------------------------------------------------------------------------------------------------- -->
</body>
</html>