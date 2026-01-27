<%-- 
    Document   : user
    Created on : Jan 26, 2026, 10:17:57 PM
    Author     : ADMIN
--%>

<%@page import="models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO) session.getAttribute("USER");
            if(user == null || !"US".equals(user.getRoleID())){               
                response.sendRedirect("login.jsp");
                return;
            }
            String name = "";
            if(user != null) name = user.getFullName();
        %>
        <h1>Welcome, user <%=name%> </h1>
        
    </body>
</html>
