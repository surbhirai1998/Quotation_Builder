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

public class AddAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AddAdmin() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("user_name");
		String password = request.getParameter("password");
		String adminName = request.getParameter("admin_name");
		Admin admin = new Admin();
		admin.setName(adminName);
		admin.setUserName(userName);
		
		String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
		
		AdminDao adao = DaoFactory.getAdminDao();
		boolean added = adao.add(admin, hashedPassword);
		if(!added){
			request.getSession(false).setAttribute("msg","user name already taken");
		}else{
			request.getSession(false).setAttribute("msg","Added");
			
		}
		response.setStatus(302);
		response.setHeader("location", Config.getBaseUrl()+"/add-admin.jsp");
		
	}

}
