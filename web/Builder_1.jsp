
<%-- 
    Document   : IntroPage
    Created on : 23 Aug, 2020, 4:39:20 PM
    Author     : abc
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
        

          .button1:hover {
            background-color: #000;
            color: white;
          }
             table {
           
            font-family:  'Poppins', sans-serif;;
            border-collapse: collapse;
            width: 100%;
          }
          td {
            border: 1px solid #dddddd;
            padding-top:20px;
            padding-bottom:20px;
            text-align: center;
            
          }
          th{
              background-color: #000;
              color: #ffffff;
              padding: 20px;
          }
          .td3
          {
           padding-left: 40px;
           padding-right: 40px;
          }
          
          td img
          {
              height:200px;
              width:auto;
          }
         .button1 {
            font-family:  'Poppins', sans-serif;;
            padding: 0px 55px;
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
         .mainbutton
         {
            
              padding: 5px 295px;
         }
        
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BuildYourPc</title>
        <link rel="stylesheet" href="style.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600;700&display=swap" rel="stylesheet">
    </head>
<body>
    <div class="header">
       <div class="container">
            <div class="navbar">
            <div class="logo">
               
            </div>
            <nav>
                <ul>
                    <li><a href="IntroPage.jsp">Home</a></li>
                    <li><a href="">Products</a></li>
                    <li><a href="aboutus.html">About</a></li>
                    <li><a href="">Contact</a></li>
                    <li><a href="Login.html">Login</a></li>
                </ul>
            </nav>
            <img src="cart.png" width="30px" height="30px">
        </div>
       
        </div>
    </div> 
    
    <div class="footer1">
        <div class="footer1-col-1">
            <ul><li>SYSTEM BUILDER</li></ul> 
        </div>
    </div>
    
<br>
           <br>
           <table border="1" align="center">
               <th>Component</th> 
               <th>Choose</th>
               <th class="td3">Name</th>
              <th>Price</th>
              
              <tr>
               <td>Processor</td>
               
              <td>&nbsp;<a href="Builderproducts_1.jsp?product=Processor"><button class="button1">+</button></a></td>   
              <%! String pid1="",pid2="",pid3="",pid4="",pid5="",pid6="",pid7="",pid8="",pid9="";%> 
              <%
 
                Class.forName("com.mysql.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                PreparedStatement ps = c.prepareStatement("select * from productbuilder where Type=?");
                ps.setString(1,"Processor");
                ResultSet rs = ps.executeQuery(); 
                while(rs.next())
                {
                    pid1 = rs.getString(1);
                %>    
               <td><%=rs.getString(2)%></td>
               <td><%=rs.getString(3)%></td>
                 <td style=" text-align: center" colspan="5">   
                 </td>
                 <%}
                 c.close();
                 rs.close();
                 %>
           </tr>    
           <tr>
               <td>Ram</td>
               
              <td>&nbsp;<a href="Builderproducts_1.jsp?product=Ram"><button class="button1">+</button></a></td>   
               <%
 
                Class.forName("com.mysql.jdbc.Driver");
                Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                PreparedStatement ps1 = c1.prepareStatement("select * from productbuilder where Type=?");
                ps1.setString(1,"Ram");
                ResultSet rs1 = ps1.executeQuery(); 
                while(rs1.next())
                {
                    pid2 = rs1.getString(1);
                %>    
              
               <td><%=rs1.getString(2)%></td>
               <td><%=rs1.getString(3)%></td>
              
                
                
                 <td style=" text-align: center" colspan="5">   
                 </td>
                 <%}
                 c1.close();
                 rs1.close();%>
               
           </tr>
           <tr>
               <td>MotherBoard</td>
               
              <td>&nbsp;<a href="Builderproducts_1.jsp?product=MotherBoard"><button class="button1">+</button></a></td>   
               <%
 
                Class.forName("com.mysql.jdbc.Driver");
                Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                PreparedStatement ps2 = c2.prepareStatement("select * from productbuilder where Type=?");
                ps2.setString(1,"MotherBoard");
                ResultSet rs2 = ps2.executeQuery(); 
                while(rs2.next())
                {
                    pid3 = rs2.getString(1);
                %>    
              
               <td><%=rs2.getString(2)%></td>
               <td><%=rs2.getString(3)%></td>
              
                
                
                 <td style=" text-align: center" colspan="5">   
                 </td>
                 <%}
                 c2.close();
                 rs2.close();%>
               
           </tr>
           <tr>
               <td>Case</td>
               
              <td>&nbsp;<a href="Builderproducts_1.jsp?product=Case"><button class="button1">+</button></a></td>   
               <%
 
                Class.forName("com.mysql.jdbc.Driver");
                Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                PreparedStatement ps3 = c3.prepareStatement("select * from productbuilder where Type=?");
                ps3.setString(1,"Case");
                ResultSet rs3 = ps3.executeQuery(); 
                while(rs3.next())
                {
                    pid4 = rs3.getString(1);
                %>    
              
               <td><%=rs3.getString(2)%></td>
               <td><%=rs3.getString(3)%></td>
              
                
                
                 <td style=" text-align: center" colspan="5">   
                 </td>
                 <%}
                 c3.close();
                 rs3.close();%>
               
           </tr>
           <tr>
               <td>Cpu Cooler</td>
               
              <td>&nbsp;<a href="Builderproducts_1.jsp?product=Cpu Cooler"><button class="button1">+</button></a></td>   
               <%
 
                Class.forName("com.mysql.jdbc.Driver");
                Connection c4 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                PreparedStatement ps4 = c4.prepareStatement("select * from productbuilder where Type=?");
                ps4.setString(1,"Cpu Cooler");
                ResultSet rs4 = ps4.executeQuery(); 
                while(rs4.next())
                {
                    pid5 = rs4.getString(1);
                %>    
              
               <td><%=rs4.getString(2)%></td>
               <td><%=rs4.getString(3)%></td>
              
                
                
                 <td style=" text-align: center" colspan="5">   
                 </td>
                 <%}
                 c4.close();
                 rs4.close();%>
               
           </tr>
           <tr>
               <td>GPU</td>
               
              <td>&nbsp;<a href="Builderproducts_1.jsp?product=GPU"><button class="button1">+</button></a></td>   
               <%
 
                Class.forName("com.mysql.jdbc.Driver");
                Connection c5 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                PreparedStatement ps5 = c5.prepareStatement("select * from productbuilder where Type=?");
                ps5.setString(1,"GPU");
                ResultSet rs5 = ps5.executeQuery(); 
                while(rs5.next())
                {
                    pid6 = rs5.getString(1);
                %>    
              
               <td><%=rs5.getString(2)%></td>
               <td><%=rs5.getString(3)%></td>
              
                
                
                 <td style=" text-align: center" colspan="5">   
                 </td>
                 <%}
                 c5.close();
                 rs5.close();%>
            </tr>
            <tr>
               <td>Storage</td>
               
              <td>&nbsp;<a href="Builderproducts_1.jsp?product=Solid State Drive"><button class="button1">+</button></a></td>   
               <%
 
                Class.forName("com.mysql.jdbc.Driver");
                Connection c6 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                PreparedStatement ps6 = c6.prepareStatement("select * from productbuilder where Type=?");
                ps6.setString(1,"Solid State Drive");
                ResultSet rs6 = ps6.executeQuery(); 
                while(rs6.next())
                {
                    pid7 = rs6.getString(1);
                %>    
              
               <td><%=rs6.getString(2)%></td>
               <td><%=rs6.getString(3)%></td>
              
                
                
                 <td style=" text-align: center" colspan="5">   
                 </td>
                 <%}
                 c6.close();
                 rs6.close();%>
            </tr>
            <tr>
               <td>Power Supply</td>
               
              <td>&nbsp;<a href="Builderproducts_1.jsp?product=Power Supply"><button class="button1">+</button></a></td>   
               <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection c7 = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                PreparedStatement ps7 = c7.prepareStatement("select * from productbuilder where Type=?");
                ps7.setString(1,"Power Supply");
                ResultSet rs7 = ps7.executeQuery(); 
                while(rs7.next())
                {
                    pid8 = rs7.getString(1);
                %>    
              
               <td><%=rs7.getString(2)%></td>
               <td><%=rs7.getString(3)%></td>
              
                
                
                 <td style=" text-align: center" colspan="5">   
                 </td>
                 <%}
                 c7.close();
                 rs7.close();%>
            </tr>
           <td colspan="5">
                
           </td> 
           
           </table>
            <table>
                <tr>
                    <td><a href="TestBuilder_1.jsp?pid1=<%=pid1%>&pid2=<%=pid2%>&pid3=<%=pid3%>&pid4=<%=pid4%>&pid5=<%=pid5%>&pid6=<%=pid6%>&pid7=<%=pid7%>"><button class="mainbutton button1">Test</button></a></td>
                    <td><a href="BuilderClearAll.jsp"><button class="mainbutton button1">Clear</button></a></td>
                </tr>
            </table>          

</body>
<!--</html>-->

    <!-- footer  ---->
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

