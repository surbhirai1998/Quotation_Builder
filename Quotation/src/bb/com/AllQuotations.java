package bb.com;

import java.io.IOException;
import java.util.ArrayList;

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

public class AllQuotations extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AllQuotations() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*ProjectDao pdao = DaoFactory.getProjectDao();
		ArrayList<Quotation> quotationList= pdao.getAllQuotations();
		request.setAttribute("quotationList", quotationList);
		RequestDispatcher rd = request.getRequestDispatcher(Config.getBaseUrl()+"/all-quotations.jsp");
		rd.forward(request, response);*/
		
		response.setStatus(302);
		response.setHeader("location",Config.getBaseUrl()+"/all-quotations.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
