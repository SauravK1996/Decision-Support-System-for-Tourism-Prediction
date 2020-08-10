<link rel="stylesheet" href="css/mainleft.css">
<%if(session.getAttribute("admin")!=null || session.getAttribute("user")!=null || session.getAttribute("admin")==null || session.getAttribute("user")==null){%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<marquee behavior="alternate">
	<p style="font-style: oblique;color: aqua;font-size: large;">
		An intelligent way to predict the correct destination for tourist.
	</p>
	</marquee>		
<%}%>

<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="images/img_nature_wide.jpg" style="width:100%">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="images/img_snow_wide.jpg" style="width:100%">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="images/img_mountains_wide.jpg" style="width:100%">
  <div class="text"></div>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>