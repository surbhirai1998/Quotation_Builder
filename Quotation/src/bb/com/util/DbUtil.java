package bb.com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import bb.com.model.Config;

public class DbUtil {
	static Connection con;
	static String classname = "oracle.jdbc.driver.OracleDriver"  ;
	static String url="jdbc:oracle:thin:@localhost:1521:XE";
	static String user="system";
	static String password="root";
	
	static String classname2 = "com.mysql.jdbc.Driver"  ;//com.mysql.cj.jdbc.Driver
	static String url2=Config.getMySqlDns();
	static String user2=Config.getMySqlUsername();
	static String password2=Config.getMySqlPassword();
static {
		try {
			Class.forName(classname2);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException{
		con = DriverManager.getConnection(url2,user2,password2);
		return con;
	}
	
	public static void closeConnection(Connection con) throws SQLException{
		if(con!=null)
			con.close();
	}
}
