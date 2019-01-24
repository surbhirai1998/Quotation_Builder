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
import bb.com.model.Client;
import bb.com.model.Config;

public class SelectClient extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectClient() {
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setStatus(302);
		response.setHeader("location",Config.getBaseUrl()+"/select-client.jsp");
		
		
	}

}
