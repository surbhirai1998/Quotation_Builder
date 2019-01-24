package bb.com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb.com.dao.DaoFactory;
import bb.com.dao.OriginalMSDao;
import bb.com.dao.OriginalSSDao;
import bb.com.model.SubService;

public class FetchSubServices extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public FetchSubServices() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		try {
			String mainService= request.getParameter("service");
			int mainServiceCounter = Integer.parseInt(request.getParameter("mainServiceIdCounter"));
			OriginalSSDao ssdao = DaoFactory.getOriginalSSDao();
			OriginalMSDao msdao = DaoFactory.getOriginalMSDao();
			int m_id= msdao.getIdByName(mainService);
			pw.write("<div id=\"ms-"+mainServiceCounter+"\">");
			if(m_id !=0){
			ArrayList<SubService> subServiceList = ssdao.getAllSubServices(m_id);
			pw.write("<div class=\"card-body row\">");
			pw.write(
					 "<div class=\"col-md-1\"><input type=\"button\"  value=\"x\" class=\"btn btn-danger btn-xs delete\" onClick=\"removeMainService('ms-"+mainServiceCounter+"');\" style=\"height:20px;  padding: 2px;\" ></div>"
					+"<div class=\"col-md-5\"  style=\"font-weight: bold;\" >Main Service : <h5 class=\"ser-title\">"+"<input type=\"hidden\"   name=\"mainServices[]\"  value=\""+mainService+"\" readonly>"+mainService+"</h5></div>"
					+"<div class=\"col-md-4\"  style=\"font-weight: bold;\" >Cost : Rs. <input  type=\"text\"   class=\"mdl-textfield__input\"   placeholder=\"(in INR)\"  name=\"cost[]\" required ></div>"
					+ "</div>"
					);
					
			for(SubService subService : subServiceList)
			{	
				pw.write("<div class=\"col-lg-12 p-t-18\">");
				pw.write("<label class=\"mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect\" for=\""+subService.getDescription()+"-"+mainServiceCounter+"\">");
				pw.write("<input type=\"checkbox\" id=\""+subService.getDescription()+"-"+mainServiceCounter+"\" name=\"subServices"+mainServiceCounter+"[]\" class=\"mdl-checkbox__input\"  "
						+ "value=\""+subService.getDescription()+"\"  checked> &nbsp; &nbsp;");
				pw.write(subService.getDescription());
				pw.write("</label>");
				pw.write("</div>");
			}
			}else{
				pw.write("<div class=\"card-body row\">");
				pw.write(
						"<div class=\"col-md-1\"><input type=\"button\"  value=\"x\" class=\"btn btn-danger btn-xs delete\" onClick=\"removeMainService('ms-"+mainServiceCounter+"');\" style=\"height:20px;  padding: 2px;\" ></div>"
						+"<div class=\"col-md-5\" style=\"font-weight: bold;\" >Other : <h5 class=\"ser-title\">"+"<input type=\"text\" class=\"mdl-textfield__input\" name=\"mainServices[]\"  placeholder=\"Enter Main Service\" required></h5></div>"
						+"<div class=\"col-md-4\" style=\"font-weight: bold;\" >Cost : Rs. <input  class=\"mdl-textfield__input\"   style=\"font-weight: bold;\" type=\"text\"  placeholder=\"(in INR)\"  name=\"cost[]\" required></div>"
						+ "</div>"
						);
			}
			pw.write("<div style=\"height:10px\"></div>");
			pw.write("<div id=\""+mainServiceCounter+"\"> </div>");
			pw.write("<input class=\"btn btn-secondary btn-sm\" style=\"margin:10px;\" type=\"button\" onClick=\"addSubService('"+mainServiceCounter+"',"+mainServiceCounter+");\" value=\"Add sub service\">");
			pw.write("<hr style=\"margin: 2px;\">");	
			pw.write("</div");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
