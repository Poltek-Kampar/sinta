<%@ page import ="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sinta",
"sinta", "sinta");
Statement st = con.createStatement();
%>
