<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="utf-8">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<title>Registration</title>
<link rel="stylesheet" href="resources/style.css">
<script>
    function validate() {

      let username = document.forms["myForm"]["username"].value;
      let username_regexp = /^[0-9a-zA-z_\d]{6,12}$/;
      if (!username_regexp.test(username)) {
        document.getElementById("error").innerHTML="Username must contain at least 6 and no more than 12 characters, only letters of the Latin alphabet, numbers, underscore";
        return false;
      }

      let pass_regexp = /^[0-9a-zA-z_\d]{6,12}$/;
      let pass = document.forms["myForm"]["pass"].value;
      if (!pass_regexp.test(pass)) {
          document.getElementById("error").innerHTML="The password must contain at least 6 and no more than 12 characters, Latin letters, numbers, underscore";
          return false;
      }

      let pass1 = document.forms["myForm"]["pass"].value;
      let pass2 = document.forms["myForm"]["repass"].value;
      if (pass1 != pass2) {
        document.getElementById("error").innerHTML="Passwords do not match";
        return false;
      }

      let email = document.forms["myForm"]["email"].value;
      let email_regexp = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
      if (!email_regexp.test(email)) {
        document.getElementById("error").innerHTML="Invalid Email";
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

  <label>Registration</label>
  <form name="myForm" action="<%= request.getContextPath() %>/register" method="post" onsubmit="return validate()">
   <input type="text" name="firstName" placeholder="Name" required/>
   <input type="text" name="lastName" placeholder="Surname" required/>
   <input type="text" name="username" placeholder="Nickname" required/>
   <input type="password" name="pass" placeholder="Password" required/>
   <input type="password" name="repass" placeholder="Repeat password" required/>
   <input type="email" name="email" placeholder="Email" required/>
   <div class="text">Gender:</div>
   <div class="text_cont">
   <div class="text_cont">
   <div class="text1">Female</div>
   <input type="radio" name="gender" value="female" checked /></div>
   <div class="text_cont">
   <div class="text1">Male</div>
   <input type="radio" name="gender" value="male" /></div></div>
   <div class="text">City:</div>
   <select name="country">
        <option>Balakovo</option>
        <option>Saratov</option>
        <option>Marx</option>
        <option>Engels</option>
    </select>
    <textarea name="address" placeholder="Address" required></textarea>
    <div class="text_cont">
    <div class="text">Consent to data processing:</div>
    <input type="checkbox" name="consent" value="yes" />
    </div>
    <div id="error"></div>
   <input type="reset" value="Clear" />
   <input type="submit" value="Submit" />
  </form>
</body>
</html>