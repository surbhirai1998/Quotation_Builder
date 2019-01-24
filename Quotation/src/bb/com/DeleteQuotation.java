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
import bb.com.model.Quotation;

public class DeleteQuotation extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeleteQuotation() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProjectDao pdao = DaoFactory.getProjectDao();
		int p_id=Integer.parseInt(request.getParameter("p_id"));
		pdao.deleteProject(p_id); 
		response.sendRedirect(Config.getBaseUrl()+"/AllQuotations");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
