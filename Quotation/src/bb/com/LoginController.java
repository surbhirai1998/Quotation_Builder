package bb.com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bb.com.dao.AdminDao;
import bb.com.dao.DaoFactory;
import bb.com.model.Admin;
import bb.com.model.Config;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public LoginController() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("user_name");
		String password = request.getParameter("password");
		
		AdminDao adao = DaoFactory.getAdminDao();
		Admin  admin = adao.login(userName, password);
		
		if(admin != null){
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);			
			session.setAttribute("admin_name", admin.getName());			
			response.sendRedirect(Config.getBaseUrl()+"/index.jsp");
		}else{
			response.sendRedirect(Config.getBaseUrl()+"/login-again.jsp");
		}
		
	}

}
