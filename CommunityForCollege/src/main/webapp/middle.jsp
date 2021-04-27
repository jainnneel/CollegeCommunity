<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ include file="css_js.jsp" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
</head>
<body>

</body>
<script type="text/javascript">
$(document).ready(function(){
	
	$.ajax({
		url:"datasend",
		data:{},
		
		success:function(data,textStatus,jqXHR){
			console.log(data);
			swal(data)
			.then((value) => {
				window.location="login.jsp"
			}); 
			
		},
	})	
});
	
	


</script>
</html>