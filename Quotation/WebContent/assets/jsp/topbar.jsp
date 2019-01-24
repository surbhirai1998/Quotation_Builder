<%@page import="bb.com.model.Config" %>
<div class="page-header navbar navbar-fixed-top">
            <div class="page-header-inner ">
                <div class="page-logo">
                    <a href="index.jsp">
                   	 <img src="assets/img/logo.png" width="100%" height="auto" /> 
                    </a>
                </div>
				<ul class="nav navbar-nav navbar-left in">
					<li><a href="#" class="menu-toggler sidebar-toggler"><i class="icon-menu"></i></a></li>
				</ul>
				<ul class="nav navbar-nav navbar-left in hidden-phone">
					<li><a href="javascript:;" class="fullscreen-btn"><i class="fa fa-arrows-alt"></i></a></li>
				</ul>
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
                    <span></span>
                </a>
                <div class="top-menu hidden-480">
                    <ul class="nav navbar-nav pull-right">
                    	<li><a href="<%=Config.getBaseUrl()%>/LogoutController"  class="" title="Logout"><i class="fa fa-power-off"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
