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
public class Producto {
    private int id;
    private String nombre;
    private int valor;
    private int canjes;

    public Producto(int id, String nombre, int valor) {
        this.id = id;
        this.nombre = nombre;
        this.valor = valor;
    }

    public Producto(int id, String nombre, int valor, int canjes) {
        this.id = id;
        this.nombre = nombre;
        this.valor = valor;
        this.canjes = canjes;
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
     * @return the valor
     */
    public int getValor() {
        return valor;
    }

    /**
     * @param valor the valor to set
     */
    public void setValor(int valor) {
        this.valor = valor;
    }

    /**
     * @return the canjes
     */
    public int getCanjes() {
        return canjes;
    }

    /**
     * @param canjes the canjes to set
     */
    public void setCanjes(int canjes) {
        this.canjes = canjes;
    }
    
    
    
    
}
