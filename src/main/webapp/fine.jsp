<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library Books</title>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<style>
  table {
    width: 100%;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid black;
    padding: 8px;
    text-align: left;
  }
  th {
    background-color: #f2f2f2;
  }
  td {
    color: black; /* Changed to black for better visibility */
  }
</style>
</head>
<body>
<%
try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sunita", "root", "Onetwothree123");
  Statement st = con.createStatement();
  ResultSet rs = st.executeQuery("SELECT BookID, BookName, Edition, issueDate FROM acceptedBooks");
%>
<table>
  <thead>
    <tr>
      <th>S.No</th>
      <th>Book Name</th>
      <th>Numbers</th>
      <th>Issue Date</th>
      <th>Fine (if any)</th>
    </tr>
  </thead>
  <tbody>
    <% 
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date currentDate = new Date();
    while(rs.next()) { 
      Date issueDate = sdf.parse(rs.getString("issueDate"));
      long diffInMillies = Math.abs(currentDate.getTime() - issueDate.getTime());
      long diff = diffInMillies / (1000 * 60 * 60 * 24);
      int fine = (diff > 15) ? (int)(diff - 15) : 0;
    %>
    <tr>
      <td><%= rs.getInt("BookID") %></td>
      <td><%= rs.getString("BookName") %></td>
      <td><%= rs.getInt("Edition") %></td>
      <td><%= rs.getString("issueDate") %></td>
      <td><%= (fine > 0) ? "Fine for " + fine + " days" : "No fine" %></td>
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
<script>
function showAddBookForm() {
  // Functionality to show the add book form
  alert("Add Book form functionality goes here.");
}

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
