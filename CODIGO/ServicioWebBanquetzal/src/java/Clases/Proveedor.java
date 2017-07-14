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
public class Proveedor {

    private int id;
    private String nombre;
    private String direccion;
    private int canjes;

    public Proveedor(int id, String nombre, String direccion) {
        this.id = id;
        this.nombre = nombre;
        this.direccion = direccion;
    }

    public Proveedor(int id, String nombre, String direccion, int canjes) {
        this.id = id;
        this.nombre = nombre;
        this.direccion = direccion;
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
     * @return the direccion
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * @param direccion the direccion to set
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
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
