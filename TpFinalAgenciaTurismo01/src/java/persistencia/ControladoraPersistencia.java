/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Cliente;
import logica.Empleado;
import logica.PaqueteTuristico;
import logica.ServicioTuristico;
import logica.Usuario;
import logica.Venta;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author FerCod
 */
public class ControladoraPersistencia {
    
    ClienteJpaController clienteJPA = new ClienteJpaController();
    EmpleadoJpaController empleadoJPA = new EmpleadoJpaController();
    PaqueteTuristicoJpaController paqueteJPA = new PaqueteTuristicoJpaController();
    ServicioTuristicoJpaController servicioJPA = new ServicioTuristicoJpaController();
    UsuarioJpaController usuarioJPA = new UsuarioJpaController();
    VentaJpaController ventaJPA = new VentaJpaController();

    ///METODOS DE ALTA
    public void altaCliente(Cliente unCliente) {
        try {
            clienteJPA.create(unCliente);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void altaEmpleado(Empleado unEmpleado, Usuario unUsuario) {
        
        try {
            usuarioJPA.create(unUsuario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            empleadoJPA.create(unEmpleado);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void altaServicio(ServicioTuristico unServicio) {
        
        try {
            servicioJPA.create(unServicio);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        public void altaPaquete(PaqueteTuristico unPaquete) {
        paqueteJPA.create(unPaquete);
    }
        
        public void altaVenta(Venta unaVenta) {
        ventaJPA.create(unaVenta);
    }
        
         
    ///METODOS DE BUSQUEDA   
        
    public Cliente buscarCliente(int id_cliente) {
         return clienteJPA.findCliente(id_cliente);
    }
        
    public Empleado buscarEmpleado(int id_empleado) {
        return empleadoJPA.findEmpleado(id_empleado);
    }
      
    public PaqueteTuristico buscarPaquete(int paquete) {
        return paqueteJPA.findPaqueteTuristico(paquete);
    }

    public ServicioTuristico buscarServicio(int servicio) {
        return servicioJPA.findServicioTuristico(servicio);
    }
      
    public ServicioTuristico buscarServicioTuristico(int id) {
        return servicioJPA.findServicioTuristico(id);
    }

   
    
    ///METODOS DE LISTAS
    public List<Cliente> listaCliente() {
        return clienteJPA.findClienteEntities();
    }

    public List<Empleado> listaEmpleado() {
        return empleadoJPA.findEmpleadoEntities();
    }
    
     public List<Usuario> listaUsuario() {
        return usuarioJPA.findUsuarioEntities();
    }

    public List<ServicioTuristico> listaServicio() {
        return servicioJPA.findServicioTuristicoEntities();
    }

    public List<PaqueteTuristico> listaPaquete() {
        return paqueteJPA.findPaqueteTuristicoEntities();
    }

    public List<Venta> listaVenta() {
        return ventaJPA.findVentaEntities();
    }

    
    ///METODOS DE MODIFICACION
    public void modificarCliente(Cliente unCliente) {
        try {
            clienteJPA.edit(unCliente);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void modificarEmpleado(Empleado unEmpleado) {
        try {
            empleadoJPA.edit(unEmpleado);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    ///METODOS DE ELIMINACION
    public void eliminarCliente(int id_cliente) {
        try {
            clienteJPA.destroy(id_cliente);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarEmpleado(int id_empleado) {
        try {
            empleadoJPA.destroy(id_empleado);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
