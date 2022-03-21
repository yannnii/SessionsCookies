package net.javaguides.registration.dao;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.javaguides.registration.model.Employee;

public class AuthDao {
	    
	public void authEmployee(Employee employee, HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, ServletException, IOException {
        String SELECT_USERS_SQL = "SELECT * FROM employee WHERE username=(?) AND pass=(?);";

        Class.forName("com.mysql.jdbc.Driver");
        
        HttpSession session = request.getSession();

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/employees?useSSL=false&serverTimezone=UTC", "root", "root");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_SQL)) {
            preparedStatement.setString(1, employee.getUsername());
            preparedStatement.setString(2, employee.getPass());
            

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet result = preparedStatement.executeQuery();
            if(result.next())
            {
            	Cookie username = new Cookie("username", request.getParameter("username"));
            	//Cookie pass = new Cookie("pass", request.getParameter("pass"));
            	response.addCookie(username);
            	//response.addCookie(pass);
            	
            	session.setMaxInactiveInterval(1*60*60);
                session.setMaxInactiveInterval(-1);
            	session.setAttribute("username", request.getParameter("username"));
            	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/auth_success.jsp");
		    	dispatcher.forward(request, response);
            }
            else
            {
            	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/auth_error.jsp");
		    	dispatcher.forward(request, response);
            }

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

}