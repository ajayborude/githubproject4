<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Book Application</title>

<%@include file="CSS/allCssLinks.jsp"%>

<style type="text/css">
.bac-img {
	background: url("Images/e-notes.jfif");
	width: 100%;
	height: 83.7vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>
<body>
	<%@include file="ComenElements/navbar.jsp"%>


        <%
		UserDetails ud1=(UserDetails)session.getAttribute("user-obj");
		if (ud != null) {
		%>
			<div class="container-fluid bac-img">
		<div class="text-white text-center p-5">
		<h1>Welcome <%=ud1.getName() %></h1>
			<h1>
				<i class="fas fa-book"></i> E Notes- Save Your Notes
			</h1>
			
		</div>
	</div>
		<%
		}
		else{
		%>
			<div class="container-fluid bac-img">
		<div class="text-white text-center p-5">
			<h1>
				<i class="fas fa-book"></i> E Notes- Save Your Notes
			</h1>
			<a href="login.jsp" class="btn btn-light my-2 my-sm-0"><i
				class="fas fa-sign-in-alt"></i> Login</a> <a href="register.jsp"
				class="btn btn-light my-2 my-sm-0"><i class="fas fa-registered"></i>
				Register</a>
		</div>
	</div>
		<%
		}
		%>



<div class="sticky-footer">
<%@include file="ComenElements/footer.jsp" %>
</div>

</body>
</html>