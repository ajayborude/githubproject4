<%@page import="com.dataBaseConnection.DataBaseConnection"%>
<%@page import="com.dataBaseOperation.AllNotesRegardingOpr"%>
<%@page import="com.dataBaseOperation.NotesDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Notes Here</title>
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
			<h2 class="text-center ">Edit Your Notes</h2>
			<div class="card">
			

			
			
				<div class="card-body">
					<form method="post" action="EditServlet">
					<%
			
					int uid=Integer.parseInt(request.getParameter("uid"));
					
					DataBaseConnection.getConnection();
					
					NotesDetails nd=AllNotesRegardingOpr.getNotesByID(uid);
					%>
					<input type="hidden" value="<%=uid%>" name="uid" >
						<div class="form-group">
							<label for="exampleInputname">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputname"
								value="<%=nd.getTitle() %>" name="title">
						</div>
						<div class="form-group">
							<label for="exampleFormControlTextarea1">Enter Content</label>
							<textarea name="content" class="form-control"
								id="exampleFormControlTextarea1" placeholder="Enter Title"
								rows="6"><%=nd.getContent() %></textarea>
						</div>
						<button type="submit" class="btn btn-primary text-center">Edit Notes</button>
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