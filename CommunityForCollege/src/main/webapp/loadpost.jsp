<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page import="helper.*" %>  
<%@ page import="entity.*" %> 
<div class="row text-center">


<%
user u3 = (user)session.getAttribute("user");
int id= u3.getId();

SessionFactory fact= factory.getFactory();
Session ses = fact.openSession();
List<post> l1 = null;
Query q2;

int cid = Integer.parseInt(request.getParameter("cid"));
int uid = Integer.parseInt(request.getParameter("userid")); 

System.out.print(cid+" "+uid);
if(cid==0 && uid==0)
{
	Query qs=ses.createQuery("from follow where userid=:x");
	qs.setParameter("x",id);
	List<follow> l3=qs.list();
	System.out.print(l3.size());
	for(follow f:l3)
	{
	Query qf=ses.createQuery("from post where u_id=:x order By d desc");
	qf.setParameter("x",f.getFollow());
	l1=qf.list();
	for(post p:l1)	
	{
	%>
	<div class="col-md-6 col-sm-12 col-lg-6 col-xl-4 mt-4">
		<div class="card" style="width: 18rem; height:21rem; ">
		<div class="card-header text-left text-dark">
			<img alt="" src="pics/<%=p.getU().getProfile()%>" width="25rem;" height="20rem;"><span class="pl-2"><b><a href="userprofile1.jsp?id=<%=p.getU().getId()%>"><%=p.getU().getUname() %></a></b></span>
				
		</div>
	  <img class="card-img-top p-1" width="17rem;" height="160rem;" src="pics/<%=p.getThimage()%>" alt="Card image cap">
	  <div class="card-body">
	  	<%-- <img alt="" src="pics/<%=p.getPtimage()%>"/> --%>
	    <h5 class="card-title"><a href="postShow.jsp?id=<%=p.getPid()%>"><%=p.getTitle()%></a></h5>
	    <%-- <p class="card-text text-justify" style="height: 10rem;"><%=p.getContent()%></p> --%>
	    </div><br>
	    <div class="card-footer">
	    <a href="postShow.jsp?id=<%=p.getPid()%>" class="btn btn-primary">Read more..</a>
	   </div>
	  
	</div>
	</div>
	<br>
	<%
	}
	/* ses.close(); */
	}
}
else if(cid==98)
{
	Query qs=ses.createQuery("from liked where ur=:x");
	qs.setParameter("x",id);
	List<liked> l8= qs.list();
	for(liked f:l8)
	{
	Query qf=ses.createQuery("from post where pid=:x order By d desc");
	qf.setParameter("x",f.getPt());
	l1=qf.list();
	for(post p:l1)	
	{
	%>
	<div class="col-md-6 col-sm-12 col-lg-6 col-xl-4 mt-3">
		<div class="card" style="width: 18rem; height:21rem; ">
		<div class="card-header text-left">
			<img alt="" src="pics/<%=p.getU().getProfile()%>" width="25rem;" height="20rem;"><span class="pl-2"><b><a href="userprofile1.jsp?id=<%=p.getU().getId()%>"><%=p.getU().getUname() %></a></b></span>
				
		</div>
	  <img class="card-img-top p-1" width="17rem;" height="160rem;" src="pics/<%=p.getThimage()%>" alt="Card image cap">
	  <div class="card-body">
	  	<%-- <img alt="" src="pics/<%=p.getPtimage()%>"/> --%>
	    <h5 class="card-title"><a href="postShow.jsp?id=<%=p.getPid()%>"><%=p.getTitle()%></a></h5>
	    <%-- <p class="card-text text-justify" style="height: 10rem;"><%=p.getContent()%></p> --%>
	    </div><br>
	    <div class="card-footer">
	    <a href="postShow.jsp?id=<%=p.getPid()%>" class="btn btn-primary">Read more..</a>
	   </div>
	  
	</div>
	</div>
	<%
	}
	/* ses.close(); */
	}
	
}


else if(cid==99 && uid==99)
{
	List<category> l4=null;
	String cat=null;
		int c1;
		cat= u3.getCategory();
		System.out.print(cat); 
		String c[] = cat.split(",");
		System.out.print("size of cat:"+c.length);
		category cl = new category();
		for(int i=0;i<c.length;i++)
		{
		
		Query<category> q4=ses.createQuery("from category where cname=:x");
		
		q4.setParameter("x",c[i]);
		
		category c0= q4.getSingleResult();
				
		q2=ses.createQuery("from post where c_cid=:x order By d desc");
			
		q2.setParameter("x",c0.getCid());
			
		l1=q2.list();
		System.out.print("size"+l1.size());
		
		if(l1.size()==0)
			{
			%>
				<!-- <div class="container text-center">
				<h5 class="display-3">No post yet</h5>
				</div>  -->
			<%
			} 
			for(post p:l1)	
			{
			%>
			<div class="col-md-6 col-sm-12 col-lg-6 col-xl-4 mt-3">
				<div class="card" style="width: 18rem; height:21rem; ">
				<div class="card-header text-left">
					<img alt="" src="pics/<%=p.getU().getProfile()%>" width="25rem;" height="20rem;"><span class="pl-2"><b><a href="userprofile1.jsp?id=<%=p.getU().getId()%>"><%=p.getU().getUname() %></a></b></span>
				
				</div>
			  <img class="card-img-top p-1" width="17rem;" height="160rem;" src="pics/<%=p.getThimage()%>" alt="Card image cap">
			  <div class="card-body">
			  	<%-- <img alt="" src="pics/<%=p.getPtimage()%>"/> --%>
			    <h5 class="card-title"><a href="postShow.jsp?id=<%=p.getPid()%>"><%=p.getTitle()%></a></h5>
			    <%-- <p class="card-text"><%=p.getContent()%></p> --%>
			   </div>
			  	 <div class="card-footer">
				  <a href="postShow.jsp?id=<%=p.getPid()%>" class="btn btn-primary">Read more..</a>
			  		
				    </div>
		</div>
		</div>
		<%
		}
		}
		
			ses.close();
		}

else if(cid==0 && uid!=0)
{
	q2=ses.createQuery("from post where u_id=:x order By d desc");
	q2.setParameter("x",uid);
	l1=q2.list();
	if(l1.size()==0)
	{
		%>
		<div class="container text-center">
		<h5 class="display-3">No post yet</h5>
		</div>
		<%
	}
	for(post p:l1)	
{
	
%>
<div class="col-md-6 col-sm-12 col-lg-6 col-xl-4 mt-3">
	<div class="card" style="width: 18rem; height:21rem; ">
	<div class="card-header text-left">
			<img alt="" src="pics/<%=p.getU().getProfile()%>" width="25rem;" height="20rem;"><span class="pl-2"><b><%=p.getU().getUname() %></b></span>
				
		</div>
  <img class="card-img-top p-1" width="17rem;" height="160rem;" src="pics/<%=p.getThimage()%>" alt="Card image cap">
  <div class="card-body">
  	<%-- <img alt="" src="pics/<%=p.getPtimage()%>"/> --%>
    <h5 class="card-title"><a href="postEdit.jsp?id=<%=p.getPid()%>"><%=p.getTitle()%></a></h5>
    <%-- <p class="card-text"><%=p.getContent()%></p> --%>
   </div>
  	 <div class="card-footer">
	  <a href="postEdit.jsp?id=<%=p.getPid()%>" class="btn btn-primary">Read more..</a>
  		<a href="delete?id=<%=p.getPid()%>" class="btn btn-primary">Delete</a>
	    </div>
</div>
</div>
<%
}
	ses.close();
}
else
{
	q2=ses.createQuery("from post where c_cid=:x order By d desc");
	q2.setParameter("x",cid);
	l1=q2.list();
	if(l1.size()==0)
	{
	%>
		<div class="container text-center">
		<h5 class="display-3">No post yet</h5>
		</div>
	<%
	}
	for(post p:l1)	
	{
	%>
	<div class="col-md-6 col-sm-12 col-lg-6 col-xl-4 mt-3">
		<div class="card" style="width: 18rem; height:21rem; ">
		<div class="card-header text-left">
			<img alt="" src="pics/<%=p.getU().getProfile()%>" width="25rem;" height="20rem;"><span class="pl-2"><b><a href="userprofile1.jsp?id=<%=p.getU().getId()%>"><%=p.getU().getUname() %></a></b></span>
		</div>
	  <img class="card-img-top p-1" width="17rem;" height="160rem;" src="pics/<%=p.getThimage()%>" alt="Card image cap">
	  <div class="card-body">
	  	<%-- <img alt="" src="pics/<%=p.getPtimage()%>"/> --%>
	    <h5 class="card-title"><a href="postShow.jsp?id=<%=p.getPid()%>"><%=p.getTitle()%></a></h5>
	    <%-- <p class="card-text"><%=p.getContent()%></p> --%>
	    </div>
	    <div class="card-footer">
	    <a href="postShow.jsp?id=<%=p.getPid()%>" class="btn btn-primary">Read more..</a>
	      
    	</div>
	  
	</div>
	</div>
	<%
	}
	ses.close();
}
%>

</div>

