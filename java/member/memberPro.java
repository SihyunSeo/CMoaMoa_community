package member;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberPro {
	private static memberPro instance = new memberPro();
	public static memberPro getInstance() {
		return instance;
	}	
	private memberPro() {}
	
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
			System.out.println("�����ͺ��̽� ���� ����!" + sqlerr.getMessage());
		}
	}
	
	public static void resourceClose(Statement stmt, Connection conn) {
		try {
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		} catch (SQLException sqlerr) {
			System.out.println("�����ͺ��̽� ���� ����!" + sqlerr.getMessage());
		}
	}
	
	
	public void insertMember(memberBean member) {
		Connection conn = null;
		PreparedStatement ps = null;	
		String sql = null;
		try {
			sql = "insert into member values(?,?,?,?,?,?,?)";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPasswd());
			ps.setString(3, member.getName());
			ps.setString(4, member.getEmail());
			ps.setInt(5, member.getYear());
			ps.setString(6, member.getMajor());
			ps.setString(7, member.getNickname());
			ps.executeUpdate();
		}catch(Exception e){	
			e.printStackTrace();
		}finally {
			resourceClose(ps, conn);
		}
	}
	
	public void updateMember(memberBean member) {
		Connection conn = null;
		PreparedStatement ps = null;	
		String sql = null;
		
		try {
			conn = getConnection();
			sql = "update member set name=?, nickname=?, email=?, year=?, major=? where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getNickname());
			ps.setString(3, member.getEmail());
			ps.setInt(4, member.getYear());
			ps.setString(5, member.getMajor());
			ps.setString(6, member.getId());
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(ps, conn);
		}
	}
	
	public void updateMemberPasswd(memberBean member) {
		Connection conn = null;
		PreparedStatement ps = null;	
		String sql = null;
		
		try {
			conn = getConnection();
			sql = "update member set passwd=? where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getPasswd());
			ps.setString(2, member.getId());
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(ps, conn);
		}
	}
	
	public int checkMemberPasswd(memberBean member, String id) {
		int x = -1;
		Connection conn = null;
		PreparedStatement ps = null;	
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = getConnection();
			sql = "select id from member where passwd=? and id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getPasswd());
			ps.setString(2, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				x = 1;
			}
			else {
				x = 0;
			}
				
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose(ps, conn);
		}
		
		return x;
	}
	
	public int userCheck(String id, String passwd) {
		int x = -1;
		Connection conn = null;
		PreparedStatement ps = null;	
		ResultSet rs = null;
		String sql = null;
		try {
			sql = "select passwd from member where id = ?";
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("passwd").equals(passwd))
					x = 1; 
				else
					x = 0; 
			}
			else
				x = -1; 
			
		}catch(Exception e){	
			e.printStackTrace();
		}finally {
			resourceClose(rs, ps, conn);
		}
		return x;
	}
	
	public memberBean getMember(String id) {
		memberBean member = null;
		Connection conn = null;
		PreparedStatement ps = null;	
		ResultSet rs = null;
		String sql = null;
		try {
			conn = getConnection();
			sql = "select * from member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				member = new memberBean();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setNickname(rs.getString("nickname"));
				member.setEmail(rs.getString("email"));
				member.setYear(rs.getInt("year"));
				member.setMajor(rs.getString("major"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			resourceClose(rs, ps, conn);
		}
		return member;
	}
	
	public String getNickname(String id) {
	      String nickname = null;
	      Connection conn = null;
	      PreparedStatement ps = null;   
	      ResultSet rs = null;
	      String sql = null;
	      
	      try {
	         conn = getConnection();
	         sql = "select * from member where id = ?";
	         ps = conn.prepareStatement(sql);
	         ps.setString(1, id);
	         rs = ps.executeQuery();
	         if(rs.next()) {
	            nickname = rs.getString("nickname");
	         }
	      }catch(Exception e){
	         e.printStackTrace();
	      }finally {
	         resourceClose(rs, ps, conn);
	      }
	      
	      return nickname;
	   }
	public boolean confirmId(String id) {
		Connection conn = null;
	      PreparedStatement ps = null;   
	      ResultSet rs = null;
	      String sql = null;
		boolean result = false;
		try {
			conn = getConnection();
			sql = "select nickname from member where nickname = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
	         resourceClose(rs, ps, conn);
		}
		return result;
	}
}
