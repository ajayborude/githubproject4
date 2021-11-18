<%@page import="com.dataBaseConnection.DataBaseConnection"%>
<%@page import="com.dataBaseOperation.AllNotesRegardingOpr"%>
<%@page import="com.dataBaseOperation.NotesDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Notes Here</title>
<%@include file="CSS/allCssLinks.jsp"%>
</head>
<body style="background-color: lightblue">
	<%@include file="ComenElements/navbar.jsp"%>
	<%
	UserDetails ud1 = (UserDetails) session.getAttribute("user-obj");
	if (ud1 == null) {
		session.setAttribute("error-msg", "Please Login First");
		response.sendRedirect("login.jsp");
	}
	%>


	<h2 class="text-center">Your All Notes:</h2>


	<%
	if (ud1 != null) {

		DataBaseConnection.getConnection();
		List<NotesDetails> list = AllNotesRegardingOpr.getNotesById(ud1.getId());
		for (NotesDetails nd1 : list) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-10 offset-md-1">

				<div class="card">
					<i class="far fa-sticky-note fa-3x text-center"></i>

					<%
					String updated_msg = (String) session.getAttribute("updt-msg");

					if (updated_msg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=updated_msg%></div>
					<%
					}
					session.removeAttribute("updt-msg");
					%>

					<div class="card-body">

						<div class="form-group">
							<b>Title:</b> <input type="text" class="form-control"
								id="exampleInputname" placeholder="<%=nd1.getTitle()%>">
						</div>
						<div class="form-group">
							<b>Content:</b>
							<textarea class="form-control" id="exampleFormControlTextarea1"
								placeholder=" <%=nd1.getContent()%>" rows="4"></textarea>
						</div>
						<div class="form-group">
							<b>Publish By:</b> <input type="text" class="form-control"
								id="exampleInputname" placeholder="<%=ud1.getName()%>">
						</div>
						<div class="form-group">
							<b>Publish Date:</b> <input type="text" class="form-control"
								id="exampleInputname" placeholder="<%=nd1.getDate()%>">
						</div>
						<a href="editNotes.jsp?uid=<%=nd1.getId()%>"
							class="btn btn-success">Edit</a> <a
							href="DeleteServlet?uid=<%=nd1.getId()%>"
							class="btn btn-danger ml-2">Delete</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<%
	}
	}
	%>
</body>
</html>