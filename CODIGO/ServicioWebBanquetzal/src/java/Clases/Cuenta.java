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
public class Cuenta {

    private int id;
    private double fondos;
    private String individualidad;
    private int tipo;
    private int estado;
    private long cuiPresidente;
    private long cuiVice;
    private long cuiContador;
    private long cuiPropietario;
    private String propietario;

    public Cuenta(int id, double fondos, String individualidad, int tipo, int estado) {
        this.id = id;
        this.fondos = fondos;
        this.individualidad = individualidad;
        this.tipo = tipo;
        this.estado = estado;
    }

    public Cuenta(int id, double fondos, String individualidad, int tipo, int estado,
            long cuiPresidente, long cuiVice, long cuiContador){
        this.id = id;
        this.fondos = fondos;
        this.individualidad = individualidad;
        this.tipo = tipo;
        this.estado = estado;
        this.cuiPresidente = cuiPresidente;
        this.cuiVice = cuiVice;
        this.cuiContador = cuiContador;
    }
    
    public Cuenta(int id, int estado, long cuiPropietario, String propietario){
        this.id = id;
        this.estado = estado;
        this.cuiPropietario = cuiPropietario;
        this.propietario = propietario;
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
     * @return the fondos
     */
    public double getFondos() {
        return fondos;
    }

    /**
     * @param fondos the fondos to set
     */
    public void setFondos(double fondos) {
        this.fondos = fondos;
    }

    /**
     * @return the individualidad
     */
    public String getIndividualidad() {
        return individualidad;
    }

    /**
     * @param individualidad the individualidad to set
     */
    public void setIndividualidad(String individualidad) {
        this.individualidad = individualidad;
    }

    /**
     * @return the tipo
     */
    public int getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the estado
     */
    public int getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(int estado) {
        this.estado = estado;
    }

    /**
     * @return the cuiPresidente
     */
    public long getCuiPresidente() {
        return cuiPresidente;
    }

    /**
     * @param cuiPresidente the cuiPresidente to set
     */
    public void setCuiPresidente(long cuiPresidente) {
        this.cuiPresidente = cuiPresidente;
    }

    /**
     * @return the cuiVice
     */
    public long getCuiVice() {
        return cuiVice;
    }

    /**
     * @param cuiVice the cuiVice to set
     */
    public void setCuiVice(long cuiVice) {
        this.cuiVice = cuiVice;
    }

    /**
     * @return the cuiContador
     */
    public long getCuiContador() {
        return cuiContador;
    }

    /**
     * @param cuiContador the cuiContador to set
     */
    public void setCuiContador(long cuiContador) {
        this.cuiContador = cuiContador;
    }

    /**
     * @return the cuiPropietario
     */
    public long getCuiPropietario() {
        return cuiPropietario;
    }

    /**
     * @param cuiPropietario the cuiPropietario to set
     */
    public void setCuiPropietario(long cuiPropietario) {
        this.cuiPropietario = cuiPropietario;
    }

    /**
     * @return the propietario
     */
    public String getPropietario() {
        return propietario;
    }

    /**
     * @param propietario the propietario to set
     */
    public void setPropietario(String propietario) {
        this.propietario = propietario;
    }

}
