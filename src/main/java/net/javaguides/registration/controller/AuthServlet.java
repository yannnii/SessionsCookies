package net.javaguides.registration.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.registration.dao.AuthDao;
import net.javaguides.registration.model.Employee;

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AuthDao authDao = new AuthDao();
	
    public AuthServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Server at: ").append(request.getContextPath());
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/authorization.jsp");
    	dispatcher.forward(request, response);
    	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		    	
		    	response.setCharacterEncoding("UTF-8");
		    	response.setContentType("text/html;charset=UTF-8");
		        String username = request.getParameter("username");
		        String pass = request.getParameter("pass");
		        Employee employee = new Employee();
		        employee.setUsername(username);
		        employee.setPass(pass);
		        try {
		        	authDao.authEmployee(employee, request, response);
		        } catch (Exception e) {
		            e.printStackTrace();
		            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/auth_error.jsp");
			    	dispatcher.forward(request, response);
		        }
		      
		    }
}
