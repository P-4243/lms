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

/**
 * Servlet implementation class LoginServlet
 */

public class SLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
    
    public LoginServlet() {
    super();
    // TODO Auto-generated constructor stub
}
*/
/**
 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	response.getWriter().append("Served at: ").append(request.getContextPath());
} */

/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	//doGet(request, response);
	try {
        PrintWriter out = response.getWriter();

        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Establish a connection to the database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sunita", "root", "Onetwothree123");

        // Get user input from the request
        String username = request.getParameter("txtName");
        String password = request.getParameter("txtPwd");

        // Create a PreparedStatement to check if the username and password exist in the database
        PreparedStatement ps = con.prepareStatement("SELECT uname FROM login WHERE uname=? AND password=?");
        ps.setString(1, username);
        ps.setString(2, password);  // Note: In a real-world application, store hashed passwords instead of plain text

        // Execute the PreparedStatement to fetch data
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            // Username and password match, redirect to welcome.jsp
            RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
            rd.forward(request, response);
        } else {
            // Username and password do not match, redirect to register.jsp
            out.println("<font color='red'>Invalid username or password!<br>");
            out.println("<a href='SRegister.jsp'>Register Now</a>");
        }

        // Close the ResultSet, PreparedStatement, and Connection
        rs.close();
        ps.close();
        con.close();

    }  catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}

