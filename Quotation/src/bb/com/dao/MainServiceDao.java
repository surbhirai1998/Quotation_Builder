package bb.com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import bb.com.model.MainService;

public interface MainServiceDao {
	
	int add(MainService ms,int p_id);
	int add(Connection con, MainService ms, int p_id) throws SQLException;
	ArrayList<MainService> getMainServices(Connection con, int p_id)throws SQLException;
	void deleteAllMainServices(Connection con, int p_id)throws SQLException;
	void deleteMainService(Connection con, int mid) throws SQLException;
}
