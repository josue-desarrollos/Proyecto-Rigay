<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Controladores.Conectar"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Query</title>
    </head>
    <body background=./imagen/imgf3.jpg>
        <h1 align="center">Lista de Inventario</h1> 
        <table border="2" width="600" align="center">
            <tr bgcolor="orange">
                <th colspan="5"> Lista y acciones</th>
                <th><a href="agregar.jsp">
                    <img src="imiconos/agregar.png" width="40" height="40"></th>
            </tr>
            <tr bgcolor="red">
                <th>Proveedor</th><th>Producto</th>
                <th>Precio</th><th>Piezas</th>
                <th>Contacto</th><th>Acciones</th>
            </tr>
            <%
                try{
        Conectar cc=new Conectar();
        Connection con=cc.conexion();
        
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select * from user");

        while(rs.next()){
            %>
            <tr>
                <th><%= rs.getString(1) %></th>
                <th><%= rs.getString(2) %></th>
                <th><%= rs.getString(3) %></th>
                <th><%= rs.getString(4) %></th>
                <th><%= rs.getString(5) %></th>
                <th>
                    <a href="editar.jsp?Proveedor=<%=rs.getString(1)%>">
                    <img src="imiconos/editar.png" width="30" height="30"> 
                    </a>
                    <a href="eliminar.jsp?Proveedor=<%=rs.getString(1)%>">
                    <img src="imiconos/eliminar.png" width="30" height="30">
                    </a>
                </th>
            </tr>
                <%
                 }                
                stmt.close();
                rs.close();
                con.close();
                 }catch(Exception e){}        
          %>  
            </table>
    </body>
</html>
