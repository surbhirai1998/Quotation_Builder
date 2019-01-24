package bb.com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import bb.com.model.Client;
import bb.com.model.Project;
import bb.com.model.Quotation;

public interface ProjectDao {
	 int getProjectCount();
	int getMaxProjId() ;
	int getMaxProjId(Connection con) throws SQLException;
	Project addProject(Project project,int c_id);
	void updateProject(Project project);
	void deleteProject(int id);
	void deleteAllProjects(int c_id);
	Project getProject(int p_id);
	Project getProject(Connection con,int p_id) throws SQLException;
	Quotation getQuotation(int p_id);
	ArrayList<Quotation> getAllQuotations();
	String getSenderName(int p_id);
	void setSenderName(int p_id,String senderName);
}
