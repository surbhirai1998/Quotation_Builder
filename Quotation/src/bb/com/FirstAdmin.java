package bb.com;

import bb.com.dao.AdminDao;
import bb.com.dao.DaoFactory;
import bb.com.model.Admin;
import bb.com.util.BCrypt;


public class FirstAdmin {
public static void main(String args[]){
	AdminDao adao = DaoFactory.getAdminDao();
	Admin admin = new Admin();
	admin.setUserName("test@gmail.com");
	admin.setName("test");
	String password = BCrypt.hashpw("1234", BCrypt.gensalt());
	adao.add(admin, password );
}
}
