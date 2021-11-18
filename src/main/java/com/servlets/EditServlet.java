package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dataBaseOperation.AllNotesRegardingOpr;
import com.dataBaseOperation.NotesDetails;

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid=Integer.parseInt(request.getParameter("uid"));
		String title=request.getParameter("title");
		String cont=request.getParameter("content");
	
		NotesDetails nd = new NotesDetails();
		nd.setId(uid);
		nd.setTitle(title);
		nd.setContent(cont);		
		HttpSession session=request.getSession();
		
		int result=AllNotesRegardingOpr.editNotes(nd);
		if(result>0)
		{
			session.setAttribute("updt-msg", "Your Record has been Successfully Updated");
			response.sendRedirect("viewNotes.jsp");
		}
		else 
		{
			session.setAttribute("user-obj", "Something wrong on Server");
			response.sendRedirect("editNotes.jsp");
		}
	}

}
