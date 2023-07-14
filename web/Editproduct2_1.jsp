<%-- 
    Document   : Editproduct2
    Created on : 27 Oct, 2020, 1:17:40 PM
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
        <%! String ProductId =""; %>
        <%
             if(request.getParameter("Save")!=null)
            {
                /*if((request.getParameter("ProductId").equals("Select Id"))&&((request.getParameter("ProductType").equals("Select Product Type"))))
                {
                    out.print("<script>alert('Specify Valid Product Id and Product Type');</script>");
                    out.flush();
                    RequestDispatcher rp = request.getRequestDispatcher("Editproduct.jsp");
                    rp.include(request, response);
                  ---trial  Discard if not required-----
                   
                }*/
                ProductId = request.getParameter("ProductId");
                String ProductType = request.getParameter("ProductType");
                String ProductBrand = request.getParameter("ProductBrand");
                String ProductName = request.getParameter("ProductName");
                String ProductImage = request.getParameter("ProductImage");
                String ProductPrice = request.getParameter("ProductPrice");
                String ProductQuantity = request.getParameter("ProductQuantity");
                String ProductDetails = request.getParameter("ProductDetails");
                
               /* out.print(ProductId);
                out.print(ProductType);
                out.print(ProductBrand);
                out.print(ProductName);
                out.print(ProductImage);
                out.print(ProductPrice);
                out.print(ProductQuantity);
                out.print(ProductDetails);
                */
              
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/tyitcd","root","");
            PreparedStatement ps = c.prepareStatement("update products set Product_Type=?,Product_Brand=?,Product_name=?,Product_price=?,Product_quantity=?,Product_image=?,Product_details=? where Product_ID=?");                                      
            ps.setString(1,ProductType);
            ps.setString(2,ProductBrand);
            ps.setString(3,ProductName);
            ps.setString(4,ProductPrice);
            ps.setString(5,ProductQuantity);
            ps.setString(6,ProductImage);
            ps.setString(7,ProductDetails);
            ps.setString(8,ProductId);
            ps.executeUpdate();  // the 1 was printing form here ha ha !!
            %>
            <script>alert("Product Details Edited Successfully");</script>
            <%
            ps.close();
            c.close();
            }
             %>
             <%--<jsp:include flush="true" page="Editproduct_1.jsp"></jsp:include>--%>
            <%
            if(request.getParameter("Cancel")!=null)
            {
                response.sendRedirect("Editproduct_1.jsp");
            }
            else
            {%>
                
            
            <%    response.sendRedirect("Editproduct_1.jsp?ProductId="+ProductId+"&message=Product Details Edited Successfully");
            }
        %>
    </body>
</html>
