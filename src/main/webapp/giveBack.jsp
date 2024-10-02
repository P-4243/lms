<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<style>
/* Your existing CSS styles */
</style>
<script>
/* Your existing JavaScript functions */
function showTable(option) {
  var tables = document.querySelectorAll('[id$="Table"]');
  tables.forEach(function(table) {
    table.style.display = 'none';
  });

  var selectedTable = document.getElementById(option + 'Table');
  if (selectedTable) {
    selectedTable.style.display = 'block';
  }
}
</script>
</head>
<body>

<div class="navbar">
  <a href="#" onclick="showTable('option1')">Issue Book</a>
  <a href="#" onclick="showTable('option2')">Book Details</a>
  <a href="#" onclick="showTable('option3')">Register Student</a>
  <a href="#" onclick="showTable('option4')">Return Book</a>
</div>

<h1>Welcome to <b>YOUR</b> library!!</h1>

<!-- Display message from the servlet -->
<%
  String message = request.getParameter("message");
  if (message != null && !message.isEmpty()) {
%>
  <p style="color: white; text-align: center;"><%= message %></p>
<%
  }
%>

<!-- Book Details Table -->
<div id="option2Table" style="display: none;">
<%
try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sunita", "root", "Onetwothree123");
  Statement st = con.createStatement();
  ResultSet rs = st.executeQuery("select * from books");
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

<!-- Return Book Form -->
<div id="option4Table" style="display: none;">
  <h2>Return Book</h2>
  <form action="ReturnBookServlet" method="post">
    <label for="bookName">Book Name:</label>
    <input type="text" id="bookName" name="bookName" required><br>

    <input type="submit" value="Return Book">
  </form>
</div>

</body>
</html>
