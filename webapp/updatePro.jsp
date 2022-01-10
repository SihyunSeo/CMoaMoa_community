<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="write.writePro"%>
<%@ page import = "java.io.*" %>
<%@ page import="java.util.*"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<% request.setCharacterEncoding("utf-8");%>

<% 
	String realFolder = "";//웹 어플리케이션상의 절대 경로
	String filename ="";
	MultipartRequest imageUp = null; 

	String saveFolder = "/imageFile";//파일이 업로드되는 폴더를 지정한다.
	String encType = "utf-8"; //엔코딩타입
	int maxSize = 2*1024*1024;  //최대 업로될 파일크기 5Mb
	//현재 jsp페이지의 웹 어플리케이션상의 절대 경로를 구한다 
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);  
	
	try{
		//전송을 담당할 콤포넌트를 생성하고 파일을 전송한다.
		//전송할 파일명을 가지고 있는 객체, 서버상의 절대경로,최대 업로드될 파일크기, 문자코드, 기본 보안 적용
	 	imageUp = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
	   
	 	//전송한 파일 정보를 가져와 출력한다
	 	Enumeration<?> files = imageUp.getFileNames();
   
	 	while(files.hasMoreElements()){//파일 정보가 있다면,  input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름
		   	String name = (String)files.nextElement();       
			filename = imageUp.getFilesystemName(name);	//서버에 저장된 파일 이름
		}	
	}catch(Exception e){
 		e.printStackTrace();
	}
		

// 	st.insertFreeboard(sp);	
	
// 	response.sendRedirect("freeboard.jsp");
%>

<jsp:useBean id="sp" class="write.writeBean">
	<jsp:setProperty name="sp" property="*" />
</jsp:useBean>

<%
	writePro st = writePro.getInstance();
	
	String req_no = request.getParameter("no");
	
	int no = Integer.parseInt(req_no);
	
	String form_board_num = imageUp.getParameter("board_no");
// 	String form_board_num = request.getParameter("board_no");
	
	String form_title = imageUp.getParameter("title");
	String form_name = imageUp.getParameter("name");
	String form_content = imageUp.getParameter("content");
	
	System.out.println("form_board_num : \t"+form_board_num);
// 	sp.setBoard_no(form_board_num);
	sp.setTitle(form_title);
	sp.setContent(form_content);
	sp.setImage(filename);
	
	st.Updateboard(sp, no);
	
	if (Integer.parseInt(form_board_num) >= 1 && Integer.parseInt(form_board_num) <= 3) {
		if (Integer.parseInt(form_board_num) == 1) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=1&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(form_board_num) == 2) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=2&&maxPage=1&&nowPage=1");
		}
		else {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=3&&maxPage=1&&nowPage=1");
		}
	}
	else if (Integer.parseInt(form_board_num) >= 4 && Integer.parseInt(form_board_num) <= 6) {
		if (Integer.parseInt(form_board_num) == 4) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=4&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(form_board_num) == 5) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=5&&maxPage=1&&nowPage=1");
		}
		else {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=6&&maxPage=1&&nowPage=1");
		}
	}
	else if (Integer.parseInt(form_board_num) >= 7 && Integer.parseInt(form_board_num) <= 11) {
		if (Integer.parseInt(form_board_num) == 7) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=7&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(form_board_num) == 8) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=8&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(form_board_num) == 9) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=9&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(form_board_num) == 10) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=10&&maxPage=1&&nowPage=1");
		}
		else {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=11&&maxPage=1&&nowPage=1");
		}
	}
	else if (Integer.parseInt(form_board_num) >= 12 && Integer.parseInt(form_board_num) <= 14) {
		if (Integer.parseInt(form_board_num) == 12) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=12&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(form_board_num) == 13) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=13&&maxPage=1&&nowPage=1");
		}
		else {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=14&&maxPage=1&&nowPage=1");
		}
	}
	else if (Integer.parseInt(form_board_num) >= 15 && Integer.parseInt(form_board_num) <= 16) {
		if (Integer.parseInt(form_board_num) == 15) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=15&&maxPage=1&&nowPage=1");
		}
		else {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=16&&maxPage=1&&nowPage=1");
		}
	}
	else if (Integer.parseInt(form_board_num) >= 17 && Integer.parseInt(form_board_num) <= 23) {
		if (Integer.parseInt(form_board_num) == 17) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=17&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(form_board_num) == 18) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=18&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(form_board_num) == 19) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=19&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(form_board_num) == 20) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=20&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(form_board_num) == 21) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=21&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(form_board_num) == 22) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=22&&maxPage=1&&nowPage=1");
		}
		else {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=23&&maxPage=1&&nowPage=1");
		}
	}
	else if (Integer.parseInt(form_board_num) >= 24 && Integer.parseInt(form_board_num) <= 26) {
		if (Integer.parseInt(form_board_num) == 24) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=24&&maxPage=1&&nowPage=1");
		}
		else if (Integer.parseInt(form_board_num) == 25) {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=25&&maxPage=1&&nowPage=1");
		}
		else {
			response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=26&&maxPage=1&&nowPage=1");
		}
	}
	else if (Integer.parseInt(form_board_num) == 27) {
		response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=27&&maxPage=1&&nowPage=1");
	}
	else if (Integer.parseInt(form_board_num) == 28) {
		response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=28&&maxPage=1&&nowPage=1");
	}
	else if (Integer.parseInt(form_board_num) == 111) {
		response.sendRedirect("/CMoaMoa/Comp_Moa_Board/Competition.jsp?board_no=111&&maxPage=1&&nowPage=1");
	}
	else if (Integer.parseInt(form_board_num) == 112) {
		response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=112&&maxPage=1&&nowPage=1");
	}
	else if (Integer.parseInt(form_board_num) == 121) {
		response.sendRedirect("/CMoaMoa/IO_Campus/InCam.jsp?board_no=121&&maxPage=1&&nowPage=1");
	}
	else if (Integer.parseInt(form_board_num) == 122) {
		response.sendRedirect("/CMoaMoa/IO_Campus/OutCam.jsp?board_no=122&&maxPage=1&&nowPage=1");
	}
	else if (Integer.parseInt(form_board_num) == 0) {
		response.sendRedirect("/CMoaMoa/freeBoard/freeboard.jsp?board_no=0&&maxPage=1&&nowPage=1");
	} //
%>