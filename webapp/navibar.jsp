<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <!-- ::::::::::::::All JS Files here :::::::::::::: -->
    <script src="/CMoaMoa/assets/js/jquery-3.5.1.min.js"></script>
    <!-- Main JS -->
    <script src="/CMoaMoa/assets/js/main.js"></script>
    
    <!-- Vendor CSS -->
    <link rel="stylesheet" href="/CMoaMoa/assets/css/font-awesome.min.css">

    <!-- Main CSS -->
    <!--  <link rel="stylesheet" href="/CMoaMoa/assets/css/bootstrap.css">
    -->
    <link rel="stylesheet" href="/CMoaMoa/assets/css/style.css">
</head>
<style>
	@font-face {
	    font-family: '나눔스퀘어R';
	    src: url('/CMoaMoa/font/NanumSquareR.ttf') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	@font-face {
	    font-family: '나눔스퀘어B';
	    src: url('/CMoaMoa/font/NanumSquareB.ttf') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	*{
		font-family: '나눔스퀘어R';
		margin: 0;
		padding: 0;
    	box-sizing: border-box;
	}
	a:active {
		color : black;
		text-decoration: none;
	}
	a:link {
		color : black;
		text-decoration: none;
	}
	a:visited {
		color: black; 
		text-decoration: none;
	}
 	a:hover { 
 		color: black; 
 		/*text-decoration: underline;*/ 
		text-decoration: none;
 	}
 	
 	header{
 		height: 100px;
 		padding-top: 10px;
 		margin: 0;
    	/*box-shadow: 0px 0px 3px rgba(100, 100, 100, 0.2), 0px 0px 3px rgba(100, 100, 100, 0.2);*/
 	}
 	.header-inner{
 		position: relative;
 		width: 1280px;
 		height: 100%;
 		margin: 0 auto;
 	}
 	.nav-logo-box{
 		vertical-align: top;
 		/*float: left;
 		margin-top: 10px;
 		margin-left: 100px;*/
 		cursor: pointer;
 	}
 	.nav-logo-box img{
 		vertical-align: top;
 		height: 50px;
 		width: auto;
	}
 	.header-inner nav{
 		display: block;
 		margin: 0 auto;
 		text-align: center;
 	}
 	.header-inner nav > ul >li{
 		margin-left: 25px !important;
 		margin-right: 25px !important;
 	}
 	.header-inner nav li{
 		vertical-align: top;
 		list-style: none;
 	}
 	.header-inner nav a{
 		width: 200px;
		font-family: '나눔스퀘어B' !important;
		font-size: 20px !important;
 	}
 	
 	.body-box{
 		position: relative;
 		width: 1280px;
 		margin: 0 auto;
 	}
</style>
</head>
<body>
    <!-- ...:::: Start Header Section:::... -->
    <header>
        <div class="header-inner">
			<!-- Header Main Menu -->
			<div class="main-menu">
			                 
				<nav>
					<ul>
					<li class="has-dropdown">					
						<div class="nav-logo-box" onclick="location.href='/CMoaMoa/main.jsp'">
							<img src="/CMoaMoa/image/logo.png"/>
						</div>
					</li>
						<li class="has-dropdown">
							<a href="#">학부게시판 <i class="fa fa-angle-down"></i></a>
							<!-- Sub Menu -->
							<ul class="sub-menu">
								<li><a href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=1&&maxPage=1&&nowPage=1'>비즈니스대학</a></li>
					            <li><a href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=4&&maxPage=1&&nowPage=1'>인문사회대학</a></li>
					            <li><a href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=7&&maxPage=1&&nowPage=1'>공과대학</a></li>
					            <li><a href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=12&&maxPage=1&&nowPage=1'>사범대학</a></li>
					            <li><a href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=15&&maxPage=1&&nowPage=1'>예술대학</a></li>
					            <li><a href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=17&&maxPage=1&&nowPage=1'>보건의료과학대학</a></li>
					            <li><a href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=24&&maxPage=1&&nowPage=1'>교양대학</a></li>
					            <li><a href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=27&&maxPage=1&&nowPage=1'>항공학부</a></li>
					            <li><a href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=28&&maxPage=1&&nowPage=1'>군사학과</a></li>
							</ul>
						</li>
						<li class="has-dropdown">
							<a href="/CMoaMoa/Comp_Moa_Board/Competition.jsp?board_no=111">공모전 Moa</a>
						</li>
						<li class="has-dropdown">
							<a href="/CMoaMoa/IO_Campus/InCam.jsp?board_no=121">교내/외 Moa</i></a>
						</li>
						<li class="has-dropdown">
							<a href="/CMoaMoa/freeBoard/freeboard.jsp?board_no=0&&maxPage=1&&nowPage=1">자유게시판</a>
						</li>
					</ul>
				</nav>
			</div> <!-- Header Main Menu Start -->
		</div> <!-- End Bottom Area -->
		<div style=display:none;>
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
				String nickname = null;
				
				try {
					conn = DriverManager.getConnection(url, id, pw);
					sql = "select * from member where id ="+ session.getAttribute("id");
					ps = conn.prepareStatement(sql);
					rs = ps.executeQuery();
					if(rs.next()) {
						nickname = rs.getString("nickname");
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				if (nickname != null){
					session.setAttribute("nick",rs.getString("nickname"));
				}else{
					nickname = "visitor";
					session.setAttribute("nick",nickname);
				}
			%>
			(<%= nickname %>) <a href="/CMoaMoa/logoutPro.jsp">로그아웃</a>
		</div>
    </header> <!-- ...:::: End Header Section:::... -->
</body>
</html>