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
import logica.Empleado;

@WebServlet(name = "SvEmpleado_Editar", urlPatterns = {"/SvEmpleado_Editar"})
public class SvEmpleado_Editar extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id_empleado = Integer.parseInt(request.getParameter("empleado"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        String fechaNacimiento = request.getParameter("fechaNacim");
        String direccion = request.getParameter("direccion");
        String nacionalidad = request.getParameter("nacionalidad");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        
        Empleado unEmpleado= control.buscarEmpleado(id_empleado);
        
        SimpleDateFormat formato = new SimpleDateFormat("YYYY-dd-MM");
        Date fecha;
        try {
            fecha= formato.parse(fechaNacimiento);
        } catch (ParseException ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
            fecha= null;
        }
        
        unEmpleado.setNombre(nombre);
        unEmpleado.setApellido(apellido);
        unEmpleado.setDni(dni);
        unEmpleado.setFechaNacimiento(fecha);
        unEmpleado.setDireccion(direccion);
        unEmpleado.setNacionalidad(nacionalidad);
        unEmpleado.setCelular(celular);
        unEmpleado.setEmail(email);
        
        control.modificarEmpleado(unEmpleado);
        
        request.getSession().setAttribute("listaEmpleados", control.listaEmpleado());
        
        response.sendRedirect("empleados.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id_empleado = Integer.parseInt(request.getParameter("empleado"));
                        
        Empleado unEmpleado = control.buscarEmpleado(id_empleado);
        
        HttpSession miSession = request.getSession();
        miSession.setAttribute("unEmpleado", unEmpleado);
        response.sendRedirect("empleado_modificar.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
