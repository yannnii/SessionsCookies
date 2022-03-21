<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>
<%
	String username_session = (String) session.getAttribute("username");
	Date createTime = new Date(session.getCreationTime());
	Date lastAccessTime = new Date(session.getLastAccessedTime());
	
	Cookie[] cookies = request.getCookies();
	String cookieName = "username";
    Cookie cookie = null;
    if(cookies !=null) {
        for(Cookie c: cookies) {
            if(cookieName.equals(c.getName())) {
                cookie = c;
                break;
            }
        }
    }
	String username_cookies = cookie.getValue();
	//String pass = request.getParameter("pass");
%>
<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="utf-8">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<title>Success authorization</title>
<link rel="stylesheet" href="resources/style.css">
</head>
<body>
  <div class="menu">
  <button><a href="register">Registration</a></button>
  <button><a href="auth">Authorization</a></button>
  <button><a href="#">Courses</a></button>
  <button><a href="#">About the site</a></button>
  <button><a href="logout">Log out</a></button>
  </div>
  <label>Success authorization</label>
  <div class="text">Session:</div>
  <div class="text">Hello, <%=username_session%>!</div>
  <div class="text">Session creation time: <%=createTime%>!</div>
  <div class="text">Cookies:</div>
  <div class="text">Hello, <%=username_cookies%>!</div>
</body>
</html>