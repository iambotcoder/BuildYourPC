<%-- 
    Document   : Deleteproduct2
    Created on : 27 Oct, 2020, 8:50:44 PM
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
              try
              {
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/tyitcd","root","");
                   PreparedStatement ps1 = c1.prepareStatement("delete from products where Product_ID=?");
                   ps1.setString(1,request.getParameter("ProductId"));
                   ps1.executeUpdate();
                   c1.close();
                   ps1.close();
                   
                   response.sendRedirect("ShowProduct_1.jsp");
              }
              catch(Exception e)
              {
                  out.print(e);
              }
                   
          %>
    </body>
</html>
