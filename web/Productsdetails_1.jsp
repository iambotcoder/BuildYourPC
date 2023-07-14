<%-- 
    Document   : Productsdetails
    Created on : 24 Aug, 2020, 9:02:15 PM
    Author     : abc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Products | BuildYourPC</title>
        <link rel="stylesheet" href="style.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600;700&display=swap" rel="stylesheet">
        <style>
           
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

         <%
                Cookie[] ck = request.getCookies();
                String pastsessionid = ck[0].getValue(); // login page session id retrieing using jsp
                String presentsessionid = session.getId(); // present page session id\
                if(pastsessionid.equals(presentsessionid))
                {
                    String name = session.getAttribute("user").toString();
                   
                }
                else
                {
                    response.sendRedirect("Login.html");
                }
            %>
        
   <div class="header">
       <div class="container">
            <div class="navbar">
            <div class="logo">
               
            </div>
            <nav>
                <ul>
                    <li><a href="IntroPage.jsp">Home</a></li>
                    <li><a href="Products_1.jsp">Products</a></li>
                    <li><a href="">About</a></li>
                    <li><a href="">Contact</a></li>
                    <li><a href="Logout.jsp">Logout</a></li>
                </ul>
            </nav>
                <a href="cart.jsp"><img src="cart.png" width="30px" height="30px"></a>
        </div>
        
            <%! String PID="",P_id="",P_brand="",P_Type="",P_desname="",img_name="",P_price="",P_Quantity="",P_details="";%>
            <%! String[] product= {};%>
            <%! int Count = 0;%>

        <%
            try
            {
            PID = request.getParameter("PID");
//            out.print(PID); 
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
            PreparedStatement ps = c.prepareStatement("select * from products");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                P_id = (rs.getString(1));
//                out.print(P_id + "<br>");
                if(PID.equals(P_id))
                {
                    P_Type = (rs.getString(2));    
                    P_brand = (rs.getString(3));
                    P_desname = (rs.getString(4));
                    P_price = (rs.getString(5));
                    P_Quantity   = (rs.getString(6));
                    P_details = (rs.getString(8));
                    img_name  = (rs.getString(7));
////                    P_details= (rs.getString(8));
////                session.setAttribute("P_id",P_id);
////                session.setAttribute("P_desname",P_desname);  //This attribute is fetched from next page cart.jsp
////                session.setAttribute("P_price",P_price);
////                session.setAttribute("P_Quantity",P_Quantity);
////                session.setAttribute("img_name",img_name);  
                }     
             }
//            out.print(img_name);
//               
                product = P_details.split(",");
//                
            }
            catch(Exception e)
            {
                out.print(e);
            }
            
        %>
   
           
        </div>
    </div> 
    <!------single Product Details ------->
    <form action="cart_1.jsp">
    <div class="small-container single-product">
        <div class="row">
            <div class="col-2">
                
                <!--https://drive.google.com/file/d//view?usp=drive_link-->
                <img src="http://drive.google.com/uc?export=view&id=<%=img_name%>"  style=" height: 400px; width: auto">
            </div>
            <div class="col-2">
                <h2><%=P_desname%></h2>
                <h4 style=" padding-bottom:20px">Product Details</h4>
                
                <table>
                    <tr>
                        <td><input type="text" name="PID" value="<%=PID%>" hidden="true"></td>
                    </tr>
                    <tr>
                        <td>Product Type &nbsp;&nbsp;&nbsp;</td>
                        <td><%=P_Type%></td>
                    </tr>
                    <tr>
                        <td> Product Brand&nbsp;&nbsp;&nbsp;</td>
                        <td><%=P_brand%></td>
                    </tr>
                    <tr>
                        <td>price &nbsp;&nbsp;&nbsp;</td>
                        <td>₹<%=P_price%></td>
                    </tr>
                    <tr>
                        <td>Quantity Available &nbsp;&nbsp;&nbsp;</td>
                        <td><%=P_Quantity%></td>
                    </tr>
                    <tr>
                        <td>Product Details</td>
                        <td>
                        <%
                            for(int i=0;i<2 && i<product.length;i++)
                            {
                                out.print(product[i]+"<br>");
                            }
//                            out.print(P_details);
                        %>
                        </td>
                        <!--<td><   /td>-->
                    </tr>
                    <tr>
                        <!--<td>Product Quantity</td>-->
                        <!--<td><input type="number" name="required_quantity"></td>-->
                    </tr>
                </table>
                
                <a class="btn" href="Products_1.jsp">Go back</a>
                <!--<a class="btn" >Add to Cart</a>-->
                <input type="submit" class="btn" value="Add to Cart">
                
                
            </div>
        </div>
    </div>
    </form>
   <div class="row-2">
  
        <!-- footer ---->
      <div class="footer">
          <div class="container">
              <div class="row">
                  <div class="footer-col-1">
                      <h3>Download our App</h3>
                  </div>
                  <div class="footer-col-2">
                      <h3>Kindly Visit</h3>
                  </div>
                  <div class="footer-col-3">
                      <ul>
                          <li>BLOGS</li>
                          <li>COupons</li>
                          <li>Return Policy</li>
                      </ul>
                  </div>
                  <div class="footer-col-4">
                      <ul>
                          <li>Facebook</li>
                          <li>Youtube</li>
                          <li>Twitter</li>
                      </ul>
                  </div> 
              </div>
          </div>
      </div>
  </div>

    
</body>
</html>
<%
    int count=0;
    ps.close();
    rs.close();
    c.close();
%>

     
        
    