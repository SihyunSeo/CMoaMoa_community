<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="member.*" %>
<%@ page import="write.*" %>
<%@ page import="java.util.*"%>
<%@ page import = "likey.*" %>

<!DOCTYPE html>
<jsp:useBean id="sp" class="write.writeBean">
	<jsp:setProperty name="sp" property="*" />
</jsp:useBean>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href = "/CMoaMoa/css/write.css">
	<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/navibar.jsp"></jsp:include>
	
	<script>
		$(document).ready(function(){
			$(".edit-btn").on('click', function(){
				$($(this).parent()).find(".modify_txt").show();
				//$('.modify_txt').show();
				
				$( $(this).parent() ).css('border', '0 solid #320DFD').animate({borderWidth:2}, 300);
				$($(this).parent()).find(".modify_cancle").hide();
				//$('.modify_cancle').hide();
				$(this).next().show();
				//$(".editbtn").hide();
				$($(this).parent()).find(".editbtn").hide();
				$($(this).parent()).find(".modify_btn").show();
				$($(this).parent()).find(".modify_cancle").show();
				//$(".modify_btn").show();
				//$(".modify_cancle").show();
			});
			$(".modify_cancle").on('click', function(){
				$('.editbtn').show();
				/*$( $(this).parent() ).css('border', '2px solid #gray');*/
				$($( $(this).parent() ).parent()).css('border', '2px solid #D9D9D9').animate({borderWidth:2}, 300);
				$('.modify_txt').hide();
				$(".modify_btn").hide();
				$('.modify_cancle').hide();
			})
		})
		
		$(document).ready(function(){
			$(".reply").on('click', function(){
				$($(this).parent()).find(".reply_txt").show();
			})
			$(".reply_cancel_btn").on('click', function(){
				$($(this).parent().parent()).find(".reply_txt").hide();
			})
// 			$(".reply").on('click', function(){
// 				(".reply_txt").show();
// 			})
// 			$(".reply_cancel_btn").on('click', function(){
// 				(".reply_txt").hide();
// 			})
		})
		
	</script>  <!-- 폼 띄우기 까지 함 -->

	<%
		ArrayList<ArrayList> replyList = new ArrayList<ArrayList>();
		ArrayList<ArrayList> commentList = new ArrayList<ArrayList>();
		request.setCharacterEncoding("utf-8");
	
		String nick = (String)session.getAttribute("nick");
		String hakbun = (String)session.getAttribute("id");
		String no = "";
		String req_no = request.getParameter("no");
		String board_no = request.getParameter("board_no");
		
		int y = Integer.parseInt(req_no);
		
		System.out.println(y);
		
		LikeyDAO like = LikeyDAO.getInstance();
		writePro write = writePro.getInstance();
		
		int board_no_int = Integer.parseInt(board_no);
		int no_int = Integer.parseInt(req_no);

		int next_no = write.next_board(board_no_int, no_int);
		int prev_no = write.prev_board(board_no_int, no_int);
		
		int like_count = like.likey(y);
		
		if (nick == "visitor"){%>
			<script>
	    		alert("로그인을 하셔야 게시글을 볼 수 있습니다.");	
	    		history.back();
			</script>
		<% 
		}
		else{		
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
		
		
			
		try {
		conn = DriverManager.getConnection(url, id, pw);
		sql = "select * from freeboard where no="+req_no; 
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		int count = sp.getViews();
		
		Cookie[] cookies = request.getCookies();
		int visitor = 0;
		
		if(rs.next()) {
			sp.setImage(rs.getString("image"));
			count = rs.getInt("views");
			count++;
			String frist = rs.getString("write_date").substring(2,10);
			String second = rs.getString("write_date").substring(11,16);
			no = String.valueOf(rs.getInt("no"));
	%>

	<div class="body-box">
		<div class="title"><%=rs.getString("title")%></div>
		<div class="name"><%=rs.getString("name") %></div>
		<div class="date"> <%=frist %> <%=second %></div>
		<div class="views"><%=rs.getInt("views") %></div>
        <br>
		<hr>
		<button class="like-btn" onclick="location.href='/CMoaMoa/like.jsp?no=<%=no%>&&hakbun=<%=hakbun%>'">추천 <%=like_count %></button>
		<div class="content-box">
	        <%if (rs.getString("image") != null){%>
	       		<img class="content-img" src="/CMoaMoa/imageFile/<%=sp.getImage() %>"/>
	        <%
	        }
	        else {
	       	%><p style="text-align: center; margin: 50px auto; color: gray">첨부된 이미지가 없습니다.</p><%
	        }
	       	%>
			<p><%=rs.getString("content")%></p>
		        	
		    <%if(nick.equals(rs.getString("name"))) {%>
			    <button class="go-list-btn" type="button" onclick = "location.href='/CMoaMoa/update.jsp?no=<%=no%>&&board_no=<%=board_no %>'"> 수정하기 </button>
			    <button class="go-list-btn" type="button" onclick = "button_event();"> 삭제하기 </button>
			    
			    <script type="text/javascript">
			    	function button_event(){
			    		if(confirm("정말 삭제하시겠습니까?") == true){
			    			location.href='../delete.jsp?no=<%=no%>&&board_no=<%= request.getParameter("board_no") %>'
			    		}else{
			    			return
			    		}
			    	}
			    </script>
		    <%}%>
			
			<%
	         if(request.getParameter("board_no").equals("111")){ %>
	            <button class="go-list-btn" onclick="location.href = '/CMoaMoa/Comp_Moa_Board/Competition.jsp?board_no=<%= request.getParameter("board_no")%>'">목록</button>
	      <%} else if(request.getParameter("board_no").equals("121")) {%>
	            <button class="go-list-btn" onclick="location.href = '/CMoaMoa/IO_Campus/InCam.jsp?board_no=<%= request.getParameter("board_no")%>'">목록</button>
	      <%} else if(request.getParameter("board_no").equals("122")) {%>
	            <button class="go-list-btn" onclick="location.href = '/CMoaMoa/IO_Campus/OutCam.jsp?board_no=<%= request.getParameter("board_no")%>'">목록</button>
	      <%} else {%>
	            <button class="go-list-btn" onclick="location.href = '/CMoaMoa/freeBoard/freeboard.jsp?board_no=<%= request.getParameter("board_no")%>&&maxPage=1&&nowPage=1'">목록</button>
	    <%} %>
		</div>
		<br><br><br>
	    
	    <script type="text/javascript">
	    	function button_event1(no){
	    		if(confirm("댓글을 정말 삭제하시겠습니까?") == true){
	    			location.href="/CMoaMoa/commentDelete.jsp?no="+no;
	    		}
	    		else{
	    			return
	    		}
	    	}
		    function button_event2(no){
	    		if(confirm("댓글을 정말 삭제하시겠습니까?") == true){
	    			location.href="/CMoaMoa/replyDelete.jsp?no="+no;
	    		}
	    		else{
	    			return
	    		}
		    }
		</script>
				
		<!-- 댓글 입력 부분 -->
		<div class="comment-box">
	    	<%if(next_no == 0 && prev_no != 0){%>
                <button class="like-btn" onclick="location.href='/CMoaMoa/freeBoard/freeboardDetail.jsp?board_no=<%=board_no%>&&no=<%=prev_no%>'">이전글</button>
            <%}else if (prev_no == 0 && next_no !=0){
               %><button class="like-btn" onclick="location.href='/CMoaMoa/freeBoard/freeboardDetail.jsp?board_no=<%=board_no%>&&no=<%=next_no%>'">다음글</button>
            <%}else if (prev_no == 0 && next_no==0){ %>
            <%}else{%>
               <button class="like-btn" onclick="location.href='/CMoaMoa/freeBoard/freeboardDetail.jsp?board_no=<%=board_no%>&&no=<%=prev_no%>'">이전글</button>
               <button class="like-btn" onclick="location.href='/CMoaMoa/freeBoard/freeboardDetail.jsp?board_no=<%=board_no%>&&no=<%=next_no%>'">다음글</button>
            <%}
             %> 
			<br><br><br>
			<div class="comment-box-icon">
				<img class="title_left_img" src="/CMoaMoa/image/comment.png"/>
				<div>댓글목록 ↓</div>
			</div>
		
			<!-- 여기 while문 시작 -->
			<%
			}// if문 끝
// 			String comment_list = "select * from comment where comment_no="+req_no;

// 			String comment_list = "SELECT c.name, c.com_content, c.com_write_date, c.auto_no, r.rep_name, r.rep_content, r.rep_write_date FROM comment c LEFT JOIN reply r ON c.auto_no = r.rep_no where comment_no=336";
			String reply_list = "SELECT * FROM reply";
			String comment_list = "SELECT * FROM comment where comment_no="+req_no;
			ps = conn.prepareStatement(reply_list);
			rs = ps.executeQuery();
			while(rs.next()){ %>
			<%
// 				String frist = rs.getString("r.rep_write_date").substring(2,10);
// 	            String second = rs.getString("r.rep_write_date").substring(11,16);
				String rep_no = rs.getString("rep_no");
	            String writerName = rs.getString("rep_name");
	            String boardContent = rs.getString("rep_content");
	            int auto_no = rs.getInt("auto_no");
	            String rep_auto_no = Integer.toString(auto_no);
				  ArrayList<String> replyInfo = new ArrayList<String>() {{
					  add(rep_no);
		          	  add(writerName);
// 		          	  add(frist);
// 		          	  add(second);
		          	  add(boardContent);
		          	  add(rep_auto_no);
				  }};
	      	  	replyList.add(replyInfo);
	      	  	
			
			%>
			<%} %>
			<%
				ps = conn.prepareStatement(comment_list);
				rs = ps.executeQuery();
				while(rs.next()) {
					String comment_no = rs.getString("comment_no");
					String name = rs.getString("name");
					String com_content = rs.getString("com_content");
					String auto_no = rs.getString("auto_no");
					
					ArrayList<String> commentInfo = new ArrayList<String>() {{
			          	  	add(comment_no);
				          	add(name);
				          	add(com_content);
				          	add(auto_no);
			          	
					  }};
		      	  	commentList.add(commentInfo);
		      	  	
				}
			%>
			<% 
				for(int i = 0; i < commentList.size(); i ++) { %>
					<div class="comment-mini-box" style="margin-bottom:0px; margin-top:60px;">
						<div class="comment-name"><%=commentList.get(i).get(1) %> </div>
						<form method="POST" action="/CMoaMoa/commentUpdate.jsp?auto_no=<%=commentList.get(i).get(3)%>">
							<div class='comment-contain'><%=commentList.get(i).get(2)%> 
							
							<% if (nick.equals(commentList.get(i).get(1))) {%>
						  		<button class='edit-btn btn-left' type="button" >수정</button>
						    	<button class='del-btn btn-right' type="button" onclick = "button_event1('<%=commentList.get(i).get(3)%>');">삭제</button>
						    	<div class="modify_txt" style="display:none">
									<input type='text' name="com_content" value=<%=commentList.get(i).get(2)%>>
									<button class="modify_btn btn-left" style='display: none' type="submit">수정완료</button>
									<button class="modify_cancle btn-right" style='display:none' type='button'>취소</button>
						    	</div>
							<%} %>
							</div>
					    </form>
					</div>
					
					<%for(int j = 0; j < replyList.size(); j ++) {
						if(commentList.get(i).get(3).equals(replyList.get(j).get(0))) {%>
							<div class="comment-mini-box" style="position:relative; padding-left:60px; margin-bottom:15px; margin-top:15px;">
									
								<img class="title_left_img" style="position:absolute; height: 30px; top:30px; left:20px; z-index:9999;" src="/CMoaMoa/image/reply.png"/>
				    			<div class="comment-name" ><%=replyList.get(j).get(1)%></div>
				    			<form method="POST" action="/CMoaMoa/replyUpdate.jsp?auto_no=<%=replyList.get(j).get(3)%>">
					    			<div class='comment-contain'><%=replyList.get(j).get(2)%>
					    			
					    				<%if (nick.equals(replyList.get(j).get(1))) { %>
				                            <button class='edit-btn btn-left' type="button" >수정</button>
				                            <button class='del-btn btn-right' type="button" onclick = "button_event2('<%=replyList.get(j).get(3)%>');">삭제</button>
				                            <div class="modify_txt" style="display:none">
				                              <input type='text' name="rep_content" value=<%=replyList.get(j).get(2)%>>
				                              <button class="modify_btn btn-left" style='display: none' type="submit">수정완료</button>
				                              <button class="modify_cancle btn-right" style='display:none' type='button'>취소</button>
				                            </div>
				                         <%} %>
					    				
					    			</div>
				    			</form>
			    			</div>
						<%}%>
						
						<%
					}
					
					%>
					<form method="POST" style="margin-top:0px; margin-bottom:10px;" action="/CMoaMoa/replyPro.jsp?rep_no=<%=commentList.get(i).get(3)%>&&rep_name=<%=nick%>">
					<button class='reply go-list-btn' type="button" style="margin:10px 2px -5px;"> 답글 달기 </button>
				    	<div class='reply_txt' style="display:none">
				    		<button class='reply_cancel_btn go-list-btn' type='button' style="margin:10px 2px -5px;"> 닫기 </button>
				    		<div class='reply_cancel' >
		   						<input type="text" placeholder="상대방을 존중하는 답글을 남깁시다." name="rep_content" style="margin-top:30px;">
								<button type="submit" class="post-comment-btn" style="margin-top:30px;">답글등록</button>
							</div>
						</div>
				    </form>
				    <%
				}
			%>
			<!-- 댓글 리스팅 끝 -->
			
			<!-- 여기 while문 끝 -->
			    
				
		 		<!-- << 댓글 작성자 닉네임 넣어야함  -->
				<form method="POST" action="/CMoaMoa/comment.jsp?no=<%=no%>&&name=<%=nick%>">
					<input type="text" placeholder="상대방을 존중하는 댓글을 남깁시다." name="com_content" style="margin-top:30px;">
					<button type="submit" class="post-comment-btn" style="margin-top:30px;">댓글등록</button>
				</form>
		</div>
			
		<%
			String viewCount = "update freeboard set views =? where no="+req_no;
			ps = conn.prepareStatement(viewCount);
			ps.setInt(1, count);
			ps.executeUpdate();
			
			conn.close();
			
			}
			catch (SQLException sqlerr){
				
			}

			}
		%>
		
	</div>
	
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>