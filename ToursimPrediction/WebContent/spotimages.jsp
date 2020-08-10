<%@page import="pojo.DatabaseData"%>
<%@page import="pojo.UserData"%>
<%
Object uSession = session.getAttribute("userData");
UserData uData = null;

if(uSession!= null){
	uData = (UserData)uSession;
}
/* 
Object dData = session.getAttribute("databaseData");
DatabaseData dbaData = null;
 
if(dData!= null){
	dbaData = (DatabaseData)dData;
} */
if(uData.getSpot().equals("Srinagar")){
%> 	
<img src="images/srinagar4.png" height="35%" width="100%"/>
<img src="images/srinagar2.png" height="35%" width="100%"/>
<img src="images/srinagar3.png" height="35%" width="100%"/>
<%} else if(uData.getSpot().equals("Auli")){
%> 	
<img src="images/auli1.png" height="35%" width="100%"/>
<img src="images/auli2.jpg" height="35%" width="100%"/>
<img src="images/auli3.jpg" height="35%" width="100%"/>
<%}else if(uData.getSpot().equals("Mon")){
%> 	
<img src="images/mon1.png" height="35%" width="100%"/>
<img src="images/mon2.jpg" height="35%" width="100%"/>
<img src="images/mon3.jpg" height="35%" width="100%"/>
<%}else if(uData.getSpot().equals("SpitiValley")){
%> 	
<img src="images/spitivalley1.jpg" height="35%" width="100%"/>
<img src="images/spitivalley2.jpg" height="35%" width="100%"/>
<img src="images/spitivalley3.jpg" height="35%" width="100%"/>
<%}else if(uData.getSpot().equals("Kodaikanal")){
%> 	
<img src="images/kodaikanal1.jpg" height="35%" width="100%"/>
<img src="images/kodaikanal2.jpg" height="35%" width="100%"/>
<img src="images/kodaikanal3.jpg" height="35%" width="100%"/>
<%}else if(uData.getSpot().equals("Ladakh")){
%> 	
<img src="images/ladakh1.jpg" height="35%" width="100%"/>
<img src="images/ladakh2.jpg" height="35%" width="100%"/>
<img src="images/ladakh3.jpg" height="35%" width="100%"/>
<%}else if(uData.getSpot().equals("Gulmarg")){
%> 	
<img src="images/gulmarg2.jpg" height="35%" width="100%"/>
<img src="images/gulmarg1.jpg" height="35%" width="100%"/>
<img src="images/gulmarg3.jpg" height="35%" width="100%"/>
<%} %>