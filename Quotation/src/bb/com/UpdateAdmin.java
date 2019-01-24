package bb.com;

import bb.com.dao.AdminDao;
import bb.com.dao.DaoFactory;
import bb.com.model.Admin;
import bb.com.util.BCrypt;

public class UpdateAdmin {

	public static void main(String[] args) {
		
		String oldPass = "1234";
		String newPass = "12345";
		
		String oldPassword = BCrypt.hashpw( oldPass, BCrypt.gensalt());
		String newPassword = BCrypt.hashpw(newPass , BCrypt.gensalt());
		String userName = "test@gmail.com";
		Admin newAdmin = null;
		AdminDao adao = DaoFactory.getAdminDao();
		newAdmin = adao.login(userName,oldPass);
		if(newAdmin==null){
			System.out.println("wrong old Password");
			return;
		}
		
		boolean done = adao.updatePassword(userName, oldPassword, newPassword);
		
		System.out.println(done);
	}

}
