package logica;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import persistencia.ControladoraPersistencia;

/**
 *
 * @author FerCod
 */
public class Controladora {
    
    ControladoraPersistencia controlPersistencia = new ControladoraPersistencia();
    
    public boolean verificarUsuario(String usuario, String password) {
        
        List<Usuario> listaUsuario = controlPersistencia.listaUsuario();
        
        if (listaUsuario != null) {
            for (Usuario unUsuario : listaUsuario) {
                if (unUsuario.getNombreUsuario().equals(usuario) && unUsuario.getPassword().equals(password)) {
                    return true;
                }
            }
        }
        return false;
    }

    public void crarEmpleado(String nombre, String apellido, String dni, String fechaNacimiento, String direccion, String nacionalidad, String celular, String email, String cargo, String sueldo, String usuario, String password) {
        
        Empleado unEmpleado = new Empleado();
        Usuario unUsuario = new Usuario();
        
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
        unEmpleado.setCargo(cargo);
        unEmpleado.setSueldo(Double.parseDouble(sueldo));   
                
        unUsuario.setNombreUsuario(usuario);
        unUsuario.setPassword(password);
        
        unEmpleado.setUsuario(unUsuario);
        
        controlPersistencia.altaEmpleado(unEmpleado, unUsuario);
        
    }

    public void crarCliente(String nombre, String apellido, String dni, String fechaNacimiento, String direccion, String nacionalidad, String celular, String email) {
        
        Cliente unCliente = new Cliente();
               
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
        
        controlPersistencia.altaCliente(unCliente);
    }

    public void crearServicio(String nombre, String descripcion_breve, String destino_servicio, String fecha_servicio, String costo_servicio) {
        
        ServicioTuristico unServicio = new ServicioTuristico();
        
        SimpleDateFormat formato = new SimpleDateFormat("YYYY-dd-MM");
        Date fecha;
        try {
            fecha= formato.parse(fecha_servicio);
        } catch (ParseException ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
            fecha= null;
        }
        
        unServicio.setNombre(nombre);
        unServicio.setDescripcion_breve(descripcion_breve);
        unServicio.setDestino_servicio(destino_servicio);
        unServicio.setCosto_servicio(Double.parseDouble(costo_servicio));
        unServicio.setFecha_servicio(fecha);
        
        controlPersistencia.altaServicio(unServicio);
    }
    

    public void crearPaquete(String[] listaServicios, String nombrePaquete) {
       
        PaqueteTuristico unPaquete = new PaqueteTuristico();
        
        double costoPaquete = 0;
        ServicioTuristico servicio = new ServicioTuristico();
        List<ServicioTuristico> servicios = new ArrayList<>();
        for (String lista : listaServicios) {
            servicio = buscarServicioTuristico(Integer.parseInt(lista));
            costoPaquete += servicio.getCosto_servicio()*0.9;
            servicios.add(servicio);
        }
        unPaquete.setCosto_paquete(costoPaquete);
        unPaquete.setListaServicios(servicios);
        unPaquete.setNombre(nombrePaquete);
        controlPersistencia.altaPaquete(unPaquete);
    }
    
    public void crearVenta(String fechaVenta, String medioPago, int servicio, int paquete, int id_cliente, int id_empleado) {
        
         Venta unaVenta = new Venta();
         
        SimpleDateFormat formato = new SimpleDateFormat("YYYY-dd-MM");
        Date fecha;
        try {
            fecha= formato.parse(fechaVenta);
        } catch (ParseException ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
            fecha= null;
        }
         
        PaqueteTuristico unPaquete = buscarPaquete(paquete);
        ServicioTuristico unServicio = buscarServicio(servicio);
        
         Cliente unCliente = new Cliente();
        for(Cliente c : listaCliente()){
            if(c.getId_cliente() == id_cliente){
                unCliente = c;
            }
        }
        Empleado unEmpleado = new Empleado();
        List<Empleado> listarEmpleado = listaEmpleado();
        for(Empleado emple : listarEmpleado){
            if(emple.getId_empleado() == id_empleado){
                unEmpleado = emple;
                break;
            }
        }
        
        unaVenta.setFecha_venta(fecha);
        unaVenta.setMedio_pago(medioPago);
        unaVenta.setUnPaquete(unPaquete);
        unaVenta.setUnServicio(unServicio);
        unaVenta.setUnCliente(unCliente);
        unaVenta.setUnEmpleado(unEmpleado);
        
        controlPersistencia.altaVenta(unaVenta);
    }   

    private ServicioTuristico buscarServicioTuristico(int id) {
        return controlPersistencia.buscarServicioTuristico(id);
    }
    
    public List<Cliente> listaCliente(){
        return controlPersistencia.listaCliente();
    }
    
    public List<Empleado> listaEmpleado(){
        return controlPersistencia.listaEmpleado();
    }
    
    public List<ServicioTuristico> listaServicio(){
        return controlPersistencia.listaServicio();
    }
    
    public List<PaqueteTuristico> listaPaquete(){
        return controlPersistencia.listaPaquete();
    }
    
    public List<Venta> listaVenta(){
        return controlPersistencia.listaVenta();
    }

    private PaqueteTuristico buscarPaquete(int paquete) {
         return controlPersistencia.buscarPaquete(paquete);
    }

    private ServicioTuristico buscarServicio(int servicio) {
         return controlPersistencia.buscarServicio(servicio);
    }

    public void eliminarCliente(int id_cliente) {
        controlPersistencia.eliminarCliente(id_cliente);
    }

    public Cliente buscarCliente(int id_cliente) {
        return controlPersistencia.buscarCliente(id_cliente);
    }

    public void modificarCliente(Cliente unCliente) {
        controlPersistencia.modificarCliente(unCliente);
    }

    public Empleado buscarEmpleado(int id_empleado) {
        return controlPersistencia.buscarEmpleado(id_empleado);
    }

    public void modificarEmpleado(Empleado unEmpleado) {
         controlPersistencia.modificarEmpleado(unEmpleado);
    }

    

}
