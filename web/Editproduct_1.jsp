<%-- 
    Document   : Editproduct
    Created on : 26 Oct, 2020, 4:25:32 PM
    Author     : abc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> 
        <!-- Code for Side bar -->
        <!-- link for Css -->
         <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <!-- Code for Icons -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600;700&display=swap" rel="stylesheet">
        <style>
            *{
                font-family: 'Poppins', sans-serif;
            }
            table{
                margin-left: auto;
                margin-right: auto;
                border: solid 1px;
            }   
            th, td {
                padding: 15px;
            }   
        </style>
    <script>
        
        function w3_open() {
          document.getElementById("mySidebar").style.display = "block";
          document.getElementById("myOverlay").style.display = "block";
        }

        function w3_close() {
          document.getElementById("mySidebar").style.display = "none";
          document.getElementById("myOverlay").style.display = "none";
        }
    </script>
    </head>
    <body>
        
         <!-- Sidebar -->
      
          <a href="AdminHome_1.jsp" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-home"></i></a>
          <a href="ShowProduct_1.jsp" class="w3-bar-item w3-button" style=" font-size: 20px">Products</a>
          <a href="Searchproduct_1.jsp" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-search"></i></a>
          <a href="Addproduct_1.html" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-plus"></i></a>   
          <a href="Editproduct_1.html" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-edit"></i></a>   
          <a href="Deleteproduct_1.jsp" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-trash"></i></a> 
        </div>
       
        <!-- Page Content -->
        <div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>

        
        
         <form action="Editproduct2_1.jsp">
        
        <div>
           
          <div class="w3-container">
            <center><h1>Edit A product</h1></center>
            <!-- Table  -->
            <table border="1">
                <tr>
                <td colspan="2">
                    Enter Product Id 
                    <select name="ProductId" required>
                        <option><%=request.getParameter("ProductId")%></option>
         <%!
         String Message="",ProductId="",ProductType="",ProductBrand="",ProductName="",ProductImage="",ProductPrice="",ProductQuantity="",ProductDetails="";
         %>
        <%
            ProductId= request.getParameter("ProductId");
            Message = request.getParameter("message");
            Class.forName("com.mysql.jdbc.Driver");
            %>
            
            <%
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/tyitcd","root","");
            PreparedStatement ps = c.prepareStatement("select * from products");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
          %>
            <option><%=rs.getString(1)%></option><!-- DropDown List for my Product Id -->
                       
                        <% }
                        rs.close();//Here End of Prouduct Id DropDown List
                        ps.close();
                        c.close();
                        %>
                    </select>
                    </td>
                </tr>
                <% 
                 //Code to fetch other values from Database 
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/tyitcd","root","");
                  PreparedStatement ps1 = c1.prepareStatement("select * from products where Product_ID = ?");
                  ps1.setString(1,ProductId);
                  ResultSet rs1 = ps1.executeQuery();
                  while(rs1.next())
                  {
                    ProductType = rs1.getString(2); 
                    ProductBrand = rs1.getString(3);
                    ProductName = rs1.getString(4);                 
                    ProductPrice = rs1.getString(5);
                    ProductQuantity = rs1.getString(6);
                    ProductImage = rs1.getString(7);
                    ProductDetails = rs1.getString(8);
                  }
                  rs1.close();
//                  out.println(Message);
                 if(Message.length()>0)
                 {
//                     out.print("<h1>hello</h1>");
//                                   out.print("<script> alert("+ Message +");</script>");

                    out.print("<div class='alert alert-success alert-dismissible fade show' role='alert'><strong>" + Message + "</strong><button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button</div>");
                 }
                %>
                
       
                
                
                <%--<c:if test = "${Message.length>0}">--%>
                    <c:out value = "${Message}"/>
                <%--</c:if>--%>
                 <tr style="height: 120px;">
                    <td>
                        Enter Product Type <!-- DropDown List for my Product Type -->
                        <select name="ProductType" required>
                        <option><%=ProductType%></option>
                        <option>Processor</option>
                        <option>Ram</option>
                        <option>Case</option>
                        <option>Cpu Cooler</option>
                        <option>GPU</option>
                        <option>Storage</option>
                        <option>Power Supply</option>
                        
                        </select>
                            
                  </td>
                    <td> Enter Brand
                        <select name="ProductBrand" required>
                            <option><%=ProductBrand%></option>
                            <option>Ryzen</option>
                            <option>Intel</option>
                            <option>Asus</option>
                            <option>Gigabyte</option>
                            <option>Samsung</option>
                            <option>Logitech</option>
                            <option>MSI</option> 
                        </select>
                    </td>
                    
                </tr>
                
                <tr style="height: 120px;">
                    <td> Enter Product Name <input type="text" name="ProductName" required value="<%=ProductName%>"></td>
                    <td> Choose A Image <input type="text" name="ProductImage" required value="<%=ProductImage%>"></td>
                </tr>    
                <tr style="height: 120px;">
               
                <td> Enter Price <input type="text" name="ProductPrice" required value="<%=ProductPrice%>"></td>
                <td> Enter Quantity <input type="text" name="ProductQuantity" required value="<%=ProductQuantity%>"></td>
                </tr>
                <tr>
                    <td colspan="2"> Enter Other Details About Product <input type="text" name="ProductDetails" height="" size="50" value="<%=ProductDetails%>" required></td>
                </tr>
                <tr>
                    <input type="submit" name="Save" value="Save">
                    <input type="submit" name="Cancel" value="Cancel">
                </tr>
                
            </table>
                    
          </div>
        </div>
       <%
            rs1.close();
            ps1.close();
            c1.close();
       %>
     </form>
    </body>
</html>
  