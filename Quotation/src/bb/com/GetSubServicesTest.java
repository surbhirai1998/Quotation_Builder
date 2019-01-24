package bb.com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.lang.jstl.OrOperator;

import bb.com.dao.DaoFactory;
import bb.com.dao.OriginalMSDao;
import bb.com.dao.OriginalSSDao;
import bb.com.model.SubService;

public class GetSubServicesTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public GetSubServicesTest() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		try {
			OriginalSSDao ssdao = DaoFactory.getOriginalSSDao();
			OriginalMSDao msdao = DaoFactory.getOriginalMSDao();
			String mainService= request.getParameter("service");
			int m_id= msdao.getIdByName(mainService);
			ArrayList<SubService> subServiceList = ssdao.getAllSubServices(m_id);
			pw.write("<div id=\"1\">");
			pw.write("<h5 class=\"ser-title\">"+mainService+"</h5>  	<hr style=\"margin: 2px;\">");
			for(SubService subService : subServiceList)
			{	
				pw.write("<label class=\"mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect\" for=\"websiteDesign\">");
				pw.write("<input type=\"checkbox\" id=\"websiteDesign\" name=\"subServices"+m_id+"\" class=\"mdl-checkbox__input\" checked>");
				//pw.write("<input type=\"text\" class=\"mdl-textfield__input service-input\" id =\"\" name=\"\" value=\""+subService.getDescription()+"\" />");
				pw.write(subService.getDescription());
				pw.write("</label>");
			}
			pw.write("</div");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
