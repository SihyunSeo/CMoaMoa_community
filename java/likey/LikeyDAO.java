package likey;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LikeyDAO {
	private static LikeyDAO instance = new LikeyDAO();
	public static LikeyDAO getInstance() {
		return instance;
	}	
	private LikeyDAO() {}
	
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
	

	
	public void like(String no_id, int board_no , String id) {
		Connection conn= null;
		PreparedStatement ps = null;	
		String sql = null;
		try {
			sql = "insert into likey values(?, ?, ?)";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, no_id);
			ps.setInt(2, board_no);
			ps.setString(3, id);
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose(ps, conn);
		}
	}
	
	public int check(String no_id) {
		Connection conn= null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		int x = 0;
		try {
			sql = "select no_id from likey where no_id= ?";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, no_id);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("no_id")!=null)
					x = 1;
				else
					x = 0;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose(ps, conn);
		}
		return x;
	}
	
	public int likey(int board_no) {
		Connection conn= null;
		PreparedStatement ps = null;	
		String sql = null;
		ResultSet rs= null;
		int count = 0;
		try {
			sql = "select count(*) from likey where board_no =?;";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, board_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose(ps, conn);
		}return count;
	} 
}
