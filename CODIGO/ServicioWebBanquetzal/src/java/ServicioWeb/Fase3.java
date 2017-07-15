/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServicioWeb;

import Clases.Cliente;
import Clases.Conexion;
import Clases.Cuenta;
import Clases.EstadoPrestamo;
import Clases.Prestamo;
import Clases.Producto;
import Clases.Proveedor;
import Clases.Stock;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Luis González
 */
@WebService(serviceName = "Fase3")
public class Fase3 {

    Conexion conexion1;
    Connection accesoBD;
    Statement statement1;
    ResultSet resultSet1;
    java.util.Date fecha;
    SimpleDateFormat formatoFechaHora;
    String consulta;

    public Fase3() {
        //Conexion a BD
        conexion1 = new Conexion();
        accesoBD = conexion1.getConexion();
        try {
            statement1 = accesoBD.createStatement();
        } catch (Exception e) {
            //
        }
        consulta = "";

        //Formato de fecha;
        fecha = new java.util.Date();
        formatoFechaHora = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    }

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    /*
    *
    **********************************PRODUCTO**********************************
    *
     */
    @WebMethod(operationName = "mostrarStock")
    public ArrayList<Stock> mostrarStock() {
        consulta = "SELECT S.IDPRODUCTO ID, PROD.NOMBRE PRODUCTO, PROD.VALORPUNTOS PUNTOS, "
                + "PA.NOMBRE PATROCINADOR, S.CANTIDAD EXISTENCIAS "
                + "FROM PRODUCTO PROD INNER JOIN PROVEEDOR PA INNER JOIN STOCK S "
                + "ON PROD.IDPRODUCTO = S.IDPRODUCTO AND PA.IDPROVEEDOR = S.IDPROVEEDOR "
                + "WHERE S.CANTIDAD > 0 "
                + "GROUP BY PROD.IDPRODUCTO, PA.IDPROVEEDOR";
        ArrayList<Stock> stock = new ArrayList<Stock>();
        Stock nodo = null;
        String producto;
        String patrocinador;
        int existencias;
        int id;
        int puntos;
        Double[] arreglo;

        try {
            resultSet1 = statement1.executeQuery(consulta);
            while (resultSet1.next()) {
                id = resultSet1.getInt("ID");
                producto = resultSet1.getString("PRODUCTO");
                patrocinador = resultSet1.getString("PATROCINADOR");
                existencias = resultSet1.getInt("EXISTENCIAS");
                puntos = resultSet1.getInt("PUNTOS");
                nodo = new Stock(id, producto, puntos, patrocinador, existencias);
                stock.add(nodo);
            }

            System.out.println("*****Se mostro el stock*****");
            return stock;
        } catch (Exception e) {
            System.out.println("-----Error al mostrar el stock-----");
            return stock;
        }

    }

    @WebMethod(operationName = "canjearProducto")
    public String canjearProducto(@WebParam(name = "cui") long cui,
            @WebParam(name = "idStock") int idStock) {
        int puntosProd = -1;
        int puntosCliente = -1;
        int cantidad = -1;
        int idcanje = -1;

        try {

            consulta = "SELECT VALORPUNTOS FROM STOCK S INNER JOIN PRODUCTO P "
                    + "ON S.IDPRODUCTO = P.IDPRODUCTO "
                    + "WHERE S.IDSTOCK =  " + idStock + ";";
            resultSet1 = statement1.executeQuery(consulta);
            while (resultSet1.next()) {
                puntosProd = resultSet1.getInt("VALORPUNTOS");
            }

            consulta = "SELECT PUNTOS FROM CLIENTE WHERE CUI = " + cui + ";";
            resultSet1 = statement1.executeQuery(consulta);
            while (resultSet1.next()) {
                puntosCliente = resultSet1.getInt("PUNTOS");
            }

            if (puntosCliente >= puntosProd) {
                //Se resta la cantidad de puntos que vale el producto de los 
                //puntos del cliente.
                consulta = "UPDATE CLIENTE SET PUNTOS = " + (puntosCliente - puntosProd)
                        + " WHERE CUI = " + cui + ";";

                resultSet1 = statement1.executeQuery(consulta);
                System.out.println("*****Se descontaron puntos de cliente*****");

                //
                consulta = "SELECT CANTIDAD FROM STOCK WHERE IDSTOCK = " + idStock + ";";
                resultSet1 = statement1.executeQuery(consulta);
                while (resultSet1.next()) {
                    cantidad = resultSet1.getInt("CANTIDAD");
                }

                //Se reduce el stock del producto y patrocinador.
                consulta = "UPDATE STOCK SET CANTIDAD = " + (cantidad - 1)
                        + " WHERE IDSTOCK = " + idStock + ";";

                resultSet1 = statement1.executeQuery(consulta);
                System.out.println("*****Se redujo el stock de producto y proveedor*****");

                //Se registra el canje
                consulta = "INSERT INTO CANJE (CUICLIENTE, IDSTOCK)"
                        + " VALUES (" + cui + ", " + idStock + ");";

                resultSet1 = statement1.executeQuery(consulta);
                System.out.println("*****Se realizo el canje*****");

                consulta = "SELECT IDCANJE FROM CANJE Ultimo canje WHERE CUICLIENTE = " + cui;

                return "Canje exitoso. ID: " + idcanje;
            } else {
                System.out.println("-----No tiene suficientes puntos-----");
                return "No tiene suficientes puntos";
            }
        } catch (Exception e) {
            System.out.println("-----Error al canjear producto-----");
            return "-----Error al canjear producto-----";
        }
    }

    @WebMethod(operationName = "mostarProductosMasSolicitados")
    public ArrayList<Producto> mostarProductosMasSolicitados() {
        consulta = "SELECT P.IDPRODUCTO, P.NOMBRE, P.VALORPUNTOS AS 'VALOR',\n"
                + "	(SELECT COUNT(*) \n"
                + "			FROM CANJE C INNER JOIN STOCK S \n"
                + "			ON  C.IDSTOCK = S.IDSTOCK\n"
                + "			WHERE S.IDPRODUCTO = P.IDPRODUCTO) AS 'CANJES'\n"
                + "FROM PRODUCTO P INNER JOIN CANJE C INNER JOIN STOCK S\n"
                + "ON P.IDPRODUCTO = S.IDPRODUCTO AND S.IDSTOCK = C.IDSTOCK\n"
                + "GROUP BY P.IDPRODUCTO\n"
                + "ORDER BY CANJES DESC;";
        int id;
        String nombre;
        int valor;
        int canjes;
        Producto producto;
        ArrayList<Producto> productos = new ArrayList<Producto>();

        try {
            resultSet1 = statement1.executeQuery(consulta);
            while (resultSet1.next()) {
                id = resultSet1.getInt("IDPRODUCTO");
                nombre = resultSet1.getString("NOMBRE");
                valor = resultSet1.getInt("VALOR");
                canjes = resultSet1.getInt("CANJES");
                producto = new Producto(id, nombre, valor, canjes);
                productos.add(producto);
            }
            System.out.println("*****Reporte de productos mas solicitados exitoso*****");
            return productos;
        } catch (Exception e) {
            System.out.println("-----Reporte de productos mas solicitados fallido-----" + e);
            return productos;
        }
    }

    @WebMethod(operationName = "mostrarProductos")
    public ArrayList<Producto> mostrarProductos() {
        consulta = "SELECT * FROM PRODUCTO;";
        int id;
        String nombre;
        int valor;
        Producto producto;
        ArrayList<Producto> productos = new ArrayList<Producto>();

        try {
            resultSet1 = statement1.executeQuery(consulta);
            while (resultSet1.next()) {
                id = resultSet1.getInt("IDPRODUCTO");
                nombre = resultSet1.getString("NOMBRE");
                valor = resultSet1.getInt("VALORPUNTOS");
                producto = new Producto(id, nombre, valor);
                productos.add(producto);
            }
            System.out.println("*****Reporte de productos exitoso*****");
            return productos;
        } catch (Exception e) {
            System.out.println("-----Reporte de productos fallido-----" + e);
            return productos;
        }
    }

    @WebMethod(operationName = "agregarProducto")
    public String agregarProducto(@WebParam(name = "nombre") String nombre,
            @WebParam(name = "valor") int valor,
            @WebParam(name = "cantidad") int cantidad,
            @WebParam(name = "idproveedor") int idproveedor,
            @WebParam(name = "idproducto") long idproducto,
            @WebParam(name = "nuevo") boolean nuevo) {

        if (nuevo) {
            try {
                //inscribir producto
                consulta = "INSERT INTO PRODUCTO(NOMBRE, VALORPUNTOS) "
                        + "VALUES('" + nombre + "', " + valor + ");";
                resultSet1 = statement1.executeQuery(consulta);

                //determinar el id del producto recien insertado
                consulta = "SELECT LAST_INSERT_ID();";
                resultSet1 = statement1.executeQuery(consulta);

                while (resultSet1.next()) {
                    idproducto = resultSet1.getLong("LAST_INSERT_ID()");
                }

                //agregar producto a stock
                consulta = "INSERT INTO STOCK (IDPRODUCTO, IDPROVEEDOR, CANTIDAD) "
                        + "VALUES(" + idproducto + ", " + idproveedor + ", " + cantidad + ");";
                resultSet1 = statement1.executeQuery(consulta);
                System.out.println("*****Producto agregado con exito.*****");
                return "Producto agregado con exito.";
            } catch (Exception e) {
                System.out.println("-----Error al agregar nuevo producto-----");
                return "Error al agregar nuevo producto.";
            }
        } else {
            consulta = "SELECT * FROM STOCK WHERE IDPRODUCTO = " + idproducto
                    + " AND IDPROVEEDOR = " + idproveedor + ";";
            try {
                resultSet1 = statement1.executeQuery(consulta);
                if (resultSet1.next()) {
                    consulta = "UPDATE STOCK SET CANTIDAD = " + cantidad
                            + " WHERE IDPRODUCTO = " + idproducto
                            + " AND IDPROVEEDOR = " + idproveedor + ";";
                    //System.out.println("es update");
                } else {
                    consulta = "INSERT INTO STOCK (IDPRODUCTO, IDPROVEEDOR, CANTIDAD) "
                            + "VALUES(" + idproducto + ", " + idproveedor + ", " + cantidad + ");";
                    //System.out.println("es insert");
                }

                resultSet1 = statement1.executeQuery(consulta);
                System.out.println("*****Se actualizo o ingreso el producto*****");
                return "Se actualizo o ingreso el producto";
            } catch (Exception e) {
                System.out.println("-----Error al actualizar o ingresar el producto-----" + e);
                return "Error al actualizar o ingresar el producto";
            }
        }
    }

    /*
    *
    *********************************PROVEEDOR**********************************
    *
     */
    @WebMethod(operationName = "mostarProveedoresMasSolicitados")
    public ArrayList<Proveedor> mostarProveedoresMasSolicitados() {
        consulta = "SELECT P.IDPROVEEDOR, P.NOMBRE, P.DIRECCION,\n"
                + "	(SELECT COUNT(*) \n"
                + "			FROM CANJE C INNER JOIN STOCK S \n"
                + "			ON  C.IDSTOCK = S.IDSTOCK\n"
                + "			WHERE S.IDPROVEEDOR = P.IDPROVEEDOR) AS 'CANJES'\n"
                + "FROM PROVEEDOR P INNER JOIN CANJE C INNER JOIN STOCK S\n"
                + "ON P.IDPROVEEDOR = S.IDPROVEEDOR AND S.IDSTOCK = C.IDSTOCK\n"
                + "GROUP BY P.IDPROVEEDOR\n"
                + "ORDER BY CANJES DESC;";
        int id;
        String nombre;
        String direccion;
        int canjes;
        Proveedor proveedor;
        ArrayList<Proveedor> proveedores = new ArrayList<Proveedor>();

        try {
            resultSet1 = statement1.executeQuery(consulta);
            while (resultSet1.next()) {
                id = resultSet1.getInt("IDPROVEEDOR");
                nombre = resultSet1.getString("NOMBRE");
                direccion = resultSet1.getString("DIRECCION");
                canjes = resultSet1.getInt("CANJES");
                proveedor = new Proveedor(id, nombre, direccion, canjes);
                proveedores.add(proveedor);
            }
            System.out.println("*****Reporte de proveedores mas solicitados exitoso*****");
            return proveedores;
        } catch (Exception e) {
            System.out.println("-----Reporte de proveedores mas solicitados fallido-----" + e);
            return proveedores;
        }
    }

    @WebMethod(operationName = "mostrarProveedores")
    public ArrayList<Proveedor> mostrarProveedores() {
        consulta = "SELECT * FROM PROVEEDOR;";
        int id;
        String nombre;
        String direccion;
        Proveedor proveedor;
        ArrayList<Proveedor> proveedores = new ArrayList<Proveedor>();

        try {
            resultSet1 = statement1.executeQuery(consulta);
            while (resultSet1.next()) {
                id = resultSet1.getInt("IDPROVEEDOR");
                nombre = resultSet1.getString("NOMBRE");
                direccion = resultSet1.getString("DIRECCION");
                proveedor = new Proveedor(id, nombre, direccion);
                proveedores.add(proveedor);
            }
            System.out.println("*****Reporte de proveedores exitoso*****");
            return proveedores;
        } catch (Exception e) {
            System.out.println("-----Reporte de proveedores fallido-----" + e);
            return proveedores;
        }
    }

    @WebMethod(operationName = "agregarProveedor")
    public String agregarProveedor(@WebParam(name = "nombre") String nombre,
            @WebParam(name = "direccion") String direccion) {
        try {
            consulta = "INSERT INTO PROVEEDOR (NOMBRE, DIRECCION) "
                    + "VALUES ('" + nombre + "', '" + direccion + "');";
            statement1.executeQuery(consulta);
            System.out.println("*****Proveedor agregado con exito*****");
            return "Proveedor agregado con exito";
        } catch (Exception e) {
            System.out.println("-----Error al agregar proveedor-----");
            return "Error al agregar proveedor";
        }
    }

    /*
    *
    ************************************CLIENTE*********************************
    *
     */
    @WebMethod(operationName = "puntosCliente")
    public int puntosCliente(@WebParam(name = "cui") long cui) {
        consulta = "SELECT PUNTOS FROM CLIENTE WHERE CUI = " + cui + ";";
        int puntos = -1;
        try {
            resultSet1 = statement1.executeQuery(consulta);
            while (resultSet1.next()) {
                puntos = resultSet1.getInt("PUNTOS");
            }

            System.out.println("*****Se mostraron los puntos*****");
            return puntos;
        } catch (Exception e) {
            System.out.println("-----Error al mostrar los puntos-----");
            return puntos;
        }
    }

    /*
    *
    ********************************CLIENTECUENTA*******************************
    *
     */
    @WebMethod(operationName = "mostrarPropietarioDeCuenta")
    public Cliente mostrarPropietarioDeCuenta(@WebParam(name = "cuenta") int cuenta) {
        consulta = "SELECT CL.CUI, CL.NOMBRES, CL.APELLIDOS "
                + "FROM CUENTA CU INNER JOIN CLIENTE CL "
                + "	INNER JOIN CLIENTECUENTA CC "
                + "ON CL.CUI = CC.CUICLIENTE AND CU.IDCUENTA = CC.IDCUENTA "
                + "WHERE CU.INDIVIDUALIDAD = 'V' AND CU.IDCUENTA = " + cuenta + ";";
        String nombres = "";
        String apellidos = "";
        long cui = -1;
        Cliente cliente = null;

        try {
            resultSet1 = statement1.executeQuery(consulta);
            while (resultSet1.next()) {
                cui = resultSet1.getLong("CUI");
                nombres = resultSet1.getString("NOMBRES");
                apellidos = resultSet1.getString("APELLIDOS");
            }
            cliente = new Cliente(cui, nombres, apellidos);
            return cliente;
        } catch (Exception e) {
            return cliente;
        }
    }

    /*
    *
    *************************************CUENTAS********************************
    *
     */
    @WebMethod(operationName = "mostrarCuentasCliente")
    public ArrayList<Cuenta> mostrarCuentasCliente(@WebParam(name = "cui") long cui) {
        consulta = "SELECT * FROM CLIENTECUENTA CC INNER JOIN CUENTA C "
                + "ON CC.IDCUENTA = C.IDCUENTA "
                + "WHERE C.INDIVIDUALIDAD = 'V' AND CC.CUICLIENTE = " + cui + ";";
        ArrayList<Cuenta> cuentas = new ArrayList<Cuenta>();
        Cuenta cuenta = null;
        int id;
        double fondos;
        String individualidad;
        int tipo;
        int estado;

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                id = resultSet1.getInt("IDCUENTA");
                fondos = resultSet1.getDouble("FONDOS");
                individualidad = resultSet1.getString("INDIVIDUALIDAD");
                tipo = resultSet1.getInt("IDTIPOCUENTA");
                estado = resultSet1.getInt("IDESTADO");
                cuenta = new Cuenta(id, fondos, individualidad, tipo, estado);
                cuentas.add(cuenta);
            }
            System.out.println("*****Se mostraron las cuentas individuales*****");
            return cuentas;

        } catch (Exception e) {
            System.out.println("-----Error al mostrar las cuentas individuales-----");
            return cuentas;
        }
    }

    @WebMethod(operationName = "mostrarCuentasAsociadas")
    public ArrayList<Cuenta> mostrarCuentasAsociadas(@WebParam(name = "cui") long cui) {
        ArrayList<Cuenta> cuentas = mostrarCuentasCliente(cui);

        consulta = "SELECT * FROM ASOCIACIONCUENTA AC INNER JOIN CUENTA C \n"
                + "ON AC.CUENTAASOCIADA = C.IDCUENTA\n"
                + "WHERE CUICLIENTE = " + cui + ";";
        Cuenta cuenta = null;
        int id;
        double fondos;
        String individualidad;
        int tipo;
        int estado;

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                id = resultSet1.getInt("IDCUENTA");
                fondos = resultSet1.getDouble("FONDOS");
                individualidad = resultSet1.getString("INDIVIDUALIDAD");
                tipo = resultSet1.getInt("IDTIPOCUENTA");
                estado = resultSet1.getInt("IDESTADO");
                cuenta = new Cuenta(id, fondos, individualidad, tipo, estado);
                cuentas.add(cuenta);
            }
            System.out.println("*****Se mostraron las cuentas individuales*****");
            return cuentas;
        } catch (Exception e) {
            System.out.println("-----Error al mostrar las cuentas individuales-----");
            return cuentas;
        }
    }

    @WebMethod(operationName = "asociarCuenta")
    public String asociarCuenta(@WebParam(name = "cui") long cui,
            @WebParam(name = "idcuenta") int idcuenta) {
        consulta = "INSERT INTO ASOCIACIONCUENTA VALUES(" + cui + ", " + idcuenta + ");";

        try {
            resultSet1 = statement1.executeQuery(consulta);
            System.out.println("*****Asociacion exitosa*****");
            return "Asociacion exitosa.";
        } catch (Exception e) {
            System.out.println("-----Error al asociar-----");
            return "Error al asociar";
        }
    }

    /*
    *
    ********************************OPERACIONES*********************************
    *
     */
    @WebMethod(operationName = "transferir")
    public String transferir(@WebParam(name = "origen") int origen,
            @WebParam(name = "destino") int destino,
            @WebParam(name = "monto") long monto,
            @WebParam(name = "cuitrabajador") long cuitrabajador) {
        long fondosOrigen = 0;
        long fondosDestino = 0;
        try {
            //Consultar fondos origen
            consulta = "SELECT FONDOS FROM CUENTA WHERE IDCUENTA = " + origen + ";";
            resultSet1 = statement1.executeQuery(consulta);
            while (resultSet1.next()) {
                fondosOrigen = resultSet1.getLong("FONDOS");
            }

            if (fondosOrigen >= monto) {
                //Consultar fondos destino
                consulta = "SELECT FONDOS FROM CUENTA WHERE IDCUENTA = " + destino + ";";
                resultSet1 = statement1.executeQuery(consulta);
                while (resultSet1.next()) {
                    fondosDestino = resultSet1.getLong("FONDOS");
                }
                //Reducir fondos origen
                consulta = "UPDATE CUENTA SET FONDOS = " + (fondosOrigen - monto)
                        + " WHERE IDCUENTA = " + origen + ";";
                resultSet1 = statement1.executeQuery(consulta);
                //Agregar fondos destino
                consulta = "UPDATE CUENTA SET FONDOS = " + (fondosDestino + monto)
                        + " WHERE IDCUENTA = " + destino + ";";
                resultSet1 = statement1.executeQuery(consulta);

                //registrar operacion
                String fechaHora = formatoFechaHora.format(fecha);
                consulta = "INSERT INTO OPERACION(FECHA, MONTO, CUENTATRANSFERENCIA, "
                        + "     IDCUENTA, IDTIPOOPERACION, CUICLIENTE) "
                        + "VALUES('" + fechaHora + "', " + monto + ", " + destino
                        + ", " + origen + ", 9, " + cuitrabajador + ");";
                resultSet1 = statement1.executeQuery(consulta);

                System.out.println("*****Transferencia exitosa*****");
                return "Transferencia exitosa";
            } else {
                return "No tiene fondos suficientes.";
            }

        } catch (Exception e) {
            System.out.println("-----Error en transferencia-----" + e);
            return "Error en transferencia";
        }

    }

    @WebMethod(operationName = "retirar")
    public String retirar(@WebParam(name = "cuenta") int cuenta,
            @WebParam(name = "monto") long monto,
            @WebParam(name = "cuitrabajador") long cuitrabajador) {
        long fondos = 0;

        try {
            consulta = "SELECT FONDOS FROM CUENTA WHERE IDCUENTA = " + cuenta
                    + " AND INDIVIDUALIDAD = 'V';";
            resultSet1 = statement1.executeQuery(consulta);
            if (resultSet1.next()) {
                fondos = resultSet1.getLong("FONDOS");
            } else {
                return "La cuenta es una nomina.";
            }
            System.out.println("fondos = " + fondos);
            System.out.println("monto = " + monto);
            if (fondos >= monto) {
                fondos = fondos - monto;
                consulta = "UPDATE CUENTA SET FONDOS = " + fondos
                        + " WHERE IDCUENTA = " + cuenta + ";";
                resultSet1 = statement1.executeQuery(consulta);

                //REGISTRAR OPERACION
                String fechaHora = formatoFechaHora.format(fecha);
                consulta = "INSERT INTO OPERACION(FECHA, MONTO, IDCUENTA, "
                        + "IDTIPOOPERACION, CUITRABAJADOR) "
                        + "VALUES('" + fechaHora + "', " + monto + ", " + cuenta + ", 6, " + cuitrabajador + ");";
                resultSet1 = statement1.executeQuery(consulta);

                return "Retiro exitoso.";
            } else {
                return "Cuenta sin suficientes fondos.";
            }
        } catch (Exception e) {
            return "Error de retiro.";
        }
    }

//    @WebMethod(operationName = "pagarSalariosNomina")
//    public String pagarSalariosNomina(@WebParam(name = "idnomina") int idnomina) {
//        consulta = "SELECT SUM(CC.SALARIO) AS 'SALARIOTOTAL', COUNT(*) AS 'EMPLEADOS', C.FONDOS "
//                + "FROM CLIENTECUENTA CC INNER JOIN CUENTA C "
//                + "ON C.IDCUENTA = CC.IDCUENTA "
//                + "WHERE C.IDCUENTA = " + idnomina + ";";
//        long salarioTotal = -1;
//        long fondosNomina = -1;
//        int empleados = -1;
//        long salario = -1;
//        long cui=-1;
//
//        try {
//            resultSet1 = statement1.executeQuery(consulta);
//            while (resultSet1.next()) {
//                salarioTotal = resultSet1.getLong("SALARIOTOTAL");
//                fondosNomina = resultSet1.getLong("FONDOS");
//                empleados = resultSet1.getInt("EMPLEADOS");
//            }
//
//            if (fondosNomina >= salarioTotal) {
//                //definir el salario del cliente
//                consulta = "SELECT SALARIO, CUICLIENTE FROM CLIENTECUENTA WHERE IDCUENTA =" + idnomina;
//                resultSet1 = statement1.executeQuery(consulta);
//                while (resultSet1.next()) {
//                    salario = resultSet1.getLong("SALARIO");
//                    cui = resultSet1.getLong("CUICLIENTE");
//                    //determinar a que cuenta pagar
//                    
//                    //determinar los fondos de la cuenta
//                    
//                    //descontar salario de nomina
//                    consulta = "UPDATE CUENTA SET FONDOS = ";
//                    //agregar salario a cuenta cliente
//
//                    //inscribir operacion de pago
//                }
//
//            } else {
//                return "Nomina sin fondos suficientes.";
//            }
//
//        } catch (Exception e) {
//            System.out.println("-----Error al realizar el pago-----");
//            return "Error al realizar el pago";
//        }
//    }
    /*
    *
    ************************************PRESTAMOS*******************************
    *
     */
    @WebMethod(operationName = "mostrarPrestamosTrabajador")
    public ArrayList<Prestamo> mostrarPrestamosTrabajador() {
        consulta = "SELECT P.IDPRESTAMO AS 'ID', CL.NOMBRES, CL.APELLIDOS, P.MONTO,\n"
                + "	P.SALDO, EP.NOMBRE AS 'ESTADOPRESTAMO', P.IDESTADOPRESTAMO, MP.NOMBRE AS 'MODALIDAD',\n"
                + "	TP.NOMBRE AS 'TIPO'\n"
                + "FROM PRESTAMO P INNER JOIN CLIENTE CL INNER JOIN ESTADOPRESTAMO EP\n"
                + "	INNER JOIN MODALIDADPAGO MP INNER JOIN TIPOPRESTAMO TP\n"
                + "ON P.CUICLIENTE = CL.CUI AND P.IDESTADOPRESTAMO = EP.IDESTADOPRESTAMO\n"
                + "	AND P.IDMODALIDADPAGO = MP.IDMODALIDAD AND P.IDTIPOPRESTAMO = TP.IDTIPOPRESTAMO;";
        ArrayList<Prestamo> prestamos = new ArrayList<Prestamo>();
        Prestamo prestamo = null;
        int id = -1;
        String solicitante = "";
        long monto = -1;
        long saldo = -1;
        String estado = "";
        int idestado = -1;
        String modalidad = "";
        String tipo = "";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                id = resultSet1.getInt("ID");
                solicitante = resultSet1.getString("NOMBRES");
                solicitante += " " + resultSet1.getString("APELLIDOS");
                monto = resultSet1.getLong("MONTO");
                saldo = resultSet1.getLong("SALDO");
                estado = resultSet1.getString("ESTADOPRESTAMO");
                idestado = resultSet1.getInt("IDESTADOPRESTAMO");
                modalidad = resultSet1.getString("MODALIDAD");
                tipo = resultSet1.getString("TIPO");
                prestamo = new Prestamo(id, solicitante, monto, saldo, estado, idestado, modalidad, tipo);
                prestamos.add(prestamo);
            }
            System.out.println("*****Se mostraron los prestamos*****");
            return prestamos;
        } catch (Exception e) {
            System.out.println("-----Error al mostrar los prestamos-----");
            return prestamos;
        }
    }

    @WebMethod(operationName = "mostrarPrestamosCliente")
    public ArrayList<Prestamo> mostrarPrestamosCliente(@WebParam(name = "nomina") int nomina) {
        consulta = "SELECT DISTINCT P.IDPRESTAMO AS 'ID', CL.NOMBRES, CL.APELLIDOS, "
                + "	P.MONTO,	P.SALDO, EP.NOMBRE AS 'ESTADOPRESTAMO', "
                + "	P.IDESTADOPRESTAMO, MP.NOMBRE AS 'MODALIDAD', TP.NOMBRE AS 'TIPO' "
                + "FROM CUENTA CU INNER JOIN CLIENTE CL INNER JOIN CLIENTECUENTA CC "
                + "	INNER JOIN PRESTAMO P INNER JOIN ESTADOPRESTAMO EP "
                + "	INNER JOIN MODALIDADPAGO MP INNER JOIN TIPOPRESTAMO TP "
                + "ON CL.CUI = P.CUICLIENTE AND CL.CUI = CC.CUICLIENTE "
                + "	AND P.IDESTADOPRESTAMO = EP.IDESTADOPRESTAMO "
                + "	AND P.IDMODALIDADPAGO = MP.IDMODALIDAD "
                + "	AND P.IDTIPOPRESTAMO = TP.IDTIPOPRESTAMO "
                + "WHERE CC.IDCUENTA = " + nomina + " "
                + "GROUP BY P.IDPRESTAMO;";
        ArrayList<Prestamo> prestamos = new ArrayList<Prestamo>();
        Prestamo prestamo = null;
        int id = -1;
        String solicitante = "";
        long monto = -1;
        long saldo = -1;
        String estado = "";
        int idestado = -1;
        String modalidad = "";
        String tipo = "";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                id = resultSet1.getInt("ID");
                solicitante = resultSet1.getString("NOMBRES");
                solicitante += " " + resultSet1.getString("APELLIDOS");
                monto = resultSet1.getLong("MONTO");
                saldo = resultSet1.getLong("SALDO");
                estado = resultSet1.getString("ESTADOPRESTAMO");
                idestado = resultSet1.getInt("IDESTADOPRESTAMO");
                modalidad = resultSet1.getString("MODALIDAD");
                tipo = resultSet1.getString("TIPO");
                prestamo = new Prestamo(id, solicitante, monto, saldo, estado, idestado, modalidad, tipo);
                prestamos.add(prestamo);
            }
            System.out.println("*****Se mostraron los prestamos*****");
            return prestamos;
        } catch (Exception e) {
            System.out.println("-----Error al mostrar los prestamos-----");
            return prestamos;
        }
    }

    @WebMethod(operationName = "mostrarEstadosPrestamos")
    public ArrayList<EstadoPrestamo> mostrarEstadosPrestamos() {
        consulta = "SELECT * FROM ESTADOPRESTAMO;";

        ArrayList<EstadoPrestamo> estados = new ArrayList<EstadoPrestamo>();
        EstadoPrestamo estado = null;
        int id = -1;
        String nombre = "";
        String descripcion = "";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                id = resultSet1.getInt("IDESTADOPRESTAMO");
                nombre = resultSet1.getString("NOMBRE");
                descripcion = resultSet1.getString("DESCRIPCION");

                estado = new EstadoPrestamo(id, nombre, descripcion);
                estados.add(estado);
            }

            System.out.println("*****Se mostraron los estados de prestamo");
            return estados;
        } catch (Exception e) {
            System.out.println("-----Error al mostrar los estados  de prestamo-----");
            return estados;
        }

    }

    @WebMethod(operationName = "cambiarEstadoPrestamo")
    public String cambiarEstadoPrestamo(@WebParam(name = "idprestamo") int idprestamo,
            @WebParam(name = "idestado") int idestado) {
        consulta = "UPDATE PRESTAMO SET IDESTADOPRESTAMO = " + idestado
                + " WHERE IDPRESTAMO = " + idprestamo + ";";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            System.out.println("*****Se cambio el estado del prestamo*****");
            return "Se cambio el estado del prestamo";
        } catch (Exception e) {
            System.out.println("-----Error al cambiar el estado del prestamo-----");
            return "Error al cambiar el estado del prestamo";
        }
    }

    @WebMethod(operationName = "prueba")
    public double[] prueba() {
        double[] vector = new double[5];
        return vector;
    }
}
