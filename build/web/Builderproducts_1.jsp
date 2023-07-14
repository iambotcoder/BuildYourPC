<%-- 
    Document   : Builderproducts
    Created on : 7 Feb, 2021, 6:38:12 PM
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
                margin-left: 60px;
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
   
    </head>
    <body>
        <br>
        <br>
       
        <%! String val=""; int i=0;%>
        
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/tyitcd","root","");
            PreparedStatement ps = c.prepareStatement("select * from products where Product_Type = ?");
            ps.setString(1,request.getParameter("product"));
            ResultSet rs = ps.executeQuery();
            %>
            
            <table border="1">
                <th colspan="12" style="font-size:20px">Products</th>
                <tr>
                    <td>&nbsp;Product Id&nbsp;</td>
                    <td>&nbsp;Product Type&nbsp;</td>
                    <td>&nbsp;Brand&nbsp;</td>
                    <td>&nbsp;Main Name&nbsp;</td>
                    <td>&nbsp;Price&nbsp;</td>
                    <td>&nbsp;Quantity&nbsp;</td>
                    <td>&nbsp;Image Name&nbsp;</td>
                    <td>&nbsp;Details&nbsp;</td>
                    
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
                <td>
                    <img src="http://drive.google.com/uc?export=view&id=<%=(rs.getString(7))%>" height="100px" width="100px" alt="Image">
                    <!--<img src="" >-->
                </td>
               <td>
               <c:forTokens var="items" delims=";" items="<%=(rs.getString(8))%>" >
                <c:out value="${items}"></c:out>
            </c:forTokens>
               </td>
               <td>
                 &nbsp;<a href="addproductbuilder_1.jsp?PID=<%=rs.getString(1)%>"><button style="padding: px; alignment-adjust: central;" class="w3-button w3-xlarge w3-black">+</button></a>
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
