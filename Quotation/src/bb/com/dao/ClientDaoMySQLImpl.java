package bb.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.xml.ws.Response;

import bb.com.model.Client;
import bb.com.util.DbUtil;

public class ClientDaoMySQLImpl implements ClientDao {
	
	public int getClientId(String client_name){
		int id = 0;
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select c_id from Client where client_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,client_name);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				id = rs.getInt("c_id");
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
	
	public int getMaxClientId(){
		int id = 0;
		Connection con  = null;
		Statement stmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select IFNULL(max(c_id),0) as c_id from Client";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				id = rs.getInt("c_id");
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
	public Client addClient(Client client) {
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "insert into Client(company_name,client_name ,email ,contact_number,city,state,country)values("
			+"?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,client.getCompanyName());
			pstmt.setString(2,client.getClientName());
			pstmt.setString(3,client.getEmail());
			pstmt.setString(4,client.getContactNumber());
			pstmt.setString(5,client.getCity());
			pstmt.setString(6,client.getState());
			pstmt.setString(7,client.getCountry());
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
				try {
					con.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			}
		}
		
		int id = getMaxClientId();
		client.setId(id);
		return client;
	}

	public void deleteClient(int id)  throws SQLException{
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
			con = DbUtil.getConnection();
			sql  = "delete from Client where c_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
		

	}

	public Client getClient(int id) {
		Connection con  = null;
		PreparedStatement pstmt = null;
		Client client= null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select * from Client where c_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				String companyName=rs.getString("company_name");
				String clientName=rs.getString("client_name");
				String email=rs.getString("email");
				String contactNumber=rs.getString("contact_number");
				String city=rs.getString("city");
				String state=rs.getString("state");
				String country=rs.getString("country");
				client = new Client(id,clientName,companyName,email,contactNumber,city,state,country);
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
		return client;
	}

	public ArrayList<Client> getAllClients() {
		Connection con  = null;
		Statement stmt = null;
		ArrayList<Client> clientList = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select * from Client";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			clientList = new ArrayList<Client>();
			while(rs.next()){
				
				int id = rs.getInt("c_id");
				String companyName=rs.getString("company_name");
				String clientName=rs.getString("client_name");
				String email=rs.getString("email");
				String contactNumber=rs.getString("contact_number");
				String city=rs.getString("city");
				String state=rs.getString("state");
				String country=rs.getString("country");
				Client client = new Client(id,clientName,companyName,email,contactNumber,city,state,country);
				clientList.add(client);
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
		return clientList;
	}
	
	public void updateClient(Client client){
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "update Client set company_name=?,client_name =?,email =?,"+
						"contact_number=?,city=?,state=?,country=? where c_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,client.getCompanyName());
			pstmt.setString(2,client.getClientName());
			pstmt.setString(3,client.getEmail());
			pstmt.setString(4,client.getContactNumber());
			pstmt.setString(5,client.getCity());
			pstmt.setString(6,client.getState());
			pstmt.setString(7,client.getCountry());
			pstmt.setInt(8, client.getId());
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
	}

	
	public Client getClient(Connection con, int c_id) throws SQLException {
		PreparedStatement pstmt = null;
		Client client= null;
		String sql = null;
		
			sql  = "select * from Client where c_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,c_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				String companyName=rs.getString("company_name");
				String clientName=rs.getString("client_name");
				String email=rs.getString("email");
				String contactNumber=rs.getString("contact_number");
				String city=rs.getString("city");
				String state=rs.getString("state");
				String country=rs.getString("country");
				client = new Client(c_id,clientName,companyName,email,contactNumber,city,state,country);
			}
		
		return client;
	}

	public String getSenderName(Connection con, int c_id) throws SQLException {
		String senderName = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
			con = DbUtil.getConnection();
			sql  = "select sender_name from Client where c_id=?";
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				senderName = rs.getString("sender_name");
			}
		
		return senderName;
	}

	public int getClientCount() {
		int id = 0;
		Connection con  = null;
		Statement stmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select count(*) as count_c_id from Client";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				id = rs.getInt("count_c_id");
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
	
}
