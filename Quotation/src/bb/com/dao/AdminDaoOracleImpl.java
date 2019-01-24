package bb.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bb.com.model.Admin;
import bb.com.util.DbUtil;

public class AdminDaoOracleImpl implements AdminDao {

	public Admin login(String userName,String password) {
		

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		Admin admin = null;
		try{
			admin = new Admin();
			con = DbUtil.getConnection();
			sql = "select * from BBAdmin where user_name=? and password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2,password);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				String name= rs.getString("admin_name");
				admin.setName(name);
				admin.setUserName(userName);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				DbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return admin;
	}


	public boolean add(Admin admin, String password) {
		boolean isAdded = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try{
			con = DbUtil.getConnection();
			sql = "insert into BBAdmin (id,admin_name,user_name,password)values("
					+ "(select nvl(max(id),0)+1 from BBAdmin),?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, admin.getName());
			pstmt.setString(2, admin.getUserName());
			pstmt.setString(3,password);
			pstmt.executeUpdate();
		isAdded = true;
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				DbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return isAdded;
		
	}


	public boolean updatePassword(String userName, String oldPassword,
			String newPassword) {
		// TODO Auto-generated method stub
		return false;
	}
		
	
	
	
	
}
