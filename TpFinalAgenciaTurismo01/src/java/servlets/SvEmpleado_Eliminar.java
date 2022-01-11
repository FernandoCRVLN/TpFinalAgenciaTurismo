
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvEmpleado_Eliminar", urlPatterns = {"/SvEmpleado_Eliminar"})
public class SvEmpleado_Eliminar extends HttpServlet {
    
    Controladora control = new Controladora(); 

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id_empleado = Integer.parseInt(request.getParameter("empleado"));
        
        control.eliminarEmpleado(id_empleado);
        
        request.getSession().setAttribute("listaEmpleados", control.listaEmpleado());
        
        response.sendRedirect("empleados.jsp");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
