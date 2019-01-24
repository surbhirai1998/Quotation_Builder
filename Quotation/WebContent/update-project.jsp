<%@ page import="bb.com.model.*" %>
<%@ page import="bb.com.dao.*" %>
<%@ page import="java.util.*" %>
<%
	String pages = "all-quotations";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
if(request.getParameter("p_id")==null && request.getParameter("p_id").trim()=="" ){
	response.sendRedirect(Config.getBaseUrl()+"/AllQuotations");
}
int p_id = Integer.parseInt(request.getParameter("p_id"));
ProjectDao pdao = DaoFactory.getProjectDao();
Quotation quotation = pdao.getQuotation(p_id);
request.setAttribute("quotation", quotation);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Quotation | BlueBanyan</title>
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
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <style>
		.autocomplete {
			position: relative;
			display: inline-block;
		}
		input[type=submit] {
			background-color: DodgerBlue;
			color: #fff;
			cursor: pointer;
		}
		.autocomplete-items {
			position: absolute;
			border: 1px solid #d4d4d4;
			border-bottom: none;
			border-top: none;
			z-index: 99;
			margin-top: 0px;
			/*margin-left: 7%;*/
			width: 100%;
		}
		.autocomplete-items div {
			padding-left: 5px;
			cursor: pointer;
			background-color: #fff; 
			border-bottom: 1px solid #d4d4d4; 
			font-size: 14px;
			color: #565b60;
			font-weight: 400;
			letter-spacing: 1px;
		}
		.autocomplete-items div:hover {
			background-color: #e9e9e9; 
		}
		.autocomplete-active {
			background-color: #6673fc !important; 
			color: #fff ! important; 
			font-weight: 900;
			letter-spacing: 1px;
		}
		.service{
        	display: none;
        	border: solid 1px #188ae2;
        	padding: 0px 20px 20px 20px;;
        	margin: 0px 14px;
        	width: 100%;
        	border-radius: 10px;
        }
        .ser-title{
        	color: #343a40;
        	font-weight: 500;
        }
        .service-input{
        	border-bottom:none; 
        	font-size:14px ! important; 
        	margin-top:-4px;
        }
	</style>
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
                <div class="page-content">
					<div class="row">
						<div class="col-sm-12">
							<div class="card card-topline-aqua" style="margin-bottom:180px;">
								<div class="card-head">
									<header>Quotation</header>
									<div class="tools">
                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
	                                    <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                    </div>
								</div>
								<form method="post" action="<%=Config.getBaseUrl()%>/UpdateProject">
								<input type="hidden" name="c_id"  value="${quotation.client.id}" >
								<input type="hidden" name="p_id"  value="${quotation.project.pid}" >
								<div class="card-body row">
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" id ="" value="${quotation.client.clientName}" readonly />
					                     <label class="mdl-textfield__label">Client Name</label>
					                  </div>
					               </div>   
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" id ="" value="${quotation.client.companyName}" readonly />
					                     <label class="mdl-textfield__label">Company Name</label>
					                  </div>
					               </div>   
						            <h2>Project Details </h2>
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" id ="" name="senderName" value="${quotation.project.senderName}" />
					                     <label class="mdl-textfield__label">Sender Name</label>
					                  </div>
					               </div>   
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" id ="" name="projectName" value="${quotation.project.projectName}" />
					                     <label class="mdl-textfield__label">Project</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" id ="date" name="term" placeholder="Date" value="${quotation.project.term}" />
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield txt-full-width">
					                     <textarea class = "mdl-textfield__input" rows="2" id = "text7" name="extraNote">${quotation.project.extraNote}</textarea>
					                     <label class = "mdl-textfield__label" for = "text7">Note</label>
					                  </div>
						            </div>
									<div class="col-lg-12" style="height:20px;"></div>
						           <button class="btn btn-primary btn-block" type="submit">Update</button>
									</div>
								</form>
							</div>
									<div class="col-lg-12" style="height:20px;"></div>
						           
							
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
 	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
	
	<script>
		function autocomplete(inp, arr) {
			var currentFocus;
		  	inp.addEventListener("input", function(e) {
				var a, b, i, val = this.value;
			  	closeAllLists();
			  	if (!val) { return false;}
			  	currentFocus = -1;
			  	a = document.createElement("DIV");
			  	a.setAttribute("id", this.id + "autocomplete-list");
			  	a.setAttribute("class", "autocomplete-items");
			  	this.parentNode.appendChild(a);
			  	for (i = 0; i < arr.length; i++) {
					if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
				  		b = document.createElement("DIV");
				  		b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
				  		b.innerHTML += arr[i].substr(val.length);
				  		b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
				  		b.addEventListener("click", function(e) {
					  		inp.value = this.getElementsByTagName("input")[0].value;
					  		closeAllLists();
				  		});
				  		a.appendChild(b);
					}
			   }
		  });
		  inp.addEventListener("keydown", function(e) {
			  var x = document.getElementById(this.id + "autocomplete-list");
			  if (x) x = x.getElementsByTagName("div");
			  if (e.keyCode == 40) {
			  	currentFocus++;
				addActive(x);
			  } 
			  else if (e.keyCode == 38) { //up
				currentFocus--;
				addActive(x);
			  } 
			  else if (e.keyCode == 13) {
				e.preventDefault();
				if (currentFocus > -1) {
				  if (x) x[currentFocus].click();
				}
			  }
		  });
		  function addActive(x) {
			if (!x) return false;
			removeActive(x);
			if (currentFocus >= x.length) currentFocus = 0;
			if (currentFocus < 0) currentFocus = (x.length - 1);
			x[currentFocus].classList.add("autocomplete-active");
		  }
		  function removeActive(x) {
			for (var i = 0; i < x.length; i++) {
			  x[i].classList.remove("autocomplete-active");
			}
		  }
		  function closeAllLists(elmnt) {
			var x = document.getElementsByClassName("autocomplete-items");
			for (var i = 0; i < x.length; i++) {
			  if (elmnt != x[i] && elmnt != inp) {
				x[i].parentNode.removeChild(x[i]);
			  }
			}
		  }
		  document.addEventListener("click", function (e) {
			  closeAllLists(e.target);
		  });
		}
		var clients = ["Unknown","Demo","BlueBanyan","Demo 2","Demo 4"];
		autocomplete(document.getElementById("client"), clients);
	</script>
	<script>
		$(document).ready(function()
			{
				$('#date').bootstrapMaterialDatePicker({
				format: 'DD-MM-YYYY',
				time: false,
				clearButton: true
			});
		});
	</script>
</body>
</html>