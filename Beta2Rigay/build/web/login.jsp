
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="vista.css">
        <title>JSP Page</title>
    </head>   
    <div class="container">
        <div class="header">
            <h3>Iniciar Sesion</h3>           
        </div>
        <div class="sep"></div>
        <div class="inputs">
        <form action="validarlogin" method="post" id="signup">
            <input type="text" name="usuario" placeholder="Nombre de usuario" autofocus/><br/>
            <input type="password" name="password" placeholder="Contraseña" autofocus/><br/>
            <input type="submit" value="Iniciar Sesión" id="submit">
        </form>
        </div>
</div>
​
</html>
