/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author Luis González
 */
public class EstadoCuenta {
    
    private String fecha;
    private String operacion;
    private long monto;

    public EstadoCuenta(String fecha, String operacion, long monto) {
        this.fecha = fecha;
        this.operacion = operacion;
        this.monto = monto;
    }

    /**
     * @return the fecha
     */
    public String getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the operacion
     */
    public String getOperacion() {
        return operacion;
    }

    /**
     * @param operacion the operacion to set
     */
    public void setOperacion(String operacion) {
        this.operacion = operacion;
    }

    /**
     * @return the monto
     */
    public long getMonto() {
        return monto;
    }

    /**
     * @param monto the monto to set
     */
    public void setMonto(long monto) {
        this.monto = monto;
    }
    
    
    
}
