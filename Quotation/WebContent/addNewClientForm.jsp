<%@page import="bb.com.model.Config" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<title>Quotes</title>
<script type="text/javascript">
function addLocation(){
	document.getElementById("location").style.display = "block";
}

function validate(){
    var companyName = document.forms["addClientForm"]["companyName"].value;
    if (companyName.trim()=="") {
        alert("Company Name must be filled out");
        return false;
    }	
    var clientName = document.forms["addCientForm"]["clientName"].value;
    if (clientName.trim() == "") {
        alert("Client Name must be filled out");
        return false;
    }	
	return true;
}


function validateForm() {
    var companyName = document.forms["addClientForm"]["companyName"].value;
    var clientName   =document.forms["addCientForm"]["clientName"].value;
    var email        =document.forms["addCientForm"]["email"].value;
    var contactNumber=document.forms["addCientForm"]["contactNumber"].value;
    var city         =document.forms["addCientForm"]["city"].value;
    var state        =document.forms["addCientForm"]["state"].value;
    var country      =document.forms["addCientForm"]["country"].value;
    
    if (companyName.trim()=="") {
        alert("Company Name must be filled out");
        return false;
    }else if (clientName.trim()=="") {
        alert("Client Name must be filled out");
        return false;
    }else if (contactNumber.trim()=="") {
        alert("Contact Number must be filled out");
        return false;
    }else if (email.trim()=="") {
        alert("Email must be filled out");
        return false;
    }else if (city.trim()=="") {
        alert("City must be filled out");
        return false;
    }else{
    	return true;
    }
  
}
</script>
</head>
<body>
<div class="jumbotron">
		<h1>New Client</h1>
		<br>
		<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active"><a href= "selectClient.jsp">Back</a></li>
		</ol>
		</nav>
	</div>
	<div class="container col-md-4 col-md-offset-4 ">
		<form action="AddClient" method="post" class="center-div" name="addClientForm" onSubmit="return validate();">
			<div class="form-group">
				<label for="inputSenderName" class="control-label">Sender Name : </label>
				<input id="inputSenderName" name="senderName" class="form-control" type="text" required autofocus>
			</div>
			<div class="form-group">
				<label for="inputCompanyName" class="control-label">Company Name : </label>
				<input id="inputCompanyName" name="companyName" class="form-control" type="text" required autofocus>
			</div>
			<div class="form-group">
				<label for="inputClientName" class="control-label">Client Name : </label>
				<input id="inputClientName" name="clientName" class="form-control" type="text" required>
			</div>
			<div class="form-group">
				<label for="inputEmail" class="control-label">Email : </label>
				<input id="inputEmail" name="email" class="form-control" type="email" required>
			</div>
			
			<div class="form-group">
				<label for="inputContact" class="control-label">Contact Number : </label>
				<input id="inputContact" name="contactNumber" class="form-control" type="text" required>
			</div>
			<div id="location" style="display: block">
				 <div class="form-group">
	                <label for="inputCity" class="control-label">City</label>
	                <input type="text" class="form-control" id="inputCity" name="city" required>
	            </div>
	             <div class="form-group">
	                <label for="inputState" class="control-label">State</label>
	                <input type="text" class="form-control" id="inputState" name="state">
	            </div>
	            <div class="form-group">
	                <label for="inputCountry" class="control-label">Country</label>
	                <input type="text" class="form-control" id="inputCountry"name="country">
	            </div>
			</div>
			 <!-- <button onclick="addLocation()">Add Location</button>  -->
			<button class="btn btn-success" type="submit">Add</button>
		</form>
	</div>

</body>
</html>