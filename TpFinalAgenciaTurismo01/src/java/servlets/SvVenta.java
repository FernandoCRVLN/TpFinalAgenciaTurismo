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
@WebServlet(name = "SvVenta", urlPatterns = {"/SvVenta"})
public class SvVenta extends HttpServlet {

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
       
        String fechaVenta= request.getParameter("fechaVenta");
        String medioPago = request.getParameter("medioPago");
        String seleccionPaquete = request.getParameter("seleccionPaquete");
        
        int id_servicio = -1;
        int id_paquete = -1;
        
        if(seleccionPaquete != null){
            id_servicio = Integer.parseInt(request.getParameter("servicio"));
        }else{
            id_paquete = Integer.parseInt(request.getParameter("paquete"));
        }
        
        int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
        int id_empleado = Integer.parseInt(request.getParameter("id_empleado"));
        
      
        
        control.crearVenta(fechaVenta, medioPago, id_servicio, id_paquete, id_cliente, id_empleado);
        
        response.sendRedirect("alta_venta.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
