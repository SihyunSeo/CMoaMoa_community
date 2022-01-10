<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
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
</head>
<body>
	<jsp:include page="/navibar.jsp"></jsp:include>
	
	<div class="body-box">
		<div>
		<%
		ArrayList<ArrayList> boardList = new ArrayList<ArrayList>();
		
		String req_no = request.getParameter("board_no");
		if (req_no.equals("0")) {%>
				<img class="title_left_img" src="/CMoaMoa/image/freeboard.png"/>
				<div class="board_title">자유게시판</div>
				<div class="board_btn_box" style="border-bottom:none; padding:10px"></div>
		<% } else if (req_no.equals("112")) {%>
				<img class="title_left_img" src="/CMoaMoa/image/tropy(공모).png"/>
				<div class="board_title">공모전</div>
				<div class="board_btn_box">
					<button onclick="location.href='/CMoaMoa/Comp_Moa_Board/Competition.jsp?board_no=111'">소식</button>
					<button class="activate-btn" onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=112&&maxPage=1&&nowPage=1'">팀</button>
				</div>
		<% } else if ((req_no.equals("1")) || (req_no.equals("2")) || (req_no.equals("3"))) {%>
				<img class="title_left_img" src="/CMoaMoa/image/freeboard.png"/>
				<div class="board_title">비즈니스대학</div>
				<div class="board_btn_box">
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=1&&maxPage=1&&nowPage=1'">경영학부</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=2&&maxPage=1&&nowPage=1'">글로별경제통상학부</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=3&&maxPage=1&&nowPage=1'">관광호텔경영학부</button>
				</div>
				<script>					
					$(".board_btn_box > button").eq(<% out.print(Integer.parseInt(req_no)-1); %>).addClass('activate-btn');
				</script>
		<% } else if ((req_no.equals("4")) || (req_no.equals("5")) || (req_no.equals("6"))) {%>
				<img class="title_left_img" src="/CMoaMoa/image/freeboard.png"/>
				<div class="board_title">인문사회대학</div>
				<div class="board_btn_box">
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=4&&maxPage=1&&nowPage=1'">미디어콘텐츠학부</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=5&&maxPage=1&&nowPage=1'">사회과학부</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=6&&maxPage=1&&nowPage=1'">인문학부</button>
				</div>
				<script>					
					$(".board_btn_box > button").eq(<% out.print(Integer.parseInt(req_no)-4); %>).addClass('activate-btn');
				</script>
		<% } else if ((req_no.equals("7")) || (req_no.equals("8")) || (req_no.equals("9")) || (req_no.equals("10")) || (req_no.equals("11"))) {%>
				<img class="title_left_img" src="/CMoaMoa/image/freeboard.png"/>
				<div class="board_title">공과대학</div>
				<div class="board_btn_box">
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=7&&maxPage=1&&nowPage=1'">에너지광기술융합학부</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=8&&maxPage=1&&nowPage=1'">BT융합학부</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=9&&maxPage=1&&nowPage=1'">소프트웨어융합학부</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=10&&maxPage=1&&nowPage=1'">휴먼환경디자인학부</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=11&&maxPage=1&&nowPage=1'">융합전자공학부</button>
				</div>
				<script>					
					$(".board_btn_box > button").eq(<% out.print(Integer.parseInt(req_no)-7); %>).addClass('activate-btn');
				</script>
		<% } else if ((req_no.equals("12")) || (req_no.equals("13")) || (req_no.equals("14"))) {%>
				<img class="title_left_img" src="/CMoaMoa/image/freeboard.png"/>
				<div class="board_title">사범대학</div>
				<div class="board_btn_box">
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=12&&maxPage=1&&nowPage=1'">국어교육과</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=13&&maxPage=1&&nowPage=1'">수학교육과</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=14&&maxPage=1&&nowPage=1'">교직과</button>
				</div>
				<script>					
					$(".board_btn_box > button").eq(<% out.print(Integer.parseInt(req_no)-12); %>).addClass('activate-btn');
				</script>
		<% } else if ((req_no.equals("15")) || (req_no.equals("16"))) {%>
				<img class="title_left_img" src="/CMoaMoa/image/freeboard.png"/>
				<div class="board_title">예술대학</div>
				<div class="board_btn_box">
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=15&&maxPage=1&&nowPage=1'">디자인조형학부</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=16&&maxPage=1&&nowPage=1'">연극영화학부</button>
				</div>
				<script>					
					$(".board_btn_box > button").eq(<% out.print(Integer.parseInt(req_no)-15); %>).addClass('activate-btn');
				</script>
		<% } else if ((req_no.equals("17")) || (req_no.equals("18")) || (req_no.equals("19")) || (req_no.equals("20")) || (req_no.equals("21")) || (req_no.equals("22")) || (req_no.equals("23"))) {%>
				<img class="title_left_img" src="/CMoaMoa/image/freeboard.png"/>
				<div class="board_title">보건의료과학대학</div>
				<div class="board_btn_box">
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=17&&maxPage=1&&nowPage=1'">간호학과</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=18&&maxPage=1&&nowPage=1'">치위생학과</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=19&&maxPage=1&&nowPage=1'">방사선학과</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=20&&maxPage=1&&nowPage=1'">물리치료학과</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=21&&maxPage=1&&nowPage=1'">작업치료학과</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=22&&maxPage=1&&nowPage=1'">임상병리학과</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=23&&maxPage=1&&nowPage=1'">보건행정헬스케어학부</button>
				</div>
				<script>					
					$(".board_btn_box > button").eq(<% out.print(Integer.parseInt(req_no)-17); %>).addClass('activate-btn');
				</script>
		<% } else if ((req_no.equals("24")) || (req_no.equals("25")) || (req_no.equals("26"))) {%>
				<img class="title_left_img" src="/CMoaMoa/image/freeboard.png"/>
				<div class="board_title">교양대학</div>
				<div class="board_btn_box">
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=24&&maxPage=1&&nowPage=1'">교양학부</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=25&&maxPage=1&&nowPage=1'">의사소통교육부</button>
					<button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=26&&maxPage=1&&nowPage=1'">기초교육클리닉부</button>
				</div>
				<script>					
					$(".board_btn_box > button").eq(<% out.print(Integer.parseInt(req_no)-24); %>).addClass('activate-btn');
				</script>
		<% } else if ((req_no.equals("27"))) {%>
				<img class="title_left_img" src="/CMoaMoa/image/freeboard.png"/>
				<div class="board_title">항공학부</div>
				<div class="board_btn_box">
					<button class="activate-btn" onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=27&&maxPage=1&&nowPage=1'">항공학부</button>
				</div>
		<% } else if ((req_no.equals("28"))) {%>
				<img class="title_left_img" src="/CMoaMoa/image/freeboard.png"/>
				<div class="board_title">군사학과</div>
				<div class="board_btn_box">
					<button class="activate-btn" onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=28&&maxPage=1&&nowPage=1'">군사학과</button>
				</div>
		<% } else if ((req_no.equals("131"))) {%>
				<div class="board_title">내 활동 내역</div>
				<div class="board_btn_box" style="border-bottom:none"></div>
		<% } %>
		</div>

		<div class = "text-board">
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
				%>
			
			<div class="sort-search-box">
				<!-- 정렬 시작 -->
				<form method="post" action="/CMoaMoa/order_board.jsp">
					<select class="form-control" id="orderby"  onchange="if(this.value) location.href='/CMoaMoa/order_board.jsp?orderby='+(this.value)+'&board_no='+<%=req_board_no%>+'&&maxPage=1&&nowPage=1';">
						 <option value="asc_date">날짜 오름차순</option>
		                  <option value="desc_date">날짜 내림차순</option>
		                  <option value="asc_views">조회수 오름차순</option>
		                  <option value="desc_views">조회수 내림차순</option>
					</select>
				</form>
				<!-- 정렬 끝 -->
				
				<%
					if((req_no.equals("131"))) {%>
						<div></div>
				<%} else {%>
				<!-- 게시물 검색 시작 -->
				<form method="post" name="search" action="/CMoaMoa/searchbbs.jsp?board_no=<%= req_board_no %>">
					<select class="form-control" name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="name">닉네임</option>
					</select>
					<input type="text" class="form-control"
						placeholder="검색어 입력" name="searchText" maxlength="100">
					<button type="submit" class="btn btn-success">검색</button>
				</form>
				<%}%>
				<!-- 게시물 검색 끝 -->
			</div>
			<br><br><br>
			<%
			try {
	               conn = DriverManager.getConnection(url, id, pw);
	               if(req_board_no.equals("131")) {
	                  memberPro st = memberPro.getInstance();
	                     String nickname = st.getNickname((String)session.getAttribute("id"));
	                     
	                    
	                      sql = "select * from freeboard where name='"+nickname+"'";
	                   } 
	                   else {
	                      sql = "select * from freeboard where board_no="+req_board_no;
	                   }
	               ps = conn.prepareStatement(sql);
	               rs = ps.executeQuery();
	               while(rs.next()) {
	            	  sp.setImage(rs.getString("image"));
	                  String frist = rs.getString("write_date").substring(2,10);
	                  String second = rs.getString("write_date").substring(11,16);
	                  String boardImage = sp.getImage();
	                  String boardNo = Integer.toString(rs.getInt("no"));
	                  String boardTitle = rs.getString("title");
	                  String writerName = rs.getString("name");
	                  String boardViews = Integer.toString(rs.getInt("views"));
	                  String boardContent = rs.getString("content");
					  ArrayList<String> boardInfo = new ArrayList<String>() {{
						  add(boardImage);
		            	  add(boardNo);
		            	  add(boardTitle);
		            	  add(writerName);
		            	  add(boardViews);
		            	  add(frist);
		            	  add(second);
		            	  add(boardContent);
					  }};
	            	  boardList.add(boardInfo);
	            	  
			%>
			<%} %>
			<%
				//게시물 10개 단위로 끊어서 보여주기
				String maxPage = request.getParameter("nowPage");
				int mp = Integer.parseInt(maxPage);
				int startIdx = (mp-1) * 10;
				
				for(int i = startIdx ; i < startIdx+10; i ++) {
					try{
						if(boardList.get(i).get(1) == null){
							break;
						}
						%>
						<div onclick="location.href='/CMoaMoa/freeBoard/freeboardDetail.jsp?no=<%=boardList.get(i).get(1)%>&&board_no=<%= req_board_no %>'" class = "item">
					        <%if (boardList.get(i).get(0) != null){%>
					       		<img src="/CMoaMoa/imageFile/<%=boardList.get(i).get(0) %>" border="0" width="80" height="100"/>
					        <%
					        }
					        else {
					        	%> <img src="/CMoaMoa/image/logo.png" border="0" width="80" height="100"/> <%
					        }
					        	%>
							<div class="tit"> <%=boardList.get(i).get(2) %> </div>
			        		<div class="info">
								<div class="name"><%=boardList.get(i).get(3) %></div>
								<div class="views"><%=boardList.get(i).get(4) %></div>
								<div class="date"> <%=boardList.get(i).get(5) %> <%=boardList.get(i).get(6) %> </div>
							</div>
							<div class="content"><%= boardList.get(i).get(7) %></div>
						</div>
					<%}
					catch(IndexOutOfBoundsException e) {
						continue;
					}
				}
			%>
		<% 
			} catch (SQLException sqlerr){
				
			}
		%>
		<%
			int maxPage = (boardList.size())/10 + 1;
			int nowPage;%>
			<div class="page-box">
			<%
// 			for(int i = maxPage; i > 0; i --) {
			for(int i = 1; i <= maxPage; i ++) {
						if (Integer.parseInt(request.getParameter("nowPage")) == i ) {%>
							<button class="page-btn current" type=button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=<%= req_board_no %>&&maxPage=<%= maxPage %>&&nowPage=<%= i %>'"><%= i %></button>	
						<%} else {%>
							<button class="page-btn" type=button onclick="location.href='/CMoaMoa/freeBoard/freeboard.jsp?board_no=<%= req_board_no %>&&maxPage=<%= maxPage %>&&nowPage=<%= i %>'"><%= i %></button>
						<%}
			}%>
			</div>
	<%
		%>
		<%
			if(request.getParameter("board_no").equals("131")) {%>
			<div></div>
		<%} else {%>
			<br><br><br>
			<div>
			  	<button class="write-btn" type=button onclick="location.href='/CMoaMoa/write_board.jsp?board_no=<%= req_board_no %>'">글쓰기</button>
			</div>
		<%}%>
	</div>
	</div>
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>