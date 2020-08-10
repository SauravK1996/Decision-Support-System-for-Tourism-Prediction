<%@page import="pojo.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<script>
function myalert() {
  alert("You are successfully registered. Please login to continue...");
  /* location.replace("ContactUs") */
  document.location.href = "UserDetails";
}
</script>

<%
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String contact = request.getParameter("contact");
String password = request.getParameter("password");
String repassword = request.getParameter("repassword");

User newUser = new User();

newUser.setfName(fname);
newUser.setlName(lname);
newUser.setEmailid(email);
newUser.setMobno(Long.parseLong(contact));
newUser.setPasword(password);
newUser.setCpasword(repassword);

HttpSession newusersession = request.getSession();
newusersession.setAttribute("newUserArise",newUser);

if(fname.trim().isEmpty() || lname.trim().isEmpty() || lname.length()<3 || fname.length()<3){
	
	request.getSession().setAttribute("newusererror", "Name must be filled correctly.");
	response.sendRedirect("signup.jsp");
	
}else if(contact.length()<10 || contact.length()>10){
	
	request.getSession().setAttribute("newusererror", "Contact number must be of 10 digit.");
	response.sendRedirect("signup.jsp");
	
}else if(password.equals(repassword)==false){
	
	request.getSession().setAttribute("newusererror", "password and confirm password must be same.");
	response.sendRedirect("signup.jsp");
	
}else{%>
	<script>
		myalert()
	</script>
<%}

%>