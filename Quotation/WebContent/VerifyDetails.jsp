<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quotation-Verify</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</script>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<div class="container">
<div class="jumbotron"><h1>VERIFY DETAILS</h1></div>
<h2>CLIENT-DETAILS : ${client.id}</h2>
<table class="table">
<tbody>
<tr><td>Client Name</td> <td style="color:#256;">${client.clientName}</td></tr>
<tr><td>Company Name</td><td>${client.companyName}</td><tr>
<tr><td>Email</td><td>${client.email}</td>            </tr>
<tr><td>Contact Number</td><td>${client.contactNumber}</td>    </tr>
<tr><td>City</td><td>${client.city}    </td>         </tr>
<tr><td>State</td><td>${client.state}   </td>         </tr>
<tr><td>Country</td><td>${client.country} </td>         </tr>
<tr><td>Sender Name</td><td style="color:#256;">${project.senderName}</td> </tr>
</tbody>
</table>
<form action="UpdateClientData" method="post">
<input type="hidden" value="${client.id}" name="c_id">
<input type="hidden" value="${pid}" name="p_id">
<button class="btn btn-secondary btn-block" type="submit">Edit information of client</button>
</form>

<br>
<div style="height:50px"></div>
<h2>PROJECT DETAILS</h2>
<table class="table">
<tbody>
<tr><td>p_id</td><td>${pid}</td></tr>
<tr><td>Project Name</td><td>${project.projectName}</td></tr>
<tr><td>Project Term</td><td>${project.term}</td></tr>
<tr><td>Extra Note</td><td>${project.extraNote}</td></tr>
</tbody>
</table>
<form action="UpdateProjectData" method="post">
<input type="hidden" value="${client.id}" name="c_id">
<input type="hidden" value="${pid}" name="p_id">
<button class="btn btn-secondary btn-block" type="submit">Edit project details</button>
</form>
<div style="height:50px"></div>
<h2>SERVICES</h2>
<div style="height:20px"></div>
<table class="table">
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
<td>${ms.mainService}</td>
<td>${ms.cost}</td>
</tr>
<c:forEach varStatus="innerloop" var="ss" items="${ms.subServices}">
<tr>
<td></td>
<td>> ${ss.description}</td>
<td></td>
</tr>
</c:forEach>
</c:forEach>
</tbody>
</table>

<form action="UpdateServicesData" method="post">
<input type="hidden" value="${client.id}" name="c_id">
<input type="hidden" value="${pid}" name="p_id">
<button class="btn btn-secondary btn-block" type="submit">Edit Services details</button>
</form>

<%-- <a href="GetData?c_id=${client.id}&p_id=${pid}"><button class="btn btn-sm btn-secondary">UpdateAll</button></a><br> --%>
<div style="height:50px"></div>
<form method="post" action="QuotationPdf" target="_blank">
<input type="hidden" value="${client.id}" name="c_id">
<input type="hidden" value="${pid}" name="p_id">
<button class="btn btn-success btn-block" type="submit" onClick="location.href='index.html'" >Make Quotation</button>
<div style="height:50px"></div>
</form>
</div>
</body>
</html>