<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="entity.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Email-Verification</title>
<%@ include file="css_js.jsp" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
</head>
<body>
	
<div class="container text-center">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top ">

  <a class="navbar-brand" href="home.jsp">Blank</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse " id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item "><span class="fa fa-home fa-lg"></span>
        <a class="nav-link" href="home.jsp">Home </a>
      </li>
     
      <li class="nav-item"><span class="fa fa-user-circle-o fa-spin"></span>  <a class="nav-link" href="#">Login</a></li>
      <li class="nav-item"><span class="fa fa-user-plus"></span> <a class="nav-link" href="signup.jsp">Sign up</a></li>
      
      
    </ul>
   
  </div>
  
</nav>
</div>
<div class="container-fluid mt-4 p-0 m-0">
	<div class="jumbotron">
		<div class="container text-center mt-4 ">
  <form id="otp" action="everify" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1"><b>OTP</b></label>
    <input type="text" class="form-control" placeholder="Enter OTP" name="vari">
    <small  class="form-text text-muted">We send otp on your email</small>
    <%
            message m = (message)session.getAttribute("otpMsg");
            if(m!=null)
            {
           	%>
            <div class="alert alert-primary" role="alert">
 			 <%=m.getContent()%>
			</div>
			<%
			}
            session.removeAttribute("otpMsg");
      %>
  </div>
  <button type="submit" class="btn btn-primary">Verify</button>
</form>
  </div>
</div>
</div>
<!-- <script type="text/javascript">
$(document).ready(function(){

	$('#otp').on('submit',function(event){
		
		event.preventDefault();
		
		let f = new FormData(this);
		
		$.ajax({
			url:"everify",
			type:'POST',
			data:f,
			success:function(data,textStatus,jqXHR){
				console.log(data);
				swal(data)
				.then((value) => {
				  window.location="datasend"
				}); 
				
			},
		 processData:false,
		 contentType:false
		})	
	});
	
});

</script> -->
</body>
</html>