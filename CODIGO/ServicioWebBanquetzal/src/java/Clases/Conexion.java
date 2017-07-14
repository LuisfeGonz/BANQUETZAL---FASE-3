/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.*;

/**
 *
 * @author FelipeGonzalez
 */
public class Conexion {

    public Conexion() {
        //constructor
    }

    public Connection getConexion() {
        Connection conexion = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver").newInstance();
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/banquetzal", "root", "");
            System.out.println("*****Conectado***** \n");
        } catch (Exception e) {
            System.out.println("-----Error de conexion----- \n");
        }

        return conexion;
    }

}
