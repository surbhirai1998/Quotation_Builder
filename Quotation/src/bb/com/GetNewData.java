package bb.com;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb.com.dao.ClientDao;
import bb.com.dao.DaoFactory;
import bb.com.dao.ProjectDao;
import bb.com.model.Client;
import bb.com.model.Config;
import bb.com.model.MainService;
import bb.com.model.Project;

public class GetNewData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int c_id = Integer.parseInt(request.getParameter("c_id"));
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		
		ClientDao cdao = DaoFactory.getClientDao();
		Client client = cdao.getClient(c_id);
		
		ProjectDao pdao = DaoFactory.getProjectDao();
		Project project = pdao.getProject(p_id);
		
		ArrayList<MainService> mainServiceList = project.getMainServices();
		
		request.setAttribute("client", client);
		request.setAttribute("project", project);
		request.setAttribute("pid", p_id);
		request.setAttribute("mainServiceList", mainServiceList);
		RequestDispatcher rd = request.getRequestDispatcher(Config.getBaseUrl()+"/VerifyDetails.jsp");
		rd.forward(request, response);
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int c_id = Integer.parseInt(request.getParameter("c_id"));
		int p_id = Integer.parseInt(request.getParameter("p_id"));
				
		ClientDao cdao = DaoFactory.getClientDao();
		Client client = cdao.getClient(c_id);
		
		ProjectDao pdao = DaoFactory.getProjectDao();
		Project project = pdao.getProject(p_id);
		
		ArrayList<MainService> mainServiceList = project.getMainServices();
		
		request.setAttribute("client", client);
		request.setAttribute("c_id", c_id);
		request.setAttribute("project", project);
		request.setAttribute("pid", p_id);
		request.setAttribute("mainServiceList", mainServiceList);
		RequestDispatcher rd = request.getRequestDispatcher(Config.getBaseUrl()+"/VerifyDetails.jsp");
		rd.forward(request, response);
		
	}

}
