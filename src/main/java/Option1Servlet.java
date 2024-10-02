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
public class Option1Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();

            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sunita", "root", "Onetwothree123");

            // Retrieve values from request parameters
            String studentname = request.getParameter("txtStudentName");
            String bookname = request.getParameter("txtBookName");
            String departname = request.getParameter("txtDepartment");

            // Prepare and execute SQL query to check presence of uname in title table
            PreparedStatement checkStatement = con.prepareStatement("SELECT COUNT(*) FROM detail WHERE uname = ?");
            checkStatement.setString(1, studentname);
            ResultSet resultSet = checkStatement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);
            checkStatement.close();

            if (count > 0) {
                // Update the existing row with bookname and department
                PreparedStatement updateStatement = con.prepareStatement("UPDATE detail SET bookname = ?, department = ? WHERE uname = ?");
                updateStatement.setString(1, bookname);
                updateStatement.setString(2, departname);
                updateStatement.setString(3, studentname);
                updateStatement.executeUpdate();

                // Redirect to welcome.jsp
                response.sendRedirect("welcome.jsp");
            } else {
                // Set a message to indicate that the student is not registered in the college database
                request.setAttribute("errorMessage", "Student is not registered in the college database.");

                // Forward the request to SLogin.jsp to display the message
                request.getRequestDispatcher("SLogin.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing operation");
        }
    }
}
