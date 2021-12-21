
package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author FerCod
 */
@Entity
public class Venta implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int num_venta;
    private String medio_pago;
    @Temporal(TemporalType.DATE)
    private Date fecha_venta;
    @ManyToOne
    private Cliente unCliente;
    @ManyToOne
    private Empleado unEmpleado;
    @ManyToOne
    private ServicioTuristico unServicio;
    @ManyToOne
    private PaqueteTuristico unPaquete;
    
    public Venta() {
    }

    public Venta(int num_venta, String medio_pago, Date fecha_venta, Cliente unCliente, Empleado unEmpleado, ServicioTuristico unServicio, PaqueteTuristico unPaquete) {
        this.num_venta = num_venta;
        this.medio_pago = medio_pago;
        this.fecha_venta = fecha_venta;
        this.unCliente = unCliente;
        this.unEmpleado = unEmpleado;
        this.unServicio = unServicio;
        this.unPaquete = unPaquete;
    }

    public int getNum_venta() {
        return num_venta;
    }

    public void setNum_venta(int num_venta) {
        this.num_venta = num_venta;
    }

    public String getMedio_pago() {
        return medio_pago;
    }

    public void setMedio_pago(String medio_pago) {
        this.medio_pago = medio_pago;
    }

    public Date getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(Date fecha_venta) {
        this.fecha_venta = fecha_venta;
    }

    public Cliente getUnCliente() {
        return unCliente;
    }

    public void setUnCliente(Cliente unCliente) {
        this.unCliente = unCliente;
    }

    public Empleado getUnEmpleado() {
        return unEmpleado;
    }

    public void setUnEmpleado(Empleado unEmpleado) {
        this.unEmpleado = unEmpleado;
    }

    public ServicioTuristico getUnServicio() {
        return unServicio;
    }

    public void setUnServicio(ServicioTuristico unServicio) {
        this.unServicio = unServicio;
    }

    public PaqueteTuristico getUnPaquete() {
        return unPaquete;
    }

    public void setUnPaquete(PaqueteTuristico unPaquete) {
        this.unPaquete = unPaquete;
    }
    
    
}

