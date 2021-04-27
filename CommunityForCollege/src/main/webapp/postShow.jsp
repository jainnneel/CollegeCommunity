<%@page import="helper.forlike"%>
<%@page import="java.util.List"%>
<%@page import="helper.factory"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="entity.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="login.jsp"%>
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
    
      <li class="nav-item "><span class="fa fa-home fa-lg"></span>
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
<div class="card-header"><h3><%=p.getTitle() %></h3></div>
  <img class="card-img-top p-2" src="pics/<%=p.getPtimage()%>" alt="Card image cap">
  <div class="card-body">
    <hr>
    
	<h5 style="text-align: left;"><a href="userprofile.jsp"><%=u.getFname()+" "+u.getLname()%></a>  <span>has Posted</span></h5>
	<%
	session.setAttribute("luid",u1.getId());
	session.setAttribute("puid",u.getId());
	
	%>
    
    <h6 style="text-align: right;color: blue"><%=p.getD()%></h6>
    <hr>
    <p class="card-text text-justify"><%=p.getContent()%></p>
    <div class="card-footer">
    <a href="profile.jsp" class="btn btn-primary">Profile</a>
    <%
    forlike l1 = new forlike();
    int c = l1.countLike(p.getPid());
    
    Query q3=ses.createQuery("from liked where ur=:x and pt=:y");
    q3.setParameter("x",u1.getId());
    q3.setParameter("y",p.getPid());
    
    List<liked> li = q3.list();
    
    System.out.print("neel:"+li.size());
   
    
    if(li.size()==0)
    { 
    %>
    <button  id="like" onclick="dolike(<%=u1.getId()%>,<%=p.getPid()%>)" class="btn btn-primary" >Like</button> <span class="conter"><%=c%></span>
	<%
    }
    else
    {
	%>
	<button id="like" onclick="dolike(<%=u1.getId()%>,<%=p.getPid()%>)" class="btn btn-primary" >unLike</button>  <span class="conter"><%=c%></span>
	 <%
    }
	 %>  
    </div>
    <div class="card-footer">
    <div class="fb-comments" data-href="http://localhost:8087/Clgcommunity/postShow.jsp?id=<%=p.getPid() %>" data-numposts="5" data-width=""></div>
    </div>
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
<script type="text/javascript">
function dolike(uid,pid) {
	
	let status = document.getElementById('like').innerText;
	if(status == 'Like')
		{
	const d= {
		
		uid:uid,
		pid:pid,
		operation:'like'
	};
	$.ajax({
	url:"likeServlet",
	data:d,
	success : function(data,textStatus,jqXHR)
	{
		console.log(data);
		
			let c = $('.conter').html();
			c++;
			$('.conter').html(c);
			document.getElementById('like').innerText='unLike'
			
			
	},
	error : function(data,textStatus,jqXHR)
	{
		console.log(data);
	},
	})
		}
	else
		{
		const d= {
				
				uid:uid,
				pid:pid,
				operation:'unlike'
			};
			$.ajax({
			url:"unlikeServlet",
			data:d,
			success : function(data,textStatus,jqXHR)
			{
				console.log(data);
				
					let c = $('.conter').html();
					c--;
					$('.conter').html(c);
					document.getElementById('like').innerText='Like'
			},
			error : function(data,textStatus,jqXHR)
			{
				console.log(data);
			},
			})
			
		}
	
}
</script>
</html>
