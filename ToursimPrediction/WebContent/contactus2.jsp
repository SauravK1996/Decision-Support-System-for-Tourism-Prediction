<%@page import="pojo.Contact"%>
<%@include file="header.jsp"%>	
<link rel="stylesheet" href="css/styles.css">



<div class="form-style-6">
	<h1>Contact Us</h1>
	<form action="contactverify.jsp" method="post">
	<%if(session.getAttribute("errormsg")!=null){ %>
			<p style=color:red;><%=session.getAttribute("errormsg") %></p>
	<%}%>
	<input type="text" name="name" placeholder="Your Name" />
	<input type="email" name="email" placeholder="Email Address" />
	<textarea name="message" placeholder="Type your Message"></textarea>
	<input type="submit" value="Send" />
	</form>
</div>

<%
	session.removeAttribute("errormsg");
	session.removeAttribute("contactus");
%> 
<%-- <%@include file="footer.jsp"%> --%>