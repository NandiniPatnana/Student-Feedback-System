
import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.*;


@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {

    public void service(HttpServletRequest req, HttpServletResponse res)
    throws IOException, ServletException {

        String sname = req.getParameter("sname");
        String department = req.getParameter("department");

        String fname = req.getParameter("fname");
        String q1 = req.getParameter("q1");
        String q2 = req.getParameter("q2");
        String q3 = req.getParameter("q3");
        String q4 = req.getParameter("q4");
        String comments = req.getParameter("comments");

        PrintWriter out = res.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/feedback", 
                "root", 
                "nandu?15"
            );

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO feedback VALUES (?,?,?,?,?,?,?,?)"
            );

            ps.setString(1, sname);
            ps.setString(2, department);
            ps.setString(3, fname);
            ps.setString(4, q1);
            ps.setString(5, q2);
            ps.setString(6, q3);
            ps.setString(7, q4);
            ps.setString(8, comments);

            ps.executeUpdate();

            out.println("Feedback Submitted Successfully!");

            con.close();
        }
        catch(Exception e){
            out.println(e);
        }
    }
}