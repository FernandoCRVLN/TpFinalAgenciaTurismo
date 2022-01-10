
package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Empleado;

/**
 *
 * @author FerCod
 */
@WebServlet(name = "SvEmpleado_Lista", urlPatterns = {"/SvEmpleado_Lista"})
public class SvEmpleado_Lista extends HttpServlet {
    
    Controladora control = new Controladora();  

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List <Empleado> listaEmpleados = control.listaEmpleado();
        // En la sesion activa crea atributo LISTAEMPLEADO y le asigna listaEmpleados ("listaEmpleados", listaEmpleados)
        HttpSession miSession = request.getSession();
        miSession.setAttribute("listaEmpleados", listaEmpleados);
        response.sendRedirect("empleados.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
