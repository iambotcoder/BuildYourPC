    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : cart
    Created on : 9 Aug, 2020, 9:38:05 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600;700&display=swap" rel="stylesheet">
        <style>   
            
            
        <%
            String name="";
            Cookie[] ck = request.getCookies();
            String pastsessionid = ck[0].getValue(); // login page session id retrieing using jsp
            String presentsessionid = session.getId(); // present page session id\
            if(pastsessionid.equals(presentsessionid))
            {
                name = session.getAttribute("user").toString();

            }
            else
            {
                response.sendRedirect("Login.html");
            }
            
            // Css For table tag of cart
        %>    
            
            
            table {
            alignment-adjust: middle;   
            font-family:  'Poppins', sans-serif;;
            border-collapse: collapse;
            width: 90%;
          }
          td {
            border: 1px solid #dddddd;
            padding: 20px;
            
          }
          th{
              background-color: #000;
              color: #ffffff;
              text-align: left; 
              padding: 20px;
          }
          
          td img
          {
              height:200px;
              width:auto;
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
            background-color: #dddddd; 
            color: black; 
            border: 2px solid #000;
          }

          .button1:hover {
            background-color: #000;
            color: white;
          }
         
        
        </style>
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
   <%!
        // this code will add the product in cart
         String PID = "",Pname="",Pprice="",PQuantity = "";
         int val=0;
         
        %>
        <%
           
            try
            {
               String PID = request.getParameter("PID"); // PID is Transferred via Query 
//               String P_id = session.getAttribute("P_id").toString();
//               if(P_id.equals(PID))
//               {
//                   String P_desname = session.getAttribute("P_desname").toString(); //This Attributes were set in  Product detials.jsp
//                   String P_price = session.getAttribute("P_price").toString();
//                   String P_Quantity = session.getAttribute("P_Quantity").toString();
//                   String img_name = session.getAttribute("img_name").toString();
                  
                   
                   String P_id=" ",P_desname=" ",P_price=" ",P_Quantity=" ",img_name=" ";    
                            
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection c = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                   PreparedStatement ps = c.prepareStatement("select * from products where Product_ID=?");
                   ps.setString(1,PID);
                   ResultSet rs = ps.executeQuery();
                   while(rs.next())
                   {
                        P_id = rs.getString(1);
                        P_desname = rs.getString(4);
                        P_price = rs.getString(5);
                        P_Quantity = rs.getString(6);        
                        img_name = rs.getString(7);
                   }
                   /* out.print(P_desname);
                   out.print(P_price);
                   out.print(P_Quantity);
                   out.print(img_name);*/
                   Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                   PreparedStatement ps1 = c1.prepareCall("insert into cart values(?,?,?,?,?,?,?,?);");
                   ps1.setString(1,PID);
                   ps1.setString(2,P_desname);
                   ps1.setString(3,P_price);
                   ps1.setString(4,P_Quantity);
                   ps1.setString(5,img_name);
                   ps1.setString(6,name);   
                   ps1.setString(7,"true");
                   ps1.executeUpdate();
                   ps1.close();
                   c.close();
//               }
//               else
//               { // If this page is directly run by any user so he should login first hence if and else block is written
                
//               }
            }
            catch(Exception e)
            {
                //out.print(e);
                if((e.toString()).startsWith("com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException:"))
                {
                    %>
                    <script>alert("Already added")</script>
                    <%
//                    out.print(e);
                }
            }
        %>
         
        
        <%!// This below code will print the output that is contents of cart in table format 
       int total=0;
            int Quantity=0;
            int tableRowSize=0;
        %>
        <form action="EvaluateTotal_1.jsp">
       <%
            
           Class.forName("com.mysql.jdbc.Driver");
           Connection c = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
           PreparedStatement ps = c.prepareCall("select * from cart where username=?");
           ps.setString(1,name);
           ResultSet rs = ps.executeQuery(); 
//           out.print(rs.getRow());
           %>
           <br>
           <br>
           <table border="1" align="center">
               <th>Product</th>
               <th>Name</th>
               <th>Price</th>
              <th>Quantity</th>
              <!--<th></th>-->
           <%
           while(rs.next())
           {
               tableRowSize++;
               // in <a> href we pass PID and in rs.getString(2)--> name of product
           %>   
               <tr>
                   <td><img src="http://drive.google.com/uc?export=view&id=<%=rs.getString(5)%>"></td>
                   <td><a href="Productsdetails_1.jsp?PID="><%=rs.getString(2)%></a></td>
                   <td>₹ <%=Integer.parseInt(rs.getString(3).trim())*Integer.parseInt(rs.getString(8).trim())%></td>
                   <td><input type="number" name="cartProduct<%=tableRowSize%>" value="<%=rs.getString(8)%>"></td>
                   <%--<td><c:forEach begin="1" end="<%=Quantity%>" step="1"></c:forEach>
                   <select>
                       <option><%=++val%></option>
                   </select> --%>
                   <!--</td>-->
               </tr>
           <%}
           PreparedStatement ps1 = c.prepareCall("select * from cart");
           ResultSet rs1 = ps.executeQuery(); 
           while(rs1.next())
           {
               total = total + Integer.parseInt(rs1.getString(3).trim())*Integer.parseInt(rs1.getString(8).trim());  // Fethches all the Prices from cart as we require total of all cart products
               Quantity = Quantity + Integer.parseInt(rs1.getString(8).trim());
           }
           rs.close();
           rs1.close();
           %>
           
           <tr>
               <td></td>
               <td>Total</td>
               <td>₹ <%=total%></td>
              
               <td>
                   <!--<a href="cart2_1.jsp"><button class="button button1" style="padding: 10px; alignment-adjust: central;">Evaluate Total</button></a>-->
                   <input  class="button button1" type="submit" value="Evaluate Total" style="padding: 10px; alignment-adjust: central;">
               </td>
                
               <%
               total = 0;
               Quantity = 0;    
               %>
           </tr><input type="number" name="length" value="<%=tableRowSize%>" hidden>
           <td colspan="5">
               <a href="Products_1.jsp">Back</a>
               <a href="ProductSlip_1.jsp?Quant=1"> Order</a>        
           </td> 
           </table>
           
           </form>
    </body> 
</html>
<%val = 0;tableRowSize=0;%>