package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dataBaseOperation.AllUserRegardingOpr;
import com.dataBaseOperation.UserDetails;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter pw=response.getWriter();
		String em=request.getParameter("email");
		String pass=request.getParameter("password");
		
		UserDetails ud = new UserDetails();
		HttpSession session=request.getSession();
		ud=AllUserRegardingOpr.getLogin(em, pass);
		
		if (ud!=null) 
		{
			session.setAttribute("user-obj", ud);
			response.sendRedirect("index.jsp");
		} 
		else 
		{
			session.setAttribute("error-msg", "Invalid Email or Password");
			response.sendRedirect("login.jsp");
		}
	}

}
