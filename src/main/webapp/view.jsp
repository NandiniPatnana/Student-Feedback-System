<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String fname = request.getParameter("fname");
%>

<h2>Feedback for: <%= fname %></h2>

<table border="1" cellpadding="8" cellspacing="0">
<tr style="background:lightgreen; font-weight:bold;">
    <td>Student</td>
    <td>Department</td>
    <td>Faculty</td>
    <td>Q1</td>
    <td>Q2</td>
    <td>Q3</td>
    <td>Q4</td>
    <td>Comments</td>
</tr>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
      "jdbc:mysql://localhost:3306/feedback",
      "root",
      "nandu?15"
    );

    PreparedStatement ps = con.prepareStatement(
      "SELECT * FROM feedback WHERE faculty=?"
    );
    ps.setString(1, fname);
    ResultSet rs = ps.executeQuery();

    while(rs.next()){
%>

<tr>
    <td><%= rs.getString(1) %></td>
     <td><%= rs.getString(2) %></td>
    <td><%= rs.getString(3) %></td>
    <td><%= rs.getString(4) %></td>
    <td><%= rs.getString(5) %></td>
    <td><%= rs.getString(6) %></td>
    <td><%= rs.getString(7) %></td>
    <td><%= rs.getString(8) %></td>
</tr>

<%
    }

    con.close();
}
catch(Exception e){
    out.println(e);
}
%>

</table>