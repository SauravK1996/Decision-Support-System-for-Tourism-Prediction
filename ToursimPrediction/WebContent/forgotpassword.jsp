<%@include file="header.jsp"%>	
<link rel="stylesheet" href="css/login.css">
<div class="login-page">
  <div class="form">
    
    <form class="login-form" method="post" action="EmailCheck">
    <%if(session.getAttribute("error_msg")!=null){ %>
			<p style=color:red;><%=session.getAttribute("error_msg") %></p>
	<%}%>
      <input type="email" required="required" name="emailrecover" placeholder="enter your email for verification..."/>
      
      <button>Click to verify</button>
      <p class="message">Already registered? <a href="login.jsp">login</a></p>
    </form>
  </div>
</div>

<%session.removeAttribute("error_msg");%>
<%-- <%@include file="footer.jsp"%> --%>