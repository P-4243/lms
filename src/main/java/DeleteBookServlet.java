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
import java.sql.SQLException;

@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement deleteStatement = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sunita", "root", "Onetwothree123");

            // Retrieve values from request parameters
            String bookName = request.getParameter("txtDeleteBookName");

            // Prepare and execute SQL query to delete the book
            String deleteSQL = "DELETE FROM books WHERE book_name = ?";
            deleteStatement = con.prepareStatement(deleteSQL);
            deleteStatement.setString(1, bookName);
            int rowsAffected = deleteStatement.executeUpdate();

            // Check if the deletion was successful
            if (rowsAffected > 0) {
                out.println("Book '" + bookName + "' deleted successfully.");
            } else {
                out.println("Book '" + bookName + "' not found.");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing deletion");
        } finally {
            // Close resources
            try {
                if (deleteStatement != null) deleteStatement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
