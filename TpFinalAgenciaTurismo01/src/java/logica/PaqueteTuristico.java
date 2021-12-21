/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

/**
 *
 * @author FerCod
 */
@Entity
public class PaqueteTuristico implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int codigo_paquete;
    private String nombre;
    private double costo_paquete;
    @ManyToMany
    private List<ServicioTuristico> listaServicios;
    

    public PaqueteTuristico() {
    }

    public PaqueteTuristico(int codigo_paquete, String nombre, double costo_paquete, List<ServicioTuristico> listaServicios) {
        this.codigo_paquete = codigo_paquete;
        this.nombre = nombre;
        this.costo_paquete = costo_paquete;
        this.listaServicios = listaServicios;

    }

    public List<ServicioTuristico> getListaServicios() {
        return listaServicios;
    }

    public void setListaServicios(List<ServicioTuristico> listaServicios) {
        this.listaServicios = listaServicios;
    }

    public int getCodigo_paquete() {
        return codigo_paquete;
    }

    public void setCodigo_paquete(int codigo_paquete) {
        this.codigo_paquete = codigo_paquete;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getCosto_paquete() {
        return costo_paquete;
    }

    public void setCosto_paquete(double costo_paquete) {
        this.costo_paquete = costo_paquete;
    }
    
    
}
