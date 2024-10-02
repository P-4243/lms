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

@WebServlet("/ReturnBookServlet")
public class ReturnBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();

            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sunita", "root", "Onetwothree123");

            // Retrieve the book name from request parameters
            String bookName = request.getParameter("bookName");

            // Prepare and execute SQL query to check the presence of the book in the database
            PreparedStatement checkStatement = con.prepareStatement("SELECT COUNT(*) FROM books WHERE book_name = ?");
            checkStatement.setString(1, bookName);
            ResultSet resultSet = checkStatement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);
            checkStatement.close();

            if (count > 0) {
                // Update the existing book's edition count
                PreparedStatement updateStatement = con.prepareStatement("UPDATE books SET edition = edition + 1 WHERE book_name = ?");
                updateStatement.setString(1, bookName);
                updateStatement.executeUpdate();
                updateStatement.close();

                // Redirect to welcome.jsp with success message
                response.sendRedirect("welcome.jsp?message=Book returned successfully!");
            } else {
                // Redirect to welcome.jsp with error message if the book is not found
                response.sendRedirect("welcome.jsp?message=Book not found in the database!");
            }

            resultSet.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing operation");
        }
    }
}
