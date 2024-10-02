<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Register</title>

<style>
body {
      background-image: url('https://miro.medium.com/v2/resize:fit:1280/1*IetY-kLHy7TpkwHgmU129g.gif');
    font-family: Arial, sans-serif; /* Font family */
    background-repeat: no-repeat; /* Prevent image from repeating */
    background-size:98% 80%; /* Cover the entire background */
    background-position: center; 
    background-color: black;
}

.navbar {
    background-color: black;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 10px 0;
}

.nav-item {
    color: orange;
    font-size: 18px;
    margin: 0 95px;
    text-decoration: none;
    transition: color 0.3s;
}

.nav-item:hover {
    color: white;
}

.center-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Full viewport height */
}

.login-box {
    background-color: rgba(0, 0, 0, 0); /* Light white background with transparency */
    backdrop-filter: blur(5px); /* Blur effect */
    border-radius: 0px; /* Rounded corners for the login box */
    padding: 60 px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Optional: Add a subtle shadow for depth */
    width: 50; /* Adjust the width as needed */
    margin: 0 auto; /* Center the login box horizontally */
}

h1 {
    text-align: center;
    color: #333; /* Dark text color */
}

form {
    text-align: left; /* Align form elements to the left */
}

table {
    width: 100%;
}

td {
    padding: 10px;
}

input[type="text"],
input[type="password"],
input[type="submit"],
input[type="reset"] {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    border: none;
    border-radius: 5px;
}

input[type="submit"] {
    background-color: #FFA500; /* Blue button color */
    color: white;
    cursor: pointer;
}

input[type="reset"] {
    background-color: #DC3545; /* Red button color */
    color: white;
    cursor: pointer;
}
</style>


</head>
<body>
<div class="navbar">
    <a href="firstPage.jsp" class="nav-item">Home</a>
    <a href="SLogin.jsp" class="nav-item">Student Login</a>
    <a href="SRegister.jsp" class="nav-item">Student Register</a>
    <a href="#" class="nav-item">About Us</a>
    <a href="#" class="nav-item">Contact Us</a>
</div>

 <div class="center-container">
  <div class="login-box">
    <h1 style="color: #ffffff;">student Registration</h1>
    <form action="SRegisterServlet" method="post">
    <table>
        <tr>
            <td style="color: #ffffff;">Enter name:</td>
            <td><input type="text" name="txtName" required></td>
        </tr>
        <tr>
            <td style="color: #ffffff;">New Password:</td>
            <td><input type="password" name="txtPwd" required></td>
        </tr>
        <tr>
            <td style="color: #ffffff;">Confirm Password:</td>
            <td><input type="password" name="txtConfirmPwd" required></td>
        </tr>
        <tr>
            <td><input type="submit" value="Register"></td>
            <td><input type="reset"></td>
        </tr>
    </table>
</form>
    
    </div>
 </div>
</body>
</html>