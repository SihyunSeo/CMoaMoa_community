package reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import comment.commentBean;


public class replyPro {
	private static replyPro instance = new replyPro();
	public static replyPro getInstance() {
		return instance;
	}	
	private replyPro() {}
	
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
	
	
	public void wirteReply(int rep_no, String rep_name, String rep_content) {
		Connection conn = null;
		PreparedStatement ps = null;	
		String sql = null;
		
		try {
			sql = "insert into reply values(?,?,?,?,null)";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, rep_no);
			ps.setString(2, rep_name);
			ps.setString(3, rep_content);
			ps.setString(4, LocalDateTime.now().toString());
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose(ps, conn);
		}
	}
	
	public void updateReply(replyBean comment, int auto_no) {
		Connection conn = null;
		PreparedStatement ps = null;	
		String sql = null;
	
		try {
			sql = "update reply set rep_content =?, rep_write_date=? where auto_no =?";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, comment.getRep_content());
			ps.setString(2, LocalDateTime.now().toString());
			ps.setInt(3, auto_no);
			ps.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose(ps, conn);
		}
	
	}
	
	public void deleteReply(int auto_no) {
		Connection conn = null;
		PreparedStatement ps = null;	
		String sql = null;
	
		try {
			sql = "delete from reply where auto_no =?";
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
