package bb.com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb.com.model.Config;

/**
 * Servlet Filter implementation class UserFilter
 */
@WebFilter(urlPatterns = { 
		"/index.jsp"
		,"/add-admin.jsp"
		,"/add-client-again.jsp"
		,"/add-client.jsp"
		,"/add-quotation.jsp"
		,"/all-clients.jsp"
		,"/all-quotations.jsp"
		,"/common-error-page.jsp"
		,"/edit-client.jsp"
		,"/quotation.jsp"
		,"/select-client.jsp"
		,"/update-project.jsp"
		,"/update-services.jsp"
		,"/AllClients"
		,"/AllQuotations"
		,"/GetQuotation"
		,"/GetSubServicesTest"
		,"/UpdateProject"
		,"/UpdateServices"
		,"/UpdateClientData"
		,"/UpdateProjectData"
		,"/UpdateServicesData"
		,"/DeleteQuotation"
		,"/QuotationPdf"
})
public class UserFilter implements Filter {

    public UserFilter() {
        
    }

	public void destroy() {
	
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;		
		String location = "/login.jsp";
		try {
			if(req.getSession(false) !=null && req.getSession(false).getAttribute("admin_name")!=null )
			{
				chain.doFilter(request, response);
			
			}
			
			else
			{
				resp.setStatus(302);
				resp.setHeader("location",Config.getBaseUrl()+location);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.setStatus(302);
			resp.setHeader("location", Config.getBaseUrl()+"/index.jsp");
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
