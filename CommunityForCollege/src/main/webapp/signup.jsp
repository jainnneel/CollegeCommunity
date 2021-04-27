<%@page import="entity.message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Signup</title>
<%@ include file="css_js.jsp" %>
</head>
<body>

<div class="container text-center">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top ">

  <a class="navbar-brand" href="index.jsp">Blank</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse " id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item "><span class="fa fa-home fa-lg"></span>
        <a class="nav-link" href="index.jsp">Home </a>
      </li>
     
      <li class="nav-item"><span class="fa fa-user-circle-o fa-spin"></span>  <a class="nav-link" href="login.jsp">Login</a></li>
      <li class="nav-item"><span class="fa fa-user-plus"></span> <a class="nav-link" href="signup.jsp">Sign up</a></li>
      
      
    </ul>
   
  </div>
  
</nav>
</div>
<br>
<br>

<div class="container-fluid mt-4 p-0 m-0">
	<div class="jumbotron">
	
		<div class="container">
			<div class="container text-center mb-4">
		
		<%
            message m = (message)session.getAttribute("emailver");
            if(m!=null)
            {
           	%>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <div class="container text-center">
			  <strong><%=m.getContent()%></strong>
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			  </div>
			</div>
			<%
			}
            session.removeAttribute("emailver");
            %>
            <span class="fa fa-user-plus fa-3x text-success"></span>
		<h1 class="display-7 text-center text-primary">Register</h1>
		</div>
  		<form class="needs-validation" novalidate action="signup" id="otp">
  <div class="form-row">
    <div class="col-md-4 mb-3">
      <label for="validationCustom01">First name</label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="First name" value="Mark" name="fname" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationCustom02">Last name</label>
      <input type="text" class="form-control" id="validationCustom02" placeholder="Last name" value="Otto" name="lname" required>
      <div class="valid-feedback">
        Looks good!
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationCustomUsername">Username</label>
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">@</span>
        </div>
        <input type="text" class="form-control" id="validationCustomUsername" placeholder="Username" aria-describedby="inputGroupPrepend" name="uname" required>
        <div class="invalid-feedback">
          Please choose a username.
        </div>
      </div>
    </div>
  </div>
   <div class="form-row">
    <div class="col-md-6 mb-3">
      <label for="validationCustom03">Enter Password</label>
      <input type="password" class="form-control"  placeholder="password" name="pass" required>
    
    </div>
    <div class="col-md-6 mb-3">
      <label for="validationCustom03">Gender</label>
      <input type="text" class="form-control"  placeholder="male/female" name="sex" required>
    
    </div>
    
    
  </div>
  <div class="form-row">
    <div class="col-md-6 mb-3">
      <label for="validationCustom03">Email</label>
      <input type="email" class="form-control"  placeholder="Enter your email" name="email" required>
    
    </div>
    <div class="col-md-6 mb-3">
      <label for="validationCustom03">Date of Birth</label>
      <input type="date" class="form-control"  placeholder="Date"  name="date" required>
    
    </div>
    
    
  </div>
  <div class="form-row">
    <div class="col-md-6 mb-3">
      <label for="validationCustom03">City</label>
      <input type="text" class="form-control" id="validationCustom03" placeholder="City" name="city" required>
      <div class="invalid-feedback">
        Please provide a valid city.
      </div>
    </div>
    <div class="col-md-6 mb-3">
      <label for="validationCustom04">State</label>
      <input type="text" class="form-control" id="validationCustom04" placeholder="State" name="state" required>
      <div class="invalid-feedback">
        Please provide a valid state.
      </div>
    </div>
   
  </div>
  <label for="validationCustom03">Department</label>
  <div class="form-row form-check form-control ">
   
   <select name="department">
   <option value="Computer">Computer</option>
   <option value="Electronics and Communication">Electronics and Communication</option>
   <option value="Electrical">Electrical</option>
   <option value="I.T">I.T</option>
   <option value="Civil">Civil</option>
   </select>
 </div>
  
 <div class="form-check">
 
  <br>
	  <input class="form-check-input form-control" type="checkbox" value="Entertainment" name="category">
  <label class="form-check-label" >
    Entertainment
  </label>
	<br>
	<br>
	  <input class="form-check-input form-control" type="checkbox" value="Economy" name="category">
  <label class="form-check-label">
    Economy
  </label>
	  <br>
	  <br>
	  <input class="form-check-input form-control" type="checkbox" value="Programming" name="category">
  <label class="form-check-label" >
    Programming
  </label>
	  <br>
	  <br>
	  <input class="form-check-input form-control" type="checkbox" value="Literature" name="category">
  <label class="form-check-label" >
   	Literature
  </label>
    <br>
    <br>
	  <input class="form-check-input form-control" type="checkbox" value="Literature" name="category">
  <label class="form-check-label" >
   	Political
  </label>
   <br>
   <br>
	  <input class="form-check-input form-control" type="checkbox" value="Literature" name="category">
  <label class="form-check-label" >
   Sports
   </label>
	
</div>
<br>
<br><br> 
  <div class="container text-center">
  <div class="form-group">
    <div class="form-check">
	     <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
      <label class="form-check-label" for="invalidCheck">
        Agree to terms and conditions
      </label>
      <div class="invalid-feedback">
        You must agree before submitting.
      </div>
    </div>
  </div>
  <button class="btn btn-primary" type="submit">Sign Up</button>
 </div>
</form>
</div>
 

<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
<!-- <script type="text/javascript">
$(document).ready(function(){

	$('#otp').on('submit',function(event){
		
		event.preventDefault();
		
		let f = new FormData(this);
		
		$.ajax({
			url:"datasend",
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
	
}); -->

</script>
  </div>
</div>

</body>
</html>