<%@page import="helper.forlike"%>
<%@page import="java.util.List"%>
<%@page import="helper.factory"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="entity.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v6.0"></script>
<%@ include file="css_js.jsp" %>
</head>
<body>
<%
String i = request.getParameter("id").trim();
int id = Integer.parseInt(i);
%>
<div class="container text-center">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top ">

  <a class="navbar-brand ml-3" href="profile.jsp">Blank</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
    
     c-  <li class="nav-item "><span class="fa fa-home fa-lg"></span>
        <a class="nav-link" href="profile.jsp">Home</a>
      </li>
      <li class="nav-item" data-toggle="modal" data-target="#post"><span class="fa fa-dedent fa-lg"></span><a class="nav-link" href="#">Post</a></li>
      <li class="nav-item" data-toggle="modal" data-target="#neel"><span class="fa fa-search fa-lg"></span>  <a class="nav-link" href="#">Search</a></li>
      <li class="nav-item" data-toggle="modal" data-target="#exampleModal"><span class="fa fa-user fa-lg"></span>  <a class="nav-link" href="#">Profile</a></li>
      <li class="nav-item"><span class="fa fa-sign-out"></span> <a class="nav-link" href="signout.jsp">Sign out</a></li>
    </ul>
  </div>
 </nav>
</div>
<br>
<br>
<br>
<br><br>
<%

user u1 = (user)session.getAttribute("user");

SessionFactory fact= factory.getFactory();
Session ses = fact.openSession();
Query q2 = ses.createQuery("from post where pid=:x");
q2.setParameter("x",id);
List<post> l = q2.list();


for(post p:l)
{
	user u = p.getU();
%>
<div class="container text-center">
<div class="row">
<div class="col-md-6 offset-md-2">
<div class="card" style="width:750px;">
<form class="form-group" action="editPost" enctype="multipart/form-data" method="post">

<input type="hidden" name="pid" value="<%=p.getPid()%>">
<input type="hidden" name="profile" value="<%=p.getPtimage()%>">

<div class="card-header"><h3><b>Title:</b><input class="form-control" type="text" name="title" value="<%=p.getTitle()%>"></h3></div>
  <img class="card-img-top p-3" src="pics/<%=p.getPtimage()%>" alt="Card image cap">
  <div class="p-3">
 <b>Photo:</b> <input type="file" class="form-control p-1" name="pic">
  </div>
  <div class="card-body">
    <hr>
    <h5 style="text-align: left;"><a href="#!"><%=u.getUname()%></a>  <span>has Posted</span></h5>
    <h6 style="text-align: right;color: blue"><%=p.getD()%></h6>
    <hr>
    
    <p class="card-text text-justify"><b>Content:</b><textarea class="form-control" rows="10" cols="" name="content"> <%=p.getContent()%></textarea></p>
    </div>
    <div class="card-footer">
    <a href="profile.jsp" class="btn btn-primary">Profile</a>
    
   <%--  <%
    forlike l1 = new forlike();
    int c = l1.countLike(p.getPid());
    %> --%>
   <%--  <a href="#" onclick="dolike(<%=u1.getId()%>,<%=p.getPid()%>)" class="btn btn-primary"><span id="toggle"><i class="fa fa-thumbs-up"></i></span>  <span class="conter"><%=c%></span></a> --%>
   <!--  <a href="#" class="btn btn-primary"><span class="fa fa-comments-o"></span>  5</a> -->
   <button class="btn btn-primary" type="submit">Update</button>
   </div>
   
    </form>
    <div class="card-footer">
    <div class="fb-comments" data-href="http://localhost:8087/Clgcommunity/postShow.jsp?id=<%=p.getPid() %>" data-numposts="5" data-width=""></div>
    </div>
    </div>
    </div>
    </div>
    
    
  </div>


<%
}
ses.close();
%>

</body>
</html>