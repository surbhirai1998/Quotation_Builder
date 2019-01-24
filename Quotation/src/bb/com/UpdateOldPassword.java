package bb.com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb.com.dao.AdminDao;
import bb.com.dao.DaoFactory;
import bb.com.model.Admin;
import bb.com.model.Config;
import bb.com.util.BCrypt;

public class UpdateOldPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public UpdateOldPassword() {
        super();
       
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String oldPass =request.getParameter("old_password");
		String newPass = request.getParameter("new_password");
		String userName =request.getParameter("user_name");
		
		String oldPassword = BCrypt.hashpw( oldPass, BCrypt.gensalt());
		String newPassword = BCrypt.hashpw(newPass , BCrypt.gensalt());
		Admin newAdmin = null;
		AdminDao adao = DaoFactory.getAdminDao();
		newAdmin = adao.login(userName,oldPass);
		if(newAdmin==null){
			request.getSession(false).setAttribute("msg", "password incorrect");
		}
		else{
			
		boolean done = adao.updatePassword(userName, oldPassword, newPassword);
		if(done==true){
			request.getSession(false).setAttribute("msg", "Updated");	
		}else{
			request.getSession(false).setAttribute("msg", "Not Updated");
		}
		}
		
		response.setStatus(302);
		response.setHeader("location",Config.getBaseUrl()+"/update-admin.jsp");			
	}

}
