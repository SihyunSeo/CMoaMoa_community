<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "member.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MoaMoa</title>
    <link rel="stylesheet" href="/CMoaMoa/css/main.css">
</head>
<body>
	<jsp:include page="/navibar.jsp"></jsp:include>
	
	<div class="body-box">
	<table class="main_board">
		<colgroup>
			<col width="25%">
			<col width="25%">
			<col width="25%">
			<col width="25%">
		</colgroup>
		<tr>
			<td rowspan=3 colspan=2>
				<div class='item-card'>
					<img src="/CMoaMoa/image/speaker_icon.png" class='speaker_img'/>
					<div class='main-board-title'><a href='#'>뉴스</a></div>
					<div class='main-board-contain'>
						인공지능소프트웨어, 제 9회 K-Hackathon 대회 장려상 수상
					</div>
					
					<div class="main_news_box">
						<img src="/CMoaMoa/image/로그인.jpg" class='news_img'/>
						<img src="/CMoaMoa/image/주차장세부내용.jpg" class='news_img'/>
					</div>
				</div>
			</td>
			<td rowspan=2>
				<div class='item-card'>
					<img src="/CMoaMoa/image/speaker_icon.png" class='speaker_img'/>
					<div class='main-board-title'><a href="/CMoaMoa/Comp_Moa_Board/Competition.jsp?board_no=111">공모전 Moa</a></div>
						<div class='main-board-contain'>
						   <ul>
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
								
								String nick_name  = request.getParameter("nickname");
								
								
								try {
									conn = DriverManager.getConnection(url, id, pw);
									sql = "select * from freeboard where board_no=111 order by write_date desc limit 4;";
									ps = conn.prepareStatement(sql);
									rs = ps.executeQuery();
									while(rs.next()) {%>
									   <li class="contain_board_title"><a href='/CMoaMoa/freeBoard/freeboardDetail.jsp?no=<%=rs.getInt("no")%>&&board_no=111'><%= rs.getString("title") %> </a></li>
						   		<%	}  %>
						   </ul>
					   </div>
			   </div>
			</td>
			<td>
				<div class='item-card'>
					<div class="login_box">
						<img src="/CMoaMoa/image/user.png"/>
						<% String nick = (String)session.getAttribute("nick");
						
						if (nick=="visitor") {%>
							<div class="btn-box" onclick="location.href='/CMoaMoa/login.jsp'">로그인</div>
							<div class="btn-box" onclick="location.href='/CMoaMoa/signup.jsp'">회원가입</div>
						<% } else { %>
						<%= nick %><br>
							<div class="btn-box" onclick="location.href='/CMoaMoa/introMypage.jsp'">마이페이지</div>
							<div class="btn-box" onclick="location.href='/CMoaMoa/logoutPro.jsp'">로그아웃</div>
						<%} %>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td rowspan=2>
				<div class='item-card'>
					<img src="/CMoaMoa/image/speaker_icon.png" class='speaker_img'/>
					<div class='main-board-title'><a href="/CMoaMoa/freeBoard/freeboard.jsp?board_no=0&&maxPage=1&&nowPage=1">자유게시판</a></div>
					<div class='main-board-contain'>
						<ul>
						<%
							sql = "select * from freeboard where board_no=0 order by write_date desc limit 7;";
							ps = conn.prepareStatement(sql);
							rs = ps.executeQuery();
							while(rs.next()) {%>
							   <li class="contain_board_title"><a href='/CMoaMoa/freeBoard/freeboardDetail.jsp?no=<%=rs.getInt("no")%>&&board_no=0'><%= rs.getString("title") %> </a></li>
				   		<%	}  %>
				   		</ul>
			   		</div>
			   </div>
			</td>
		</tr>
		<tr>
			<td>
				<div class='item-card'>
					<img src="/CMoaMoa/image/speaker_icon.png" class='speaker_img'/>
					<div class='main-board-title'><a href="/CMoaMoa/IO_Campus/InCam.jsp?board_no=121&&maxPage=1&&nowPage=1">교내・외게시판</a></div>
					<div class='main-board-contain'>
						<ul>
						<%
							sql = "select * from freeboard where board_no=121 order by write_date desc limit 4;";
							ps = conn.prepareStatement(sql);
							rs = ps.executeQuery();
							while(rs.next()) {%>
							   <li class="contain_board_title"><a href='/CMoaMoa/freeBoard/freeboardDetail.jsp?no=<%=rs.getInt("no")%>&&board_no=121'><%= rs.getString("title") %> </a></li>
				   		<%	}  %>
				   		</ul>
			   		</div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<div class='item-card'>
					<div class='banner banner-left'>
						<div class="main-board-title">각종 대회를 확인해보세요.</div>
						<div onclick="location.href='/CMoaMoa/IO_Campus/InCam.jsp?board_no=121'" class='banner-btn'>대회 소식 바로가기</div>
						<img src="/CMoaMoa/image/winner.png"/>
					</div>
				</div>
			</td>
			<td colspan=2>
				<div class='item-card'>
					<div class='banner banner-right'>
						<div class="main-board-title">당신의 역량을 팀원들과 뽐내보세요.</div>
						<div onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=112&&maxPage=1&&nowPage=1'" class='banner-btn'>팀원 모집 바로가기</div>
						<img src="/CMoaMoa/image/team.png"/>
					</div>
				</div>
			</td>
			
			<% 
				} catch (SQLException sqlerr){
					
				}			
			%>
			<!-- ---------------------------------------------------------------------------------- -->	
		</tr>
		
	</table>
	</div> 
	
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>