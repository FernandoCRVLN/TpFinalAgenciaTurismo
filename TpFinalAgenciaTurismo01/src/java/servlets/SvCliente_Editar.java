
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "SvCliente_Editar", urlPatterns = {"/SvCliente_Editar"})
public class SvCliente_Editar extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id_cliente = Integer.parseInt(request.getParameter("cliente"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        String fechaNacimiento = request.getParameter("fechaNacim");
        String direccion = request.getParameter("direccion");
        String nacionalidad = request.getParameter("nacionalidad");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        
        Cliente unCliente= control.buscarCliente(id_cliente);
        
        SimpleDateFormat formato = new SimpleDateFormat("YYYY-dd-MM");
        Date fecha;
        try {
            fecha= formato.parse(fechaNacimiento);
        } catch (ParseException ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
            fecha= null;
        }
        
        unCliente.setNombre(nombre);
        unCliente.setApellido(apellido);
        unCliente.setDni(dni);
        unCliente.setFechaNacimiento(fecha);
        unCliente.setDireccion(direccion);
        unCliente.setNacionalidad(nacionalidad);
        unCliente.setCelular(celular);
        unCliente.setEmail(email);
        
        control.modificarCliente(unCliente);
        
        request.getSession().setAttribute("listaClientes", control.listaCliente());
        
        response.sendRedirect("clientes.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id_cliente = Integer.parseInt(request.getParameter("cliente"));
                        
        Cliente unCliente = control.buscarCliente(id_cliente);
        
        HttpSession miSession = request.getSession();
        miSession.setAttribute("unCliente", unCliente);
        response.sendRedirect("cliente_modificar.jsp");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
