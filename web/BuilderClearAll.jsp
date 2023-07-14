<%-- 
    Document   : BuilderClearAll
    Created on : 24 Feb, 2021, 9:46:59 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
            PreparedStatement ps2 = c2.prepareStatement("DELETE FROM productbuilder;");
            ps2.executeUpdate();
            ps2.close();
            c2.close();
            
            response.sendRedirect("Builder_1.jsp");
        %>
    </body>
</html>
