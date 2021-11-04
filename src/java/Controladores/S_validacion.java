/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Modelos.Usuarios;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Manu
 */
public class S_validacion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession session =request.getSession();
        if(session.getAttribute("usuario")==null){
            response.sendRedirect("login.jsp");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Conectar cc=new Conectar();
        Connection con=cc.conexion();
        
        String nombre, pass;
        int result=0;
        nombre = request.getParameter("usuario");
        pass = request.getParameter("password");
        /*
        usuario: admin
        Contraseña: hola123
        */
        String SQL="select * from Usuario where user='"+nombre+"'and Contrasena='"+pass+"'  ";
        try{
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery(SQL);
        
        if(rs.next()){
           result=1;
           
           if(result==1){ /*OK, usuario correcto*/
               Usuarios usu = new Usuarios(nombre, pass);
               HttpSession session = request.getSession();
               session.setAttribute("usuario", usu);
               
                
               request.getRequestDispatcher("principal").forward(request, response);
           }
        }else{
            request.getRequestDispatcher("Error_validacion").forward(request, response);
            //stmt.close();
        }
            
        
        }catch(Exception e){
            request.getRequestDispatcher("Error_validacion").forward(request, response);
        }
        
       
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
