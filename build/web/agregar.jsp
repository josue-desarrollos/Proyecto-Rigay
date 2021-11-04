

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
        <title>Agregar</title>
    </head>
    <body>
        <h1 align="center">Registro a la bd</h1>
        <form action="">
            <table border="" width="225" align="center">
                <tr>
                    <td> Nombre Proveedor: </td>                   
                    <td><input type="text" name="NombreProv"> </td>
                </tr>
                                <tr>
                    <td> Nombre Producto: </td>                   
                    <td><input type="text" name="NombreProd"> </td>
                </tr>
                                <tr>
                    <td> Precio: </td>                   
                    <td><input type="text" name="Precio"> </td>
                </tr>
                <tr>
                    <td> Piezas: </td>                   
                    <td><input type="text" name="Piezas"> </td>
                </tr>
                 <tr>
                    <td> Contacto: </td>                   
                    <td><input type="text" name="Contacto"> </td>
                </tr>
                <tr>                  
                    <th colspan="2"><input type="submit" name="Guardar" value="Guardar"></th>
                </tr>
            </table>
        </form>
        
        <%
        String usuario = "root";
        String password = "admin123";
        String url="jdbc:mysql://localhost:3306/Login";
        
        if(request.getParameter("Guardar")!=null){
        String provee=request.getParameter("NombreProv");
        String produc=request.getParameter("NombreProd");
        int precio=Integer.parseInt(request.getParameter("Precio"));
        int pz=Integer.parseInt(request.getParameter("Piezas"));
        Long contacto=Long.parseLong(request.getParameter("Contacto"));
        
        //String esc=request.getParameter("");
        
        
        Connection con=null;
        Statement stmt=null;
        ResultSet rs=null;
         
            try{
                
        Class.forName("com.mysql.cj.jdbc.Driver");
        con=DriverManager.getConnection(url, usuario, password);
         
        
        stmt=con.createStatement();
        stmt.executeUpdate("insert into user values ('"+provee+"','"+produc+"',"+precio+","+pz+","+contacto+")");
        
        request.getRequestDispatcher("tabla.jsp").forward(request, response);
        stmt.close();
        rs.close();
        con.close();
        }catch(Exception e){}
            } 
        %>
    </body>
</html>
