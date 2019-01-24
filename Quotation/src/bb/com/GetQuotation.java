package bb.com;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb.com.dao.DaoFactory;
import bb.com.dao.ProjectDao;
import bb.com.model.Config;
import bb.com.model.Quotation;

public class GetQuotation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public GetQuotation() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int p_id=Integer.parseInt(request.getParameter("p_id"));
		response.setStatus(302);
		response.setHeader("location",Config.getBaseUrl()+"/quotation.jsp?p_id="+p_id);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int p_id = (Integer )request.getAttribute("p_id");

		response.setStatus(302);
		response.setHeader("location",Config.getBaseUrl()+"/quotation.jsp?p_id="+p_id);
		
		
	}

}
