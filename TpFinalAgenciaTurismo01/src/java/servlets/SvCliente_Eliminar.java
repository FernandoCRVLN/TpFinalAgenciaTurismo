
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

/**
 *
 * @author FerCod
 */
@WebServlet(name = "SvCliente_Eliminar", urlPatterns = {"/SvCliente_Eliminar"})
public class SvCliente_Eliminar extends HttpServlet {
    
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
        
        int id_cliente = Integer.parseInt(request.getParameter("cliente"));
        
        control.eliminarCliente(id_cliente);
        
        request.getSession().setAttribute("listaClientes", control.listaCliente());
        
        response.sendRedirect("clientes.jsp");
        
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
