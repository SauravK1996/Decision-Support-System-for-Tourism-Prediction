<%@page import="pojo.NewPlace"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<script>
function myalert() {
  alert("New tourist spot added successfully.");
  /* location.replace("ContactUs") */
  document.location.href = "AddNewPlace";
}
</script>


<%
String spotname = request.getParameter("spotname");
int budget = Integer.parseInt(request.getParameter("budget"));
String month = request.getParameter("month");

NewPlace newplace = new NewPlace();
newplace.setSpotname(spotname);
newplace.setMonth(month);
newplace.setBudget(budget);

HttpSession nsession = request.getSession();
nsession.setAttribute("newplace",newplace);

if(spotname.trim().isEmpty() || month.trim().isEmpty()){
	request.getSession().setAttribute("newplaceerrormsg", "All field must be filled correctly.");
	response.sendRedirect("addplace.jsp");
}else{%>
	<script>
		myalert()
	</script>
<%}%>


