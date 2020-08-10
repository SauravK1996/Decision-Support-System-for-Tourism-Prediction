<%@page import="pojo.UserData"%>
<%@page import="pojo.DatabaseData"%>
<%@include file="header.jsp"%>	

<%
Object userSession = session.getAttribute("userData");
UserData userData = null;

if(userSession!= null){
	userData = (UserData)userSession;
}

Object databaseData = session.getAttribute("databaseData");
DatabaseData dbData = null;
 
if(databaseData!= null){
	dbData = (DatabaseData)databaseData;
}
		
%>

<div id="main">
	<div id="mainleft" style="background-color: navy;">
		<%if(dbData.isVisit()){ %>
			<img src="gif/congrats.gif " height="40%" width="100%"/>
		
		<p style="font-family: monospace;font-size: 25;font-variant: normal;color: aqua;">
		   The data given by you is fulfilling all the requirement.<br>
		   Number of person : <%=userData.getNo_of_person() %><br>
		   Number of days for you journey : <%=userData.getNo_of_days() %><br>
		   Best month for visiting <%=userData.getSpot() %> is <%=dbData.getMonth() %>.<br>
		   Your overall budget : Rs.<%=dbData.getUserGivenOverAllBudget() %><br>
		   Average overall budget for <%=userData.getNo_of_person()%> persons and
		    <%=userData.getNo_of_days() %> days : Rs.<%=dbData.getAvgOverAllBudget() %>.<br>
		   You can plan and enjoy your trip.<br>
		   <a style="text-decoration: none;" 
		   href="SpotDetails?id=<%=dbData.getSpot()%>">Click</a>
		    to get more information about <%=userData.getSpot() %>.<br>
		   Thank You		   
		</p>
		<%}else{%><br>
			<p style="font-family: monospace;font-size: 25;font-variant: normal;color: aqua;">
			   
			   The data given by you is not fulfilling all the requirement.<br>
			   Reason : <%=dbData.getReason() %><br>
			   Number of person : <%=userData.getNo_of_person() %><br>
			   Number of days for you journey : <%=userData.getNo_of_days() %><br>
			   Your overall budget : Rs.<%=dbData.getUserGivenOverAllBudget() %>/-<br>
			   Average overall budget for <%=userData.getNo_of_person()%> persons and
			    <%=userData.getNo_of_days() %> days : Rs.<%=dbData.getAvgOverAllBudget() %>/-.<br>
			   Your planning month : <%=userData.getMonths() %>.<br>
			   
			   Best month for visiting <%=userData.getSpot() %> is <%=dbData.getMonth() %>.<br>
			   
			   <a style="text-decoration: none;" 
			   href="SpotDetails?id=<%=dbData.getSpot()%>">Click</a>
			    to get more information about <%=userData.getSpot() %>.<br>
			    
			   <%if(!userData.getMonths().equals(dbData.getMonth()) && dbData.getUserGivenOverAllBudget() < dbData.getAvgOverAllBudget()){%>
			   		Places which you can visit in the month of <%=userData.getMonths()%>: 
			   		
			   		<%for(int i=0;i<dbData.getMonthlist().size();i++){
			   			String place = dbData.getMonthlist().get(i);
			   		%>
			   		<a style="text-decoration: none;" href="https://www.holidify.com/places/<%=place%>"><%=place%></a>
			   		<%}%>
			   		
			   		<br>
			   		
			   		Places which you can visit under your budget Rs.<%=dbData.getUserGivenOverAllBudget()%>/- :
			   		<%if(dbData.getBudgetlist().isEmpty()==false){
			   			for(int i=0;i<dbData.getBudgetlist().size();i++){
			   				String place = dbData.getBudgetlist().get(i);
			   			%>
			   			<a style="text-decoration: none;" href="https://www.holidify.com/places/<%=place%>"><%=place%></a>
			   			<%}
			   			
			   		}else{%>
			   			No result found.
			   		<%}%>
			   		
			   <%}else if(dbData.getUserGivenOverAllBudget() < dbData.getAvgOverAllBudget()){%>
			   		Places which you can visit in the month of <%=userData.getMonths()%>: 
			   		
			   		<%if(dbData.getMonthlist().isEmpty() == false){
			   			for(int i=0;i<dbData.getMonthlist().size();i++){
			   				String place = dbData.getMonthlist().get(i);
			   			%>
			   			<a style="text-decoration: none;" href="https://www.holidify.com/places/<%=place%>"><%=place%></a>
			   			<%}
			   		  }else{%>
			   				No result found.
			   		  <%}%>
			   		
			   		
			   		<br>Places which you can visit under your budget Rs.<%=dbData.getUserGivenOverAllBudget()%>/- :
			   		<%if(dbData.getBudgetlist().isEmpty()==false){
			   			for(int i=0;i<dbData.getBudgetlist().size();i++){
			   				String place = dbData.getBudgetlist().get(i);
			   			%>
			   			<a style="text-decoration: none;" href="https://www.holidify.com/places/<%=place%>"><%=place%></a>
			   			<%}
			   			
			   		}else{%>
			   			No result found.
			   		<%}%> 
			   		
			   		
			   		
			   <%}else if(!userData.getMonths().equals(dbData.getMonth())){ %>
			   		Places which you can visit in the month of <%=userData.getMonths()%>: 
			   		
			   		<%if(dbData.getMonthlist().isEmpty()==false){
			   			for(int i=0;i<dbData.getMonthlist().size();i++){
			   				String place = dbData.getMonthlist().get(i);
			   			%>
			   			<a style="text-decoration: none;" href="https://www.holidify.com/places/<%=place%>"><%=place%></a>
			   			<%}
			   		  }else{%>
			   				No result found.
			   		  <%}%>
			   	<%}%>
			   	<br>Thank You	   
				</p>
			<%}%>
		
	</div>
	<div id="mainright">
		 <%if(!dbData.isVisit()){ %>
			<img src="gif/sorry.gif " height="100%" width="100%"/>
		<%}%>
		<%@include file="spotimages.jsp"%>	
			
			 <%-- <%@include file="mainright.jsp"%> --%>	
	</div>

</div>
<%@include file="footer.jsp"%>