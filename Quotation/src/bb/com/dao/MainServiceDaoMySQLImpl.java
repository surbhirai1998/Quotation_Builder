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

public class MainServiceDaoMySQLImpl implements MainServiceDao {
	
	
	
	public int add(MainService ms,int p_id) {
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "insert into MainService(p_id,main_service,fees"
					+")values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,p_id);
			pstmt.setString(2,ms.getMainService());
			pstmt.setInt(3,ms.getCost());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				DbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		int m_id = getMaxMainServiceId();
		return m_id;
	}
	
	public int add(Connection con,MainService ms,int p_id) throws SQLException {
		
		PreparedStatement pstmt = null;
		String sql = null;
			sql  = "insert into MainService(p_id,main_service,fees"
					+")values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,p_id);
			pstmt.setString(2,ms.getMainService());
			pstmt.setInt(3,ms.getCost());
			pstmt.executeUpdate();
			
		
		int m_id = getMaxMainServiceId();
		return m_id;
	}
	
	
	
	public int getMaxMainServiceId(){
		int id = 0;
		Connection con  = null;
		Statement stmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select IFNULL(max(m_id),0) as m_id from mainService";
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

	public ArrayList<MainService> getMainServices(Connection con, int p_id)
			throws SQLException {
		SubServiceDao ssdao = null;
		PreparedStatement pstmt = null;
		ArrayList<MainService> mainServiceList = null;
		String sql = null;
		ssdao=DaoFactory.getSubServiceDao();
			sql  = "select * from MainService where p_id=? order by m_id";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, p_id);
			ResultSet rs = pstmt.executeQuery();
			mainServiceList = new ArrayList<MainService>();
			while(rs.next()){
				MainService ms = new MainService();
				int m_id = rs.getInt("m_id");
				String mainService=rs.getString("main_service");
				int cost=rs.getInt("fees");
				ArrayList<SubService> subServices = ssdao.getSubServiceList(con,m_id);
				ms.setId(m_id);
				ms.setCost(cost);
				ms.setMainService(mainService);
				ms.setSubServices(subServices);
				mainServiceList.add(ms);
			}
		
		return mainServiceList;
	}
	
	
public void deleteAllMainServices(Connection con,int p_id)throws SQLException {
	
	SubServiceDao ssdao = null;
		ssdao=DaoFactory.getSubServiceDao();
		ArrayList<MainService> mainServiceList = getMainServices(con, p_id);
		for(MainService ms:mainServiceList){
			ssdao.deleteAllSubServices(con,ms.getId());
			deleteMainService(con,ms.getId());
		}
		
	}

public void deleteMainService(Connection con, int id) throws SQLException{
	
	PreparedStatement pstmt = null;
	String sql = null;
	
	sql  = "delete from MainService where m_id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1,id);
	pstmt.executeUpdate();
	
	
}
	
}
