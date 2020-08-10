<%@include file="header.jsp"%>	
<link rel="stylesheet" href="css/login.css">
<div class="login-page">
  <div class="form">
    <form class="login-form" method="post" action="LoginProcessor">
	    <%if(session.getAttribute("errmsg")!=null){ %>
			<p style=color:red;><%=session.getAttribute("errmsg") %></p>
		<%}%><%-- else if(session.getAttribute("msg")!=null){ %>
			<p style=color:red;><%=session.getAttribute("msg") %></p>
		<%}%> --%>
      <input type="text" name="userid" placeholder="username"/>
      <input type="password" name ="pwd" placeholder="password"/>
      <button>login</button>
      <p class="message">Not registered? <a href="email.jsp">Create an account</a></p>
      <p class="message">Forgot password? <a href="forgotpassword.jsp">Click to reset</a></p>
    </form>
  </div>
</div>
<%session.removeAttribute("errmsg");%>
<%session.removeAttribute("newemail");%>