<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controladores.Conectar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar</title>
    </head>
    <body>
         
                <%
                    
        String usuario = "root";
        String password = "admin123";
        String url="jdbc:mysql://localhost:3306/Login";
        
        String Nombre=request.getParameter("Proveedor");
        
        Connection con=null;
        Statement stmt=null;
        ResultSet rs=null;
         
            try{
                
        Class.forName("com.mysql.cj.jdbc.Driver");
        con=DriverManager.getConnection(url, usuario, password);

        stmt=con.createStatement();
        stmt.executeUpdate("delete from user where nombreProv='"+Nombre+"'");
        request.getRequestDispatcher("tabla.jsp").forward(request, response);
        stmt.close();
        rs.close();
        con.close();
        }catch(Exception e){}   
        %>
    </body>
</html>
