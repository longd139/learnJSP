<%-- 
    Document   : login
    Created on : Jan 26, 2026, 9:27:41 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="MainController" method="POST">
            User ID: <input type="text" name="userID" required=""> <br>
            Password: <input type="password" name="password" required=""> <br>
            <input type="submit" name="action" value="Login">
            <input type="reset" value="Reset">
        </form>
        
    </body>
</html>
