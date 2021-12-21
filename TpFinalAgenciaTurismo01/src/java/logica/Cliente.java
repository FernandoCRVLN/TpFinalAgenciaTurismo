
package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author FerCod
 */
@Entity
public class Cliente extends Persona implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_cliente;
    

    public Cliente() {
    }

    public Cliente(int id_cliente, String dni, String nombre, String apellido, String direccion, String nacionalidad, String celular, String email, Date fechaNacimiento) {
        super(dni, nombre, apellido, direccion, nacionalidad, celular, email, fechaNacimiento);
        this.id_cliente = id_cliente;
        
    }




    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    /**
     *
     * @return
     */
    @Override
    public String getDni() {
        return dni;
    }

    @Override
    public void setDni(String dni) {
        this.dni = dni;
    }

    @Override
    public String getNombre() {
        return nombre;
    }

    /**
     *
     * @param nombre
     */
    @Override
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String getApellido() {
        return apellido;
    }

    @Override
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    @Override
    public String getDireccion() {
        return direccion;
    }

    @Override
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     *
     * @return
     */
    @Override
    public String getNacionalidad() {
        return nacionalidad;
    }

    @Override
    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    @Override
    public String getCelular() {
        return celular;
    }

    @Override
    public void setCelular(String celular) {
        this.celular = celular;
    }

    @Override
    public String getEmail() {
        return email;
    }

    @Override
    public void setEmail(String email) {
        this.email = email;
    }


    
}
