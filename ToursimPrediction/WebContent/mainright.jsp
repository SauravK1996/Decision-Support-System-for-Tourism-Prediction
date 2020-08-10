
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="tourism.com.dbConnection.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<link rel="stylesheet" href="css/styles.css">

<script src="js/mainleft.js"></script>

<%if(session.getAttribute("admin")!=null){

Connection con1 = null;
PreparedStatement  pstmt1 = null;
ResultSet rs1 = null;

try {
	con1 = DatabaseConnection.getConnection();
	
	String sql1 = "select * from contactustourism";
	pstmt1 = con1.prepareStatement(sql1);
	
	rs1 = pstmt1.executeQuery();
	PrintWriter pw = response.getWriter();
%>


<%	while(rs1.next()){
		String name = rs1.getString("name");
		String email = rs1.getString("emailid");
		String message = rs1.getString("message");
		
		
%>

	<table border=2 width=100%>
		<tr><td><%=name%></td></tr>
		<tr><td><%=email %></td></tr>
		<tr><td><%=message %></td></tr>
	</table>

<%}%>

<%
} catch (Exception e) {
	e.printStackTrace();
}finally{
	try {
		DatabaseConnection.closeConnection(con1);
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
%>

<%
}else{ %>
	<div class="form-style-3">
		<form method="post" action="ProcessData">
		<fieldset><legend>Holiday Planing</legend>
		<label for="field4"><span>Tourist Spot*</span>
			<select name="spot" class="select-field">
			<option value="">select</option>
		
<%

Connection con = null;
PreparedStatement  pstmt = null;
ResultSet rs = null;

try {
	con = DatabaseConnection.getConnection();
	
	String sql = "select * from tourist_spot";
	pstmt = con.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
	
	while(rs.next()){%>
		<option value="<%=rs.getString("spotname")%>"><%=rs.getString("spotname")%></option>
	<%}
} catch (Exception e) {
	e.printStackTrace();
}finally{
	try {
		DatabaseConnection.closeConnection(con);
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
%>		
			</select>
		</label>
		
		<label for="field1"><span>Budget (in Rs.)<span class="required">*</span></span>
			<br><input type="radio" name="budgetType" value="overall">overall 
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			<input type="radio" name="budgetType" value="perperson">per day per person

			<input type="number" class="input-field" name="budget" value="" />
		</label>
		<label for="field2"><span>Number of Persons <span class="required">*</span></span>
			<input type="number" required="required" class="input-field" name="no_of_person" value="" />
		</label>
		<label for="field3"><span>Number of Days <span class="required">*</span></span>
			<input type="number" required="required" class="input-field" name="no_of_days" value="" />
		</label>
		<label for="field4"><span>Month</span>
			<select name="month" class="select-field" >
				<option value="">select</option>
				<option value="January">January</option>
				<option value="February">February</option>
				<option value="March">March</option>
				<option value="April">April</option>
				<option value="May">May</option>
				<option value="June">June</option>
				<option value="July">July</option>
				<option value="August">August</option>
				<option value="September">September</option>
				<option value="October">October</option>
				<option value="November">November</option>
				<option value="December">December</option>
			</select>
		</label>
		<label><input type="submit" value="Submit" /></label>
		</fieldset>
		
		</form> 
	</div>
<%} %>
	
	
