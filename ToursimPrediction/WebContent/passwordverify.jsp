<%@page import="pojo.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script>
function myalert() {
  alert("Your password is successfully updated. Please login to continue...");
  /* location.replace("ContactUs") */
  document.location.href = "ControllerPassword";
}
</script>


<%
String pwd = request.getParameter("pwd");
String cpwd = request.getParameter("cpwd");

User newpwd = new User();
newpwd.setPasword(pwd);
newpwd.setCpasword(cpwd);

HttpSession newpwdsession = request.getSession();
newpwdsession.setAttribute("newpwd",newpwd);

if(pwd.equals(cpwd)==false || pwd.trim().isEmpty() || cpwd.trim().isEmpty()){
	
	request.getSession().setAttribute("newpwderror", "password and confirm password must be same.");
	response.sendRedirect("enterpassword.jsp");
	
}else{%>
	<script>
		myalert()
	</script>
<%}%>


    