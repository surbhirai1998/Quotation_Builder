<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quotation Update Client</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<style type="text/css">
.borderless td, .borderless th {
    border: none;
}
</style>
<script type="text/javascript">
window.history.forward();
function noBack() { window.history.forward(); }
</script>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<div class="container">
<form method="post" action="UpdateClient">
<div class="jumbotron"><h1>UPDATE - CLIENT</h1></div>
<h2>CLIENT-DETAILS : ${client.id}</h2>
<input type="hidden" value="${client.id}" name="c_id">
<input type="hidden" value="${pid}" name="pid">
<table class="table borderless">
<tbody>
<tr><td>Client Name</td> <td style="color:#256;"><input type="text" class="form-control" name="clientName" value="${client.clientName}"></td></tr>
<tr><td>Company Name</td><td><input type="text" class="form-control" name="companyName" value="${client.companyName}"></td><tr>
<tr><td>Email</td><td><input type="text" class="form-control" name="email" value="${client.email}"></td> </tr>
<tr><td>Contact Number</td><td><input type="text" class="form-control" name="contactNumber" value="${client.contactNumber}"></td>    </tr>
<tr><td>City</td><td><input type="text" class="form-control" name="city" value="${client.city}"></td>  </tr>
<tr><td>State</td><td><input type="text" class="form-control" name="state" value="${client.state}"></td> </tr>
<tr><td>Country</td><td><input type="text" class="form-control" name="country" value="${client.country}"></td>  </tr>
<tr><td>Sender Name</td><td style="color:#256;"><input type="text" class="form-control" name="senderName" value="${senderName}"></td> </tr>
</tbody>
</table>

<div style="height:50px"></div>
<input class="btn btn-success btn-block" type="submit" value="Done">
</form>
</div>
</body>
</html>