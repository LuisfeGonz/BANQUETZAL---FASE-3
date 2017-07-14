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
public class Prestamo {
    
    private int id;
    private String solicitante;    
    private long monto;
    private long saldo;
    private String estado;
    private int idestado;
    private String modalidad;
    private String tipo;

    public Prestamo(int id, String solicitante, long monto, long saldo,
            String estado, int idestado, String modalidad, String tipo) {
        this.id = id;
        this.solicitante = solicitante;
        this.monto = monto;
        this.saldo = saldo;
        this.estado = estado;
        this.idestado = idestado;
        this.modalidad = modalidad;
        this.tipo = tipo;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the solicitante
     */
    public String getSolicitante() {
        return solicitante;
    }

    /**
     * @param solicitante the solicitante to set
     */
    public void setSolicitante(String solicitante) {
        this.solicitante = solicitante;
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

    /**
     * @return the saldo
     */
    public long getSaldo() {
        return saldo;
    }

    /**
     * @param saldo the saldo to set
     */
    public void setSaldo(long saldo) {
        this.saldo = saldo;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * @return the idestado
     */
    public int getIdestado() {
        return idestado;
    }

    /**
     * @param idestado the idestado to set
     */
    public void setIdestado(int idestado) {
        this.idestado = idestado;
    }

    /**
     * @return the modalidad
     */
    public String getModalidad() {
        return modalidad;
    }

    /**
     * @param modalidad the modalidad to set
     */
    public void setModalidad(String modalidad) {
        this.modalidad = modalidad;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    
    
    
}
