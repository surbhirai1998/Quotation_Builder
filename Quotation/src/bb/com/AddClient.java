package bb.com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb.com.dao.ClientDao;
import bb.com.dao.DaoFactory;
import bb.com.model.Client;
import bb.com.model.Config;

public class AddClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			
			String clientName = request.getParameter("clientName") ;
			String companyName = request.getParameter("companyName");
			String email= request.getParameter("email");
			String contactNumber = request.getParameter("contactNumber");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String country = request.getParameter("country");
			
			ClientDao dao = DaoFactory.getClientDao();
			Client client = new Client();
			client.setCompanyName(companyName);
			client.setClientName(clientName);
			client.setEmail(email);
			client.setContactNumber(contactNumber);
			client.setCity(city);
			client.setState(state);
			client.setCountry(country);
		
			client = dao.addClient(client);
			int c_id=client.getId();
			if(c_id==0 || client==null){
				response.sendRedirect(Config.getBaseUrl()+"/add-client-again.jsp");
			}
			
			request.getSession(false).setAttribute("msg","added_client_sucessfully");
			response.sendRedirect(Config.getBaseUrl()+"/AllClients");
			
			
			
	}

}
