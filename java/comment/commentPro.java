package comment;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import comment.commentPro;

public class commentPro {
	private static commentPro instance = new commentPro();
	public static commentPro getInstance() {
		return instance;
	}	
	private commentPro() {}
	
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
			System.out.println("데이터베이스 연결 오류!" + sqlerr.getMessage());
		}
	}
	
	public static void resourceClose(Statement stmt, Connection conn) {
		try {
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		} catch (SQLException sqlerr) {
			System.out.println("데이터베이스 종료 오류!" + sqlerr.getMessage());
		}
	}
	
	public void writeComment(commentBean comment, int no) {
		Connection conn = null;
		PreparedStatement ps = null;	
		String sql = null;
		
		try {
			sql = "insert into comment values(?,?,?,?,null)";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setString(2, comment.getName());
			ps.setString(3, comment.getCom_content());
			ps.setString(4, LocalDateTime.now().toString());
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose(ps, conn);
		}
	
	}
	
	public void updateComment(commentBean comment, int auto_no) {
		Connection conn = null;
		PreparedStatement ps = null;	
		String sql = null;
	
		try {
			sql = "update comment set com_content =?, com_write_date=? where auto_no =?";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, comment.getCom_content());
			ps.setString(2, LocalDateTime.now().toString());
			ps.setInt(3, auto_no);
			ps.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose(ps, conn);
		}
	
	}
	
	public void deleteComment(int auto_no) {
		Connection conn = null;
		PreparedStatement ps = null;	
		String sql = null;
	
		try {
			sql = "delete from comment where auto_no =?";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, auto_no);
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose(ps, conn);
		}
		
	}
	

}
