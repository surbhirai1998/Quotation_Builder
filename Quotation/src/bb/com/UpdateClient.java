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

public class UpdateClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		//int p_id = Integer.parseInt(request.getParameter("pid"));
		//String senderName = request.getParameter("senderName");
		String clientName = request.getParameter("clientName") ;
		String companyName = request.getParameter("companyName");
		String email= request.getParameter("email");
		String contactNumber = request.getParameter("contactNumber");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");

		Client client = new Client();
		client.setId(c_id);
		client.setCity(city);
		client.setClientName(clientName);
		client.setCompanyName(companyName);
		client.setContactNumber(contactNumber);
		client.setCountry(country);
		client.setEmail(email);
		client.setState(state);
		
		
		ClientDao cdao = DaoFactory.getClientDao();	
		cdao.updateClient(client);
		//cdao.setSenderName(c_id, senderName);
		
		request.setAttribute("c_id", c_id);
		//request.setAttribute("p_id", p_id);
		/*RequestDispatcher rd = request.getRequestDispatcher("GetNewData");
		rd.forward(request,response);*/
		request.getSession(false).setAttribute("msg", "updated_client_sucessfully");
		response.sendRedirect(Config.getBaseUrl()+"/AllClients");
		
	}

}
