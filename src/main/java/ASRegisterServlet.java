import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Option1Servlet")
public class ASRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();

            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sunita", "root", "Onetwothree123");

            // Retrieve values from request parameters
           // String bookname = request.getParameter("txtBookName");
           // int Edition = Integer.parseInt(request.getParameter("txtEdition"));


            // Prepare and execute SQL query to check presence of uname in title table
           // PreparedStatement checkStatement = con.prepareStatement("SELECT COUNT(*) FROM books WHERE book_name= ?");
            //PreparedStatement checkStatement.setString(1,bookname);
            //ResultSet resultSet = checkStatement.executeQuery();
            //resultSet.next();
            //int count = resultSet.getInt(1);
            //checkStatement.close();

           
                // Set a message to indicate that the student is not registered in the college database
            PreparedStatement selectStatement = con.prepareStatement("SELECT * FROM login");
            ResultSet resultSet = selectStatement.executeQuery();

            // Display table values
            while (resultSet.next()) {
                String Sname = resultSet.getString("uname");
                
                System.out.println("Name: " + Sname);
            }

            // Close resources
            resultSet.close();
            selectStatement.close();
            }

        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing operation");
        }
    }
}
