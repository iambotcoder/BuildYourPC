<%-- 
    Document   : addproductbuilder2
    Created on : 12 Feb, 2021, 9:35:32 PM
    Author     : abc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%! String P_id = "",name="",price="",Type = ""; 
         int val=0;
         
        %>
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
            P_id = request.getParameter("pid");
            /*out.print(request.getParameter("Type"));
            out.print(request.getParameter("price"));
            out.print(request.getParameter("name"));
            
            out.print(P_id);*/
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
            PreparedStatement ps1 = c1.prepareCall("insert into productbuilder values(?,?,?,?);");
            ps1.setString(1,request.getParameter("pid"));
            ps1.setString(2,request.getParameter("name"));
            ps1.setString(3,request.getParameter("price"));
            ps1.setString(4,request.getParameter("Type"));
            ps1.executeUpdate();
            ps1.close();
            c1.close();
            }
            catch(Exception e)
            {
                //out.print(e);
                if((e.toString()).startsWith("com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException:"))
                {
                    %>
                    <script>alert("Already added")</script>
                    <%
                    out.print(e);
                }
                out.print(e);
            }

            response.sendRedirect("Builder_1.jsp");
        %>
    </body>
</html>
