<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LoginAdmin</title>
<style>
body {
  background-image: url('https://i.pinimg.com/originals/de/df/2a/dedf2a28629d3b144884a23c07238298.gif');
    font-family: Arial, sans-serif; /* Font family */
    background-repeat: no-repeat; /* Prevent image from repeating */
    background-size: 98% 80%; /* Cover the entire background */
    background-position: center; 
}

.center-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Full viewport height */
}
.navbar {
    background-color: black;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 10px 0;
}

.nav-item {
    color: lightblue;
    font-size: 18px;
    margin: 0 95px;
    text-decoration: none;
    transition: color 0.3s;
}

.nav-item:hover {
    color: white;
}
.login-box {
    background-color: rgba(56, 56, 55, 0.1); /* Light white background with transparency */
    backdrop-filter: blur(5px); /* Blur effect */
    border-radius: 0px; /* Rounded corners for the login box */
    padding: 82px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Optional: Add a subtle shadow for depth */
    width: 400px; /* Adjust the width as needed */
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
<script>
document.getElementById("showPassword").addEventListener("change", function() {
    var passwordField = document.getElementById("password");
    if (passwordField.type === "password") {
        passwordField.type = "text";
    } else {
        passwordField.type = "password";
    }
});
</script>
<script>
    // Check if the attribute indicating invalid credentials is set, and if so, display the popup
    <% if (request.getAttribute("invalidCredentials") != null && (boolean) request.getAttribute("invalidCredentials")) { %>
        window.onload = function () {
            showInvalidCredentialsPopup();
        }
    <% } %>

    function showInvalidCredentialsPopup() {
        alert("Error: Invalid username or password!");
    }
 </script>
</head>
<body>
<div class="navbar">
    <a href="firstPage.jsp" class="nav-item">Home</a>
    <a href="ALogin.jsp" class="nav-item">Login as Admin</a>
    <a href="ARegister.jsp" class="nav-item">Register as Admin</a>
    <a href="#" class="nav-item">About Us</a>
    <a href="#" class="nav-item">Contact Us</a>
</div>
<div class="center-container">
    <div class="login-box">
        <h1 style="color: #ffffff;">Admin Login</h1>
        <form action="ALoginServlet" method="post">
            <table>
                <tr>
                    <td style="color: #ffffff;">Enter name:</td>
                    <td><input type="text" name="txtName" required></td>
                </tr>
                <tr>
                    <td style="color: #ffffff;">Enter password:</td>
                    <td>
                        <input type="password" id="password" name="txtPwd" required>
                        <input type="checkbox" id="showPassword"> Show Password
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Login"></td>
                    <td><input type="reset"></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script>
document.getElementById("showPassword").addEventListener("change", function() {
    var passwordField = document.getElementById("password");
    if (passwordField.type === "password") {
        passwordField.type = "text";
    } else {
        passwordField.type = "password";
    }
});
</script>
</body>
</html>


