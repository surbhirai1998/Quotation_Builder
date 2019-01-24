<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quotation-Update</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<style type="text/css">
.borderless td, .borderless th {
    border: none;
}
</style>
</head>
<body>
<div class="container">
<form method="post" action="Update">
<div class="jumbotron"><h1>VERIFY DETAILS</h1></div>
<h2>CLIENT-DETAILS : ${client.id}</h2>
<table class="table borderless">
<tbody>
<tr><td>Client Name</td> <td style="color:#256;"><input type="text" class="form-control" name="clientName" value="${client.clientName}"></td></tr>
<tr><td>Company Name</td><td><input type="text" class="form-control" name="companyName" value="${client.companyName}"></td><tr>
<tr><td>Email</td><td><input type="text" class="form-control" name="email" value="${client.email}"></td> </tr>
<tr><td>Contact Number</td><td><input type="text" class="form-control" name="contactNumber" value="${client.contactNumber}"></td>    </tr>
<tr><td>City</td><td><input type="text" class="form-control" name="city" value="${client.city}"></td>  </tr>
<tr><td>State</td><td><input type="text" class="form-control" name="state" value="${client.state}"></td> </tr>
<tr><td>Country</td><td><input type="text" class="form-control" name="country" value="${client.country}"></td>  </tr>
<tr><td>Sender Name</td><td style="color:#256;"><input type="text" class="form-control" name="senderName" value="${project.senderName}"></td> </tr>
</tbody>
</table>
<a href="UpdateClient?c_id=${c_id}">update information of client</a>
<br>
<div style="height:50px"></div>
<h2>PROJECT DETAILS</h2>
<table class="table borderless">
<tbody>
<tr><td>p_id</td><td>${pid}</td></tr>
<tr><td>Project Name</td><td><input type="text" class="form-control" name="projectName" value="${project.projectName}"></td></tr>
<tr><td>Project Term</td><td><input type="text" class="form-control" name="term" value="${project.term}"></td></tr>
<tr><td>Project Extra Note</td><td><input type="text" class="form-control" name="term" value="${project.extraNote}"></td></tr>
</tbody>
</table>
<div style="height:50px"></div>
<h2>SERVICES</h2>
<div style="height:20px"></div>
<table class="table borderless">
<thead>
<tr>
<th>SNo</th>
<th>Item and Description</th>
<th>Cost</th>
</tr>
</thead>
<tbody>
<c:forEach varStatus="loopCounter" var="ms" items="${mainServiceList}">
<tr style="font-weight: bold;">
<td>${loopCounter.count}  ::</td>
<td>${ms.id}<input style="color:red" type="text" class="form-control" name="mainServices" value="${ms.mainService}"></td>
<td><input type="text" class="form-control" name="cost" value="${ms.cost}"></td>
</tr>
<c:forEach varStatus="innerloop" var="ss" items="${ms.subServices}">
<tr>
<td></td>
<td>${ss.s_id}<input type="text" class="form-control" name="description" value="${ss.description}"></td>
<td></td>
</tr>
</c:forEach>
</c:forEach>
</tbody>
</table>

</form>
</div>
</body>
</html>