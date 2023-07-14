<%-- 
    Document   : Addproduct
    Created on : 25 Oct, 2020, 3:46:30 PM
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
            if(request.getParameter("Add")!=null)
            {
                String ProductId = request.getParameter("ProductId");
                String ProductType = request.getParameter("ProductType");
                String ProductBrand = request.getParameter("ProductBrand");
                String ProductName = request.getParameter("ProductName");
                String ProductImage = request.getParameter("ProductImage");
                String ProductPrice = request.getParameter("ProductPrice");
                String ProductQuantity = request.getParameter("ProductQuantity");
                String ProductDetails = request.getParameter("ProductDetails");
              
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/tyitcd","root","");
            PreparedStatement ps = c.prepareStatement("insert into products values(?,?,?,?,?,?,?,?)");
            ps.setString(1,ProductId);
            ps.setString(2,ProductType);
            ps.setString(3,ProductBrand);
            ps.setString(4,ProductName);
            ps.setString(5,ProductPrice);
            ps.setString(6,ProductQuantity);
            ps.setString(7,ProductImage);
            ps.setString(8,ProductDetails);            
            ps.executeUpdate();
            %>
            <!--<script>alert("Product Added Successfully");</script>-->
            <%
            ps.close();
            c.close();
            %>
            <%--<jsp:include page="Addproduct.html" flush="true"></jsp:include>--%>
            <%
            }
            if(request.getParameter("Cancel")!=null)
            {
                response.sendRedirect("Addproduct_1.html");
            }
            else
            {
                 response.sendRedirect("Addproduct_1.html");
            }
            
        %>
   </body>
</html>
