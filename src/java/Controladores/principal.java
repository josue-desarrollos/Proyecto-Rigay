
package Controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Modelos.Usuarios;

public class principal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        
        Usuarios usu = (Usuarios)session.getAttribute("usuario");
        
        if(usu == null){
            request.getRequestDispatcher("Error_validacion").forward(request, response);
        }else{
            try {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Menú</title>");            
                out.println("</head>");
                out.println("<body background=./imagen/imgf3.jpg >");
                out.println("<h1>Bienvenido "+usu.getNombre()+"</h1>");
                out.println("<a href='tabla.jsp'>Inventario</a><br/><br/>");
                out.println("<a href='sesioncerr.jsp'>Cerrar Sesion</a><br/>");
                out.println("</body>");
                out.println("</html>");
            } finally {
                out.close();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
