<%@include file="header.jsp"%>	

<%
Object obj1  = session.getAttribute("newemail");
Object obj2  = session.getAttribute("emailrecover");
String emailFill ="";
if(obj1!=null){
	emailFill = obj1.toString();
}else if(obj2!=null){
	emailFill = obj2.toString();
}


%>

<link rel="stylesheet" href="css/login.css">
<div class="login-page">
  <div class="form">
    
    <form class="login-form" method="post" action="OtpVerification">
    
    <%if(session.getAttribute("errormsg")!=null){ %>
		<font color="red"><%=session.getAttribute("errormsg")%><br><br></font>
	<%}else{%>
		<font color="red">An OTP has been sent to your email id.<br><br></font>
	<%}%>
      <input type="email" value="<%=emailFill%>" name="email" readonly="readonly" placeholder="email from session" required="required"/>
      <input type="number" name="enter_otp" placeholder="enter otp" required="required"/>
      <button>Click to verify OTP</button>
      <p class="message">Already registered? <a href="login.jsp">login</a></p>
    </form>
  </div>
</div>
<%session.removeAttribute("errormsg");%>