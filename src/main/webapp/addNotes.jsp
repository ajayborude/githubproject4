<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes Here</title>
<%@include file="CSS/allCssLinks.jsp"%>
</head>

<%
UserDetails ud1=(UserDetails)session.getAttribute("user-obj");
if(ud1 == null)
{
	session.setAttribute("logout-msg", "Please Login First");
	response.sendRedirect("login.jsp");
}
%>

<body style="background-color: lightblue">
	<%@include file="ComenElements/navbar.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-md-12 offset-md-0.5">
			<h1 class="text-center">Add Notes</h1>
			<div class="card">
			
					<%
					String reg_msg = (String) session.getAttribute("reg-msg");
					String eror_msg = (String) session.getAttribute("error-msg");

					if (reg_msg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=reg_msg%></div>
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
					<form method="post" action="InsertNotesServlet">
					<%
					if(ud1!=null)
					{
					%>
					<input type="hidden" value="<%=ud1.getId() %>" name="uid">
					<%
					}%>
						<div class="form-group">
							<label for="exampleInputname">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputname"
								placeholder="Enter Title" name="title">
						</div>
						<div class="form-group">
							<label for="exampleFormControlTextarea1">Enter Content</label>
							<textarea name="content" class="form-control"
								id="exampleFormControlTextarea1" placeholder="Enter Title"
								rows="6"></textarea>
						</div>
						<button type="submit" class="btn btn-primary text-center">Add Notes</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="sticky-footer">
<%@include file="ComenElements/footer.jsp" %>
</div>
	
</body>
</html>