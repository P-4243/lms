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

@WebServlet("/RegisterServlet")
public class ARegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sunita", "root", "Onetwothree123");

            // Get user input from the request
            String username = request.getParameter("txtName");
            String password = request.getParameter("txtPwd");
            String confirmPassword = request.getParameter("txtConfirmPwd");

            // Check if username already exists
            PreparedStatement checkStatement = con.prepareStatement("SELECT COUNT(*) FROM loginadmin WHERE uname = ?");
            checkStatement.setString(1, username);
            ResultSet resultSet = checkStatement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);
            checkStatement.close();

            if (!password.equals(confirmPassword)) {
                // Set attribute to indicate password mismatch
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Password mismatch');");
                out.println("location='ARegister.jsp';");
                out.println("</script>");
            } else if (count > 0) {
                // Set attribute to indicate username already exists
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Username already exists');");
                out.println("location='ARegister.jsp';");
                out.println("</script>");
            } else {
                // Insert user data into the database
                PreparedStatement insertStatement = con.prepareStatement("INSERT INTO loginadmin (uname, password) VALUES (?, ?)");
                insertStatement.setString(1, username);
                insertStatement.setString(2, password);  // Note: In a real-world application, store hashed passwords instead of plain text
                insertStatement.executeUpdate();
                insertStatement.close();

                // Redirect to login page
                response.sendRedirect("ALogin.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Internal server error. Please try again later.');");
            out.println("location='ARegister.jsp';");
            out.println("</script>");
        }
    }
}
