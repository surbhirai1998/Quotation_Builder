package bb.com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import bb.com.model.SubService;

public interface OriginalSSDao {

	int add(int m_id,String subService);
	int add(Connection con,int m_id,String subService)throws SQLException;
	int getMaxId(Connection con)  throws SQLException;
	String getSubServiceName(Connection con,int id) throws SQLException;
	String getSubServiceName(int id);
	int getIdByName(String subService);
	int getIdByName(Connection con,String subService) throws SQLException;
	ArrayList<SubService> getAllSubServices(int m_id);
	ArrayList<SubService> getAllSubServices(Connection con, int m_id) throws SQLException;
	
}
