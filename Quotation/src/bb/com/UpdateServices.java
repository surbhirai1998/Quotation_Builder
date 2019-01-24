package bb.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb.com.dao.ClientDaoOracleImpl;
import bb.com.dao.DaoFactory;
import bb.com.dao.MainServiceDao;
import bb.com.dao.ProjectDao;
import bb.com.dao.SubServiceDao;
import bb.com.model.Config;
import bb.com.model.MainService;
import bb.com.model.Project;
import bb.com.model.Quotation;
import bb.com.model.SubService;
import bb.com.util.DbUtil;

public class UpdateServices extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UpdateServices() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		String mainService[]= request.getParameterValues("mainServices[]");
		String costStr[] =request.getParameterValues("cost[]");
		int counter = 0;
		int mainServiceIdCounter = Integer.parseInt(request.getParameter("mainServiceIdCounter")) ;
		
		ProjectDao pdao = DaoFactory.getProjectDao();
		MainServiceDao msdao = DaoFactory.getMainServiceDao();

		Quotation quotation = pdao.getQuotation(p_id);
		Project project = quotation.getProject();
		Connection con  = null;
		try{
			con = DbUtil.getConnection();
			msdao.deleteAllMainServices(con,p_id);
		
			ArrayList<ArrayList<SubService>> allSubServicesList = new ArrayList<ArrayList<SubService>>();
			for(int i=0;i<mainServiceIdCounter;i++){
				String[] ssDescriptionList = null;
				if(request.getParameterValues("subServices"+(i+1)+"[]")==null){
					continue;
				}
				counter++;
				ssDescriptionList=request.getParameterValues("subServices"+(i+1)+"[]");
				ArrayList<SubService> subServicesList = new ArrayList<SubService>();
				
				for(String description: ssDescriptionList){
					SubService subService = new SubService();
					subService.setDescription(description);
					subServicesList.add(subService);
				}
				allSubServicesList.add(subServicesList);
			}
			
		
			int cost[]=new int[counter];
			
			for(int i=0;i<counter;i++){			
				cost[i] = Integer.parseInt(costStr[i]);
			}
			
			
			ArrayList<MainService> mainServices  = new ArrayList<MainService>();
			
			//edit for mainservice
			for(int i=0 ;i<counter;i++){
				MainService ms = new MainService();
				ms.setCost(cost[i]);
				ms.setMainService(mainService[i]);
				ArrayList<SubService> subServices = allSubServicesList.get(i);
				ms.setSubServices(subServices);
				mainServices.add(ms);
			}
			
			
			SubServiceDao ssdao = DaoFactory.getSubServiceDao();
			
				for(MainService ms : mainServices){
					int m_id= msdao.add(con,ms,p_id);
					ArrayList<SubService> ssList = ms.getSubServices();
					ms.setId(m_id);
					for(SubService ss:ssList){
						int s_id = ssdao.add(con,ss.getDescription(),m_id);
						ss.setS_id(s_id);
					}
			
				}
		}catch(Exception e){
			e.printStackTrace();
			try {
				con.rollback();
				response.sendRedirect(Config.getBaseUrl()+"/index.jsp");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			try {
				DbUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
		/*request.setAttribute("p_id", p_id);
		RequestDispatcher rd = request.getRequestDispatcher("GetQuotation");
		rd.forward(request, response);*/
		request.getSession(false).setAttribute("msg",	"updated_quotation_successfully");
		response.setStatus(302);
		response.setHeader("location", Config.getBaseUrl()+"/all-quotations.jsp");
		
	}

}
