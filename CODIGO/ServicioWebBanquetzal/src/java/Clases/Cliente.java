/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author FelipeGonzalez
 */
public class Cliente {

    private long cui;
    private String usuario;
    private String nombre;
    private String apellido;
    private String nacimiento;
    private int puntos;
    private double salario;

    //Cliente Individual -> No salario
    public Cliente(long cui, String usuario, String nombre, String apellido, String nacimiento, int puntos) {
        this.cui = cui;
        this.usuario = usuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.nacimiento = nacimiento;
        this.puntos = puntos;
    }

    //Cliente Nominal -> Salario
    public Cliente(long cui, String usuario, String nombre, String apellido, String nacimiento, int puntos, double salario) {
        this.cui = cui;
        this.usuario = usuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.nacimiento = nacimiento;
        this.puntos = puntos;
        this.salario = salario;
    }

    public Cliente(long cui, String nombre, String apellido) {
        this.cui = cui;
        this.nombre = nombre;
        this.apellido = apellido;
    }

    /**
     * @return the cui
     */
    public long getCui() {
        return cui;
    }

    /**
     * @param cui the cui to set
     */
    public void setCui(long cui) {
        this.cui = cui;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * @return the nacimiento
     */
    public String getNacimiento() {
        return nacimiento;
    }

    /**
     * @param nacimiento the nacimiento to set
     */
    public void setNacimiento(String nacimiento) {
        this.nacimiento = nacimiento;
    }

    /**
     * @return the puntos
     */
    public int getPuntos() {
        return puntos;
    }

    /**
     * @param puntos the puntos to set
     */
    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    /**
     * @return the salario
     */
    public double getSalario() {
        return salario;
    }

    /**
     * @param salario the salario to set
     */
    public void setSalario(double salario) {
        this.salario = salario;
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

}
