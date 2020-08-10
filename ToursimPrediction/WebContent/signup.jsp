<%@include file="header.jsp"%>	

<%
Object obj  = session.getAttribute("newemail");
String emailFill ="";
if(obj!=null){
	emailFill = obj.toString();
}
%>
<link rel="stylesheet" href="css/login.css">
<div class="login-page">
  <div class="form">
    
    <form class="login-form" onsubmit="return validation()" method="post" action="newUserVerify.jsp">
    <%if(session.getAttribute("newusererror")!=null){ %>
			<p style=color:red;><%=session.getAttribute("newusererror") %></p>
	<%}else{%>
    
    <font color="red">Fill the form to complete your registration<br></font>
<%}%>     <input type="text" name="fname" required="required" placeholder="Enter your first name"/>
      <input type="text" name="lname" required="required" placeholder="Enter your last name"/>
      <input type="email" name="email" required="required" readonly="readonly" value="<%=emailFill%>" placeholder="email id from session"/>
      <input type="number" name="contact" required="required" placeholder="Contact number"/>
      <input type="password" name="password"  required="required" placeholder="password" />
      
      <!-- <font color="red">both password must be same<br></font> -->
      
      <input type="password" required="required" name="repassword" placeholder="re-enter password"/>
      <button>Register</button>
      <!-- <input type="submit" name="submit" value="submit" autocomplete="off"> -->
      <p class="message">Already registered? <a href="login.jsp">login</a></p>
    </form>
  </div>
</div>
<%session.removeAttribute("newusererror"); %>

	

<%@include file="footer.jsp"%>	