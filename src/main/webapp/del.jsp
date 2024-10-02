<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Issue and Delete Book</title>
<style>
body {
  background-color: black;
  background-image: url('https://i.pinimg.com/originals/67/dd/e0/67dde0fd61ddcea39df2be79f7d23ead.gif');
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center; 
}

h1 {
  text-align: center;
  color: white;
}

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
</head>
<body>

<h1>Issue and Delete a Book</h1>


<div id="deleteBookTable" style="margin-top: 50px;">
  <form action="DeleteBookServlet" method="post">
    <table>
      <tr>
        <td style="color: #ffffff;">Enter book name to delete:</td>
        <td><input type="text" name="txtDeleteBookName" required></td>
      </tr>
      <tr>
        <td><input type="submit" value="Delete"></td>
        <td><input type="reset"></td>
      </tr>
    </table>
  </form>
</div>

</body>
</html>
