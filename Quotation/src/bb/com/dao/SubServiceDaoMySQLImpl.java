package bb.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bb.com.model.SubService;
import bb.com.util.DbUtil;

public class SubServiceDaoMySQLImpl implements SubServiceDao {

	public int add(String ss, int m_id) {
		int s_id = 0;
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "insert into subServices(m_id,description"
			+")values(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,m_id);
			pstmt.setString(2,ss);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			try {
				DbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		s_id = getMaxSSId();
		return s_id;
		

	}
	
	public int add(Connection con,String ss, int m_id) throws SQLException {
		int s_id = 0;
		PreparedStatement pstmt = null;
		String sql = null;
			sql  = "insert into subServices(m_id,description"
			+")values(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,m_id);
			pstmt.setString(2,ss);
			pstmt.executeUpdate();
			
			s_id = getMaxSSId(con);
		
		return s_id;
		
	}

	private int getMaxSSId() {
		int s_id = 0;
		Connection con  = null;
		Statement stmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select IFNULL(max(s_id),0) as s_id from subServices";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				s_id = rs.getInt("s_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				DbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return s_id;
	}
	private int getMaxSSId(Connection con) throws SQLException {
		int s_id = 0;
		
		Statement stmt = null;
		String sql = null;
		
			sql  = "select IFNULL(max(s_id),0) as s_id from subServices";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				s_id = rs.getInt("s_id");
			}
		
		return s_id;
	}

	public ArrayList<SubService> getSubServiceList(int m_id) {
		ArrayList<SubService> ssList = null;
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select * from subServices where m_id=? order by s_id";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, m_id);
			ResultSet rs = pstmt.executeQuery();
			ssList = new ArrayList<SubService>();
			while(rs.next()){
				SubService subService = new SubService();
				String description = rs.getString("description");
				int s_id = rs.getInt("s_id");
				subService.setS_id(s_id);
				subService.setDescription(description);
				ssList.add(subService);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				DbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return ssList;
	}
	
	void update(int s_id,String description){
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "update subservices set description=? where s_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,description);
			pstmt.setInt(2, s_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try {
				DbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public ArrayList<SubService> getSubServiceList(Connection con, int m_id) throws SQLException {
		ArrayList<SubService> ssList = null;
		PreparedStatement pstmt = null;
		String sql = null;
			sql  = "select * from subServices where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, m_id);
			ResultSet rs = pstmt.executeQuery();
			ssList = new ArrayList<SubService>();
			while(rs.next()){
				SubService subService = new SubService();
				String description = rs.getString("description");
				int s_id = rs.getInt("s_id");
				subService.setDescription(description);
				subService.setS_id(s_id);
				ssList.add(subService);
			}
		
		return ssList;
	}

	public void deleteAllSubServices(Connection con, int mid) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql  = "delete from SubServices where m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,mid);
		pstmt.executeUpdate();
	}
	
}
