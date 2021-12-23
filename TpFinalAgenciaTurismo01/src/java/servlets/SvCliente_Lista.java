package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Cliente;
import logica.Controladora;

/**
 *
 * @author FerCod
 */
@WebServlet(name = "SvCliente_Lista", urlPatterns = {"/SvCliente_Lista"})
public class SvCliente_Lista extends HttpServlet {

    Controladora control = new Controladora();    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List <Cliente> listaClientes = control.listaCliente();
        // En la sesion activa crea atributo LISTACLIENTE y le asigna listaClientes ("listaClientes", listaCliente)
        HttpSession miSession = request.getSession();
        miSession.setAttribute("listaClientes", listaClientes);
        response.sendRedirect("clientes.jsp");
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
