package Controladores;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author josue
 */
public class Conectar {
            
        Connection conectar=null;
        
        public Connection conexion(){
            
        String usuario = "root";
        String password = "admin123";
        String url="jdbc:mysql://localhost:3306/Login";
        
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conectar=(Connection)DriverManager.getConnection(url, usuario, password);
            } catch (Exception e) {
                out.println("No se Pudo conectar a la base de datos, Intente mas tarde.....");
            } 
        return conectar;
   }        
 }  

