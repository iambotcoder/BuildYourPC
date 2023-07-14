    <%-- 
    Document   : Productspagetrial
    Created on : 24 Aug, 2020, 11:14:26 AM
    Author     : abc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products page</title>
        <link rel="stylesheet" href="style.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600;700&display=swap" rel="stylesheet">
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
            try
            {
                
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
            }
            catch(Exception e)
            {
                response.sendRedirect("Login.html");    
            }
            
        %>
        
        
     <!-- products -->
  
        
         <div class="header">
       <div class="container">
            <div class="navbar">
            <div class="logo">
                <img src="" width="125px">
            </div>
            <nav>
                <ul>
                    <li><a href="IntroPage.jsp">Home</a></li>
                    <li><a href="Products_1.jsp">Products</a></li>
                    <li><a href="aboutus_1.html">About</a></li>
                    <li><a href="Contactus_1.html">Contact</a></li>
                    <li><a href="Logout_1.jsp">Logout</a></li>
                </ul>
            </nav>
                <a href="cart_1.jsp"><img src="cart.png" width="30px" height="30px"></a>
        </div>
        
        </div>
    </div> 
    
    <!---Products------>
<div class="row-1">
    <div class="small-container">
    <div class="row">
        
            
                <%!
                    String PID[] = new String[100];
                    String Pname[] = new String[100];
                    String ImgName[] = new String[100];
                    String Pprice[] = new String[100];
                    String Ptype[] = new String[100];
                    String PCategory[] = {"Processors","Ram","Solid State Drive","MotherBoard","Case","Cpu Cooler","GPU",""};
                    int j=0;// for bottom loop for each of JSTL
                %>
                 <%
               Class.forName("com.mysql.jdbc.Driver");
               Connection c = DriverManager.getConnection("jdbc:mysql://localhost/tyitcd","root","");
               PreparedStatement ps = c.prepareStatement("select * from products");
               ResultSet rs = ps.executeQuery();
               int i=0;//as it stores array position while fetching from database also used as length in Foreach Loop
               while(rs.next())
               {
                   // Fetch Values to be assigned
                   PID[i] = rs.getString(1);
                   Pname[i] = rs.getString(4);
                   ImgName[i] = rs.getString(7);
                   Pprice[i] = rs.getString(5);
                   Ptype[i] = rs.getString(2);
                   i++;
//                    pageContext.setAttribute("i",i,PageContext.SESSION_SCOPE); // values are added so Scriplet values can be 
//                    pageContext.setAttribute("j",j,PageContext.SESSION_SCOPE); // accessed using my JSTL Functions By EL
               }  
               for(int iterate=0;iterate<i;iterate++)
               {
                  
                  //out.print(Ptype[iterate].equals("Ram"));
                   
               }
//               out.print(i);
               %>
               <table>
                   <h2 class="title"><%=PCategory[0]%></h2>
                <tr>
                    <c:forEach begin="1" end="<%=i%>">
                        <c:if test="<%=Ptype[j].equals("Processor")%>">  
                            <td>
                             <div class="col-4" style="margin: 25px;"> 
                             <a href="Productsdetails_1.jsp?PID=<%=PID[j]%>"><img src="http://drive.google.com/uc?export=view&id=<%=ImgName[j]%>"></a>
                             <h4><%=Pname[j]%></h4>
                             <p>₹ <%=Pprice[j]%></p> 
                             </div>
                           </td>  
                        </c:if>
                        <%j++;%>
                              
                   </c:forEach>
                </tr>
               </table>
               <table>
                   <h2 class="title"><%=PCategory[1]%></h2>
                <tr>
                    <% j=0; %>
                    <c:forEach begin="1" end="<%=i%>">
                       <c:if test="<%=Ptype[j].equals("Ram")%>">
                                <td>
                             <div class="col-4" style="margin: 25px;"> 
                             <a href="Productsdetails_1.jsp?PID=<%=PID[j]%>"><img src="http://drive.google.com/uc?export=view&id=<%=ImgName[j]%>"></a>
                             <h4><%=Pname[j]%></h4>
                             <p>₹ <%=Pprice[j]%></p> 
                             </div>
                            </td>
                        </c:if>
                        <%j++;%>         
                   </c:forEach>
                </tr>
                <table>
                   <h2 class="title"><%=PCategory[2]%></h2>
                <tr>
                    <% j=0; %>
                    <c:forEach begin="1" end="<%=i%>">
                       <c:if test="<%=Ptype[j].equals("Solid State Drive")%>">
                                <td>
                             <div class="col-4" style="margin: 25px;"> 
                             <a href="Productsdetails_1.jsp?PID=<%=PID[j]%>"><img src="http://drive.google.com/uc?export=view&id=<%=ImgName[j]%>"></a>
                             <h4><%=Pname[j]%></h4>
                             <p>₹ <%=Pprice[j]%></p> 
                             </div>
                            </td>
                        </c:if>
                        <%j++;%>         
                   </c:forEach>
                </tr>  
                </table>
                <table>
                   <h2 class="title"><%=PCategory[3]%></h2>	
                <tr>
                    <%j=0;%>
                    <c:forEach begin="1" end="<%=i%>">
                       <c:if test="<%=Ptype[j].equals("MotherBoard")%>">
                                <td>
                             <div class="col-4" style="margin: 25px;"> 
                             <a href="Productsdetails_1.jsp?PID=<%=PID[j]%>"><img src="http://drive.google.com/uc?export=view&id=<%=ImgName[j]%>"></a>
                             <h4><%=Pname[j]%></h4>
                             <p>₹ <%=Pprice[j]%></p> 
                             </div>
                            </td>
                        </c:if>
                        <%j++;%>         
                   </c:forEach>
                </tr>
                </table>
                <table>
                   <h2 class="title"><%=PCategory[4]%></h2>
                <tr>
                    <%j=0;%>
                    <c:forEach begin="1" end="<%=i%>">
                       <c:if test="<%=Ptype[j].equals("Case")%>">
                                <td>
                             <div class="col-4" style="margin: 25px;"> 
                             <a href="Productsdetails_1.jsp?PID=<%=PID[j]%>"><img src="http://drive.google.com/uc?export=view&id=<%=ImgName[j]%>"></a>
                             <h4><%=Pname[j]%></h4>
                             <p>₹ <%=Pprice[j]%></p> 
                             </div>
                            </td>
                        </c:if>
                        <%j++;%>         
                   </c:forEach>
                </tr>  
                </table>
                <table>
                   <h2 class="title"><%=PCategory[5]%></h2>
                <tr>
                    <%j=0;%>
                    <c:forEach begin="1" end="<%=i%>">
                       <c:if test="<%=Ptype[j].equals("Cpu Cooler")%>">
                                <td>
                             <div class="col-4" style="margin: 25px;"> 
                             <a href="Productsdetails_1.jsp?PID=<%=PID[j]%>"><img src="http://drive.google.com/uc?export=view&id=<%=ImgName[j]%>"></a>
                             <h4><%=Pname[j]%></h4>
                             <p>₹ <%=Pprice[j]%></p> 
                             </div>
                            </td>
                        </c:if>
                        <%j++;%>         
                   </c:forEach>
                </tr>  
                </table>
                <table>
                   <h2 class="title"><%=PCategory[6]%></h2>
                <tr>
                    <%j=0;%>
                    <c:forEach begin="1" end="<%=i%>">
                       <c:if test="<%=Ptype[j].equals("GPU")%>">
                                <td>
                             <div class="col-4" style="margin: 25px;"> 
                             <a href="Productsdetails_1.jsp?PID=<%=PID[j]%>"><img src="http://drive.google.com/uc?export=view&id=<%=ImgName[j]%>"></a>
                             <h4><%=Pname[j]%></h4>
                             <p>₹ <%=Pprice[j]%></p> 
                             </div>
                            </td>
                        </c:if>
                        <%j++;%>         
                   </c:forEach>
                </tr>
               </table>
              
              
            
                 
    </div>
    </div>
</div>
             
    <% j=0; //AS j++ Array Out of Bound hence after end value to be zero for next refresh value to be zero 
        rs.close();
        ps.close();
        c.close();
    %>
    
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
      
    </body>
</html>
