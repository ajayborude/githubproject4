<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Here</title>
<%@include file="CSS/allCssLinks.jsp"%>
</head>
<body style="background-color: powderblue;">

	<%@include file="ComenElements/navbar.jsp"%>

	<div class="container">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header bg-success">
						<div class="text-center text-white">
							<h4>
								<i class="fas fa-users fa-2x"></i><br> Register Page
							</h4>
						</div>
					</div>
					<%
					String reg_msg = (String) session.getAttribute("reg-msg");
					String eror_msg = (String) session.getAttribute("error-msg");

					if (reg_msg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=reg_msg%><a
							href="login.jsp"><br>Click here to login</a>
					</div>
					<%
					}

					if (eror_msg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=eror_msg%></div>
					<%
					}

					session.removeAttribute("reg-msg");
					session.removeAttribute("error-msg");
					%>
					<div class="card-body">
						<form method="post" action="RegisterServlet">
							<div class="form-group">
								<label for="exampleInputname">Full Name</label> <input
									type="text" class="form-control" id="exampleInputname"
									placeholder="Enter name" name="name">
							</div>
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

							<button type="submit" class="btn btn-primary">Register</button>
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