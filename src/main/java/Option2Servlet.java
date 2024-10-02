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
public class Option2Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();

            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sunita", "root", "Onetwothree123");

            // Retrieve values from request parameters
            String bookname = request.getParameter("txtBookName");
            int Edition = Integer.parseInt(request.getParameter("txtEdition"));


            // Prepare and execute SQL query to check presence of uname in title table
            PreparedStatement checkStatement = con.prepareStatement("SELECT COUNT(*) FROM books WHERE book_name= ?");
            checkStatement.setString(1,bookname);
            ResultSet resultSet = checkStatement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);
            checkStatement.close();

            if (count > 0) {
                // Update the existing row with bookname and department
            	PreparedStatement updateStatement = con.prepareStatement("UPDATE books SET edition = edition + ? WHERE book_name = ?");
            	updateStatement.setInt(1, Edition); // Assuming Edition is an integer value
            	updateStatement.setString(2, bookname);
            	updateStatement.executeUpdate();


                // Redirect to welcome.jsp
                response.sendRedirect("welcome.jsp");
            } else {
                // Set a message to indicate that the student is not registered in the college database
            	PreparedStatement insertStatement = con.prepareStatement("INSERT INTO books (book_name, edition) VALUES (?, ?)");
            	insertStatement.setString(1, bookname);
            	insertStatement.setInt(2, Edition);
            	insertStatement.executeUpdate();
            	insertStatement.close();


                // Forward the request to SLogin.jsp to display the message
                request.getRequestDispatcher("welcome.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing operation");
        }
    }
}
