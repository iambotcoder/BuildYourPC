<%-- 
    Document   : ShowProduct
    Created on : 25 Oct, 2020, 10:37:19 PM
    Author     : abc
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
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
                margin-left: 100px;
                margin-right: auto;
                border: solid 1px;
            }   
            th, td {
                padding: 15px;
            }   
            .button {
            font-family: cursive;
            padding: 15px 280px;
            text-align: center;
            display: inline-block;
            font-size: 16px;
            transition-duration: 0.4s;
            
          }

        .button1 {
            
            font-size:14px;
            background-color: #dddddd; 
            color: black; 
            border: 2px solid #000;
          }

          .button1:hover {
            background-color: #000;
            color: white;
          }
         .ibutton
         {
             font-size: 25px;
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
        <div class="w3-sidebar w3-bar-block w3-animate-left" style="display:none;z-index:5" id="mySidebar">
          <button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>
          <a href="AdminHome_1.jsp" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-home"></i></a>
          <a href="ShowProduct_1.jsp" class="w3-bar-item w3-button" style=" font-size: 20px">Products</a>
          <a href="Searchproduct_1.jsp" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-search"></i></a>
          <a href="Addproduct_1.html" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-plus"></i></a>         
          <a href="Editproduct_1.jsp" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-edit"></i></a>   
          <a href="Deleteproduct_1.jsp" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-trash"></i></a> 
        </div>
        
        <!-- Page Content -->
        <div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>

        <div>
          <button class="w3-button w3-white w3-xxlarge" onclick="w3_open()">&#9776;</button>
          <div class="w3-container">
          </div>
        </div>
        <%! String val="";%>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/tyitcd","root","");
            PreparedStatement ps = c.prepareStatement("select * from products");
            ResultSet rs = ps.executeQuery();
            %>
            <table border="1">
                <th colspan="12" style="font-size:20px">Products</th>
                <tr>
                    <td>&nbsp;Product Id&nbsp;</td>
                    <td>&nbsp;Product Type&nbsp;</td>
                    <td>&nbsp;Brand&nbsp;</td>
                    <td>&nbsp;Product Name&nbsp;</td>
                    <td>&nbsp;Price&nbsp;</td>
                    <td>&nbsp;Quantity&nbsp;</td>
                    <td>&nbsp;Image Name&nbsp;</td>
                    <td>&nbsp;Details&nbsp;</td>
                    <td><a href="Addproduct_1.html"><button class="button1 w3-button w3-xlarge w3-black">+</button></a></td>
                </tr>
           <%
            while(rs.next())
            {
               %>
               <tr>
                   <td><%=(rs.getString(1))%></td>
               <td><%=(rs.getString(2))%></td>
               <td><%=(rs.getString(3))%></td>
               <td><%=(rs.getString(4))%></td>
              
               <td><%=(rs.getString(5))%></td>
               
               <td><%=(rs.getString(6))%></td>
                <td><img src="http://drive.google.com/uc?export=view&id=<%=(rs.getString(7))%>" height="100px" width="100px" alt="Image"></td>
               
               <td>
               <c:forTokens var="items" delims=";" items="<%=(rs.getString(8))%>" >
                <c:out value="${items}"></c:out>
            </c:forTokens>
               </td>
               <td>
                   <a href="Editproduct_1.jsp?ProductId=<%=rs.getString(1)%>&message="><button class="button button1" style="padding: 10px; alignment-adjust: central;"><i class="fa fa-edit ibutton"></i></button></a><br>
                   <a href="Deleteproduct2_1.jsp?ProductId=<%=rs.getString(1)%>"><button class="button button1" style="padding: 10px; alignment-adjust: central; width:50px;"><i class="fa fa-trash ibutton"></i></button></a>                   
               </td>
            </tr>
            <% }
            %>
            </table>
            <%
            rs.close();
            ps.close();
            c.close();
        %>
       
            
             
       
    </body>
</html>
