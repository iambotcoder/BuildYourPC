<%-- 
    Document   : Deleteproduct
    Created on : 27 Oct, 2020, 8:42:50 PM
    Author     : abc
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                border: solid 2px;

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
          <a href="Searchproduct_1.jsp" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-search"></i></a>
          <a href="ShowProduct_1.jsp" class="w3-bar-item w3-button" style=" font-size: 20px">Products</a>
          <a href="Addproduct_1.html" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-plus"></i></a>   
          <a href="Editproduct_1.html" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-edit"></i></a>   
          <a href="Deleteproduct_1.jsp" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-trash"></i></a> 
     
       
        <!-- Page Content -->
        <div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>

        
        
         <form action="Deleteproduct2_1.jsp">
        
        <div>
           
          <div class="w3-container">
            <center><h1>Delete Products </h1></center>
            <!-- Table  -->
            <table border="1" style=" width:600px; text-align: center">
                <tr>
                <td colspan="2">
                   Select Product Id 
                    <select name="ProductId" required>
                        <option>Select Id</option>
                        <%! String val="";%>
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/tyitcd","root","");
                            PreparedStatement ps = c.prepareStatement("select * from products");
                            ResultSet rs = ps.executeQuery();
                            while(rs.next())
                            {

                        %>  
                        <option><%=rs.getString(1)%></option><!-- DropDown List for my Product Id -->
                        <% }
                            rs.close();
                            ps.close();
                            c.close();
                        %>
                    </select>
                    </td>
                    </tr>
                
                <input type="submit" name="Delete" value="Delete">
                <input type="submit" name="Cancel" value="Cancel">
                
            </table>
          </div>
        </div>
       
     </form>
    </body>
</html>
  