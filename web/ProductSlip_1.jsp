<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
    Document   : cart
    Created on : 9 Aug, 2020, 9:38:05 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
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
            font-family:  'Poppins', sans-serif;;
            padding: 5px 665px;
            
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
        <script>
             window.onload = function(){
                 document.getElementById("download").addEventListener("click",()=>{
                     const invoice = this.document.getElementById("invoice");
                     console.log(invoice);
                     console.log(window);
                     var opt={
                         margin : 1,
                         filename:'paymentslip.pdf',
                         html2canvas:{scale:2},
                         jsPDF:{unit:'in',format:'letter',orientation:'portrait'}
                     };
                     html2pdf().from(invoice).set(opt).save(); 
                 })
             }
        </script>
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
        
        <%!// This below code will print the output that is contents of cart in table format 
       int total=0;
            int Quantity=0;
        %>
        <button id="download" class="button button1">Download Invoice</button>
        <div id="invoice">
       <%
            
           Class.forName("com.mysql.jdbc.Driver");
           Connection c = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
           PreparedStatement ps = c.prepareCall("select * from cart where username=?");
           ps.setString(1,name);
           ResultSet rs = ps.executeQuery(); 
           %>
           
           <br>
           <br>
           <table align="center">
               <th  colspan="3" style="font-size: 20px">Build Your Pc</th>
               <tr>
                   <td>Build Your PC inc<br>123  Laminton Road <br> Mumbai(W) <br>400096</td>
                   <td>INVOICE<br><b><%= (new java.util.Date()).toLocaleString()%></b></td>
                   
               </tr>
               <tr>
                   <td colspan="3">________________________________________________________________________________________________________</td>
               </tr>
               <tr>
                   <td>Bill To <b><%=name%>
            <%
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
            PreparedStatement ps2 = c2.prepareCall("select * from register where username=?");
            ps2.setString(1,name);
            ResultSet rs2 = ps2.executeQuery(); 
            while(rs2.next())
            {

                out.print(rs2.getString(4));%></b><br>
                <b><%out.print(rs2.getString(5));%></b></td><%

            }
           
            %>
               </tr>
           </table>
           <table align="center" border="1">
               
               <th>Product</th>
               <th>Name</th>
               <th>Price</th>
              
              
           <%
           while(rs.next())
           {    // in <a> href we pass PID and in rs.getString(2)--> name of product
           %>   
               <tr>
                   <td><img src="http://drive.google.com/uc?export=view&id=<%=rs.getString(5)%>"></td>
                   <td><%=rs.getString(2)%></td>
                   <td>₹ <%=rs.getString(3)%></td>
                   
               </tr>
               <tr>
               
           </tr>
           <% }
           PreparedStatement ps1 = c.prepareCall("select * from cart");
           ResultSet rs1 = ps1.executeQuery(); 
           while(rs1.next())
           {
               PreparedStatement ps3 = c.prepareCall("update cart set P_Quantity=? where P_id=?;");
               ps3.setString(1,Integer.parseInt(rs1.getString(4))-Integer.parseInt(rs1.getString(8))+"");
               ps3.setString(2,rs1.getString(1));
               total = total + Integer.parseInt(rs1.getString(3).trim())*Integer.parseInt(rs1.getString(8).trim());  // Fethches all the Prices from cart as we require total of all cart products
//               Quantity = Integer.parseInt(request.getParameter("Quant"));
               ps3.executeUpdate();
           }
           rs.close();
           rs1.close();

           PreparedStatement ps4 = c.prepareCall("select * from cart");
           ResultSet rs4 = ps4.executeQuery();
           while(rs4.next())
           {
                PreparedStatement ps5 = c.prepareCall("update products set Product_Quantity=? where Product_ID=?;");
                ps5.setString(1,rs4.getString(4));
                ps5.setString(2,rs4.getString(1));
                ps5.executeUpdate();
           }
           rs4.close();
           %>
           
            
           <tr>
               <td></td>
               <td>Total</td>
               <td>₹ <%=total%></td>
               
               <%
               total = 0;
               Quantity = 0;    
               PreparedStatement ps5 = c.prepareCall("delete from cart");
               ps5.executeUpdate();
               

            c.close();
            ps.close();
            rs.close();
//            c1.close();
            ps1.close();
            rs1.close(); 
            c2.close();
            ps2.close();
            rs2.close();
            ps4.close();
            rs4.close();
            ps5.close();
//            rs5.close();
               %>
               
           </tr>
              
                </form>
           </td> 
           </table>
           <table align="center">
               <tr>
               <td>Thankyou for Your Business</td>
               </tr>
               <tr>
                   <td>Term & Conditions <br>Payment Mode : Cash on Delivery</td>
               </tr>
               <tr>
            <a href="Products_1.jsp"><button id="download" class="button button1">Back</button></a>
           </tr> 
           </table>
              
           </div>
    </body> 
</html>
<%val = 0;%>