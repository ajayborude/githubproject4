<%@page import="com.dataBaseOperation.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="index.jsp"><i class="fas fa-book"></i>
		E Notes</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fas fa-house-user"></i> Home <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item active"><a class="nav-link" href="addNotes.jsp"><i
					class="fas fa-book-medical"></i> Add Notes</a></li>

			<li class="nav-item active"><a class="nav-link" href="viewNotes.jsp"><i
					class="fas fa-eye"></i> Show Notes</a></li>
		</ul>
		<%
		UserDetails ud=(UserDetails)session.getAttribute("user-obj");
		if (ud != null) {
		%>
		<form class="form-inline my-2 my-lg-0" data-toggle="modal" data-target="#exampleModalCenter">
			<a class="btn btn-success text-white"><i class="fas fa-user-circle"></i> <%=ud.getName() %></a> 
			
		</form>
		<%
		}
		else{
		%>
		<form class="form-inline my-2 my-lg-0">
			<a href="" class="btn btn-success"><i
				class="fas fa-sign-in-alt"></i> Login</a> <a href="register.jsp"
				class="btn btn-success ml-2"><i class="fas fa-registered"></i>
				Register</a>
		</form>
		<%
		}
		%>
		
	</div>
	
	
	<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="LogoutServlet" class="btn btn-danger">Logout</a>
      </div>
    </div>
  </div>
</div>
</nav>