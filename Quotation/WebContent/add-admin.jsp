<%@page import="bb.com.model.Config" %>
<%
	String pages = "add-admin";
%>
<%
HttpSession httpSession = request.getSession(false);
String msg = httpSession.getAttribute("msg")!=null?httpSession.getAttribute("msg").toString():"";
httpSession.removeAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Admin | BlueBanyan</title>
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
	<link href="assets/css/theme/light/theme-color.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.css" rel="stylesheet" />
</head>
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white white-sidebar-color logo-indigo">
   <input type="hidden" name="msg" id="msg" value="<%=msg%>"/>
    <div class="page-wrapper">
        <%@include file="assets/jsp/topbar.jsp"%>
        <div class="page-container">
           <%String act="add-admin" ;%>
		 	<%@include file="assets/jsp/navbar.jsp"%>
            <div class="page-content-wrapper">
                <div class="page-content">
					<div class="row">
						<div class="col-sm-12">
							<div class="card card-topline-green">
								<div class="card-head">
									<header>Add new Admin</header>
									<div class="tools">
                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
	                                    <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                    </div>
								</div>
								<form method="post" action="<%=Config.getBaseUrl()%>/AddAdmin">
								<div class="card-body row">
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" id ="" name="admin_name" required/>
					                     <label class="mdl-textfield__label">Admin Name</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="email" class="mdl-textfield__input" id ="" name="user_name" required/>
					                     <label class="mdl-textfield__label">User Name</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="password" class="mdl-textfield__input" id ="" name="password" required/>
					                     <label class="mdl-textfield__label">Password</label>
					                  </div>
						            </div>
						            
							         <div class="col-lg-12 p-t-20 text-center"> 
						              	<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-primary add">Submit</button>
										<button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
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
    <script src="assets/plugins/bootstrap-switch/js/bootstrap-switch.min.js" ></script>
    <script src="assets/plugins/jquery-toast/dist/jquery.toast.min.js" ></script>
	<script src="assets/js/app.js" ></script>
    <script src="assets/js/layout.js" ></script>
	<script src="assets/js/theme-color.js" ></script>
	<script src="assets/plugins/material/material.min.js"></script>
    <script src="assets/js/pages/material-select/getmdl-select.js" ></script>
    <script src="assets/plugins/material-datetimepicker/moment-with-locales.min.js"></script>
	<script src="assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.js"></script>
	<script src="assets/plugins/material-datetimepicker/datetimepicker.js"></script>
	<script>
	$(document).ready(function(){
		if($("#msg").val()==="user name already taken"){
			$.toast({
				heading:'Duplication',
					text: 'User Name already used',
	         		position: 'top-right',
	         		loaderBg:'#ff6849',
	         		icon: 'error',
	         		hideAfter: 3500, 
	         		stack: 6
			});
		}else  if($("#msg").val()==="Added"){
			$.toast({
				heading:'Success',
					text: 'New Admin Added',
	         		position: 'top-right',
	         		loaderBg:'#ff6849',
	         		icon: 'success',
	         		hideAfter: 3500, 
	         		stack: 6
			});
		}
	});
	</script>
</body>
</html>