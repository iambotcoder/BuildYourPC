<%-- 
    Document   : AdminHome
    Created on : 25 Oct, 2020, 2:40:04 PM
    Author     : abc
--%>

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
         <link rel="stylesheet" href="style.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600;700&display=swap" rel="stylesheet">
        <style>
             *{
                font-family: 'Poppins', sans-serif;
            }
            table{
                border:none;
                margin-left: 60px;
                 border-spacing: 20px;
            }   
            th, td {
                padding: 10px;
            }   
            .tabledata{
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
        <div class="w3-sidebar w3-bar-block w3-animate-left" style="display:none;z-index:5" id="mySidebar">
          <button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>
          <a href="AdminHome_1.jsp" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-home"></i></a>
          <a href="ShowProduct_1.jsp" class="w3-bar-item w3-button" style=" font-size: 20px">Products</a>
          <a href="Searchproduct_1.jsp" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-search"></i></a>   
          <a href="Addproduct_1.html" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-plus"></i></a>     
          <a href="Editproduct_1.jsp" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-edit"></i></a>   
          <a href="#" class="w3-bar-item w3-button" style=" font-size: 30px"><i class="fa fa-trash"></i></a> 
        </div>

        <!-- Page Content -->
        <div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>

        <div>
          <button class="w3-button w3-white w3-xxlarge" onclick="w3_open()">&#9776;</button>
          <div class="w3-container" style=" background-color: #000">
              <center><b><p style="font-size: 35px; color: #fff">Admin Panel<p></b></center>
          </div>
          <div></div>
        </div>
        <div>
            <br><br><br><br>
            <table border="1">
                <tr>
                    <td class="tabledata"><a href="ShowProduct_1.jsp"><img src="List.jpg" height="200px" width="200px;"></a></td>
                    <td class="tabledata"><a href="Addproduct_1.html"><img src="Add.jpg" height="200px" width="200px;"></a></td>
                    <td class="tabledata"><a href="Editproduct_1.jsp"><img src="Edit.jpg" height="200px" width="200px;"></a></td>
                     <td class="tabledata"><a href="Searchproduct_1.jsp"><img src="Search.jpg" height="200px" width="200px;"></a></td>
                     <td class="tabledata"><a href=""><img src="Trash.jpg" height="200px" width="200px;"></a></td>
                </tr>
            </table>
            <br><br><br>
            </div>
        
            <!-- footer ---->
            <div style=" background-color: #000; color: #fff; font-weight: bold; padding:34px;">
            <div class="container" >
            <div class="row">
                <div class="footer-col-1">
                    <p style="color:#fff;font-size: 20px;">Build Your PC<p>
                    <p style="color:#dddddd">A complete Computer Solution store</p>
                    <p style="color:#dddddd"> .Build .Upgrade .Buy</p>
                </div>
                <div class="footer-col-2">
                    <p style="color:#fff">Contacts<br>022-111214210<br>BuildYourPC@gmail.com</p>
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

