<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="utf-8">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<title>Log out</title>
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
  <label>Log out</label>
  <div class="text">You are logged out!</div>
</body>
</html>