package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import logica.Controladora;

/**
 *
 * @author FerCod
 */
@WebServlet(name = "SvPaquete", urlPatterns = {"/SvPaquete"})
public class SvPaquete extends HttpServlet {
    
    Controladora control = new Controladora();

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
        String nombrePaquete = request.getParameter("nombrePaquete");
        String[] listaServicios = request.getParameterValues("listaServicios");
        
        
        
        if(listaServicios != null){
            if(listaServicios.length >= 2){
                control.crearPaquete(listaServicios, nombrePaquete);
            } else {
                JOptionPane.showMessageDialog(null, "Debe Incluir 2 o mas Servicios");
            }
        }
        
        response.sendRedirect("alta_paquete.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
