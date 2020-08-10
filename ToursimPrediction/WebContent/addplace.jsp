<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>	


<link rel="stylesheet" href="css/login.css">
<br><br><br><br>
<div class="login-page">
  <div class="form">
    
    <form class="login-form" method="post" action="newPlaceVerify.jsp">
   <%if(session.getAttribute("newplaceerrormsg")!=null){ %>
			<p style=color:red;><%=session.getAttribute("newplaceerrormsg") %></p>
	<%}else{%>
    
    <font color="red">Enter new tourist place<br></font>
    <%} %> 
      <input type="text" name="spotname" required="required" placeholder="Enter new spot name"/>
      <input type="text" name="month" required="required" placeholder="Enter month to visit"/>
      <input type="number" name="budget" required="required"  placeholder="Enter per day per person budget"/>
      
      <button>Save Data</button>
    </form>
  </div>
</div>


	

<%@include file="footer.jsp"%>	