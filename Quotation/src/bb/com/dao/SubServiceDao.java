package bb.com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import bb.com.model.SubService;

public interface SubServiceDao{

	int add(String ss, int m_id);
	ArrayList<SubService> getSubServiceList(int m_id);
	ArrayList<SubService> getSubServiceList(Connection con, int m_id) throws SQLException;
	int add(Connection con,String ss, int m_id) throws SQLException;
	void deleteAllSubServices(Connection con, int id) throws SQLException;
}
