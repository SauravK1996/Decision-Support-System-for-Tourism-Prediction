<%@page import="pojo.Contact"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<script>
function myalert() {
  alert("Thank you for your valuable feedback. We will get to reach you soon.");
  /* location.replace("ContactUs") */
  document.location.href = "ContactUs";
}
</script>


<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String message = request.getParameter("message");

Contact contactus = new Contact();
contactus.setName(name);
contactus.setEmail(email);
contactus.setMessage(message);

HttpSession csession = request.getSession();
csession.setAttribute("contactus",contactus);

if(name.trim().isEmpty() || email.trim().isEmpty()|| message.trim().isEmpty()){
	request.getSession().setAttribute("errormsg", "All field must be filled correctly.");
	response.sendRedirect("contactus2.jsp");
}else{%>
	<script>
		myalert()
	</script>
<%}%>


