package bb.com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb.com.dao.ClientDao;
import bb.com.dao.DaoFactory;
import bb.com.dao.ProjectDao;
import bb.com.model.Config;

public class DeleteClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeleteClient() {
        super();
            }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		
		ClientDao dao = DaoFactory.getClientDao();
		ProjectDao pdao = DaoFactory.getProjectDao();
		try{
			pdao.deleteAllProjects(c_id);
			dao.deleteClient(c_id);
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("error_no", 1);
			response.setStatus(302);
			response.setHeader("location",Config.getBaseUrl()+"/common_error_page.jsp");
			/*RequestDispatcher rd = request.getRequestDispatcher(Config.getBaseUrl()+"/err_test.jsp");
			rd.forward(request, response);*/
		}

		response.setStatus(302);
		response.setHeader("location",Config.getBaseUrl()+"/all-clients.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
int c_id = Integer.parseInt(request.getParameter("c_id"));
		
		ClientDao dao = DaoFactory.getClientDao();
		ProjectDao pdao = DaoFactory.getProjectDao();
		try{
			dao.deleteClient(c_id);
			pdao.deleteAllProjects(c_id);
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("error_no", 1);
			
			response.setStatus(302);
			response.setHeader("location",Config.getBaseUrl()+"/common_error_page.jsp");
		}
		

		response.setStatus(302);
		response.setHeader("location",Config.getBaseUrl()+"/all-clients.jsp");
	}

}
