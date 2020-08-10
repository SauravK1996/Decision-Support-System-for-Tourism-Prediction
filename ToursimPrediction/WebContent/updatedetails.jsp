<%@page import="tourism.com.dbConnection.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file="header.jsp"%>	   
<link rel="stylesheet" href="css/styles.css">

<script src="js/mainleft.js"></script>

<%if(session.getAttribute("admin")!=null){%>
	
	<center><div class="form-style-3">
	<br><br><br><br><br><br><br>
		<v><form method="post" action="UpdateSpotData">
		<fieldset><legend>Update details</legend>
		<label for="field4"><span>Select spot to update*</span>
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
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>		
			</select>
		</label>
		
		<label for="field1"><span>Enter 1 day 1 person budget (in Rs.)<span class="required">*</span></span>
			<input type="number" class="input-field" name="budget" value="" />
		</label>
		<label for="field4"><span>Select month</span>
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
<br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>		
	
    