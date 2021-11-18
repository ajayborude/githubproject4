
/*package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dataBaseOperation.AllNotesRegardingOpr;
import com.dataBaseOperation.NotesDetails;

@WebServlet("/ViewNotesServlet")
public class ViewNotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid=Integer.parseInt(request.getParameter("uid"));
		NotesDetails nd = new NotesDetails();
		
		nd.setId(uid);
		HttpSession session=request.getSession();
		nd=AllNotesRegardingOpr.getNotesByID(uid);
		
		if(nd!=null)
		{
			session.setAttribute("notes-obj", nd);
			
		}
		else {
			session.setAttribute("eror-msg", "Something wrong on Server");
			response.sendRedirect("viewNotes.jsp");
		}
	}

}
*/