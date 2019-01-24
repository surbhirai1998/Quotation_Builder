<%
	String pages = "index";
%>
<%@page import="bb.com.dao.ProjectDao,bb.com.dao.DaoFactory,bb.com.dao.ClientDao,bb.com.dao.ClientDao" %>
<%
	session = request.getSession(false);
	if(session==null){
		response.sendRedirect(Config.getBaseUrl()+"/login.jsp");
	}
	ClientDao cdao = null;
	ProjectDao pdao = null;
	cdao = DaoFactory.getClientDao();
	pdao = DaoFactory.getProjectDao();
		
	int max_p_id = pdao.getProjectCount();
	int max_c_id = cdao.getClientCount();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashbord | BlueBanyan</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="robots" content="noindex, nofollow">
    <link href="assets/img/favicon.ico" rel="shortcut icon" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
    <link href="assets/fonts/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="assets/fonts/material-design-icons/material-icon.css" rel="stylesheet" type="text/css" />
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="assets/plugins/material/material.min.css" rel="stylesheet" />
	<link href="assets/css/material_style.css" rel="stylesheet" />
    <link href="assets/css/pages/inbox.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/theme/light/theme_style.css" rel="stylesheet" id="rt_style_components" type="text/css" />
    <link href="assets/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/theme/light/style.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/theme/light/theme-color.css" rel="stylesheet" type="text/css" /> 
    <style>
    	.dashCardBox{
    		background-size: cover ! important; 
    		padding: 0px ! important;
    	}
    	.dashCardContent{
    		margin: -1px ! important; 
    		border-radius: 3px ! important;
    	}
    </style>
</head>
<body  class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white white-sidebar-color logo-indigo">
    <div class="page-wrapper">
        <%@include file="assets/jsp/topbar.jsp"%>
        <div class="page-container">
 			<%
				String act="index";
			%>
		 	<%@include file="assets/jsp/navbar.jsp"%>
            <div class="page-content-wrapper">
                <div class="page-content">
					<div class="state-overview" style="min-height:600px;">
						<div class="row">
					        <div class="col-lg-3 col-sm-6">
								<a href="<%=Config.getBaseUrl()%>/AllClients">
									<div class="overview-panel dashCardBox" style="background-image: url('assets/img/bg/1.jpg');">
										<div class="purple dashCardContent" style="background-color: rgba(233, 30, 99, 0.49);">
											<div class="symbol">
												<i class="fa fa-users usr-clr"></i>
											</div>
											<div class="value white">
												<p id ="max_c_id" class="sbold addr-font-h1" data-counter="counterup" ><%=max_c_id %></p>
												<p>CLIENTS</p>
											</div>
										</div>
									</div>
								</a>
							</div>
					        <div class="col-lg-3 col-sm-6">
								<a href="<%=Config.getBaseUrl()%>/AllQuotations">
									<div class="overview-panel" style="background-image: url('assets/img/bg/2.jpg'); background-size: cover; padding: 0px;">
										<div class="purple" style="background-color: rgba(232, 155, 38, 0.63); margin: -1px; border-radius: 3px;">
											<div class="symbol">
												<i class="fa fa-file-text"></i>
											</div>
											<div class="value white">
												<p id ="max_p_id" class="sbold addr-font-h1" data-counter="counterup" ><%=max_p_id %></p>
												<p>QUOTATIONS</p>
											</div>
										</div>
									</div>
								</a>
							</div>
					   </div>
					</div>
                </div>
            </div>
        </div>
        <%@include file="assets/jsp/footer.jsp"%>
    </div>
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <script src="assets/plugins/popper/popper.js"></script>
    <script src="assets/plugins/jquery-blockui/jquery.blockui.min.js"></script>
	<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
    <script src="assets/plugins/sparkline/jquery.sparkline.js"></script>
	<script src="assets/js/app.js"></script>
    <script src="assets/js/layout.js"></script>
    <script src="assets/js/theme-color.js"></script>
    <script src="assets/plugins/material/material.min.js"></script>
    <script src="assets/plugins/chart-js/Chart.bundle.js"></script>
    <script src="assets/plugins/chart-js/utils.js"></script>
  </body>
</html>