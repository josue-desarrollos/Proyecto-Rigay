<%-- 
    Document   : sesioncerr
    Created on : 10/03/2021, 02:25:13 PM
    Author     : josue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OPCIONES</title>
    </head>
    <body>
        <h1>Sesion!</h1>
         <%
         HttpSession sessions = request.getSession();
         sessions.invalidate();
         response.sendRedirect("login.jsp");
        %>
    </body>
</html>
