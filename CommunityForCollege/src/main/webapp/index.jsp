<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="helper.factory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="entity.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="css_js.jsp" %>

<title>Insert title here</title>
</head>
<body>

<div class="container text-center">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top ">

  <a class="navbar-brand mr-4" href="index.jsp">Blank</a>
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
  <h1 class="display-3">Blog</h1>
  <br>
  <a class="btn btn-outline-light btn-lg btn-primary" href="signup.jsp"><span class="fa fa-user-plus"></span>  Sign up for free</a>
  <a class="btn btn-outline-light btn-lg ml-4 btn-primary" href="login.jsp"><span class="fa fa-user-circle-o fa-spin"></span>  Login</a>
  
  </div>
</div>
</div>

</body>
</html>