package bb.com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb.com.dao.ClientDao;
import bb.com.dao.DaoFactory;
import bb.com.dao.ProjectDao;
import bb.com.util.DbUtil;

public class GetMaxClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public GetMaxClient() {
        super();
     
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ClientDao cdao = null;
		PrintWriter pw = response.getWriter();
			cdao = DaoFactory.getClientDao();
			
			int max_c_id = cdao.getClientCount();
			pw.write(max_c_id);
			
	}

}
