<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="utf-8">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<title>Authorization</title>
<link rel="stylesheet" href="resources/style.css">
<script>
    function validate() 
    {
      let username = document.forms["myForm"]["username"].value;
      let username_regexp = /^[0-9a-zA-z_\d]{6,12}$/;
      if (!username_regexp.test(username)) 
      {
        document.getElementById("error").innerHTML="Username must contain at least 6 and no more than 12 characters, only letters of the Latin alphabet, numbers, underscore";
        return false;
      }

      let pass_regexp = /^[0-9a-zA-z_\d]{6,12}$/;
      let pass = document.forms["myForm"]["pass"].value;
      if (!pass_regexp.test(pass)) 
      {
          document.getElementById("error").innerHTML="The password must contain at least 6 and no more than 12 characters, Latin letters, numbers, underscore";
          return false;
      }
    }
  </script>
</head>
<body>

  <div class="menu">
  <button><a href="register">Registration</a></button>
  <button><a href="auth">Authorization</a></button>
  <button><a href="#">Courses</a></button>
  <button><a href="#">About the site</a></button>
  <button><a href="logout">Log out</a></button>
  </div>

  <label>Authorization</label>
  <form name="myForm" action="<%= request.getContextPath() %>/auth" method="post" onsubmit="return validate()">
   <input type="text" name="username" placeholder="Login" required/>
   <input type="password" name="pass" placeholder="Password" required/>
    <div id="error"></div>
   <input type="reset" value="Clear" />
   <input type="submit" value="Submit" />
  </form>
</body>
</html>