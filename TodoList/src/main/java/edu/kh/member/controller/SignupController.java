package edu.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignupController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String inputId = req.getParameter("inputId");
		String inputPw = req.getParameter("inputPw");
		String inputNickname = req.getParameter("inputNickname");
		
		req.setAttribute("inputId", inputId);
	    req.setAttribute("inputPw", inputPw);
	    req.setAttribute("inputNickname", inputNickname);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/signup.jsp");

		dispatcher.forward(req, resp);
		
	}
	
}
