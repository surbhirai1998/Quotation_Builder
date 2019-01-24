<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quotation Update Project</title>
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
<form method="post" action="UpdateProject">
<input type="hidden" value="${c_id}" name="c_id">
<input type="hidden" value="${pid}" name="p_id">
<div class="jumbotron"><h1>UPDATE - PROJECT</h1></div>
<h2>PROJECT DETAILS</h2>
<table class="table borderless">
<tbody>
<tr><td>p_id</td><td>${pid}</td></tr>
<tr><td>Project Name</td><td><input type="text" class="form-control" name="projectName" value="${project.projectName}"></td></tr>
<tr><td>Project Term</td><td><input type="text" class="form-control" name="term" value="${project.term}"></td></tr>
<tr><td>Sender Name</td><td><input type="text" class="form-control" name="senderName">${project.senderName}</td></tr>
<tr><td>Extra Note</td><td><textarea class="form-control" rows=5 cols=80 name="extraNote">${project.extraNote}</textarea></td></tr>
</tbody>
</table>
<div style="height:50px"></div>
<input class="btn btn-success btn-block" type="submit" value="Done">
</form>
</div>
</body>
</html>