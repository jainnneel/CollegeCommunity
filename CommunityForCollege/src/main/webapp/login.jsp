<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true" import="entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Login</title>
<%@ include file="css_js.jsp" %>
<link rel="stylesheet" type="text/css" href="login.css">   

</head>
<body>

<div class="container text-center">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top ">

  <a class="navbar-brand" href="index.jsp">Blank</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
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
<div class="container-fluid mt-4 p-0 m-0">
	<div class="jumbotron">
		<div class="container text-center mt-4 ">
 			
 			<div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body"><span class="fa fa-user-circle-o fa-3x text-primary"></span>  
            <h5 class="card-title text-center">Login</h5>
            <%
            message m = (message)session.getAttribute("msg");
            if(m!=null)
            {
           	%>
            <div class="alert alert-primary" role="alert">
 			 <%=m.getContent()%>
			</div>
			<%
			}
            session.removeAttribute("msg");
            %>
             <%
            message m1 = (message)session.getAttribute("signoutmsg");
            if(m1!=null)
            {
           	%>
            <div class="alert alert-primary" role="alert">
 			 <%=m1.getContent()%>
			</div>
			<%
			}
            session.removeAttribute("signoutmsg");
            %>
			
            <form class="form-signin" action="login">
              <div class="form-label-group">
                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" name="email" required autofocus>
                <label for="inputEmail">Email address</label>
              </div>

              <div class="form-label-group">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="pass" required>
                <label for="inputPassword">Password</label>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Forgot Password</label>
              </div>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"> Login</button>
              <hr class="my-4">
           <!--    <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fa fa-google fa-1x"></i>    Sign in with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fa fa-facebook-official fa-1x"></i>   Sign in with Facebook</button>
            --> </form>
          </div>
        </div>
      </div>
    </div>
 			
        </div>
   </div>
</div>
</body>
</html>