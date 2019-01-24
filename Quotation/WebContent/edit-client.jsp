<%@page import="java.sql.SQLException"%>
<%@page import="bb.com.util.DbUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="bb.com.dao.*"%>
<%@page import="java.util.*"%>
<%@page import="bb.com.model.Client"%>
<%
	String pages = "all-clients";
	
if(request.getParameter("c_id")==null && request.getParameter("c_id").trim()=="" ){
	response.sendRedirect(Config.getBaseUrl()+"/AllClients");
}

	Connection con = null;
	Client client = null;
	ClientDao cdao = DaoFactory.getClientDao();
	int id = Integer.parseInt(request.getParameter("c_id").toString());
	ArrayList<Client> allClients=null;
	client = cdao.getClient(id);
	allClients = cdao.getAllClients();
	request.setAttribute("client",client);
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Client | BlueBanyan</title>
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
	<link href="assets/plugins/jquery-toast/dist/jquery.toast.min.css" rel="stylesheet" />
	<link href="assets/css/material_style.css" rel="stylesheet" />
    <link href="assets/css/theme/light/theme_style.css" rel="stylesheet" id="rt_style_components" type="text/css" />
    <link href="assets/css/theme/light/style.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/theme/light/theme-color.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/dropzone/dropzone.css" rel="stylesheet" media="screen">
    <link href="assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.css" rel="stylesheet" />
<script type="text/javascript">
function checkDuplication(){
	 var email_entered = ''+document.getElementById('client_email').value;
	<%for(Client c:allClients){%>
	if((<%=id%>!=<%=c.getId()%>) &&(email_entered=='<%=c.getEmail()%>') ){
		alert('Client Email already present');
		return false;
	}
	<%}%>
	return true; 
	
}

</script>
</head>
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white white-sidebar-color logo-indigo">
    <div class="page-wrapper">
    	<%@include file="assets/jsp/topbar.jsp"%>
        <div class="page-container">
            <%
				String act="clients";
			%>
		 	<%@include file="assets/jsp/navbar.jsp"%>
            <div class="page-content-wrapper">
                <div class="page-content">
					<div class="row">
						<div class="col-sm-12">
							<div class="card-box">
								<div class="card-head">
									<header>Edit client information</header>
									<div class="tools">
                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
	                                    <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                    </div>
								</div>
								<form method="post" action="<%=Config.getBaseUrl()%>/UpdateClient"   onSubmit="return checkDuplication();" >
								<input type="hidden" value="${client.id}" name="c_id">
								<div class="card-body row">
						            <div class="col-lg-12 p-t-20"> 
						              <div class= "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="email" class="mdl-textfield__input" value="${client.email}" id="client_email" name="email" required/>
					                     <label class="mdl-textfield__label">Email</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class= "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" value="${client.companyName}" id="" name="companyName"  />
					                     <label class="mdl-textfield__label">Company Name </label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class= "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" value="${client.clientName}" id=" " name="clientName" required/>
					                     <label class="mdl-textfield__label">Name</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class= "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" value="${client.contactNumber}" id=""title="Enter 10 digit mobile number" name="contactNumber" pattern="[0-9]{10}" required/>
					                     <label class="mdl-textfield__label">Contact Number</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class= "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" value="${client.country}" id="" name="country" />
					                     <label class="mdl-textfield__label">Country</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class= "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" value="${client.state}" id="" name="state" />
					                     <label class="mdl-textfield__label">State</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class= "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" value="${client.city}" id="" name="city" required/>
					                     <label class="mdl-textfield__label">City</label>
					                  </div>
						            </div>
							         <div class="col-lg-12 p-t-20 text-center"> 
						              	<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-primary update">Update</button>
										<a href="<%=Config.getBaseUrl()%>/AllClients">
										<button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
										</a>
						            </div>
								</div>
								</form>
							</div>
						</div>
					</div> 
                 </div>
             </div>
        </div>
        <%@include file="assets/jsp/footer.jsp"%>
    </div>
    <script src="assets/plugins/jquery/jquery.min.js" ></script>
    <script src="assets/plugins/popper/popper.js" ></script>
    <script src="assets/plugins/jquery-blockui/jquery.blockui.min.js" ></script>
    <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" ></script>
    <script src="assets/plugins/jquery-toast/dist/jquery.toast.min.js" ></script>
	<script src="assets/js/app.js" ></script>
    <script src="assets/js/layout.js" ></script>
	<script src="assets/js/theme-color.js" ></script>
	<script src="assets/plugins/material/material.min.js"></script>
    <script src="assets/js/pages/material-select/getmdl-select.js" ></script>
    <script src="assets/plugins/material-datetimepicker/moment-with-locales.min.js"></script>
	<script src="assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.js"></script>
	<script src="assets/plugins/material-datetimepicker/datetimepicker.js"></script>
    <script src="assets/plugins/dropzone/dropzone.js" ></script>
    <script src="assets/plugins/dropzone/dropzone-call.js" ></script>
  <!--   <script>
		$(".update").on("click",function(){
        	$.toast({
        		heading: 'Successful',
       			text: 'Client\'\s detail have been updated.',
         		position: 'top-right',
         		loaderBg:'#ff6849',
         		icon: 'success',
         		hideAfter: 3500, 
         		stack: 6
      		});
  		});
	</script> -->
</body>
</html>