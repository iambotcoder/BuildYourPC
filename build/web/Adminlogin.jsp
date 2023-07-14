    <%-- 
    Document   : AdminHome
    Created on : 24 Oct, 2020, 10:26:03 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if(request.getParameter("login")!= null)
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tyitcd","root","");
                PreparedStatement ps = con.prepareStatement("select * from adminregister");
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    if((rs.getString(1).equals(username))&& ((rs.getString(2).equals(password))))
                    {
                        response.sendRedirect("AdminHome_1.jsp");
                   }
                    else
                    {%>
                    <script>alert("Invalid Username or Password");</script>
                    <jsp:include flush="true" page="index.html"/>  
                   <% }
                }
                rs.close();
                ps.close();
                con.close();
                
                
            }
        %>
    </body>
</html>
