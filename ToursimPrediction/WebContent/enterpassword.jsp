<%@include file="header.jsp"%>	

<%
Object obj  = session.getAttribute("emailrecover");
String emailFill ="";
if(obj!=null){
	emailFill = obj.toString();
}
%>
<link rel="stylesheet" href="css/login.css">
<div class="login-page">
  <div class="form">
  <%if(session.getAttribute("newpwderror")!=null){ %>
			<p style=color:red;><%=session.getAttribute("newpwderror") %></p>
	<%}else{%>
    
    <font color="red">Enter your new password<br></font>
<%}%> 
<form class="login-form" onsubmit="return validation()" method="post" action="passwordverify.jsp">
    <!-- <form class="login-form" onsubmit="return validation()" method="post" action="ControllerPassword"> -->
    
      <input type="email" name="email" required="required" readonly="readonly" value="<%=emailFill%>" placeholder="email id from session"/>
      <input type="password" name="pwd" required="required" placeholder="Enter new password"/>
      <input type="password" name="cpwd" required="required" placeholder="Enter confirm password"/>
      
      <!-- <font color="red">both password must be same<br></font> -->
      
      <button>Reset</button>
      <!-- <input type="submit" name="submit" value="submit" autocomplete="off"> -->
    </form>
  </div>
</div>


<%-- <%@include file="footer.jsp"%> --%>	