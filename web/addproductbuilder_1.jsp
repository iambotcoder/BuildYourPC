<%-- 
    Document   : addproductbuilder.jsp
    Created on : 7 Feb, 2021, 6:52:25 PM
    Author     : abc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%!
        // this code will add the product in cart
         String P_id = "",name="",price="",Type = "";
         int val=0;
         
        %>
        <%
           
            try
            {
                   P_id = request.getParameter("PID"); // PID is Transferred via Query 
                   
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection c = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                   PreparedStatement ps = c.prepareCall("select * from products where Product_ID=?");
                   ps.setString(1,P_id);          
                   ResultSet rs = ps.executeQuery();
                   while(rs.next())
                   {
                       P_id = (rs.getString(1));
                       Type = (rs.getString(2));
                       name = (rs.getString(4));
                       price = (rs.getString(5)); 
                       
                       out.print(P_id + "<br>");
                       out.print(Type + "<br>");
                       out.print(name + "<br>");
                       out.print(price + "<br>");                     
                   }
                   
                   ps.close();
                   c.close();
                   response.sendRedirect("addproductbuilder2_1.jsp?pid="+P_id+"&Type="+Type+"&name="+name+"&price="+price);
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
            }
        %>
         

