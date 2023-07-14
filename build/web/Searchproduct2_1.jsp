<%-- 
    Document   : Deleteproduct2
    Created on : 27 Oct, 2020, 7:12:59 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .imagetable
            {
                position: absolute;
                top:250px;
                left:0px;
                border:none
            }
            .contenttable
            {
                position: absolute;
                top:280px;
                left:500px;
            }
        </style>
    </head>
    <body>
        <%! String imagename="";%>
        <%
            if(request.getParameter("Search")!=null)
            {
                try
                {
                %>
                <jsp:include flush="true" page="Searchproduct_1.jsp"></jsp:include>
                <%
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/tyitcd","root","");
                   PreparedStatement ps1 = c1.prepareStatement("select * from products where Product_ID=?");
                   ps1.setString(1,request.getParameter("ProductId"));
                   ResultSet rs1 = ps1.executeQuery();
                   %>
                   <table border="1" class="contenttable"> 
                       <th colspan="2"><big>Searched Product</big></th>
                   <tr>
                   </tr>
                  
                   <%
                   while(rs1.next())
                   {
                    %>
                    
                    
                    <tr>
                        <td>Product Id</td>
                        <td><%=rs1.getString(1)%></td>
                    </tr>
                    <tr>
                    <td>Product Name</td>
                    <td><%=rs1.getString(4)%></td>
                    </tr>
                    <tr>
                        <td>Product Type</td>
                        <td><%=rs1.getString(2)%></td>
                    </tr>
                    
                    <tr>
                        <td>Product Price</td>
                        <td><%=rs1.getString(5)%></td>
                    </tr>
                    <tr>
                        <td>Product Quantity</td>
                        <td><%=rs1.getString(6)%></td>
                    </tr>
                    <tr>
                        <td>Product Details</td>
                        <td><%=rs1.getString(8)%></td>
                    </tr>
                    
                    </table>
                   <table class="imagetable">
                
                       <tr>
                           <td><img src="http://drive.google.com/uc?export=view&id=<%=rs1.getString(7)%>" alt="ProductImage" height="400px" width="auto"</td>
                       </tr>
                   </table>
                    <%
                   }
                   %>
                   
                   <%
                  rs1.close();
                  ps1.close();
                  c1.close();
                }
                catch(Exception e)
                {
                    out.print(e);
                }
           }
           if(request.getParameter("Cancel")!=null)
           {
               response.sendRedirect("Searchproduct_1.jsp");
           }
        %>
    </body>
</html>
