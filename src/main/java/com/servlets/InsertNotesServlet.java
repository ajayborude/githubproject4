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

@WebServlet("/InsertNotesServlet")
public class InsertNotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("uid"));
		String title=request.getParameter("title");
		String cont=request.getParameter("content");
		
		NotesDetails nd=new NotesDetails();
		
		nd.setTitle(title);
		nd.setContent(cont);
	    nd.setUser_id(uid);
		
		
	  int result=AllNotesRegardingOpr.insert(nd);
		if(result>0)
		{
			HttpSession session=request.getSession();
			session.setAttribute("reg-msg", "You have sucessfully Add Notes");
			response.sendRedirect("addNotes.jsp");
		}
		else
		{
			HttpSession session=request.getSession();
			session.setAttribute("error-msg", "Something went wrong on Server");
			response.sendRedirect("addNotes.jsp");
		}

	}
}


