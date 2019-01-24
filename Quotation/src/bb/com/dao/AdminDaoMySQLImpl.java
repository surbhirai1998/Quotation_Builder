package bb.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bb.com.model.Admin;
import bb.com.util.BCrypt;
import bb.com.util.DbUtil;

public class AdminDaoMySQLImpl implements AdminDao {
	public Admin login(String userName,String password) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		Admin admin = null;
		try{
			con = DbUtil.getConnection();
			sql = "select * from BBAdmin where user_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userName);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				String name= rs.getString("admin_name");
				String hashedPassword = rs.getString("password");
				if(BCrypt.checkpw(password, hashedPassword)){
					admin = new Admin();
					admin.setName(name);
					admin.setUserName(userName);
				}
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
			sql = "insert into BBAdmin (admin_name,user_name,password)values("
					+ "?,?,?)";
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
		
	public boolean updatePassword(String userName,String oldPassword,String newPassword){
		boolean isUpdated = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try{
			con = DbUtil.getConnection();
			sql = "update BBAdmin set password=? where user_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,newPassword);
			pstmt.setString(2, userName);
			pstmt.executeUpdate();
			isUpdated = true;
		}catch(SQLException e){
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
		return isUpdated;
	}
	
	
}
