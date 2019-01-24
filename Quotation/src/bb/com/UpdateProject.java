package bb.com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb.com.dao.DaoFactory;
import bb.com.dao.ProjectDao;
import bb.com.model.Config;
import bb.com.model.Project;
import bb.com.model.Quotation;

public class UpdateProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		String projectName= request.getParameter("projectName");
		String term= request.getParameter("term");
		String senderName= request.getParameter("senderName");
		String extraNote= request.getParameter("extraNote");
		
		Project project = new Project();
		project.setPid(p_id);
		project.setProjectName(projectName);
		project.setTerm(term );
		project.setSenderName(senderName);
		project.setExtraNote(extraNote);
		
		ProjectDao pdao = DaoFactory.getProjectDao();
		pdao.updateProject(project);
		

		/*request.setAttribute("p_id", p_id);
		RequestDispatcher rd = request.getRequestDispatcher("GetQuotation");
		rd.forward(request, response);*/
		request.getSession(false).setAttribute("msg",	"updated_quotation_successfully");
		response.setStatus(302);
		response.setHeader("location", Config.getBaseUrl()+"/all-quotations.jsp");
		
	}

}
