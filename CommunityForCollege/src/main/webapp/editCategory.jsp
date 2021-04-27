<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
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
<title>Insert title here</title>
<%@ include file="css_js.jsp" %>
</head>
<body>

<form action="updateCategory" >
<div class="container text-center">
<h5>Your selected category</h5>
<%
String s = request.getParameter("cat");
String cname[]=s.split(",");  

 for(String c:cname)
 {
 %>	
 	<div class="form-group text-center">
 		<label><b><%=c%></b></label>
	 <input class="form-control" type="checkbox" value="<%=c%>" name="cat" checked> 
	 </div>
 </div>
	<%	 
 }
 %>
 <div class="container text-center mt-3 text-justify">
	 <h5>Add more category</h5>
 <%
System.out.print(s);

	SessionFactory fact= factory.getFactory();
	Session ses = fact.openSession();
    Query q2 = ses.createQuery("from category");
	
    List<category> l1 = q2.list();
	  for(category c:l1)
	  {
		%>
	
	<label><b><%=c.getCname()%></b></label>
  	<input  type="checkbox" value="<%=c.getCname() %>" name="cat"><br>
  		<%
	  }
	%>

<br>

<button class="btn btn-primary" type="submit">Add Category</button>
</div>
</form>

</body>
</html>