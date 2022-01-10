<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%> 
<%@ page import = "write.*" %>
<%@ page import="java.sql.*" %>
    
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String req_no = request.getParameter("no");
	String board_no = request.getParameter("board_no");

	int no = Integer.parseInt(req_no);
	
	writePro Delete = writePro.getInstance();
	Delete.Deleteboard(no);
	
	if (Integer.parseInt(board_no) >= 1 && Integer.parseInt(board_no) <= 3) {
		if (Integer.parseInt(board_no) == 1) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=1&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(board_no) == 2) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=2&&maxPage=1&&nowPage=1");
		}
		else {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=3&&maxPage=1&&nowPage=1");
		}
	}
	else if (Integer.parseInt(board_no) >= 4 && Integer.parseInt(board_no) <= 6) {
		if (Integer.parseInt(board_no) == 4) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=4&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(board_no) == 5) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=5&&maxPage=1&&nowPage=1");
		}
		else {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=6&&maxPage=1&&nowPage=1");
		}
	}
	else if (Integer.parseInt(board_no) >= 7 && Integer.parseInt(board_no) <= 11) {
		if (Integer.parseInt(board_no) == 7) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=7&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(board_no) == 8) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=8&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(board_no) == 9) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=9&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(board_no) == 10) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=10&&maxPage=1&&nowPage=1");
		}
		else {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=11&&maxPage=1&&nowPage=1");
		}
	}
	else if (Integer.parseInt(board_no) >= 12 && Integer.parseInt(board_no) <= 14) {
		if (Integer.parseInt(board_no) == 12) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=12&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(board_no) == 13) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=13&&maxPage=1&&nowPage=1");
		}
		else {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=14&&maxPage=1&&nowPage=1");
		}
	}
	else if (Integer.parseInt(board_no) >= 15 && Integer.parseInt(board_no) <= 16) {
		if (Integer.parseInt(board_no) == 15) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=15&&maxPage=1&&nowPage=1");
		}
		else {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=16&&maxPage=1&&nowPage=1");
		}
	}
	else if (Integer.parseInt(board_no) >= 17 && Integer.parseInt(board_no) <= 23) {
		if (Integer.parseInt(board_no) == 17) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=17&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(board_no) == 18) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=18&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(board_no) == 19) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=19&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(board_no) == 20) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=20&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(board_no) == 21) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=21&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(board_no) == 22) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=22&&maxPage=1&&nowPage=1");
		}
		else {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=23&&maxPage=1&&nowPage=1");
		}
	}
	else if (Integer.parseInt(board_no) >= 24 && Integer.parseInt(board_no) <= 26) {
		if (Integer.parseInt(board_no) == 24) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=24&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(board_no) == 25) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=25&&maxPage=1&&nowPage=1");
		}
		else {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=26&&maxPage=1&&nowPage=1");
		}
	}
	else if (Integer.parseInt(board_no) == 27) {
		response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=27&&maxPage=1&&nowPage=1");
	}
	else if (Integer.parseInt(board_no) == 28) {
		response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=28&&maxPage=1&&nowPage=1");
	}
	else if (Integer.parseInt(board_no) == 111) {
		response.sendRedirect("/CMoaMoa/Comp_Moa_Board/Competition.jsp?board_no=111&&maxPage=1&&nowPage=1");
	}
	else if (Integer.parseInt(board_no) == 112) {
		response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=112&&maxPage=1&&nowPage=1");
	}
	else if (Integer.parseInt(board_no) == 121) {
		response.sendRedirect("/CMoaMoa/IO_Campus/InCam.jsp?board_no=121&&maxPage=1&&nowPage=1");
	}
	else if (Integer.parseInt(board_no) == 122) {
		response.sendRedirect("/CMoaMoa/IO_Campus/OutCam.jsp?board_no=122&&maxPage=1&&nowPage=1");
	}
	else if (Integer.parseInt(board_no) == 0) {
		response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=0&&maxPage=1&&nowPage=1");
	}
%>

