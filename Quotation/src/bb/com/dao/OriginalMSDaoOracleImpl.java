package bb.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bb.com.model.MainService;
import bb.com.model.SubService;
import bb.com.util.DbUtil;

public class OriginalMSDaoOracleImpl implements OriginalMSDao{

	public int add(String mainService) {
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int m_id= 0;
		try {
			con = DbUtil.getConnection();
			sql  = "insert into original_mainServices(m_id,mainService)values("+
			"(select nvl(max(m_id),0)+1 from original_mainServices),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,mainService);
			pstmt.executeUpdate();
			System.out.println("original mainService added");
			m_id = getMaxId(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				DbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return m_id;
		
	}

	public int add(Connection con, String mainService) throws SQLException {
		
		PreparedStatement pstmt = null;
		String sql = null;
		int m_id= 0;
		
			sql  = "insert into original_mainServices(m_id,mainService)values("+
			"(select nvl(max(m_id),0)+1 from original_mainServices),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,mainService);
			pstmt.executeUpdate();
			System.out.println("original mainService added");
			m_id = getMaxId(con);
		
		return m_id;
		
	}

	public int getMaxId(Connection con) throws SQLException {
		int id = 0;
		Statement stmt = null;
		String sql = null;
			sql  = "select nvl(max(m_id),0) as m_id from original_mainServices";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				id = rs.getInt("m_id");
			}
		
		return id;
		
	}
	
	public int getIdByName(String mainService){
		int id = 0;
		Connection con  = null;
		Statement stmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select m_id from original_mainServices where mainService='"+mainService+"'";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				id = rs.getInt("m_id");
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
		
		return id;
		
	}
	public int getIdByName(Connection con,String mainService) throws SQLException{
		
		int id = 0;
		Statement stmt = null;
		String sql = null;
			sql  = "select m_id from original_mainServices where mainService='"+mainService+"'";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				id = rs.getInt("m_id");
			}
		
		return id;
	}
	
	public String getMainServiceName(Connection con,int id) throws SQLException{
		String mainService = null;
		Statement stmt = null;
		String sql = null;
			sql  = "select mainService from original_mainServices where m_id="+id;
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				mainService = rs.getString("mainService");
			}
		
		return mainService;
	}
	public String getMainServiceName(int id) {
		String mainService = null;
		Connection con  = null;
		Statement stmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select mainService from original_mainServices where m_id="+id;
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				mainService = rs.getString("mainService");				
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
		
		
		return mainService;
	}
	
	public MainService getMainService(int m_id){
		MainService mainService = null;
		Connection con  = null;
		Statement stmt = null;
		String sql = null;
		OriginalSSDao ossdao = null;
		try {
			con = DbUtil.getConnection();
			ossdao = DaoFactory.getOriginalSSDao();
			sql  = "select * from original_mainservices where m_id="+m_id+" order by m_id";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			mainService = new MainService();
			if(rs.next()){
				String ms = rs.getString("mainService");
				int s_id = rs.getInt("m_id");
				mainService.setId(m_id);
				mainService.setMainService(ms);
				ArrayList<SubService> subServices = ossdao.getAllSubServices(con,m_id);
				mainService.setSubServices(subServices );
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
		
		
		
		return mainService;
	}
	

	
}
