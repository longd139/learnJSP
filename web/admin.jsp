<%-- 
    Document   : admin
    Created on : Jan 26, 2026, 10:13:34 PM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO) session.getAttribute("USER");
            if(user == null || !"AD".equals(user.getRoleID())){
                
                response.sendRedirect("login.jsp");
                return;
            }
            String name = "";
            if (user != null) {
                name = user.getFullName();
            }

        %>
        <h1>Welcome, Admin <%=name%></h1>
        <h2>title</h2>
        <h2>Search user</h2>
        <form action="MainController">
            <%
                String find_key = (String) request.getParameter("keyword");
                if (find_key == null)
                    find_key = "";
            %>
            Find by name: <input type="text" name="keyword" placeholder="vd: Nguyen van a,..." value="<%=find_key%>">
            <input type="submit" name="action" value="Search">
        </form>


        <%

            List<UserDTO> list = (List) request.getAttribute("LIST_USER");
            if (list != null) {
                

        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>UserID</th>
                    <th>Fullname</th>
                    <th>RoleID</th>
                    <th>Password</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserDTO users : list) {
                    
                %>
                <tr>
                    <td><%=count++%></td>
                    <td><%=users.getUserID()%></td>
                    <td><%=users.getFullName()%></td>
                    <td><%=users.getRoleID()%></td>
                    <td><%=users.getPassword()%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>


        <%
            
        } else {
        
            String error_msg = (String) request.getAttribute("EMPTY_MSG");
            if (error_msg == null)
                error_msg = "";
        %>
        <h3><%= error_msg%></h3>
        <%
            }

        %>






    </body>
</html>
