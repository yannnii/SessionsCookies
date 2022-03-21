package net.javaguides.registration.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.registration.dao.EmployeeDao;
import net.javaguides.registration.model.Employee;

@WebServlet("/register")
public class EmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private EmployeeDao employeeDao = new EmployeeDao();

    public EmployeeServlet() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	response.getWriter().append("Server at: ").append(request.getContextPath());
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/employeeregister.jsp");
    	dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String country = request.getParameter("country");
        String address = request.getParameter("address");
        String consent = request.getParameter("consent");
        Employee employee = new Employee();
        employee.setFirstName(firstName);
        employee.setLastName(lastName);
        employee.setUsername(username);
        employee.setPass(pass);
        employee.setEmail(email);
        employee.setGender(gender);
        employee.setCountry(country);
        employee.setAddress(address);
        if (consent==null)
        {
        	employee.setConsent("no");
        }
        else
        {
        	employee.setConsent(consent);
        }
        try {
            employeeDao.registerEmployee(employee);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/employeedetails.jsp");
    	dispatcher.forward(request, response);
      
    }
}