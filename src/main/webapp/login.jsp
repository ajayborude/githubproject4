<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Here</title>
<%@include file="CSS/allCssLinks.jsp"%>
</head>
<body style="background-color: powderblue;">

	<%@include file="ComenElements/navbar.jsp"%>

	<div class="container">
		<div class="row mt-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header bg-success">
						<div class="text-center text-white">
							<h4>
								<i class="fas fa-user-tie fa-2x"></i><br> Login Page
							</h4>
						</div>
					</div>
					<%
					String eror_msg = (String) session.getAttribute("error-msg");
					if (eror_msg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=eror_msg%></div>
					<%
					}
					session.removeAttribute("error-msg");
					%>
					
					<%
					String logout_msg=(String)session.getAttribute("logout-msg");
					if (logout_msg != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=logout_msg%></div>
						<%
						}
						session.removeAttribute("logout-msg");
					%>
					
					<div class="card-body">
						<form method="post" action="LoginServlet">

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password">
							</div>

							<button type="submit" class="btn btn-success">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="sticky-footer">
		<%@include file="ComenElements/footer.jsp"%>
	</div>
</body>
</html>