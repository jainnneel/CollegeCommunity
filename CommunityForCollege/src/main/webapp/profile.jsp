<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="login.jsp" %>
<%@ page import="entity.message" %>  
<%@ page import="helper.*" %>  
<%@ page import="entity.*" %>  

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="css_js.jsp" %>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>  
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> 
<link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet"> 
<title>Insert title here</title>
</head>
<body>

<%
SessionFactory fact= factory.getFactory();
Session ses = fact.openSession();
user u = (user)session.getAttribute("user");

List<String> l10 = new ArrayList<String>();
l10.add("jain");
l10.add("neeljain");
l10.add("sagar jain");
l10.add("mohan");

%>
<script type="text/javascript">

</script>
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
<br>
<br>
<br>
			<%
            message m = (message)session.getAttribute("updateMsg");
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
            session.removeAttribute("updateMsg");
            %>
            <%
            message m1 = (message)session.getAttribute("postMsg");
            if(m1!=null)
            {
           	%>
           	
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <div class="container text-center">
			  <strong><%=m1.getContent()%></strong>
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			  </div>
			</div>
			<%
			}
            session.removeAttribute("postMsg");
            %>
             <%
            message m2 = (message)session.getAttribute("msgDelete");
            if(m2!=null)
            {
           	%>
           	
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <div class="container text-center">
			  <strong><%=m2.getContent()%></strong>
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			  </div>
			</div>
			<%
			}
            session.removeAttribute("msgDelete");
            %>
             <%
            message m3 = (message)session.getAttribute("msgPostedit");
            if(m3!=null)
            {
           	%>
           	
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <div class="container text-center">
			  <strong><%=m3.getContent()%></strong>
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			  </div>
			</div>
			<%
			}
            session.removeAttribute("msgPostedit");
            %>
              <%
            message m4 = (message)session.getAttribute("catupdateMsg");
            if(m4!=null)
            {
           	%>
           	
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <div class="container text-center">
			  <strong><%=m4.getContent()%></strong>
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			  </div>
			</div>
			<%
			}
            session.removeAttribute("catupdateMsg");
            %>
 
<!-- <br>
<br>
<br>

<div class="container text-center">

<span class="fa fa-refresh fa-spin fa-lg-5x"></span>

</div> -->
           
 <div class="container-fluild mt-5 ml-3 mr-5">
 <div class="row text-center">
 <div class="col-md-2 col-lg-2 col-xg-2 mt-3 mr-3">
 <div class="list-group">
  <a href="#" onclick="getpost(99,99,this)" class="c-link list-group-item list-group-item-action active">Your Interest</a>
  <a href="#" onclick="getpost(0,0,this)" class="c-link list-group-item list-group-item-action "> All Post</a>
  <a href="#" onclick="getpost(0,<%=u.getId()%>,this)" class="c-link list-group-item list-group-item-action">Your Post</a>
  <a href="#" onclick="getpost(98,<%=u.getId()%>,this)" class="c-link list-group-item list-group-item-action">Your Liked</a>
  
  
  
  
  <%
     
      Query q2 = ses.createQuery("from category");
	  List<category> l1 = q2.list();
	  for(category c:l1)
	  {
		%>
    	<a href="#" onclick="getpost(<%=c.getCid()%>,0,this)" class="c-link list-group-item list-group-item-action"><%=c.getCname()%></a>
  		<%
	  }
	%>
</div>
</div> 

<div class="col-md-8 ml-3 offset-md-2 text-center" id="postCard">

</div>
</div>  
</div>          
<div class="modal fade" id="neel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
  
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <h5 class="modal-title" id="exampleModalLabel">Find  </h5>
        
       
      <div class="container text-center">
         <form class="form-inline my-3 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" id="searchbox">
      <button class="btn btn-outline-success my-2 my-sm-0 text-white" type="submit">Search</button>
    </form>
    
      </div>
       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      <div class="modal-body">
    
    <script type="text/javascript">

function autocomp() {
	
	
	var names = <%=l10%> 

	$('#searchbox').autocomplete(
	{
		
		source : names
	},
	{
		autoFocus:true,
		
	});
}
	</script>
    </div>
      </div>
     
    </div>
  </div>
</div>

<div class="modal fade " id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
      
          <img src="pics/<%=u.getProfile()%>" style="height:120px; width: 120px; border-radius: 50%;">
          
          <h5><%=u.getUname()+" "+u.getProfile()%></h5>
        </div>
        <div id="profile">
  <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">Name:</th>
      <td><%=u.getFname()%></td>
  </tr>
     <tr>
      <th scope="row">Bio:</th>
      <td><%=u.getBio()%></td>
  </tr>
    
  </tbody>
</table>
</div>
   <div id="edit" style="display: none;">
   <form action="edit" enctype="multipart/form-data" method="post">
  <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">Name:</th>
      <td><input type="text" class="form-control" name="name" value="<%=u.getFname()%>"></td>
  </tr>
     <tr>
      <th scope="row">Password:</th>
      <td><input type="password" class="form-control" name="pass" value="<%=u.getPass()%>"></td>
  </tr>
     <tr>
      <th scope="row">Bio:</th>
      <td><textarea class="form-control" name="bio" ><%=u.getBio()%></textarea></td>
  </tr>
  
    <tr>
      <th scope="row">Update profile:</th>
      <td><input class="form-control p-1" name="profile" type="file" value="<%=u.getProfile()%>" ></td>
  </tr>

  </tbody>
 </table>
<div class="container text-center">
 <button type="submit" class="btn btn-primary ">Edit</button>
  </div>
  </form>

</div>
</div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="edit-btn" class="btn btn-primary">Edit</button>
       
      </div>
    </div>
  </div>
</div>

<div class="modal fade " id="post" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="exampleModalLabel">POST</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="form-group">
   <form action="postSave" enctype="multipart/form-data" method="post">
  <table class="table">
  
  <tbody>
   
   <tr>
      <th scope="row">Category</th>
      <td><select name="cname">
      <option selected disabled>---select category---</option>
      <%
      SessionFactory sf= factory.getFactory();
	  Session se = sf.openSession();
      
	  Query q = se.createQuery("from category");
	  
	  List<category> l = q.list();
	  
	  for(category c:l)
	  {
		
      %>
  		<option value="<%=c.getCid()%>"><%=c.getCname()%></option>
 	 <%
	  }
	     %>
 	</select>
     
     </td>
  </tr>
 
    <tr>
      <th scope="row">Post title</th>
      <td><input type="text" class="form-control" name="title" ></td>
  </tr>
 
     <tr>
      <th scope="row">Content</th>
      <td><textarea class="form-control" name="content" rows="13" ></textarea></td>
  </tr>
  
    <tr>
      <th scope="row">Feature Image:</th>
      <td><input class="form-control p-1" name="fimage" type="file"></td>
  </tr>
 <tr>
      <th scope="row">Post Image:</th>
      <td><input class="form-control p-1" name="pimage" type="file"></td>
  </tr>
  </tbody>
   
</table>
<div class="container text-center">
<div class="card-footer">
 <button type="submit" class="btn btn-primary ">Post</button>
  </div>
  </div>
  </form>
  </div>
  </div>
  </div>
  </div>
  </div>
  
  
<script type="text/javascript">
  
  $(document).ready(function() {
  
  let edit_status= false;  

    $('#edit-btn').click(function(){

      if (edit_status==false) {

        $('#profile').hide();
        $('#edit').show();

        edit_status=true;
        
        $(this).text("Back");

      }
      else
      {
         $('#profile').show();
        $('#edit').hide();

        edit_status=false;
        $(this).text("Edit");
        
      }

    });

      });
</script>
<script type="text/javascript">
  
  function getpost(catid,uid,temp) {

	  $('.c-link').removeClass('active');
		$.ajax({
			url:"loadpost.jsp",
			data:
				{ 
				cid : catid,
				userid : uid
				},
		
			success:function(data,textStatus,jqXHR){
				/* console.log(data); */
				$('#postCard').html(data)
				$(temp).addClass('active')
			}
			
		});
	  
	
}
  
  $(document).ready(function() {
	  let all = $('.c-link')[0]
  		getpost(99,99,all)
	  });
</script>
<br>
<br>
<br><br>



</body>
</html>