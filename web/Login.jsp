
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
       <%
           try
           {
            String dbname="",dbpassword="";
            String name = request.getParameter("username");//username fetched from Login.html
            String password = request.getParameter("password");
            
            if(name.equals("") && password.equals("")) //when username and password is blank
            {
             %>
             <script>alert("Enter Username and Password");</script>
             <jsp:include page="Login.html" flush="true"/>
             <%
                
            }
            else
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost/TYITCD","root","");
                PreparedStatement ps = c.prepareStatement("select username,password from register where username = ?");
                ps.setString(1,name);                   //Placeholder
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    dbname = rs.getString(1);       //takes username
                    dbpassword = rs.getString(2);   //takes pass
                }
                rs.close();
                ps.close();
                c.close();
            }
            if((dbname.equals(name)) && (dbpassword.equals(password))) // matching with password
            {
                String sessionid = session.getId(); // session id 
                session.setAttribute("user",name); // here username is stored so he can  be authenticated in other pages
                //session.setAttribute("session", sessionid);
                Cookie ck = new Cookie("sessionid",sessionid);
                response.addCookie(ck);
                response.sendRedirect("Products_1.jsp");
            }
            else
            {
               %>
               <script>alert("Invalid Username or Password")</script>
               <jsp:include page="Login.html"/>
               <%
            }
           }
           catch(Exception e)
           {
              out.print(e);
           }
       %>
     
           
       </form>
    </body>
</html>
