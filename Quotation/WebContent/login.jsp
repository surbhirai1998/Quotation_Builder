<%@ page import="bb.com.model.*" %>
<%
	response.setHeader("Cache-Control", "private,no-store,no-cache");
   /*  response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1 */
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<!DOCTYPE html>
<html>
<head>
    <title>Login | BlueBanyan</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="robots" content="noindex, nofollow">
    <link href="assets/img/favicon.ico" rel="shortcut icon" /> 
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
    <link href="assets/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="assets/fonts/material-design-icons/material-icon.css" rel="stylesheet" type="text/css" />
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/pages/extra_pages.css" rel="stylesheet" />
    <script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward();}
    setTimeout("noBack()", 0);
    </script>
</head>
<body  onunload="noBack();" onpageshow="if (event.persisted) noBack();" onload="" style="padding-top: 5%;">
    <div class="login-form text-center">
        <div></div>
        <div class="form formLogin">
            <img src="assets/img/logo-small.png" width="50%" height="auto" />
            <br>
            <br>
            <h2>Login to your account</h2>
            <form method="post" action="<%=Config.getBaseUrl()%>/LoginController">
                <input type="email" name="user_name" placeholder="Username" />
                <input type="password" name="password"  placeholder="Password" />
                <button type="submit">Login</button>
            </form>
        </div>
    </div>
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <script src="assets/js/pages/extra-pages/pages.js"></script>
</body>
</html>