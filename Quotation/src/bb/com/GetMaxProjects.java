package bb.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb.com.dao.ClientDao;
import bb.com.dao.DaoFactory;
import bb.com.dao.ProjectDao;

public class GetMaxProjects extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public GetMaxProjects() {
        super();
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProjectDao pdao = null;
		PrintWriter pw = response.getWriter();
			
			pdao = DaoFactory.getProjectDao();
			
			int max_p_id = pdao.getProjectCount();
			pw.write(max_p_id);
	}

}
