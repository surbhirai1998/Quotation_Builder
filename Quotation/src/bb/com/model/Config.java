package bb.com.model;

import java.net.URL;

public class Config {

	private static final String BASE_URL="/Quotation"; 
	private static final String MY_SQL_DNS="jdbc:mysql://localhost:3306/BlueBanyanQuotation";
	private static final String MY_SQL_USERNAME="root";
	private static final String MY_SQL_PASSWORD="student1234%";
	//private static final String BB_LOGO_PATH="F:/my_projects/Summer/Quotation/WebContent/imgs/logo.png"; 
	private static final String BB_LOGO_PATH= "http://www.bluebanyan.co.in/images/header/logo.png"; 
	//private static final String BB_LOGO_PATH= "http://localhost:8088/Quotation/imgs/logo.png"; 
	
	public static String getBaseUrl() {
		return BASE_URL;
	}
	public static String getMySqlUsername() {
		return MY_SQL_USERNAME;
	}
	public static String getMySqlPassword() {
		return MY_SQL_PASSWORD;
	}
	public static String getBbLogoPath() {
		return BB_LOGO_PATH;
	}
	public static String getMySqlDns() {
		return MY_SQL_DNS;
	}

	


}
