<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>welcome</title>
<style>
body {
  background-color:black;
  background-image: url('https://i.pinimg.com/originals/67/dd/e0/67dde0fd61ddcea39df2be79f7d23ead.gif');
  background-repeat: no-repeat;
  background-size:cover;
  background-position: center; 
}

/* Style the navbar */
.navbar {
  overflow: hidden;
  background-color: #333;
}

/* Style the links inside the navbar */
.navbar a {
  float: left;
  display: block;
  color: white;
  text-align: center;
  padding: 14px 20px;
  text-decoration: none;
}

/* Change color on hover */
.navbar a:hover {
  background-color: #ddd;
  color: black;
}
 .button-container {
      text-align: center;
      margin-top: 20px; /* Adjust margin as needed */
    }

h1 {
  text-align: center;
  color: white;
}

/* Style the table */
table {
  width: 80%;
  margin: 20px auto;
  border-collapse: collapse;
}

table, th, td {
  border: 1px solid white;
  color: white;
}

th, td {
  padding: 10px;
  text-align: center;
}
</style>
<script>
function showAddBookForm() {
  var addBookForm = document.getElementById("addBookForm");
  if (addBookForm.style.display === "none") {
    addBookForm.style.display = 'block';
  } else {
    addBookForm.style.display = 'none';
  }
}
</script>
<style>
/* Button decoration */
button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 5px;
}

button:hover {
  background-color: #45a049; /* Darker Green */
}

button:active {
  background-color: #3e8e41; /* Active Green */
}
</style>

<script>
function handleButton1() {
  window.location.href = 'SRegister.jsp';
}


</script>
<style>
/* Style the table headings */
th {
  color: white;
}
</style>
<style>
/* Style the table header background */
thead {
  background-color: blue;
}
</style>

</head>
<body>

<!-- Navbar -->
<div class="navbar">
<a href="#" onclick="showTable('option1')">Issue Book</a>
<a href="#" onclick="showTable('option2')">Book Details</a>
<a href="#" onclick="showTable('option3')">Register Student</a>
</div>

<h1>Welcome to <b>YOUR</b> library!!</h1>

<!-- Table containers -->
<div id="option1Table" style="display: none;">
  <form action="Option1Servlet" method="post">
    <table>
      <tr>
        <td style="color: #ffffff;">Enter name:</td>
        <td><input type="text" name="txtStudentName" required></td>
      </tr>
      <tr>
        <td style="color: #ffffff;">Enter book name:</td>
        <td><input type="text" name="txtBookName" required></td>  
      </tr>
      <tr>
        <td style="color: #ffffff;">Enter department:</td>
        <td><input type="text"  name="txtDepartment" required></td> 
      </tr>
      <tr>
        <td><input type="submit" value="Issue"></td>
        <td><input type="reset"></td>
      </tr>
    </table>
  </form>
</div>
<div id="option2Table" style="display: none;">
<%
try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sunita", "root", "Onetwothree123");
  Statement st=con.createStatement();
  ResultSet rs=st.executeQuery("select * from books");
%>
<table>
  <thead>
    <tr>
      <th>S.No</th>
      <th>Book Name</th>
      <th>Numbers</th>
    </tr>
  </thead>
  <tbody>
    <% while(rs.next()) { %>
    <tr>
      <td style="color: white;"><%= rs.getInt("s_no") %></td>
      <td style="color: white;"><%= rs.getString("book_name") %></td>
      <td style="color: white;"><%= rs.getInt("edition") %></td>
    </tr>
    <% } %>
  </tbody>
</table>
<%
  rs.close();
  st.close();
  con.close();
} catch(Exception e) {
  out.println(e);
}
%>
<button onclick="showAddBookForm()">Add New Book</button>
  
<!-- Form to add new book (initially hidden) -->
<div id="addBookForm" style="display: none;">
  <h2>Add New Book</h2>
  <form action="Option2Servlet" method="post">
    <label for="bookName">Book Name:</label>
    <input type="text" id="bookName" name="txtBookName" required><br>
    
    <label for="edition">Edition:</label>
    <input type="number" id="edition" name="txtEdition" required><br>
    
    <input type="submit" value="Add Book">
  </form>
</div>
</div>

<div id="option3Table" style="display: none;">
<button onclick="handleButton1()">Button 1</button>
<%
try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sunita", "root", "Onetwothree123");
  Statement st=con.createStatement();
  ResultSet rs=st.executeQuery("select * from login");
%>
<table>
  <thead>
    <tr>
      
      <th>Name</th>
      
    </tr>
  </thead>
  <tbody>
    <% while(rs.next()) { %>
    <tr>
      
      <td style="color: white;"><%= rs.getString("uname") %></td>
      
    </tr>
    <% } %>
  </tbody>
</table>
<%
  rs.close();
  st.close();
  con.close();
} catch(Exception e) {
  out.println(e);
}

%>

  
</div>

<!-- Add other tables similarly -->
<div id="readDataForm" style="display: none;">
<h2>Add New Book</h2>
<form action="ASRegister.jsp" method="post">
  <label for="bookName">Book Name:</label>
  <input type="text" id="unamee" name="txtuname" required><br>
  <input type="submit" value="Add Book">
</form>
</div>

<script>
function showTable(option) {
  // Hide all tables
  var tables = document.querySelectorAll('[id$="Table"]');
  tables.forEach(function(table) {
    table.style.display = 'none';
  });

  // Show the selected table
  var selectedTable = document.getElementById(option + 'Table');
  if (selectedTable) {
    selectedTable.style.display = 'block';
  }
}
</script>
</body>
</html>
