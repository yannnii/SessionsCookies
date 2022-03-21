<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="utf-8">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<title>Error authorization</title>
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
  <label>Error authorization</label>
  <div class="text">User <%=request.getParameter("username")%> is not found</div>
</body>
</html>