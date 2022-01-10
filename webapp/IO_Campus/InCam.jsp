<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<jsp:useBean id ="sp" class="write.writeBean">
	<jsp:setProperty name="sp" property="*" />
</jsp:useBean>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href = "/CMoaMoa/css/style.css">
	<title>MoaMoa</title>
</head>
<body>
	<jsp:include page="/navibar.jsp"></jsp:include>
	
	<div class="body-box">
		<!------------------------------------ 게시판 상단 버튼 부분 ------------------------------------>
		<div>
			<img class="title_left_img" src="/CMoaMoa/image/tropy.png"/>
			<div class="board_title">교내/외 경진대회</div>
			<div class="board_btn_box">
				<button class="activate-btn" onclick="location.href='/CMoaMoa/IO_Campus/InCam.jsp?board_no=121'">교내</button>
				<button onclick="location.href='/CMoaMoa/IO_Campus/OutCam.jsp?board_no=122'">교외</button>
			</div>
		</div>
		
		<!-- ----------------------------------공모전 db에서 title 및 이미지 긁어오기---------------------------------- -->
		<div class = "image-board">
			<%
				try {
					  Class.forName("com.mysql.jdbc.Driver");
					} catch (ClassNotFoundException err) {
					}
					  
					String url = "jdbc:mysql://203.252.240.73:3306/moa";
					String id = "JSP";      
					String pw = "dblab6100!@#";    
					 
					Connection conn = null;
					PreparedStatement ps = null;
					ResultSet rs = null;
					String sql = null;
					
					String req_board_no = request.getParameter("board_no");
					System.out.println(req_board_no);
					try {
					conn = DriverManager.getConnection(url, id, pw);
					sql = "select * from freeboard where board_no="+req_board_no;
					ps = conn.prepareStatement(sql);
					rs = ps.executeQuery();
					while(rs.next()) {
						sp.setImage(rs.getString("image"));
						System.out.println("----------------------------------------");
						System.out.println(rs.getString("image"));
						System.out.println("----------------------------------------");
						String frist = rs.getString("write_date").substring(2,10);
						String second = rs.getString("write_date").substring(11,16);
			
			%>
			<div onclick="location.href='/CMoaMoa/freeBoard/freeboardDetail.jsp?no=<%=rs.getInt("no")%>&&board_no=<%= req_board_no %>'" class = "item">
		        <p class="tit"> <a href='/CMoaMoa/freeBoard/freeboardDetail.jsp?no=<%=rs.getInt("no")%>&&board_no=<%= req_board_no %>'> <%=rs.getString("title") %></a></p>
		        <%if (rs.getString("image") != null){%>
		       		<img src="/CMoaMoa/imageFile/<%=sp.getImage() %>"/>
		        <%
		        }
		        else {
	        	%> <img src="/CMoaMoa/image/logo.png"/> <%
		        }
	        	%>
			</div>
			<%} %>
			<% 
				} catch (SQLException sqlerr){
					
				}
			%>
		</div>

		<button class="write-btn" type=button onclick="location.href='/CMoaMoa/write_board.jsp?board_no=121'">글쓰기</button>
	</div>
	
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>