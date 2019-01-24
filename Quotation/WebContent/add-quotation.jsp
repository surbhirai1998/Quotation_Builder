<%@page import="bb.com.model.*" %>
<%@page import="bb.com.dao.*" %>
<%@page import="java.util.*" %>
<%@page import="bb.com.model.Config" %>
<%
	String pages = "add-quotation";
if(request.getParameter("c_id")==null && request.getParameter("c_id").trim()=="" ){
	response.sendRedirect(Config.getBaseUrl()+"/SelectClient");
}
int c_id = Integer.parseInt(request.getParameter("c_id"));

ClientDao cdao = DaoFactory.getClientDao();
Client client = cdao.getClient(c_id);
request.setAttribute("client", client);
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Quotation | BlueBanyan</title>
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
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
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
<script type="text/javascript">

var counter = 0;
var mainServiceIdCounter = 0 ;
var subServiceIdCounter = 0;
function removeMainService(id){
	var div = document.getElementById(id);
	if (div) {    
	div.parentNode.removeChild(div);
	}
	counter--;
	document.getElementById('counter').value = counter;
	document.getElementById('mainServiceIdCounter').value = mainServiceIdCounter;
}
function removeSubService(id){
	var div = document.getElementById(id);
	if (div) {    
	div.parentNode.removeChild(div);
	}
}

 function showCounter(){        	 
	document.getElementById('counter').value = counter;
	document.getElementById('mainServiceIdCounter').value = mainServiceIdCounter;
 }
function addSubService(divName,counter1){
	subServiceIdCounter++;
    var name = "subServices"+counter1;
    var newdiv = document.createElement('div');
		
    newdiv.innerHTML ="<div class=\"card-body row\"  id=\""+counter1+"-"+subServiceIdCounter+"\">"    
    +"<div class=\"col-md-12\" style=\"padding-left: 3px;\">"
    +"<label>"
    +"<input type=\"button\"  value=\"x\" class=\"btn btn-default btn-xs delete\" onClick=\"removeSubService('"+counter1+"-"+subServiceIdCounter+"');\" style=\"display: inline-block ! important; border-radius: 50%; padding: 2px 6px;\">"
    +"</label>"
    +"<input style=\"margin-left: 10px; color: #191313 !important; font-size: 13px !important; border: none; border-bottom: 1px solid rgba(0,0,0,.12); padding: 4px 0; width: 70%; background: 0 0; text-align: left;\" type=\"text\" placeholder=\" Sub Service\" id =\"\" name=\""+name+"[]\"  required/>"
	+"</div>"
	+"</div>";
    
	/* newdiv.innerHTML ="<div class=\"card-body row\"  id=\""+counter1+"-"+subServiceIdCounter+"\">"    
	+"<div class=\"col-md-1\"><input type=\"button\"  value=\"x\" class=\"btn btn-primary btn-xs delete\" onClick=\"removeSubService('"+counter1+"-"+subServiceIdCounter+"');\" style=\"height:20px;  padding: 2px;\"></div>"
	+"<div class=\"col-md-7\"><input type=\"text\" placeholder=\" Sub Service\" class=\"mdl-textfield__input\" id =\"\" name=\""+name+"[]\"  required/> </div>"
	+"</div>"; */
	
	document.getElementById(divName).appendChild(newdiv);
}

function increamentCounter(){
	counter++;
	mainServiceIdCounter++;
}
function increamentSSCounter(){
	subServiceIdCounter++;
}

function returnCounter(){
	 return counter;
}
</script>
</head>
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white white-sidebar-color logo-indigo">
    <input id="context_path" name="context_path" value="<%=Config.getBaseUrl()%>">
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
									<header>Add new quotation</header>
									<div class="tools">
                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
	                                    <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                    </div>
								</div>
								<form  class="col-lg-12" action="<%=Config.getBaseUrl()%>/AddNewProject" method="post">
								<input type="hidden" name="c_id" value="${client.id}">
								<div class="card-body row">
						            <div class="col-lg-12 p-t-20"> 
						              <div class ="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input"  name="senderName" required/>
					                     <label class="mdl-textfield__label">Sender Name</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class ="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" id ="client" value="${client.clientName}" name="clientName" readonly />
					                     <label class="mdl-textfield__label">Name</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class ="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" value="${client.companyName}" name="clientName" readonly />
					                     <label class="mdl-textfield__label">Company Name</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="email" class="mdl-textfield__input" id ="" value="${client.email}" name="email" readonly/>
					                     <label class="mdl-textfield__label">Email</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" id ="" value="${client.contactNumber}" name="contactNumber" readonly />
					                     <label class="mdl-textfield__label">Contact Number</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" id =""  value="${client.city}" name="city" readonly />
					                     <label class="mdl-textfield__label">City</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" id =""value="${client.state}"  name="state" readonly />
					                     <label class="mdl-textfield__label">State</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" id ="" value="${client.country}" name="country" readonly />
					                     <label class="mdl-textfield__label">Country</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" id =""  name="projectName" required />
					                     <label class="mdl-textfield__label">Project</label>
					                  </div>
						            </div>
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" id ="date" name="term" placeholder="Date" required />
					                  </div>
						            </div>
				 <!-- start div -->
				 					 <input type="hidden" id="mainServiceIdCounter" name="mainServiceIdCounter" value="0">
						          <input type="hidden" id="counter" name="counter" value="0">
									
									<div class="col-lg-12" id="mainServices"></div>
						            <div class="col-md-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
					                     <input type="text" class="mdl-textfield__input" id ="service"  />
					                     <label class="mdl-textfield__label">Add Main Service</label>
					                  </div>
						            </div>
						           
						            </div>
						  <!-- end div -->
						            	
						            <div class="col-lg-12 p-t-20"> 
						              <div class = "mdl-textfield mdl-js-textfield txt-full-width">
					                     <textarea class = "mdl-textfield__input" rows="2" id = "text7"  name="extraNote"  ></textarea>
					                     <label class = "mdl-textfield__label" for = "text7">Note</label>
					                  </div>
						            </div>
   						            <div class="col-lg-12 p-t-20 text-center"> 
						              	<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-primary generate">Submit</button>
										<a href="<%=Config.getBaseUrl()%>/index.jsp">
										<button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
										</a>
						            </div>
								</form>
								</div>
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
 	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
	<script>
	  		showCounter();
	  	$(document).ready(function() {
	    	$("#service").autocomplete({
	      		source : [{
	        	  	value : "Android App Development"
	        	}, 
	        	{
	        	  	value : "Social Media Marketing"
	        	},
	        	{
	        	  	value : "Website Design and Development"
	        	},
	        	{
	        	  	value : "Software Development"
	        	},
	        	{
	        	  	value : "Digital Marketing"
	        	},
	        	{
	        	  	value : "iOS App Development"
	        	},
	        	{
	        	  	value : "Graphics Design"
	        	},
	        	{
	        	  	value : "Mobile Application Development"
	        	},
	        	{
	        	  	value : "Vulnerability Assessment and Penetration Testing"
	        	},
	        	{
	        	  	value : "Other"
	        	}
	        	],
	      		select: function(event, ui) {
	          		
      				$path = $("#context_path").val()+"/FetchSubServices";
        			$service_name = ui.item.value;
        			mainServiceIdCounter++;
        			counter++;
        			$("#mainServiceIdCounter").val(mainServiceIdCounter);
        			$("#counter").val(counter);
        			$mainServiceIdCounter = $("#mainServiceIdCounter").val();	
        			$.ajax({
        				url:$path,
        				method:'post',
        				type:'html',
        				data:{
        					"service":$service_name,
        					"mainServiceIdCounter":$mainServiceIdCounter
        				},
        				success:function(responseText)
        				{	
        					$("#mainServices").append(responseText);
        				},
        				error:function(xhr)
        				{
        					alert(xhr.status);
        				}
        			});	
          		}
	    	});
	      		
	        	/* $("#service").keyup(function(e) {
		    		if(e.keyCode==13)
	  				{
	  					$path =  $("#context_path").val()+"/FetchSubServices";
	        			$service_name = $(this).val() ;
	        			mainServiceIdCounter++;
	        			counter++;
	        			$("#mainServiceIdCounter").val(mainServiceIdCounter);
	        			$("#counter").val(counter);
	        			$mainServiceIdCounter = $("#mainServiceIdCounter").val();	
	        			$.ajax({
	        				url:$path,
	        				method:'post',
	        				type:'html',
	        				data:{
	        					"service":$service_name,
	        					"mainServiceIdCounter":$mainServiceIdCounter
	        				},
	        				success:function(responseText)
	        				{	
	        					$("#mainServices").append(responseText);
	        				},
	        				error:function(xhr)
	        				{
	        					alert(xhr.status);
	        				}
	        			});	
	  				}
	  			}).keyup(); */
	    
	  	});
	</script>
	
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