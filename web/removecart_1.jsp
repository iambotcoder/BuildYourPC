<%-- 
    Document   : removecart
    Created on : 22 Aug, 2020, 7:20:15 PM
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
        <script>
            if(!!window.performance && window.performance.navigation.type == 2)
            { 
                   window.location.reload(true);
                    object.reload(forcedReload);
                    window.location = window.location; 
            } 
        </script>

        <%
            try
            {
                int count = 0;
                String removeval = request.getParameter("removeval");//This data is coming from cart.jsp to specify which value to be removed
                String SourcePage = request.getParameter("page"); // pagerequest is From Home Page
                //out.print(removeval);
                request.getParameter("name");
                Class.forName("com.mysql.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                PreparedStatement ps = c.prepareStatement("select * from cart");
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    count = count + 1;
                }
                if((count == 0)&&(SourcePage.equals("HOME")))
                {%>
                   //Cart is Empty no remove button

                <% }
                else if(count == 1)
                {
                    PreparedStatement ps1 = c.prepareStatement("DELETE FROM cart;");
                    ps1.executeUpdate();
                    ps1.close();
                    response.sendRedirect("Products_1.jsp"); 
                }
                else
                {
                    PreparedStatement ps2 = c.prepareStatement("DELETE FROM cart WHERE P_id = ?;");
                    ps2.setString(1,removeval);
                    ps2.executeUpdate();
                    ps2.close();
                    response.sendRedirect("cart_1.jsp"); 
                }
                rs.close();
                ps.close();
                c.close();
            }
            catch(Exception e)
            {
                response.sendRedirect("Login_1.html");
            }
            

        %>
    </body>
</html>
