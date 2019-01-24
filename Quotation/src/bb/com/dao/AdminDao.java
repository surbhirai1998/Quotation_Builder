package bb.com.dao;

import bb.com.model.Admin;

public interface AdminDao {
	
	Admin login(String userName,String password);
	boolean add(Admin admin,String password);
	boolean updatePassword(String userName,String oldPassword,String newPassword);
}
