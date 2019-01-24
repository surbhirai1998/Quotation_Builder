<%@page import="bb.com.model.Config" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quotes</title>
<!-- <link href="css/bootstrap.css" rel="stylesheet" type="text/css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript">
window.history.forward();
function noBack() { window.history.forward(); }

var counter = 1;
function showCounter(){        	 
	document.getElementById('count').value = counter;
 }
function addMainService(divName){
          var newdiv = document.createElement('div');
          counter++;
          newdiv.innerHTML ="<br><br>"+(counter) +
          " : <input class=\"form-control\" type=\"text\" name=\"mainServices[]\" placeholder=\"Main Service\" required=\"required\" autofocus>"
          +"<input class=\"form-control\" type=\"text\"   style=\"margin:10px;\"  name=\"cost[]\"  style=\"width:20%\"placeholder=\"Cost\" required=\"required\">"
          +"<div id="+counter+" ></div>"
          +"<input class=\"btn btn-secondary btn-sm\"type=\"button\"  style=\"margin:10px;\"  onClick=\"addSubService('"+counter+"',"+counter+");\" value=\"Add sub service\">";                        ;
          
          document.getElementById(divName).appendChild(newdiv);
    	document.getElementById('count').value = counter;
     }
     
function addSubService(divName,counter){
    var name = "subServices"+counter;
    var newdiv = document.createElement('div');
    newdiv.innerHTML = "<input type=\"text\"  class=\"form-control\" name=\""+name+"[]\" placeholder=\" Sub Service\" required=\"required\" autofocus>";
    document.getElementById(divName).appendChild(newdiv);
}
     
     function returnCounter(){
    	 return counter;
     }
     
</script> 
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">


<h1>New Project</h1>
		<br>
		
	</div>
	<div class="container col-md-4 col-md-offset-4 ">
		<form action="AddProject" method="post" class="center-div" name="addProjectForm" onSubmit="return validate();">
			<input type="hidden" name="c_id" value="${c_id}">
			
			<div class="form-group">
				<label for="inputProjectName" class="control-label">Project Name : </label>
				<input id="inputProjectName" name="projectName" class="form-control" type="text" required autofocus>
			</div>
			<div class="form-group form-group-inline">
				<label for="inputTerm" class="control-label">Term : </label>
				<!-- <input id="inputTerm" name="term" class="form-control" type="date" required>
				<input type="date" id="bday" name="bday" class="form-control " required pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}"> -->
				<br>Day : <input type="text" id="inputTerm" name="day" class="form-control col-md-2" required pattern="[0-9]{2}">
				Month : <input type="text" id="inputTerm" name="month" class="form-control col-md-2" required pattern="[0-9]{2}">
				Year : <input type="text" id="inputTerm" name="year" class="form-control col-md-2" required pattern="[0-9]{4}">
			</div>
			
			<div class="form-group">
				<label for="mainService" class="control-label">Main Service : </label>
			<div id="mainService">
			1 : <input  class="form-control" style="float:left;"type="text" name="mainServices[]" placeholder="Main Service" required="required" autofocus>
          <input class="form-control" type="text" name="cost[]"  style="width:20%"placeholder="Cost" required="required">
          <div id="1"></div>
          <input class="btn btn-secondary btn-sm" style="margin:10px;" type="button" onClick="addSubService('1',1);" value="Add sub service">                       
			</div>
			</div>
			<input class = "btn btn-primary btn-lg"  style="margin:10px;" type="button" value="Add more main services" onClick="addMainService('mainService');">
				<br>	<input type="hidden" name="counter" id="count" value="1">
			
			<div style="height:30px"></div>
			<textarea rows="4" cols="100" name="extraNote" placeholder="Extra note..."></textarea>
			<div style="height:30px"></div>
			<button class="btn btn-success btn-block" type="submit">Add</button>
		</form>
	</div>

	
<!-- <input type="date" id="bday" name="bday" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}">
<input id="datetime" type="datetime-local"> -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
					showCounter();
</script>
</html>