<%@page import="pojo.User"%>
<head>
<link rel="stylesheet" href="css/styles.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Discover your new holiday destination</title>
</head>

<body>
<div id="head">
	<div id="logo" >
		<img src="gif/logo.gif" height=100% width=100%/> 
	</div>
	<div id="menuhead">
		<div id="menuitem">
		<%if(session.getAttribute("admin")!=null){%>
			<a id="anchor" href="addplace.jsp">Add place</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="anchor" href="home.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="anchor" href="UserList">Users list</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="anchor" href="updatedetails.jsp">Update details</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
		<%}else{%>
			<a id="anchor" href="home.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="anchor" href="index.jsp">Places</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="anchor" href="index.jsp">Review</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="anchor" href="contactus2.jsp">Enquiry</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		
		<%} %>
			</div>
		<div id="searchbar">
			<form action="SpotDetails">
			<input type="text" required="required" placeholder="Enter tourist spot to search" name="id">
  				<button type="submit" value="Search"><i class="fa fa-search"></i></button>
			</form>
		</div>	
	</div>	
	<div id="userpreferences">
		<div id="login">
		<%if(session.getAttribute("user")!=null){ %>
	        <%
	         	User user =  (User)session.getAttribute("user");
	        %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="anchor" href="profile.jsp"><%=user.getfName()%></a>
		<%}else if(session.getAttribute("admin")!=null){%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="anchor" href="#">Admin</a>
		<%}else{%>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="anchor" href="login.jsp">Login</a>
		<%} %>
		</div>	
		<div id="signup">
		<%if(session.getAttribute("user")!=null || session.getAttribute("admin")!=null){ %>
	        <%
	         	User user =  (User)session.getAttribute("user");
	        %>
		<div id="login">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="anchor" href="logout.jsp">Logout</a>
		<%}else{%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="anchor" href="email.jsp">SignUp</a>
		<%}%>
		</div>	
	</div>
</div>
</div>
</div>

