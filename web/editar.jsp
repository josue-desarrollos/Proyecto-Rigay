<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Controladores.Conectar"%>
<%@page import="Controladores.Conectar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
    </head>
    <body background=./imagen/imgf3.jpg>
        <h1 align="center">Editar BD</h1>
        
         <%
             
        String nombre=request.getParameter("Proveedor"); 
        try{
        Conectar cc=new Conectar();
        Connection con=cc.conexion();
        
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select * from user where nombreProv='"+nombre+"'");

        while(rs.next()){
          
         %>
        <form action="">
            <table border="" width="225" align="center">
                <tr>
                    <td> Nombre: </td>                   
                    <td><input type="text" name="NombreProv" value="<%= rs.getString(1) %>" > </td>
                </tr>
                <tr>
                    <td> Producto: </td>                   
                    <td><input type="text" name="NombreProd" value="<%= rs.getString(2) %>" ></td>
                </tr>
                <tr>
                    <td> Precio: </td>                   
                    <td><input type="text" name="Precio" value="<%= rs.getString(3) %>" ></td>
                </tr>
                <tr>
                    <td> Piezas: </td>                   
                    <td><input type="text" name="Piezas" value="<%= rs.getString(4) %>"> </td>
                </tr>
                <tr>
                    <td> Contacto: </td>                   
                    <td><input type="text" name="Contacto" value="<%= rs.getString(5) %>"> </td>
                </tr>
                <tr>                  
                    <th colspan="2"><input type="submit" name="Guardar" value="Guardar Cambios"></th>
                </tr>
            </table>
        </form>
                
        <%
        }
        }catch(Exception e){} 

        if(request.getParameter("Guardar")!=null){
        String provee2=request.getParameter("NombreProv");
        String produc2=request.getParameter("NombreProd");
        float precio2=Float.parseFloat(request.getParameter("Precio"));
        int pz2=Integer.parseInt(request.getParameter("Piezas"));
        Long contacto2=Long.parseLong(request.getParameter("Contacto"));

        Conectar cc=new Conectar();
        Connection con=cc.conexion();
        Statement stmt=con.createStatement();
        stmt.executeUpdate("update user set precio="+precio2+",piezas="+pz2+",contacto="+contacto2+",nombreProdu='"+produc2+"' where nombreProv='"+provee2+"'");
        request.getRequestDispatcher("tabla.jsp").forward(request, response);
        stmt.close();
        con.close();
        } 
        %>
      </body>
     </html>