package write;

import java.sql.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.*;
import javax.sql.DataSource;


public class writePro {
	private static writePro instance = new writePro();
	public static writePro getInstance() {
		return instance;
	}	
	private writePro() {}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/moa");
		return ds.getConnection();
	}
	
	public static void resourceClose(ResultSet rset, Statement stmt, Connection conn) {
		try {
			if(rset != null) rset.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch (SQLException sqlerr) {
			System.out.println("�뜲�씠�꽣踰좎씠�뒪 �뿰寃� �삤瑜�!" + sqlerr.getMessage());
		}
	}
	
	public static void resourceClose(Statement stmt, Connection conn) {
		try {
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		} catch (SQLException sqlerr) {
			System.out.println("�뜲�씠�꽣踰좎씠�뒪 醫낅즺 �삤瑜�!" + sqlerr.getMessage());
		}
	}
	

	public void insertFreeboard(writeBean write) {
		Connection conn = null;
		PreparedStatement ps = null;	
		String sql = null;
		
		try {
			sql = "insert into freeboard values(?,?,?,?,?,?,?,null)";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, write.getBoard_no());
			ps.setString(2, write.getTitle());
			ps.setString(3, write.getName());
			ps.setInt(4, write.getViews());
			ps.setString(5, write.getContent());
			ps.setString(6, LocalDateTime.now().toString());
			ps.setString(7, write.getImage());
			ps.executeUpdate();
		}catch(Exception e){	
			e.printStackTrace();
		}finally {
			resourceClose(ps, conn);
		}
	}
	public void Updateboard(writeBean write, int no) {
		Connection conn = null;
		PreparedStatement ps = null;	
		String sql = null; 
		
		sql = "update freeboard set board_no = ?, title = ? ,content = ?,write_date=?, image=? where no = ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, write.getBoard_no());
			ps.setString(2, write.getTitle());
			ps.setString(3, write.getContent());
			ps.setString(4, LocalDateTime.now().toString());
			ps.setString(5, write.getImage());
			ps.setInt(6, no);
			ps.executeUpdate();			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose(ps, conn);
		}
	}
	
	public void Deleteboard(int no) {
		Connection conn = null;
		PreparedStatement ps = null;	
		String sql = null; 
	
		sql = "delete from freeboard where no = ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			resourceClose(ps, conn);
		}
	}
	public ArrayList<writeBean> getSearch(String searchField, String searchText){//�듅�젙�븳 由ъ뒪�듃瑜� 諛쏆븘�꽌 諛섑솚
	      ArrayList<writeBean> list = new ArrayList<writeBean>();
	      String sql ="select Image, no, title, write_date, name, views,content from freeboard WHERE "+searchField.trim();
			Connection conn = null;
			PreparedStatement ps = null;	
			ResultSet rs = null;
	      try {
	            if(searchText != null && !searchText.equals("") ){//�씠嫄� 鍮쇰㈃ �븞 �굹�삩�떎�뀥 �솢吏�?
	                sql +=" LIKE '%"+searchText.trim()+"%'";
	            }
				conn = getConnection();
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				
	         while(rs.next()) {
	        	writeBean bbs = new writeBean();
	            bbs.setImage(rs.getString(1));
	            bbs.setNo(rs.getInt(2));
	            bbs.setTitle(rs.getString(3));
	            bbs.setWrite_date(rs.getString(4));
	            bbs.setName(rs.getString(5));
	            bbs.setViews(rs.getInt(6));
	            bbs.setContent(rs.getString(7));
	            
	            list.add(bbs);//list�뿉 �빐�떦 �씤�뒪�꽩�뒪瑜� �떞�뒗�떎.
	         }         
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
	      return list;//�꽦�뀛�떆湲� 由ъ뒪�듃 諛섑솚
	   }
	
	public int next_board(int board_no, int no) {
		Connection conn = null;
		PreparedStatement ps = null;	
		ResultSet rs = null;
		String sql = "select no from freeboard where board_no = ? and no > ? order by no asc limit 1";
		int next_board = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, board_no);
			ps.setInt(2, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				next_board = rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose(ps,conn);
		}
		return next_board;
	}
	
	public int prev_board(int board_no, int no) {
		Connection conn = null;
		PreparedStatement ps = null;	
		ResultSet rs = null;
		String sql = "select no from freeboard where board_no = ? and no < ? order by no desc limit 1";
		int next_board = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, board_no);
			ps.setInt(2, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				next_board = rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose(ps,conn);
		}
		return next_board;
	}
}
