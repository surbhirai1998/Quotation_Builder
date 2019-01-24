<%@page import="bb.com.model.*" %>
<%@page import="bb.com.dao.*" %>
<%@page import="java.util.*" %>
<%
	String pages = "add-quotation";
%>
<%if(session==null){
	response.sendRedirect(Config.getBaseUrl()+"/login.jsp");
} 

ClientDao cdao = DaoFactory.getClientDao();
ArrayList<Client> allClients = cdao.getAllClients();

request.setAttribute("allClients", allClients);

%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Select Client | BlueBanyan</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="robots" content="noindex, nofollow">
    <link href="assets/img/favicon.ico" rel="shortcut icon" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
    <link href="assets/fonts/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="assets/fonts/material-design-icons/material-icon.css" rel="stylesheet" type="text/css" />
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="assets/plugins/material/material.min.css" rel="stylesheet" />
	<link href="assets/plugins/jquery-toast/dist/jquery.toast.min.css" rel="stylesheet" />
	<link href="assets/css/material_style.css" rel="stylesheet" />
    <link href="assets/css/theme/light/theme_style.css" rel="stylesheet" id="rt_style_components" type="text/css" />
    <link href="assets/css/theme/light/style.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/pages/formlayout.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/theme/light/theme-color.css" rel="stylesheet" type="text/css" />
</head>
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white white-sidebar-color logo-indigo">
    <div class="page-wrapper">
        <%@include file="assets/jsp/topbar.jsp"%>
        <div class="page-container">
            <%
				String act="quotations";
			%>
		 	<%@include file="assets/jsp/navbar.jsp"%>
            <div class="page-content-wrapper">
                <div class="page-content" style="">
					<div class="row" style="padding-top:10%; min-height:570px;">
						<div class="col-sm-2">
						</div>
						<div class="col-sm-4">
							<div class="card card-topline-aqua"  style="margin-bottom: 180px; height: 190px;">
								<div class="card-body row">
									<div class="col-lg-12 p-t-20"> 
									<form action="<%=Config.getBaseUrl()%>/GetClientData" method="get" onSubmit=" return checkValidation();">
						              <div class="form-group">
                                            <select class="form-control" name="c_id" id="c_id">
                                                <option value="none">Select Client</option>
                                               <c:forEach var="client" items="${allClients}">
                                                <option value="${client.id}">${client.clientName}  --   ${client.companyName}</option>
                                               </c:forEach>
                                            </select>
                                        </div>
                                       
						            <div class="col-lg-12 p-t-20 text-center"> 
						              	<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-primary generate">Submit</button>
						            </div>
									</form>
						            </div>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<a href="<%=Config.getBaseUrl()%>/add-client.jsp">
								<div class="card card-topline-aqua" style="margin-bottom: 180px; height: 190px;">
									<div class="card-body row" style="padding-top:10px;">
										<div class="col-lg-12 p-t-20 text-center"> 
						              	<div style="font-size:40px;">
						              		<i class="fa fa-user-plus" aria-hidden="true"></i>
						              	</div>
							              <h3 class="text-center">New Client</h3>
							            </div>
									</div>
								</div>
							</a>
						</div>
					</div> 
                </div>
             </div>
        </div>
        <%@include file="assets/jsp/footer.jsp"%>
    </div>
    <script type="text/javascript">
    function checkValidation(){
    	var value = document.getElementById("c_id").value;
    	if(value==='none'){
    		alert("Select a client");
    		return false;
    		
    	}else{
    		return true;
    	}
    }
    </script>
    <script src="assets/plugins/jquery/jquery.min.js" ></script>
    <script src="assets/plugins/popper/popper.js" ></script>
    <script src="assets/plugins/jquery-blockui/jquery.blockui.min.js" ></script>
	<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" ></script>
    <script src="assets/plugins/bootstrap-switch/js/bootstrap-switch.min.js" ></script>
    <script src="assets/plugins/jquery-toast/dist/jquery.toast.min.js" ></script>
	<script src="assets/js/app.js" ></script>
    <script src="assets/js/layout.js" ></script>
	<script src="assets/js/theme-color.js" ></script>
	<script src="assets/plugins/material/material.min.js"></script>
    <script src="assets/js/pages/material-select/getmdl-select.js" ></script>
    <script src="assets/plugins/material-datetimepicker/moment-with-locales.min.js"></script>
</body>
</html>