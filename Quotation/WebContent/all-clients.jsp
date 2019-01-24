<%@page import="bb.com.model.Config" %>
<%@page import="bb.com.dao.DaoFactory"%>
<%@page import="bb.com.model.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bb.com.dao.ClientDao"%>
<%
	HttpSession httpSession = request.getSession(false);
	String msg = httpSession.getAttribute("msg")!=null?httpSession.getAttribute("msg").toString():"";
	httpSession.removeAttribute("msg");
%>

<%
if(session==null){
	response.sendRedirect(Config.getBaseUrl()+"/login.jsp");
}
	String pages = "all-clients";
	ClientDao cdao = DaoFactory.getClientDao();
	ArrayList<Client> clientList = cdao.getAllClients();
	request.setAttribute("clientList",clientList);
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>All Clients | BlueBanyan</title>
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
    <link href="assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
	<link href="assets/plugins/material/material.min.css" rel="stylesheet" />
	<link href="assets/css/material_style.css" rel="stylesheet" />
    <link href="assets/css/theme/light/theme_style.css" rel="stylesheet" id="rt_style_components" type="text/css" />
    <link href="assets/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/theme/light/style.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/theme/light/theme-color.css" rel="stylesheet" type="text/css" />
    <link href="assets/dist/sweetalert.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="assets/dist/sweetalert.js"></script>
</head>
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white white-sidebar-color logo-indigo">
   <input type="hidden" name="msg" id="msg" value="<%=msg%>"/>
   <input type="hidden" name="context_path" id="context_path" value="<%=Config.getBaseUrl()%>"/>
   
    <div class="page-wrapper">
        <%@include file="assets/jsp/topbar.jsp"%>
        <div class="page-container">
 			<%
				String act="clients";
			%>
		 	<%@include file="assets/jsp/navbar.jsp"%>
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="row" style="min-height: 600px;">
                        <div class="col-md-12">
                            <div class="card card-topline-purple">
                                <div class="card-head">
                                    <header>All Clients</header>
                                    <div class="tools">
                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
	                                    <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-scrollable">
	                                    <table class="table table-striped table-bordered table-hover table-checkable order-column valign-middle" id="example4">
	                                        <thead>
	                                            <tr>
	                                                <th class="text-center"> Name </th>
	                                                <th class="text-center"> Company </th>
	                                                <th class="text-center"> Email </th>
	                                                <th class="text-center"> Mobile </th>
	                                                <th class="text-center"> City </th>
	                                                <th class="text-center"> State </th>
	                                                <th class="text-center"> Country </th>
	                                                <th class="text-center"> Action </th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        <c:forEach varStatus="loopCounter" items="${clientList}" var="client">
												<tr class="odd gradeX">
													<td class="left">${client.clientName}</td>
													<td class="left">${client.companyName}</td>
													<td class="left"><a href="mailto:${client.email}" target="_blank">${client.email}</a></td>
													<td class="text-center"><a href="tel:${client.contactNumber}">${client.contactNumber}</a></td>
													<td class="text-center">${client.city}</td>
													<td class="text-center">${client.state}</td>
													<td class="text-center">${client.country}</td>
													<td class="text-center">
														<a href="<%=Config.getBaseUrl()%>/edit-client.jsp?c_id=${client.id}" title="Edit" class="btn btn-primary btn-xs" style="border-radius: 50%; padding: 5px;">
															<i class="fa fa-pencil"></i>
														</a>
<%-- 														 <a class="delete" href="DeleteClient?c_id=${client.id}"> --%>
														<button class="btn btn-danger btn-xs delete "  id="${client.id}" style="border-radius: 50%; padding: 5px;">
															<i class="fa fa-trash-o "></i>
														</button>
<!-- 														 </a> -->
													</td>
												</tr>
											</c:forEach>
											</tbody>
	                                    </table>
                                    </div>
                                </div>
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
    <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
 	<script src="assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js"></script>
    <script src="assets/js/pages/table/table_data.js"></script>
	<script src="assets/js/app.js"></script>
    <script src="assets/js/layout.js"></script>
	<script src="assets/js/theme-color.js"></script>
	<script src="assets/plugins/material/material.min.js"></script>
	<script>

	$(document).ready(function(){
		if($("#msg").val()==="added_client_sucessfully"){
			$.toast({
				heading:'Successful',
					text: 'Client have been added.',
	         		position: 'top-right',
	         		loaderBg:'#ff6849',
	         		icon: 'success',
	         		hideAfter: 3500, 
	         		stack: 6
			});
		}else if($("#msg").val()==="updated_client_sucessfully"){
			$.toast({
				heading:'Successful',
					text: 'Client has been updated.',
	         		position: 'top-right',
	         		loaderBg:'#ff6849',
	         		icon: 'success',
	         		hideAfter: 3000, 
	         		stack: 6
			});
		}
	});
	
	</script>
	<script>
	  $('.delete').click(function() {
		  $id = $(this).attr("id");
		  swal({
			  title: "Are you sure?",
			  text: "Delete client!",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-danger",
			  confirmButtonText: "Yes, delete it!",
			  closeOnConfirm: false
			},
			function(isConfirm){
				if(isConfirm)
				{
						window.location.href=$("#context_path").val()+"/DeleteClient?c_id="+$id;
						swal("Deleted!", "Unknwon has been deleted.", "success");
				}
				else
				{
					swal("Cancelled!", "Cancelled.", "error");
				}
			});
	  });
  </script>
</body>
</html>