<%@page import="java.util.List"%>
<%@page import="entity.*"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="helper.factory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ include file="css_js.jsp" %>
<link rel="stylesheet" href="profile.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js">
</head>
<body>
<%
String id = request.getParameter("id");
int uid = Integer.parseInt(id);
user u = (user)session.getAttribute("user");
int luid = u.getId();
SessionFactory fact= factory.getFactory();
Session ses = fact.openSession();
if(uid==luid)
{
response.sendRedirect("profile.jsp");
}


Query q2 = ses.createQuery("from user where id=:x");
q2.setParameter("x",uid);
user up = (user)q2.getSingleResult();

Query q1 = ses.createQuery("from post where u_id=:x");
q1.setParameter("x",uid);
List<post> lp = q1.list();

Query q6 = ses.createQuery("from follow where userid=:x");
q6.setParameter("x",uid);
List<follow> lf = q6.list();

Query q7 = ses.createQuery("from follow where follow=:x");
q7.setParameter("x",uid);
List<follow> fg = q7.list();

Query q3=ses.createQuery("from follow where userid=:x and follow=:y");
q3.setParameter("x",luid);
q3.setParameter("y",uid);

List<follow> fl = q3.list();

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
       <li class="nav-item dropdown"><span class="fa fa-gear fa-spin fa-lg"></span>
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Setting
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="editCategory.jsp?cat=<%=u.getCategory()%>">category</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="signout.jsp">Sign out</a>
        </div>
      </li>	
<!--      
      <li class="nav-item"><span class="fa fa-sign-out"></span> <a class="nav-link" href="signout.jsp">Sign out</a></li> -->
    </ul>
  </div>
 </nav>
</div>
<div class="container  px-5">
 <header>
       	    <div class="container ">
       	    	<div class="profile">
       	    		<div class="profile-image ml-5">
       	    			<img src="pics/<%=up.getProfile()%>" alt="user" width="200px" height="200px">
       	    		</div>
				 <div class=" profile-user-settings ml-4">
                    	<h1 class="profile-user-name"><%=up.getUname() %></h1>
                     <br>
                     <br>
                     <%
                     if(fl.size()==0)
                     { 
                     %>
                       <div>
                        <button class="btn  profile-edit-btn px-5" id="follow" onclick="dofollow(<%=luid%>,<%=uid%>)">follow</button>
                      </div> 
                      <%
						 }
						else
						{
						 %>
                         <div>
                        <button class="btn profile-edit-btn px-5" id="follow" onclick="dofollow(<%=luid%>,<%=uid%>)">following</button>
                      </div>   
                      <%} %>
                    </div>
                    <br>
                    <div class="profile-stats">
                    	<ul>
                    		<li><span class="profile-stat-count"><%=lp.size()%></span>  posts</li>
                    		<li data-toggle="modal" data-target="#flist"><span class="profile-stat-count" id="follower"><%=fg.size() %></span> <a href="#" id="#flist" >followers</a></li>
                    		<li data-toggle="modal" data-target="#fglist"><span class="profile-stat-count" id="follower"><%=lf.size()%></span> <a href="#" id="#fglist" > following</a></li>
                    	</ul>
                    </div>
                    <div class="profile-bio ml-3">
                    	<p><span class="profile-real-name"><%=up.getFname()+" "+up.getLname() %></span>   <%=up.getBio() %></p>
                    </div>
       	    	</div> 
       	    </div>
	</header>
       <hr>
       <main>
            <div class="container px-5">    
            <div class="row"> 
            
            <div class="col-12">  	  
             <div class="gallery">
       	   	  <%
       	   	  for(post p:lp)
       	   	  {
       	   	    Query q5 = ses.createQuery("from liked where pt=:x");
       		    q5.setParameter("x",p.getPid());
				List<liked> ll = q5.list();
       		    %>
       	   	  
       	   	  <div class="gallery-item" tabindex="0">
       	   	  	  <img src="pics/<%=p.getThimage()%>" alt="gallery-1" class="gallery-image"  width="200px" height="200px">
       	   	  	  <div class="gallery-item-info">
       	   	  	  	<ul>
       	   	  	  		<a href="postShow.jsp?id=<%=p.getPid()%>"><li class="gallery-item-likes"><span class="visually-hidden">Title: </span><%=p.getTitle()%></li></a><br>
       	   	  	  		<li class="gallery-item-likes"><span class="visually-hidden">Likes: </span><i class="fa fa-heart" aria-hidden></i>  <%=ll.size()%></li>
       	   	  	  <!-- 		<li class="gallery-item-comments"><span class="visually-hidden">comments: </span><i class="fa fa-comment" aria-hidden></i>54</li>
       	   	  	   -->	</ul>
       	   	  	  </div>
       	   	  </div>
       	   	  <%
       	   	
       	   	  }
       	   	  %>
       	   	 </div>
       	   	 </div>
       	   	 </div>
       	   	 </div>
       </main>
</div>
<div class="modal fade " id="flist" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="exampleModalLabel">Followers</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
   			<%
   			for(follow f:fg)
   			{
   				Query q8 = ses.createQuery("from user where id=:x");
   				q8.setParameter("x",f.getUserid());
   				List<user> ul = q8.list();
   				for(user u1:ul)
   				{%>
   				<hr>
   				
   				<img alt="" src="pics/<%=u1.getProfile()%>" width="25rem;" height="20rem;"><span class="pl-2"><a href="userprofile1.jsp?id=<%=u1.getId()%>"><%=u1.getFname()+" "+u1.getLname()%></a></span>
   				<hr>
   					
   				<%	
   				}
   			}
   			
   			%>
  	  </div>
  	</div>
  </div>
 </div>
 <div class="modal fade " id="fglist" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="exampleModalLabel">Followings</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
   			<%
   			for(follow f:lf)
   			{
   				Query q8 = ses.createQuery("from user where id=:x");
   				q8.setParameter("x",f.getFollow());
   				List<user> ul = q8.list();
   				System.out.print(ul.size());
   				for(user u2:ul)
   				{%>
   				<hr>
   				
   				<img alt="" src="pics/<%=u2.getProfile()%>" width="25rem;" height="20rem;"><span class="pl-2"><a href="userprofile1.jsp?id=<%=u2.getId()%>"><%=u2.getFname()+" "+u2.getLname()%></a></span>
   				<hr>
   					
   				<%	
   				}
   			}
   			
   			%>
  	  </div>
  	</div>
  </div>
 </div>
</body>
</body>
<script type="text/javascript">
/* 
$(document).ready(function() {

	 alert("jain");
  
 }); */
function dofollow(luid,puid) {
	 
	 let status = document.getElementById('follow').innerText;
	 
	 if(status=='follow')
		 {
		 document.getElementById('follow').innerText='following';
			$.ajax({
				url:"following",
				data:
					{ 
					lid:luid,
					uid:puid
					},
			
				success:function(data,textStatus,jqXHR){
					 console.log(data); 
					 $('#follower').html(data)
	}
		});
		 }
	 else
	 {
	 document.getElementById('follow').innerText='follow';
	 
		$.ajax({
			url:"unfollowing",
			data:
				{ 
				lid:luid,
				uid:puid
				},
			
				success:function(data,textStatus,jqXHR){
					 console.log(data); 
					 $('#follower').html(data)
	}
		});
		 }
		

	

 }
</script>
</html>