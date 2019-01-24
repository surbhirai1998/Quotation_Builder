package bb.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bb.com.model.SubService;
import bb.com.util.DbUtil;

public class OriginalSSDaoOracleImpl implements OriginalSSDao {

	public int add(int m_id, String subService) {
		int s_id = 0;
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "insert into original_subservices(s_id,m_id,subService"
			+")values((select nvl(max(s_id),0)+1 from original_subservices),?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,m_id);
			pstmt.setString(2,subService);
			pstmt.executeUpdate();
			System.out.println("sub service added");
			s_id = getMaxId(con);
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
		
		return s_id;
		
	}

	public int add(Connection con, int m_id, String subService)
			throws SQLException {
		int s_id = 0;
		PreparedStatement pstmt = null;
		String sql = null;
		
			sql  = "insert into original_subservices(s_id,m_id,subService"
			+")values((select nvl(max(s_id),0)+1 from original_subservices),?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,m_id);
			pstmt.setString(2,subService);
			pstmt.executeUpdate();
			System.out.println("sub service added");
			s_id = getMaxId(con);
		
		return s_id;
	}

	public int getMaxId(Connection con) throws SQLException {
		int id = 0;
		Statement stmt = null;
		String sql = null;
			sql  = "select nvl(max(s_id),0) as s_id from original_subServices";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				id = rs.getInt("s_id");
			}
		
		return id;
		
	}

	public String getSubServiceName(Connection con, int id) throws SQLException {
		
		return null;
	}

	public String getSubServiceName(int id) {
		
		return null;
	}

	public int getIdByName(String subService) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getIdByName(Connection con, String subService)
			throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<SubService> getAllSubServices(int m_id) {
		ArrayList<SubService> ssList = null;
		Connection con  = null;
		Statement stmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select * from original_subServices where m_id="+m_id+" order by s_id";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			ssList = new ArrayList<SubService>();
			while(rs.next()){
				SubService subService = new SubService();
				String description = rs.getString("SUBSERVICE");
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

	public ArrayList<SubService> getAllSubServices(Connection con, int m_id) throws SQLException {
		ArrayList<SubService> ssList = null;
		Statement stmt = null;
		String sql = null;
		
			sql  = "select * from original_subServices where m_id="+m_id+" order by s_id";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			ssList = new ArrayList<SubService>();
			while(rs.next()){
				SubService subService = new SubService();
				String description = rs.getString("SUBSERVICE");
				int s_id = rs.getInt("s_id");
				subService.setS_id(s_id);
				subService.setDescription(description);
				ssList.add(subService);
			}
		
		return ssList;
	}

}
