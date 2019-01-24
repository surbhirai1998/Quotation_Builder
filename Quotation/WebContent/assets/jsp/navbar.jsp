<%@page import="bb.com.model.Config" %>
<div class="sidebar-container">
 				<div class="sidemenu-container navbar-collapse collapse fixed-menu">
	                <div id="remove-scroll">
	                    <ul class="sidemenu  page-header-fixed" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
	                        <li class="sidebar-toggler-wrapper hide">
	                            <div class="sidebar-toggler">
	                                <span></span>
	                            </div>
	                        </li>
	                        <%
	                        String admin_name = null;
	                        admin_name =(String)session.getAttribute("admin_name"); 
	                        if(admin_name==null ||!request.isRequestedSessionIdValid()){
	                        	response.sendRedirect(Config.getBaseUrl()+"/login.jsp");
	                        }
	                        %>
	                        <li class="nav-item">
	                            <a href="<%=Config.getBaseUrl()%>/index.jsp" class="nav-link nav-toggle"> <i class="fa fa-user-circle"></i>
	                                <span class="title"><%=admin_name%></span> 
	                            </a>
	                        </li>
	                        <li class="nav-item <% if(pages.equals("index")){%>active<%}%>">
	                            <a href="<%=Config.getBaseUrl()%>/index.jsp" class="nav-link nav-toggle"> <i class="fa fa-th-large"></i>
	                                <span class="title">Dashboard</span> 
	                            </a>
	                        </li>
	                      
	                        <li class="nav-item <% if(act.equals("clients")){%>active<%}%>">
	                            <a href="#" class="nav-link nav-toggle"> <i class="fa fa-users"></i>
	                                <span class="title">Clients</span> <span class="arrow"></span>
	                            </a>
	                            <ul class="sub-menu">
	                                <li class="nav-item <% if(pages.equals("all-clients")){%>active<%}%>">
	                                    <a href="<%=Config.getBaseUrl()%>/AllClients" class="nav-link"> <span class="title">All Clients</span></a>
	                                </li>
	                                <li class="nav-item <% if(pages.equals("add-client")){%>active<%}%>">
	                                    <a href="<%=Config.getBaseUrl()%>/add-client.jsp" class="nav-link"> <span class="title">Add Client</span></a>
	                                </li>
	                            </ul>
	                        </li>
	                        <li class="nav-item <% if(act.equals("quotations")){%>active<%}%>">
	                            <a href="javascript:;" class="nav-link nav-toggle">
	                                <i class="fa fa-file-text"></i>
	                                <span class="title">Quotations</span>
	                                <span class="arrow"></span>
	                            </a>
	                            <ul class="sub-menu">
	                                <li class="nav-item <% if(pages.equals("all-quotations")){%>active<%}%>">
	                                    <a href="<%=Config.getBaseUrl()%>/AllQuotations" class="nav-link ">
	                                        <span class="title">All Quotations</span>
	                                    </a>
	                                </li>
	                                <li class="nav-item <% if(pages.equals("add-quotation")){%>active<%}%>">
	                                    <a href="<%=Config.getBaseUrl()%>/SelectClient" class="nav-link">
	                                        <span class="title">Add Quotation</span>
	                                    </a>
	                                </li>
	                            </ul>
	                        </li>
	                          <li class="nav-item <% if(pages.equals("add-admin")){%>active<%}%>">
	                            <a href="<%=Config.getBaseUrl()%>/add-admin.jsp" class="nav-link nav-toggle"> <i class="fa fa-user-plus"></i>
	                                <span class="title">Add Admin</span> 
	                            </a>
	                        </li>
	                          <li class="nav-item <% if(pages.equals("update-admin")){%>active<%}%>">
	                            <a href="<%=Config.getBaseUrl()%>/update-admin.jsp" class="nav-link nav-toggle"> <i class="fa fa-refresh" aria-hidden="true"></i>

	                                <span class="title">Update Admin</span> 
	                            </a>
	                        </li>
	                        <li class="nav-item hidden-min-481">
	                            <a href="<%=Config.getBaseUrl()%>/LogoutController" class="nav-link nav-toggle"> <i class="fa fa-power-off"></i>
	                                <span class="title">Logout</span> 
	                            </a>
	                        </li>
	                    </ul>
	                </div>
                </div>
            </div>
