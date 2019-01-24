<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
var counter = 2;
function addMainService(divName){
          var newdiv = document.createElement('div');
          newdiv.innerHTML =(counter) +
          " : <input type=\"text\" name=\"mainServices[]\" placeholder=\"Main Service\" required=\"required\" autofocus>"
          +"&nbsp;&nbsp;&nbsp;"+
          "<input type=\"text\" name=\"cost[]\"  style=\"width:20%\"placeholder=\"Cost\" required=\"required\">"
          +"<div id="+counter+"></div>"
          +"<input type=\"button\" onClick=\"addSubService('"+counter+"',"+counter+");\" value=\"Add sub service\">";                        ;
          
          document.getElementById(divName).appendChild(newdiv);
          counter++;
    	document.getElementById('count').value = counter;
     }
     
function addSubService(divName,counter){
    var name = "subServices"+counter;
    var newdiv = document.createElement('div');
    newdiv.innerHTML = " : : :  <input type=\"text\" name=\""+name+"[]\" placeholder=\" Sub Service\" required=\"required\" autofocus>";
    document.getElementById(divName).appendChild(newdiv);
}
     
     function returnCounter(){
    	 return counter;
     }
</script>
</head>
<body>

<!-- <div id="mainService">
					 1 : <input   type="text" name="mainService[]"
							placeholder="Main Service name" required="required" autofocus>
							&nbsp;&nbsp;&nbsp;
							<div id="sub_services">							
							<input type="text" name="percent[]"  style="float:right;"
							placeholder="Percentage" required="required">
							</div>
		    				 <input type="button" value="Add more main services" onClick="addInput('sub_services');">
</div>
					<input type="text" name="counter" id="count" value="1">
    				 
    				<br>
    				 <input type="button" value="Add more main services" onClick="addInput('dynamicInput');">
			 -->		
-----------------------------------------------------------------------------------------------------------------------
<div id="mainService">
</div>
<input type="button" value="Add more main services" onClick="addMainService('mainService');">
				<br>	<input type="text" name="counter" id="count" value="1">
</body>
</html>