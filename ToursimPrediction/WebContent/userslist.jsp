<%@page import="pojo.User"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
List<User> userList = null;
	
	if((request.getAttribute("userList"))!=null){
		userList = (List<User>)request.getAttribute("userList");
%>		
	<form method = "post" action="">
			<div id="cntup" style="overflow:scroll;width:100%;height:100%;float:left;">
			
			<fieldset>

			<legend><b>User Details</b></legend>
			<center>
<table width=50% border = "2" style="">
<th>Name</th><th>Mobile number</th><th>Email address</th><th>Remove User</th>
<%
	for(User user : userList){ 
	
%>
			<tr>
				<td><h5><%=user.getfName()%>  <%=user.getlName()%></h5></td>
				<td><%=user.getMobno()%></td>
				<td><%=user.getEmailid()%></td>
				<td><a style="text-decoration: none;" href="DeleteUser?id=<%=user.getUsrid()%>">remove</td>
			</tr>													 
			
			
		<%} %>
			
</table>
<hr>

			</fieldset>
			
			
			
			</div>
		</form>
		
<%}else{%>
<p>No any registered student</p>
<%}%>
<%@include file="footer.jsp"%>