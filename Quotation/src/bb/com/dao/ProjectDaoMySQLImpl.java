package bb.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bb.com.model.Client;
import bb.com.model.MainService;
import bb.com.model.Project;
import bb.com.model.Quotation;
import bb.com.util.DbUtil;

public class ProjectDaoMySQLImpl implements ProjectDao {
	
	public int getProjectCount(){
		int id = 0;
		Connection con  = null;
		Statement stmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select count(*) as count_p_id from Projects";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				id = rs.getInt("count_p_id");
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
	
	
	public int getMaxProjId(){
		int id = 0;
		Connection con  = null;
		Statement stmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select IFNULL(max(p_id),0) as p_id from Projects";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				id = rs.getInt("p_id");
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
	public int getMaxProjId(Connection con)throws SQLException{
		int id = 0;
		Statement stmt = null;
		String sql = null;
		
			con = DbUtil.getConnection();
			sql  = "select IFNULL(max(p_id),0) as p_id from Projects";
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				id = rs.getInt("p_id");
			}
		
		return id;
	}
	
	public Project addProject(Project project,int c_id) {
		
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "insert into Projects(project_name,c_id,term,sender_name,extra_note)"
			+" values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, project.getProjectName());
			pstmt.setInt(2, c_id);
			pstmt.setString(3,project.getTerm());
			pstmt.setString(4,project.getSenderName());
			pstmt.setString(5,project.getExtraNote());
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
		int p_id = getMaxProjId();
		project.setPid(p_id);
		return project;
	}

	
	public String getSenderName(int p_id) {
		String senderName = null;
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select sender_name from Projects where p_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, p_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				senderName = rs.getString("sender_name");
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
		return senderName;
	}
	public void setSenderName(int p_id, String senderName) {
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "update Projects set sender_name=? where p_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, senderName);
			pstmt.setInt(2, p_id);
			pstmt.executeUpdate();
			System.out.println("sender added");
		} catch (SQLException e) {
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
		
	}

	
	public void deleteProject(int p_id) {
		
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		MainServiceDao msdao = null;
		try {
			msdao = DaoFactory.getMainServiceDao();
			con = DbUtil.getConnection();
			msdao.deleteAllMainServices(con, p_id);
			sql  = "delete from Projects where p_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,p_id);
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
	public void deleteAllProjects(int c_id) {
		
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select * from Projects where c_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				int p_id = rs.getInt("p_id");
				deleteProject(p_id);
			}
			System.out.println("projects removed");
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

	public Project getProject(int p_id) {
		Project project = null;
		ArrayList<MainService> mainServices = null;
		MainServiceDao msdao = null;
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "select * from Projects where p_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, p_id);
			project = new Project();
			msdao = DaoFactory.getMainServiceDao();
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				String projectName = rs.getString("project_name");
				String term = rs.getString("term");
				String senderName= rs.getString("sender_name");
				String extraNote = rs.getString("extra_note");
				project.setPid(p_id);
				project.setTerm(term);
				project.setProjectName(projectName);
				project.setSenderName(senderName);
				project.setExtraNote(extraNote);
			}
			mainServices = msdao.getMainServices(con,p_id);
			project.setMainServices(mainServices);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				DbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return project ;
	}

	public void updateProject(Project project) {
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DbUtil.getConnection();
			sql  = "update Projects set project_name=?,term=?,sender_name=?,extra_note=? where p_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, project.getProjectName());
			pstmt.setString(2, project.getTerm());
			pstmt.setString(3,	project.getSenderName());
			pstmt.setString(4, project.getExtraNote());
			pstmt.setInt(5, project.getPid());
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
	
	
	public ArrayList<Quotation> getAllQuotations(){
		ArrayList<Quotation> allQuotations = null;
		Quotation quotation = null;
		Project project = null;
		Client client =null;
		Connection con  = null;
		Statement stmt = null;
		String sql = null;
		ClientDao cdao = DaoFactory.getClientDao();
		try {
			con = DbUtil.getConnection();
			sql  = "select * from Projects";
			stmt = con.createStatement();
			
			allQuotations = new ArrayList<Quotation>();
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				int p_id = rs.getInt("p_id");
				int c_id = rs.getInt("c_id");
				project = getProject(con,p_id);
				client = cdao.getClient(con,c_id);
				quotation = new Quotation();
				quotation.setClient(client);
				quotation.setProject(project);
				allQuotations.add(quotation);
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
		
		return allQuotations;
	}

	public Project getProject(Connection con, int p_id) throws SQLException {
		Project project = null;
		ArrayList<MainService> mainServices = null;
		MainServiceDao msdao = null;
		
		PreparedStatement pstmt = null;
		String sql = null;
		
			sql  = "select * from Projects where p_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, p_id);
			project = new Project();
			msdao = DaoFactory.getMainServiceDao();
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				String projectName = rs.getString("project_name");
				String term = rs.getString("term");
				String senderName = rs.getString("sender_name");
				String extraNote = rs.getString("extra_note");
				project.setTerm(term);
				project.setProjectName(projectName);
				project.setSenderName(senderName);
				project.setExtraNote(extraNote);
				project.setPid(p_id);
			}
			mainServices = msdao.getMainServices(con,p_id);
			project.setMainServices(mainServices);
		
		return project ;
	}


	public Quotation getQuotation(int p_id) {
		Quotation quotation = null;
		Project project = null;
		Client client =null;
		
		Connection con  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ClientDao cdao = DaoFactory.getClientDao();
		try {
			con = DbUtil.getConnection();
			sql  = "select * from Projects where p_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, p_id);
			quotation = new Quotation();
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				int c_id = rs.getInt("c_id");
				project = getProject(con,p_id);
				client = cdao.getClient(con,c_id);
				quotation.setClient(client);
				quotation.setProject(project);
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
		
		
		return quotation;
	}
}
