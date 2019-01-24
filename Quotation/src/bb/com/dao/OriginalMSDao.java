package bb.com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bb.com.model.MainService;
import bb.com.util.DbUtil;

public interface OriginalMSDao {
	
	int add(String mainService);
	int add(Connection con,String mainService)throws SQLException;
	int getMaxId(Connection con)  throws SQLException;
	String getMainServiceName(Connection con,int id) throws SQLException;
	String getMainServiceName(int id);
	int getIdByName(String mainService);
	public int getIdByName(Connection con,String mainService) throws SQLException;
	MainService getMainService(int m_id);
}
