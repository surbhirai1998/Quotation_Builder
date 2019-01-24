<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<style type="text/css">
.borderless td, .borderless th {
    border: none;
}
</style>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
  
    var counter = 0;
    var mainServiceIdCounter = 0 ;
    var subServiceIdCounter = 0;
    function removeMainService(id){
    	var div = document.getElementById(id);
    	if (div) {    
    	div.parentNode.removeChild(div);
    	}
    	counter--;
    	document.getElementById('count').value = counter;
    	document.getElementById('mainServiceIdCounter').value = mainServiceIdCounter;
    }
    function removeSubService(id){
    	var div = document.getElementById(id);
    	if (div) {    
    	div.parentNode.removeChild(div);
    	}
    }
    function addMainService(divName){
              var newdiv = document.createElement('div');
              counter++;
              mainServiceIdCounter++;
              newdiv.innerHTML ="<div  id='ms-"+mainServiceIdCounter+"'>"+(mainServiceIdCounter)
              +"<input type='button' class='btn btn-danger btn-xs delete' value='X' onClick=\"removeMainService('ms-"+mainServiceIdCounter+"');\" style='border-radius: 50%; padding: 5px;'>"
              +" : <input class=\"form-control\" type=\"text\" name=\"mainServices[]\" placeholder=\"Main Service\" required=\"required\" style=\"color:red;\" autofocus>"
              +"<input class=\"form-control\" type=\"text\"   style=\"margin:10px;\"  name=\"cost[]\"  style=\"width:20%\"placeholder=\"Cost\" required=\"required\">"
              +"<div id="+mainServiceIdCounter+" ></div>"
              +"<input class=\"btn btn-secondary btn-sm\"type=\"button\"  style=\"margin:10px;\"  onClick=\"addSubService('"+mainServiceIdCounter+"',"+mainServiceIdCounter+");\" value=\"Add sub service\">"                               
             +"</div>";
              document.getElementById(divName).appendChild(newdiv);
        	document.getElementById('count').value = counter;
        	document.getElementById('mainServiceIdCounter').value = mainServiceIdCounter;
         }
     function showCounter(){        	 
    	document.getElementById('count').value = counter;
    	document.getElementById('mainServiceIdCounter').value = mainServiceIdCounter;
     }
    function addSubService(divName,counter1){
    	subServiceIdCounter++;
        var name = "subServices"+counter1;
        var newdiv = document.createElement('div');
  		
  	newdiv.innerHTML ="<div id=\""+counter1+"-"+subServiceIdCounter+"\">"
  	+"<input type=\"button\" class=\"btn btn-danger btn-xs delete\" value=\"X\" onClick=\"removeSubService('"+counter1+"-"+subServiceIdCounter+"');\" style=\"border-radius: 50%; padding: 5px;\">"    
  	+ "<input type=\"text\"  class=\"form-control\" name=\""+name+"[]\" placeholder=\" Sub Service\" required=\"required\" autofocus>";
    +"</div>"    
  	document.getElementById(divName).appendChild(newdiv);
    }
    
    function increamentCounter(){
    	counter++;
    	mainServiceIdCounter++;
    }
    function increamentSSCounter(){
    	subServiceIdCounter++;
    }

    
    function returnCounter(){
   	 return counter;
    }
</SCRIPT>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<div class="container">
<div style="height:50px"></div>
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
<input type="hidden" value="${c_id}" name="c_id">
<input type="hidden" value="${pid}" name="p_id">
<h1>UPDATE - SERVICES</h1>
<h2>SERVICES</h2>
<div style="height:20px"></div>
	<div class="form-group">
				<label for="mainService" class="control-label">Main Service : </label>
		<div id="mainServiceList">
			<c:forEach varStatus="loopCounter" var="ms" items="${mainServiceList}">
				<div  id="ms-${loopCounter.count}">
				<script type="text/javascript">
					increamentCounter();
					showCounter();
				</script>
					  ${loopCounter.count} : 
			          <input type="button" class="btn btn-danger btn-xs delete" value="X" onClick="removeMainService('ms-${loopCounter.count}');" style="border-radius: 50%; padding: 5px;">					  
					  <input  class="form-control" type="text" name="mainServices[]" value="${ms.mainService}" placeholder="Main Service" style="float:left;color:red;" required="required" autofocus>
			          <input class="form-control" type="text" name="cost[]" value="${ms.cost}" style="width:20%"placeholder="Cost" required="required">
			          <div id="${loopCounter.count}">
			          <c:forEach varStatus="innerloop" var="ss" items="${ms.subServices}">
			          	<div id="${loopCounter.count}-${innerloop.count}">
			          	<script type="text/javascript">
							increamentSSCounter();
						</script>
			          		<input type="button" class="btn btn-danger btn-xs delete" value="X" onClick="removeSubService('${loopCounter.count}-${innerloop.count}');" style="border-radius: 50%; padding: 5px;">
			          		<input type="text" class="form-control" name="subServices${loopCounter.count}[]" value="${ss.description}">
			          	</div>
			          </c:forEach>
			          </div>
			          <input class="btn btn-secondary btn-sm" style="margin:10px;" type="button" onClick="addSubService('${loopCounter.count}',${loopCounter.count});" value="Add sub service">                       
				</div>
			</c:forEach>
		</div>
		</div>
			<input class = "btn btn-primary btn-lg"  style="margin:10px;" type="button" value="Add more main services" onClick="addMainService('mainServiceList');">
				<br>	<input type="text" name="counter" id="count" value="1">
				<br>	<input type="text" name="mainServiceIdCounter" id="mainServiceIdCounter" value="1">
	<div style="height:50px"></div>
	<input class="btn btn-success btn-block" type="submit" value="Done">
</form>

</div>
</body>
<script type="text/javascript">
					showCounter();
				</script>
</html>