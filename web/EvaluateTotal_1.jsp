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
         int val=0,i=1;
         boolean flag=true;
         
        %>
        <%
           
            try
            {
//               String PID = request.getParameter("PID"); // PID is Transferred via Query 
//               String P_id = session.getAttribute("P_id").toString();
//               if(P_id.equals(PID))
//               {
//                   String P_desname = session.getAttribute("P_desname").toString(); //This Attributes were set in  Product detials.jsp
//                   String P_price = session.getAttribute("P_price").toString();
//                   String P_Quantity = session.getAttribute("P_Quantity").toString();
//                   String img_name = session.getAttribute("img_name").toString();
                  
                   int len = Integer.parseInt(request.getParameter("length"));
                   String P_id=" ",P_desname=" ",P_price=" ",P_Quantity=" ",img_name=" ";    
                            
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection c = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                   Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                   PreparedStatement ps = c.prepareStatement("select * from cart");
//                   ps.setString(1,PID);
                   ResultSet rs = ps.executeQuery();
                   while(rs.next())
                   {
//                       if(i>=len)
//                            break;
                       
                        PreparedStatement ps1 = c1.prepareCall("update cart set P_Rquantity=? where P_id=?;");
//                        out.print(Integer.parseInt(request.getParameter("cartProduct"+i)) + " <br> " + Integer.parseInt(rs.getString(4)));
                        if(Integer.parseInt(request.getParameter("cartProduct"+i))>Integer.parseInt(rs.getString(4)))
                        {
                            flag=false;
                            break;
                        }
                        else
                        {
                            ps1.setString(1,request.getParameter("cartProduct"+i));
                            ps1.setString(2,rs.getString(1));

    //                       out.print(request.getParameter("cartProduct"+i) + " " + rs.getString(1)); 
                            i++;
                            ps1.executeUpdate();
    //                      
                        }
                          ps1.close();
//                          c.close();
//                        P_id = rs.getString(1);
//                        P_desname = rs.getString(4);
//                        P_price = rs.getString(5);
//                        P_Quantity = rs.getString(6);        
//                        img_name = rs.getString(7);
                       
                   }
                   rs.close();
                   ps.close();
                   c1.close();
                   c.close();
                   /* out.print(P_desname);
                   out.print(P_price);
                   out.print(P_Quantity);
                   out.print(img_name);*/
                   
                   
//                   ps1.setString(3,P_price);
//                   ps1.setString(4,P_Quantity);
//                   ps1.setString(5,img_name);
//                   ps1.setString(6,name);   
//                   ps1.setString(7,"true");
                   
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
            if(flag)
            {
                response.sendRedirect("cart2_1.jsp");
            }
            else
            {
                response.sendRedirect("cart2_1.jsp?message=Quantity Exceed Availibility");
            }
        %>
         
    </body> 
</html>
<%val = 0;i=1;flag=true;%>