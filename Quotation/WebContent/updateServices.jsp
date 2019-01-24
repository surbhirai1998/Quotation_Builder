<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quotation Update Services</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<style type="text/css">
.borderless td, .borderless th {
    border: none;
}
</style>
<script type="text/javascript">
function removeDiv(id){
	var div = document.getElementById('DOM');
	if (div) {    
	div.parentNode.removeChild(div);
	}
}
function deleteMainService(row)
{
    var i=row.parentNode.parentNode.rowIndex;
    document.getElementById('Services').deleteRow(i);
}
function deleteSubService(row)
{
    var i=row.parentNode.parentNode.rowIndex;
    document.getElementById('Services').deleteRow(i);
}

</script>
</head>
<body>
<div class="container">
<h2>PROJECT DETAILS</h2>
<table class="table">
<tbody>
<tr><td>p_id</td><td>${pid}</td></tr>
<tr><td>Project Name</td><td>${project.projectName}</td></tr>
<tr><td>Project Term</td><td>${project.term}</td></tr>
</tbody>
</table>
<div style="height:50px"></div>
<form method="post" action="UpdateServices">
<div class="jumbotron"><h1>UPDATE - SERVICES</h1></div>
<h2>SERVICES</h2>
<div style="height:20px"></div>
<table id="Services" class="table borderless">
<thead>
<tr>
<th>SNo</th>
<th>Item and Description</th>
<th>Cost</th>
</tr>
</thead>
<tbody>
<c:forEach varStatus="loopCounter" var="ms" items="${mainServiceList}">
<tr id="${ms.id}" style="font-weight: bold;">
<td>${loopCounter.count}  ::</td>
<td>${ms.id}<input style="color:red" type="text" class="form-control" name="mainServices" value="${ms.mainService}"></td>
<td><input type="text" class="form-control" name="cost" value="${ms.cost}"></td>
</tr>
<c:forEach varStatus="innerloop" var="ss" items="${ms.subServices}">
<tr class="">
<td></td>
<td>${ss.s_id}<input type="text" class="form-control" name="description" value="${ss.description}">
<input type="button" class="btn btn-danger btn-xs delete" value="X" onClick="deleteMainService(this);" style="border-radius: 50%; padding: 5px;">
</td>
<td></td>
</tr>
</c:forEach>
</c:forEach>
</tbody>
</table>

</form>
</div>
</body>
</body>
</html>