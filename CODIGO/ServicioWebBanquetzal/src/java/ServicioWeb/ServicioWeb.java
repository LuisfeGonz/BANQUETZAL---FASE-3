/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServicioWeb;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import java.text.SimpleDateFormat;
//para hacer consultas
import Clases.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author FelipeGonzalez
 */
@WebService(serviceName = "ServicioWeb")
public class ServicioWeb {

    Conexion conexion1;
    Connection accesoBD;
    Statement statement1;
    ResultSet resultSet1;
    java.util.Date fecha;
    SimpleDateFormat formatoFechaHora;
    String consulta;

    public ServicioWeb() {
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

    /*
    *
    *********************************LOGIN**************************************
    *
     */
    @WebMethod(operationName = "Login")
    public String login(@WebParam(name = "user") String user, @WebParam(name = "pass") String pass) {

        String cui = "";
        String nombres = "";
        String apellidos = "";
        String rol = "";

        //verifica en tabla usuario
        consulta = "SELECT * FROM CLIENTE WHERE USUARIO = '" + user + "' AND CONTRASENA = '"
                + pass + "';";

        try {
            //verificar en tabla usuario
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                cui = resultSet1.getString("CUI");
                nombres = resultSet1.getString("NOMBRES");
                apellidos = resultSet1.getString("APELLIDOS");
                rol = "-1";
            }

            if (rol.length() > 0) {
                System.out.println("*****CLIENTE*****");
                System.out.println("*****El usuario y la contrasena son validos*****");
                return (cui + "," + nombres + "," + apellidos + "," + rol);
            } else {
                //verificar en tabla trabajador
                //verifica en tabla trabajador
                consulta = "SELECT * FROM TRABAJADOR WHERE USUARIO = '" + user + "' AND CONTRASENA = '"
                        + pass + "';";
                resultSet1 = statement1.executeQuery(consulta);

                while (resultSet1.next()) {
                    nombres = resultSet1.getString("NOMBRES");
                    apellidos = resultSet1.getString("APELLIDOS");
                    rol = resultSet1.getString("IDROL");
                    cui = resultSet1.getString("CUI");
                }
                if (rol.length() > 0) {
                    System.out.println("*****TRABAJADOR*****");
                    System.out.println("*****El usuario y la contrasena son validos*****");
                    return (cui + "," + nombres + "," + apellidos + "," + rol);
                }
            }
            //la combinacion NO existe en ninguna tabla
            System.out.println("-----Usuario o contrasena invalidx-----");
            return "";
        } catch (Exception e) {
            //no se pudo acceder a la BD
            System.out.println("-----Ocurrio un error al tratar de verificar los datos-----");
            return "";
        }
    }

    /*
    *
    *******************************OPERACIONES**********************************
    *
     */
    @WebMethod(operationName = "cambiarEstadoCuenta")
    public boolean cambiarEstadoCuenta(@WebParam(name = "idcuenta") int idcuenta,
            @WebParam(name = "nuevoEstado") int nuevoEstado) {
        consulta = "UPDATE CUENTA SET IDESTADO = " + nuevoEstado
                + " WHERE IDCUENTA = " + idcuenta + ";";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            System.out.println("*****Estado de cuenta cambiado*****");
            return true;
        } catch (Exception e) {
            System.out.println("-----Error al consultar los datos-----");
            return false;
        }
    }

    @WebMethod(operationName = "cambiarCheque")
    public String cambiarCheque(@WebParam(name = "idcuenta") int idcuenta,
            @WebParam(name = "idcheque") long idcheque,
            @WebParam(name = "monto") long monto,
            @WebParam(name = "transaccionista") String transaccionista,
            @WebParam(name = "cuiTrabajador") long cuiTrabajador) {
        String fechaHora = formatoFechaHora.format(fecha);
        long fondos = -1;
        if (descontarMontoCheque(idcuenta, idcheque, monto)) {
            try {
                consulta = "INSERT INTO OPERACION (FECHA, MONTO, NOMBRETRANSACCIONISTA,"
                        + " IDCUENTA, IDTIPOOPERACION, CUITRABAJADOR) "
                        + "VALUES ('" + fechaHora + "', " + monto + ", '" + transaccionista
                        + "', " + idcuenta + ", " + 7 + ", " + cuiTrabajador + ");";

                resultSet1 = statement1.executeQuery(consulta);

                return "Transaccion realizada.";

            } catch (Exception e) {
                return "No se pudo realizar la operacion.";
            }
        } else {
            return "Cuenta sin fondos.";
        }

    }

    public boolean descontarMontoCheque(int idcuentacheque, long idcheque, long monto) {
        consulta = "SELECT FONDOS FROM CUENTA C INNER JOIN CHEQUE CH "
                + "ON C.IDCUENTA = CH.IDCUENTA AND C.IDCUENTA = " + idcuentacheque
                + " AND CH.IDCHEQUE = " + idcheque + ";";
        long fondos = -1;
        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                fondos = resultSet1.getLong("FONDOS");
            }

            if (fondos >= monto) {
                fondos = fondos - monto;

                consulta = "UPDATE CUENTA SET FONDOS = " + fondos
                        + " WHERE IDCUENTA = " + idcuentacheque + ";";

                resultSet1 = statement1.executeQuery(consulta);
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }
    }

    @WebMethod(operationName = "depositar")
    public String depositar(@WebParam(name = "conCheque") boolean conCheque,
            @WebParam(name = "idcuenta") int idcuenta,
            @WebParam(name = "idcheque") long idcheque,
            @WebParam(name = "idcuentacheque") int idcuentacheque,
            @WebParam(name = "monto") long monto,
            @WebParam(name = "transaccionista") String transaccionista,
            @WebParam(name = "cuiTrabajador") long cuiTrabajador) {
        String fechaHora = formatoFechaHora.format(fecha);
        long fondosCuentaCheque = -1;

        if (conCheque) {

            if (descontarMontoCheque(idcuentacheque, idcheque, monto)) {
                try {
                    //depositar el monto a la cuenta deseada
                    if (depositarFondos(idcuenta, monto)) {

                        consulta = "INSERT INTO OPERACION (FECHA, MONTO, NOMBRETRANSACCIONISTA,"
                                + " IDCUENTA, IDTIPOOPERACION, CUITRABAJADOR) "
                                + "VALUES ('" + fechaHora + "', " + monto + ", '" + transaccionista
                                + "', " + idcuenta + ", " + 8 + ", " + cuiTrabajador + ");";

                        //registrar operacion
                        resultSet1 = statement1.executeQuery(consulta);

                        return "Transaccion realizada.";
                    } else {
                        return "No se pudo realizar la transaccion con cheque.";
                    }

                } catch (Exception e) {
                    return "No se pudo realizar la operacion.";
                }
            } else {
                //poner multa porn no tener fondos;
                return "CuentaCheque sin fondos.";
            }

        } else if (depositarFondos(idcuenta, monto)) {
            consulta = "INSERT INTO OPERACION (FECHA, MONTO, NOMBRETRANSACCIONISTA,"
                    + " IDCUENTA, IDTIPOOPERACION, CUITRABAJADOR) "
                    + "VALUES ('" + fechaHora + "', " + monto + ", '" + transaccionista
                    + "', " + idcuenta + ", " + 8 + ", " + cuiTrabajador + ");";

            try {
                //registrar operacion
                resultSet1 = statement1.executeQuery(consulta);
                return "Transaccion realizada.";
            } catch (Exception e) {
                return "No se pudo realizar la transaccion en efectivo.";
            }

        } else {
            return "No se pudo realizar la transaccion.";
        }

    }

    private boolean depositarFondos(int idcuenta, long monto) {
        consulta = "SELECT CU.FONDOS, TC.NOMBRE AS 'TIPOCUENTA', "
                + "	CL.CUI, CL.PUNTOS "
                + "FROM CUENTA CU INNER JOIN TIPOCUENTA TC INNER JOIN CLIENTE CL "
                + "	INNER JOIN CLIENTECUENTA CC "
                + "ON CU.IDTIPOCUENTA = TC.IDTIPOCUENTA AND CU.IDCUENTA = CC.IDCUENTA "
                + "	AND CL.CUI = CC.CUICLIENTE "
                + "WHERE CU.IDCUENTA = " + idcuenta + ";";
        long fondos = -1;
        String tipocuenta = "";
        long cui = -1;
        long puntos = -1;

        try {

            //consultar los fondos actuales y el tipo de la cuenta
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                fondos = resultSet1.getLong("FONDOS");
                tipocuenta = resultSet1.getString("TIPOCUENTA");
                cui = resultSet1.getLong("CUI");
                puntos = resultSet1.getInt("PUNTOS");
            }

            fondos = fondos + monto;

            consulta = "UPDATE CUENTA SET FONDOS = " + fondos
                    + " WHERE IDCUENTA = " + idcuenta + ";";

            //depositar el monto en la cuenta
            resultSet1 = statement1.executeQuery(consulta);

            if (tipocuenta.equalsIgnoreCase("MONETARIA") && monto >= 500) {
                puntos = puntos + (1000 * (monto / 500));
                consulta = "UPDATE CLIENTE SET PUNTOS = " + puntos
                        + " WHERE CUI = " + cui + ";";

                resultSet1 = statement1.executeQuery(consulta);
            }

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /*
    @WebMethod(operationName = "Operacion")
    public boolean operacion(@WebParam(name = "tipooperacion") int tipooperacion,
            @WebParam(name = "monto") double monto,
            @WebParam(name = "cuentatransferencia") long cuentatransferencia,
            @WebParam(name = "nombrecambiocheque") String nombrecambiocheque,
            @WebParam(name = "idcuenta") long idcuenta,
            @WebParam(name = "cuicliente") long cuicliente,
            @WebParam(name = "cuitrabajador") long cuitrabajador,
            @WebParam(name = "rol") int rol) {
        //el rol para un cliente es -1;

        //variable para almacenar consulta
        String consultaoperacion = "";
        String consultaupdate1 = "";
        String consultaupdate2 = "";

        String fechaHora = formatoFechaHora.format(fecha);

        //1. Crear cuenta | 4. Solicitar chequeera | 5. Bloquear chequera, | 6. Desbloquear chequera
        //Lo hace solo servicio al cliente
        if ((tipooperacion == 1 || (tipooperacion > 3 && tipooperacion < 7)) && rol == 4) {
            consultaoperacion = "INSERT INTO OPERACION (FECHA, IDCUENTA, IDTIPOOPERACION, "
                    + "IDTRABAJADOR) "
                    + "VALUES ('" + fechaHora + "', " + idcuenta + ", "
                    + tipooperacion + ", " + cuitrabajador + ");";
        } // 2. Bloquear cuenta | 3. Desbloquear cuenta
        //Lo hace el cliente o servicio al cliente
        else if ((tipooperacion > 1 && tipooperacion < 4) && (rol == -1 || rol == 4)) {
            //2. , 3. Mandar cui o idtrabajador y el id del tipo de operacion            
            consultaoperacion = "INSERT INTO OPERACION (FECHA, IDCUENTA, IDTIPOOPERACION,"
                    + " IDTRABAJADOR) "
                    + "VALUES ('" + fechaHora + "', " + idcuenta + ", "
                    + tipooperacion + ", " + cuitrabajador + ");";
        } //7. Solicitar prestamo
        //Lo hace el cliente o servicio al cliente
        else if (tipooperacion == 7 && (rol == -1 || rol == 4)) {
            //7. Mandar monto, cui o idtrabajador, escliente
            consultaoperacion = "INSERT INTO OPERACION (FECHA, MONTO, CUICLIENTE,"
                    + " IDTIPOOPERACION, IDTRABAJADOR)"
                    + "VALUES ('" + fechaHora + "', " + monto + ", " + cuicliente
                    + ", " + tipooperacion + ", " + cuitrabajador + ");";

        } //RETIRO
        //Lo hace cajero
        else if (tipooperacion == 8 && rol == 3) {
            //8. andar la cuenta, el monto y el id del trabajador
            consultaoperacion = "INSERT INTO OPERACION (FECHA, MONTO, IDCUENTA,"
                    + " IDTIPOOPERACION, IDTRABAJADOR)"
                    + "VALUES ('" + fechaHora + "', " + monto + ", " + idcuenta
                    + ", " + tipooperacion + ", " + cuitrabajador + ");";
        } //9. CAMBIO DE CHEQUE; 10. DEPOSITO
        //Lo hace cajero
        else if ((tipooperacion == 9 || tipooperacion == 10) && rol == 3) {
            //9. Mandar cuenta, idcheque, monto, idtrabajador y quien lo cambia
            //10. Mandar cuenta, idcheque, monto, idtrabajador y quien deposita
            consultaoperacion = "INSERT INTO OPERACION (FECHA, MONTO, NOMBRECAMBIOCHEQUE,"
                    + " IDCUENTA, IDTIPOOPERACION, IDTRABAJADOR)"
                    + "VALUES ('" + fechaHora + "', " + monto + ", '" + nombrecambiocheque
                    + "', " + idcuenta + ", " + tipooperacion + ", " + cuitrabajador + ");";
        } //TRANSFERENCIA
        //La hace el cliente o el cajero
        else if (tipooperacion == 11 && rol == 3) {
            //11. Mandar la cuenta, la cuenta a la que se transfiere, el monto y el id del trabajador
            consultaoperacion = "INSERT INTO OPERACION (FECHA, MONTO, CUENTATRANSFERENCIA,"
                    + " IDCUENTA, IDTIPOOPERACION, IDTRABAJADOR)"
                    + "VALUES ('" + fechaHora + "', " + monto + "," + cuentatransferencia
                    + ", '" + nombrecambiocheque + "', " + idcuenta + ", " + tipooperacion
                    + ", " + cuitrabajador + ");";
        } //12. Pago de prestamo
        //Lo hace el cliente o cajero
        else if (tipooperacion == 12) {
            //pago de prestamo
        } else {
            //operaciones de empresas
            //operaciones comunes (aceptar o rechazar prestamo)
        }

        System.out.println("*****Tipo de operacion: " + tipooperacion + "*****");

        try {
            resultSet1 = statement1.executeQuery(consultaoperacion);
            System.out.println("*****Operacion registrada*****");
            return true;
        } catch (Exception e) {
            //no se pudo acceder a la BD
            System.out.println("-----Error al consultar los datos-----");
            return false;
        }
    }
    
     */

 /*
    *
    ******************************CONTRASENA***********************************
    *
     */
    @WebMethod(operationName = "CambiarContrasena")
    public boolean cambiarContrasena(@WebParam(name = "actual") String actual,
            @WebParam(name = "nueva") String nueva, @WebParam(name = "CUI") long cui,
            @WebParam(name = "rol") int rol) {
        String consultabusqueda;
        String consultaUpdate;
        String passactual = null;
        String tipo;

        //Consultar si la nueva contrasena ya existe
        if (existeContrasena(nueva)) {
            return false;
        }

        if (rol == -1) {
            consultabusqueda = "SELECT * FROM CLIENTE WHERE CUI = " + cui + ";";
            tipo = "CLIENTE";
        } else {
            consultabusqueda = "SELECT * FROM TRABAJADOR WHERE CUI = " + cui + ";";
            tipo = "TRABAJADOR";
        }

        try {
            resultSet1 = statement1.executeQuery(consultabusqueda);

            //verifica que exista el cui
            while (resultSet1.next()) {
                passactual = resultSet1.getString("CONTRASENA");
            }
            //verifica que la contrasena corresponta al cui
            if (passactual.equals(actual)) {
                consultaUpdate = "UPDATE " + tipo + " SET CONTRASENA = '" + nueva
                        + "' WHERE CUI = " + cui + ";";
                resultSet1 = statement1.executeQuery(consultaUpdate);

                System.out.println("*****Contrasena cambiada*****");
                return true;
            }

            System.out.println("-----La contrasena actual o el cui es incorrectx-----");
            return false;

        } catch (Exception e) {
            System.out.println("-----Error al consultar los datos-----");
            return false;
        }
    }

    private String generarContrasena() {
        String contrasena = "";
        String[] alfabeto = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
            "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X",
            "Y", "Z"};
        Random numero = new Random();
        Random letra = new Random();

        while (contrasena.length() < 9) {
            contrasena += numero.nextInt(10);
            contrasena += numero.nextInt(10);
            contrasena += alfabeto[letra.nextInt(27)];
        }

        //Consultar si la contrasena ya existe
        if (existeContrasena(contrasena)) {
            generarContrasena();
        }

        return contrasena;
    }

    private boolean existeContrasena(String contrasena) {
        boolean existe = false;

        consulta = "SELECT * FROM CLIENTE WHERE CONTRASENA = '" + contrasena + "';";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            //verifica tabla usuario
            while (resultSet1.next()) {
                existe = true;
            }

            if (!existe) {
                consulta = "SELECT * FROM TRABAJADOR WHERE CONTRASENA = '" + contrasena + "';";
                resultSet1 = statement1.executeQuery(consulta);
                //verifica tabla Trabajador
                while (resultSet1.next()) {
                    existe = true;
                }
            }

            return existe;

        } catch (Exception e) {
            System.out.println("-----Error al consultar los datos-----");
            return false;
        }
    }

    /*
    *
    *********************************CLIENTES***********************************
    *
     */
    @WebMethod(operationName = "agregarClienteIndividual")
    public boolean agregarClienteIndividual(@WebParam(name = "cui") long cui,
            @WebParam(name = "usuario") String usuario,
            @WebParam(name = "nombre") String nombre,
            @WebParam(name = "apellido") String apellido,
            @WebParam(name = "nacimiento") String nacimiento) {
        String contrasena = generarContrasena();
        consulta = "INSERT INTO CLIENTE "
                + "VALUES (" + cui + ", '" + usuario + "', '" + contrasena + "', '"
                + nombre + "', '" + apellido + "', '" + nacimiento + "', 0);";

        try {
            //los puntos iniciales siempre son 0
            resultSet1 = statement1.executeQuery(consulta);

            System.out.println("*****Se ingreso un nuevo cliente individual*****");
            return true;
        } catch (Exception e) {
            System.out.println("-----Error al consultar los datos-----");
            return false;
        }
    }

    public ArrayList<Cliente> verificarDatosCliente() {

        long cui;
        String nombre;
        String apellido;
        String nacimiento;
        int puntos;
        double salario;

        Cliente cliente = null;
        ArrayList<Cliente> listaClientes = new ArrayList<Cliente>();

        consulta = "SELECT * FROM CLIENTE ";
        try {
            resultSet1 = statement1.executeQuery(consulta);
            //+ "WHERE CUI = 2650897270101;");

            while (resultSet1.next()) {
                cui = resultSet1.getLong("CUI");
                nombre = resultSet1.getString("NOMBRES");
                apellido = resultSet1.getString("APELLIDOS");
                nacimiento = resultSet1.getString("NACIMIENTO");
                puntos = resultSet1.getInt("PUNTOS");
                salario = resultSet1.getDouble("SALARIO");

                //cliente = new Cliente(cui, nombre, apellido, nacimiento, puntos, salario);
                listaClientes.add(cliente);
            }

            System.out.println("*****Se verificaron los nombres y apellidos*****");
            return listaClientes;
        } catch (Exception e) {
            System.out.println("-----Error de verificacion de nombres y apellidos-----");
            return null;
        }
    }

    @WebMethod(operationName = "mostrarDatosCliente")
    public Cliente mostrarDatosCliente(@WebParam(name = "cui") long cui) {
        consulta = "SELECT * FROM CLIENTE WHERE CUI = " + cui + ";";
        Cliente cliente = null;
        String usuario;
        String nombre;
        String apellido;
        String nacimiento;
        int puntos;

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                usuario = resultSet1.getString("USUARIO");
                nombre = resultSet1.getString("NOMBRES");
                apellido = resultSet1.getString("APELLIDOS");
                nacimiento = resultSet1.getString("NACIMIENTO");
                puntos = resultSet1.getInt("PUNTOS");

                cliente = new Cliente(cui, usuario, nombre, apellido, nacimiento, puntos);

            }
            return cliente;
        } catch (Exception e) {
            return null;
        }
    }

    @WebMethod(operationName = "actualizarDatosCliente")
    public String actualizarDatosCliente(@WebParam(name = "cui") long cui,
            @WebParam(name = "usuario") String usuario,
            @WebParam(name = "nombres") String nombres,
            @WebParam(name = "apellidos") String apellidos,
            @WebParam(name = "nacimiento") String nacimiento) {

        try {
            consulta = "UPDATE CLIENTE SET USUARIO = '" + usuario + "' WHERE CUI = " + cui + ";";
            resultSet1 = statement1.executeQuery(consulta);

            consulta = "UPDATE CLIENTE SET NOMBRES = '" + nombres + "' WHERE CUI = " + cui + ";";
            resultSet1 = statement1.executeQuery(consulta);

            consulta = "UPDATE CLIENTE SET APELLIDOS = '" + apellidos + "' WHERE CUI = " + cui + ";";
            resultSet1 = statement1.executeQuery(consulta);

            consulta = "UPDATE CLIENTE SET NACIMIENTO = '" + nacimiento + "' WHERE CUI = " + cui + ";";
            resultSet1 = statement1.executeQuery(consulta);

            return "Datos actualizados.";
        } catch (Exception e) {
            return "Error al tratar de actualizar los datos.";
        }

    }

    //Verifica que exista el cliente, de lo contrario solicita crear un cliente con 
    //valores por defecto
    private boolean clienteExiste(@WebParam(name = "cui") long cui) {
        boolean clienteExiste = false;
        consulta = "SELECT * FROM CLIENTE WHERE CUI = " + cui + ";";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                clienteExiste = true;
            }

            if (!clienteExiste) {
                clienteExiste = crearNuevoCliente(cui);

                if (!clienteExiste) {
                    return false;
                } else {
                    return true;
                }
            } else {
                return true;
            }

        } catch (Exception e) {
            System.out.println("-----Error al consultar los datos-----clienteExiste");
            return false;
        }
    }

    //Crea un cliente con valores por defecto
    private boolean crearNuevoCliente(long cui) {
        String contrasena = generarContrasena();
        consulta = "INSERT INTO CLIENTE VALUES (" + cui + ", '" + cui + "', '" + contrasena
                + "', '" + cui + "', '" + cui + "', '" + "1000-01-01" + "', " + "0"
                + ");";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            crearCuentaIndividual(cui, 0, 1);

            System.out.println("*****Se creo un nuevo cliente*****");
            return true;
        } catch (Exception e) {
            System.out.println("-----Error al consultar los datos-----crearNuevoCliente");
            return false;
        }
    }

    /*
    *
    *******************************TRABAJADOR***********************************
    *
     */
    @WebMethod(operationName = "agregarTrabajador")
    public boolean agregarTrabajador(@WebParam(name = "cui") long cui,
            @WebParam(name = "usuario") String usuario,
            @WebParam(name = "nombre") String nombre,
            @WebParam(name = "apellido") String apellido,
            @WebParam(name = "telefono") int telefono,
            @WebParam(name = "direccion") String direccion,
            @WebParam(name = "rol") int rol,
            @WebParam(name = "agencia") int agencia) {
        String contrasena = generarContrasena();
        consulta = "INSERT INTO TRABAJADOR "
                + "VALUES (" + cui + ", '" + usuario + "', '" + contrasena
                + "', '" + nombre + "', '" + apellido + "', " + telefono
                + ", '" + direccion + "', " + rol + ", " + agencia + ");";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            System.out.println("*****Nuevo trabajador agregado*****");
            return true;

        } catch (Exception e) {
            return false;
        }

    }

    /*
    *
    **********************************CUENTA************************************
    *
     */
    //**********FUNCIONAL, ESCALAR A CLIENTE NUEVO
    //Crea cuentas individuales y de ser necesario solicita la creacion de un nuevo cliente
    @WebMethod(operationName = "crearCuentaIndividual")
    public int crearCuentaIndividual(@WebParam(name = "cui") long cui,
            @WebParam(name = "monto") double monto,
            @WebParam(name = "tipoCuenta") int tipoCuenta) {
        int idcuenta = -1;

        if (clienteExiste(cui)) {
            //Crea e inserta una nueva cuenta individual
            idcuenta = insertarCuentaIndividual(monto, tipoCuenta);
            //Asigna Cliente en Cuenta
            asignarClienteCuenta(cui, idcuenta, 0);
        }

        return idcuenta;
    }

    @WebMethod(operationName = "crearCuentaIndividualNomina")
    public String crearCuentaIndividualNomina(@WebParam(name = "cui") long cui,
            @WebParam(name = "salario") long salario,
            @WebParam(name = "nomina") int nomina) {

        int idcuenta = -1;
        String mensaje = "";

        if (clienteExiste(cui)) {
            //Crea e inserta una nueva cuenta individual
            idcuenta = insertarCuentaIndividual(0, 1);
            mensaje = idcuenta + "; ";
            //Asigna Cliente a su Cuenta recien creada (monetaria)
            mensaje = asignarClienteCuenta(cui, idcuenta, 0) + "; ";
            //Asigna Cliente a la nomina
            mensaje += asignarClienteCuenta(cui, nomina, salario);
        }

        return mensaje;

    }

    //***********LISTO, FUNCIONAL, NO BORRAR
    //Inserta en BD la nueva cuenta
    private int insertarCuentaIndividual(double monto, int tipoCuenta) {
        int idcuenta = generarId();
        consulta = "INSERT INTO CUENTA (IDCUENTA, FONDOS, INDIVIDUALIDAD, IDTIPOCUENTA, IDESTADO) "
                + "VALUES (" + idcuenta + ", " + monto + ", 'V', " + tipoCuenta + ", 1);";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            System.out.println("*****Se inserto una nueva cuenta*****");
            return idcuenta;
        } catch (Exception e) {
            System.out.println("-----Error al consultar los datos-----insertarCuentaIndividual");
            return -1;
        }
    }

    //***********LISTO, FUNCIONAL, INDIVIDUAL Y NOMINA
    //Asigna una cuenta a un cliente
    @WebMethod(operationName = "asignarClienteCuenta")
    public String asignarClienteCuenta(@WebParam(name = "cui") long cui,
            @WebParam(name = "idcuenta") int idcuenta,
            @WebParam(name = "salario") double salario) {
        consulta = "INSERT INTO CLIENTECUENTA "
                + "VALUES (" + cui + ", " + idcuenta + ", " + salario + ");";
        try {
            resultSet1 = statement1.executeQuery(consulta);

            System.out.println("*****Asignacion CLIENTECUENTA realizada*****");
            return "Cliente agregado a la nomina.";
        } catch (Exception e) {
            System.out.println("-----Error al consultar los datos-----asignarClienteCuenta");
            return "Error al consultar los datos.";
        }
    }

    @WebMethod(operationName = "asignarClienteCuentaMonetaria")
    public String asignarClienteCuentaMonetaria(@WebParam(name = "cui") long cui,
            @WebParam(name = "idcuenta") int idcuenta,
            @WebParam(name = "salario") double salario,
            @WebParam(name = "nomina") int nomina) {
        boolean esmonetaria = false;

        consulta = "SELECT C.IDTIPOCUENTA FROM CUENTA C INNER JOIN TIPOCUENTA T "
                + "ON C.IDTIPOCUENTA = T.IDTIPOCUENTA "
                + "AND NOMBRE = 'MONETARIA' "
                + "AND IDCUENTA = " + idcuenta + ";";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                esmonetaria = true;
            }
            if (esmonetaria) {
                return asignarClienteCuenta(cui, nomina, salario);
            } else {
                return "La cuenta no es monetaria";
            }
        } catch (Exception e) {
            return "Error al consultar los datos";
        }

    }

    @WebMethod(operationName = "insertarNomina")
    public int insertarNomina(@WebParam(name = "monto") double monto,
            @WebParam(name = "cuiPresidente") long cuiPresidente,
            @WebParam(name = "cuiVice") long cuiVice,
            @WebParam(name = "cuiContador") long cuiContador,
            @WebParam(name = "sueldoPresidente") double sueldoPresidente,
            @WebParam(name = "sueldoVice") double sueldoVice,
            @WebParam(name = "sueldoContador") double sueldoContador) {
        int idcuenta = -1;
        boolean asignados = false;
        boolean encargado1 = clienteExiste(cuiPresidente);
        boolean encargado2 = clienteExiste(cuiVice);
        boolean encargado3 = clienteExiste(cuiContador);

        if (encargado1 && encargado2 && encargado3) {
            idcuenta = generarId();
            consulta = "INSERT INTO CUENTA (IDCUENTA, FONDOS, INDIVIDUALIDAD, IDTIPOCUENTA,"
                    + " IDESTADO, CUIPRESIDENTE, CUIVICEPRESIDENTE, CUICONTADOR) "
                    + "VALUES (" + idcuenta + ", " + monto + ", 'F', " + 1 + ", " + 1
                    + ", " + cuiPresidente + ", " + cuiVice + ", " + cuiContador + ");";

            try {
                resultSet1 = statement1.executeQuery(consulta);
                System.out.println("*****Se inserto una nueva NOMINA*****");

                asignados = asignarEncargados(idcuenta, cuiPresidente, cuiVice,
                        cuiContador, sueldoPresidente, sueldoVice, sueldoContador);

                if (asignados) {
                    System.out.println("*****La cuenta ha sido creada*****");
                    return idcuenta;
                }

                return -1;

            } catch (Exception e) {
                System.out.println("-----Error al consultar los datos-----insertarNomina");
                return -1;
            }
        }

        return idcuenta;
    }

    private boolean asignarEncargados(int idcuenta, long cuiPresidente, long cuiVice,
            long cuiContador, double sueldoPresidente, double sueldoVice, double sueldoContador) {

        try {
            //asigna al presidente
            consulta = "INSERT INTO CLIENTECUENTA VALUES (" + cuiPresidente + ", "
                    + idcuenta + ", " + sueldoPresidente + ");";
            resultSet1 = statement1.executeQuery(consulta);

            //asigna al vicepresidente
            consulta = "INSERT INTO CLIENTECUENTA VALUES (" + cuiVice + ", "
                    + idcuenta + ", " + sueldoVice + ");";
            resultSet1 = statement1.executeQuery(consulta);

            //asigna al contador
            consulta = "INSERT INTO CLIENTECUENTA VALUES (" + cuiContador + ", "
                    + idcuenta + ", " + sueldoContador + ");";
            resultSet1 = statement1.executeQuery(consulta);

            System.out.println("*****Encargados asignados*****");
            return true;
        } catch (Exception e) {
            System.out.println("-----Error al consultar los datos-----asignarEncargados");
            return false;
        }
    }

    /*
    *
    *********************************LISTAS PREDEFINIDAS************************
    *
     */
    @WebMethod(operationName = "mostrarEstados")
    public ArrayList<String> mostarEstados() {
        ArrayList<String> listaEstados = new ArrayList<String>();
        String nombre;
        String consulta = "SELECT NOMBRE FROM ESTADO;";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                nombre = resultSet1.getString("NOMBRE");
                listaEstados.add(nombre);
            }

            System.out.println("*****Mostrar ListaEstados enviada*****");
            return listaEstados;
        } catch (Exception e) {
            System.out.println("----Error al consultar los datos-----");
            return null;
        }
    }

    @WebMethod(operationName = "mostrarRoles")
    public ArrayList<String> mostrarRoles() {
        ArrayList<String> listaRoles = new ArrayList<String>();
        String nombre;
        String consulta = "SELECT NOMBRE FROM ROL;";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                nombre = resultSet1.getString("NOMBRE");
                listaRoles.add(nombre);
            }

            System.out.println("*****Mostrar ListaRoles enviada*****");
            return listaRoles;
        } catch (Exception e) {
            System.out.println("----Error al consultar los datos-----");
            return null;
        }
    }

    @WebMethod(operationName = "mostrarAgencias")
    public ArrayList<String> mostrarAgencias() {
        ArrayList<String> listaTipos = new ArrayList<String>();
        String nombre;
        String consulta = "SELECT NOMBRE FROM AGENCIA;";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                nombre = resultSet1.getString("NOMBRE");
                listaTipos.add(nombre);
            }

            System.out.println("*****Mostrar ListaAgencia enviada*****");
            return listaTipos;
        } catch (Exception e) {
            System.out.println("----Error al consultar los datos-----");
            return null;
        }
    }

    @WebMethod(operationName = "mostrarTiposCuenta")
    public ArrayList<String> mostrarTiposCuenta() {
        ArrayList<String> listaTipos = new ArrayList<String>();

        String nombre;
        String consulta = "SELECT NOMBRE FROM TIPOCUENTA;";
        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                nombre = resultSet1.getString("NOMBRE");
                listaTipos.add(nombre);
            }

            System.out.println("*****Mostrar ListaTipoCuenta enviada*****");
            return listaTipos;
        } catch (Exception e) {
            System.out.println("----Error al consultar los datos-----");
            return null;
        }
    }

    @WebMethod(operationName = "mostrarTiposOperacion")
    public ArrayList<String> mostrarTiposOperacion() {
        ArrayList<String> listaTiposO = new ArrayList<String>();
        String nombre;
        String consulta = "SELECT NOMBRE FROM TIPOOPERACION;";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                nombre = resultSet1.getString("NOMBRE");
                listaTiposO.add(nombre);
            }

            System.out.println("*****Mostrar ListaTipoOperacion enviada*****");
            return listaTiposO;
        } catch (Exception e) {
            System.out.println("----Error al consultar los datos-----");
            return null;
        }
    }

    @WebMethod(operationName = "mostrarCuenta")
    public Cuenta mostrarCuenta(@WebParam(name = "idcuenta") int idcuenta) {
        consulta = "SELECT * FROM CUENTA WHERE IDCUENTA = " + idcuenta + ";";
        Cuenta cuenta = null;
        int id;
        double fondos;
        String individualidad;
        int tipo;
        int estado;
        long cuiPresidente;
        long cuiVice;
        long cuiContador;

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                id = resultSet1.getInt("IDCUENTA");
                fondos = resultSet1.getDouble("FONDOS");
                individualidad = resultSet1.getString("INDIVIDUALIDAD");
                tipo = resultSet1.getInt("IDTIPOCUENTA");
                estado = resultSet1.getInt("IDESTADO");

                if (individualidad.equalsIgnoreCase("V")) {
                    cuenta = new Cuenta(id, fondos, individualidad, tipo, estado);
                } else {
                    cuiPresidente = resultSet1.getLong("CUIPRESIDENTE");
                    cuiVice = resultSet1.getLong("CUIVICEPRESIDENTE");
                    cuiContador = resultSet1.getLong("CUICONTADOR");

                    cuenta = new Cuenta(id, fondos, individualidad, tipo, estado,
                            cuiPresidente, cuiVice, cuiContador);
                }
            }

            System.out.println("*****Se envio cuenta*****");
            return cuenta;

        } catch (Exception e) {
            System.out.println("-----Error al consultar los datos-----");
            return cuenta;
        }
    }

    @WebMethod(operationName = "mostrarCuentaPropietario")
    public Cuenta mostrarCuentaPropietario(@WebParam(name = "idcuenta") int idcuenta) {
        consulta = "SELECT CUICLIENTE FROM CLIENTECUENTA WHERE IDCUENTA = " + idcuenta + ";";
        long cuipropietario = -1;
        String propietario = null;
        Cuenta cuenta;

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                cuipropietario = resultSet1.getLong("CUICLIENTE");
            }
        } catch (Exception e) {
            return null;
        }

        consulta = "SELECT NOMBRES FROM CLIENTE WHERE CUI = " + cuipropietario + ";";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                propietario = resultSet1.getString("NOMBRES");
            }
        } catch (Exception e) {
            return null;
        }

        cuenta = mostrarCuenta(idcuenta);

        cuenta = new Cuenta(idcuenta, cuenta.getEstado(), cuipropietario, propietario);

        System.out.println("*****Se envio CuentaPropietario*****");
        return cuenta;

    }

    @WebMethod(operationName = "mostrarModalidadesPago")
    public ArrayList<ModalidadPagoPrestamo> mostrarModalidadesPago() {
        ArrayList<ModalidadPagoPrestamo> listaModalidades = new ArrayList<ModalidadPagoPrestamo>();
        ModalidadPagoPrestamo modalidad;
        int id;
        String nombre;
        String descripcion;
        String consulta = "SELECT * FROM MODALIDADPAGO;";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                id = resultSet1.getInt("IDMODALIDAD");
                nombre = resultSet1.getString("NOMBRE");
                descripcion = resultSet1.getString("DESCRIPCION");
                modalidad = new ModalidadPagoPrestamo(id, nombre, descripcion);
                listaModalidades.add(modalidad);
            }

            System.out.println("*****Mostrar listaModalidades enviada*****");
            return listaModalidades;
        } catch (Exception e) {
            System.out.println("----Error al consultar los datos-----");
            return null;
        }
    }

    //@WebMethod(operationName = "mostrarTiposPrestamo")
    public ArrayList<String> mostrarTiposPrestamo() {
        ArrayList<String> listaTiposPrestamo = new ArrayList<String>();
        String nombre;
        String consulta = "SELECT NOMBRE FROM TIPOPRESTAMO;";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                nombre = resultSet1.getString("NOMBRE");
                listaTiposPrestamo.add(nombre);
            }

            System.out.println("*****Mostrar listaTiposPrestamo enviada*****");
            return listaTiposPrestamo;
        } catch (Exception e) {
            System.out.println("----Error al consultar los datos-----");
            return null;
        }
    }

    @WebMethod(operationName = "mostrarNominas")
    public ArrayList<Integer> mostrarNominas(@WebParam(name = "CUI") long cui) {
        consulta = "SELECT IDCUENTA FROM CUENTA WHERE "
                + "INDIVIDUALIDAD = 'F' "
                + "AND(CUIPRESIDENTE = " + cui
                + " OR CUIVICEPRESIDENTE = " + cui
                + " OR CUICONTADOR = " + cui + ");";
        int idcuenta = -1;
        ArrayList<Integer> listaNominas = new ArrayList<Integer>();

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                idcuenta = resultSet1.getInt("IDCUENTA");
                listaNominas.add(idcuenta);
            }

            return listaNominas;
        } catch (Exception e) {
            return listaNominas;
        }

    }

    /*
    *
    ********************************IDENTIFICADORES*****************************
    *
     */
    private int generarId() {
        int id;
        String strId = "";
        Random random = new Random();

        for (int i = 0; i < 8; i++) {
            id = random.nextInt(10);
            strId += id;
        }

        id = Integer.parseInt(strId);

        if (existeIdCuenta(id)) {
            generarId();
        }

        return id;
    }

    private boolean existeIdCuenta(int id) {
        consulta = "SELECT * FROM CUENTA WHERE IDCUENTA = " + id + ";";
        boolean existe = false;

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                existe = true;
            }

            System.out.println("*****No existe el idcuenta*****");
            return existe;
        } catch (Exception e) {
            System.out.println("-----Error al consultar los datos-----");
            return false;
        }
    }

    /*
    *
    ***********************************AGENCIA**********************************
    *
     */
    @WebMethod(operationName = "nuevaAgencia")
    public boolean nuevaAgencia(@WebParam(name = "nombre") String nombre,
            @WebParam(name = "direccion") String direccion, @WebParam(name = "fondos") double fondos) {
        consulta = "INSERT INTO AGENCIA (NOMBRE, DIRECCION, FONDOS) "
                + "VALUES ('" + nombre + "', '" + direccion + "', " + fondos + ");";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            System.out.println("*****Se inserto una nueva agencia*****");
            return true;

        } catch (Exception e) {
            System.out.println("-----Error al consultar los datos-----");
            return false;
        }
    }

    /*
    *
    *********************************PRESTAMO***********************************
    *
     */
    @WebMethod(operationName = "solicitarPrestamo")
    public boolean solicitarPrestamo(@WebParam(name = "cui") long cui,
            @WebParam(name = "monto") double monto,
            @WebParam(name = "tipo") int tipo,
            @WebParam(name = "modalidad") int modalidad) {

        consulta = "INSERT INTO PRESTAMO (CUICLIENTE, MONTO, SALDO, IDESTADOPRESTAMO,"
                + " IDMODALIDADPAGO, IDTIPOPRESTAMO)"
                + " VALUES(" + cui + ", " + monto + ", " + monto + ", " + 1
                + ", " + modalidad + ", " + tipo + ");";

        try {
            resultSet1 = statement1.executeQuery(consulta);

            System.out.println("*****Se ingreso solicitud de prestamo*****");
            return true;
        } catch (Exception e) {
            System.out.println("-----Error al consultar los datos");
            return false;
        }
    }

    /*
    *
    **********************************CHEQUES***********************************
    *
     */
    @WebMethod(operationName = "solicitarChequera")
    public boolean solicitarChequera(@WebParam(name = "idcuenta") int idcuenta) {
        consulta = "SELECT IDCUENTA, NOMBRE FROM CUENTA C INNER JOIN TIPOCUENTA T "
                + "ON C.IDTIPOCUENTA = T.IDTIPOCUENTA WHERE NOMBRE = 'MONETARIA' "
                + "AND IDCUENTA = " + idcuenta + ";";
        boolean existe = false;

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                existe = true;
            }

            if (existe) {

                boolean cheques = insertarCheques(idcuenta, 1);

                if (cheques) {
                    return true;
                } else {
                    return false;
                }

            } else {
                return false;
            }

        } catch (Exception e) {
            return false;
        }
    }

    private boolean insertarCheques(int idcuenta, int iterador) {
        try {
            for (int idcheque = iterador; idcheque < (iterador + 25); idcheque++) {
                consulta = "INSERT INTO CHEQUE VALUES (" + idcheque + ", "
                        + idcuenta + ", " + 1 + ")";
                resultSet1 = statement1.executeQuery(consulta);
            }
            return true;
        } catch (Exception e) {
            return insertarCheques(idcuenta, iterador + 25);
        }
    }

    //*******************************ESTADOS DE CUENTA**************************
    @WebMethod(operationName = "mostrarEstadoCuenta")
    public ArrayList<EstadoCuenta> mostrarEstadoCuenta(@WebParam(name = "idcuenta") int idcuenta,
            @WebParam(name = "fechainicio") String fechainicio,
            @WebParam(name = "fechafinal") String fechafinal,
            @WebParam(name = "debehaber") String debeOhaber) {

        if (debeOhaber.equals("debe")) {
            consulta = "SELECT O.FECHA, O.MONTO, T.NOMBRE FROM OPERACION O INNER JOIN TIPOOPERACION T "
                    + "ON O.IDTIPOOPERACION = T.IDTIPOOPERACION "
                    + "WHERE O.IDCUENTA = " + idcuenta + " "
                    + "AND (T.NOMBRE = 'CAMBIO DE CHEQUE' "
                    + "OR T.NOMBRE = 'RETIRO' "
                    + "OR T.NOMBRE = 'TRANSFERENCIA') "
                    + "AND (O.FECHA BETWEEN '" + fechainicio + "' AND '" + fechafinal + "');";
        } else if (debeOhaber.equals("haber")) {
            consulta = "SELECT O.FECHA, O.MONTO, "
                    + "T.NOMBRE FROM OPERACION O INNER JOIN TIPOOPERACION T "
                    + "ON O.IDTIPOOPERACION = T.IDTIPOOPERACION "
                    + "WHERE ((O.IDCUENTA = " + idcuenta + " "
                    + "AND T.NOMBRE = 'DEPOSITO' ) "
                    + "OR (O.CUENTATRANSFERENCIA = " + idcuenta + " AND T.NOMBRE = 'TRANSFERENCIA')) "
                    + "AND (O.FECHA BETWEEN '" + fechainicio + "' AND '" + fechafinal + "');";
        }

        ArrayList<EstadoCuenta> estado = new ArrayList<EstadoCuenta>();
        EstadoCuenta registro;
        String fecha;
        long monto;
        String operacion;

        try {
            resultSet1 = statement1.executeQuery(consulta);

            while (resultSet1.next()) {
                fecha = resultSet1.getString("FECHA");
                monto = resultSet1.getLong("MONTO");
                operacion = resultSet1.getString("NOMBRE");
                registro = new EstadoCuenta(fecha, operacion, monto);
                System.out.println("*****nodo agregado********");
                estado.add(registro);
            }
            System.out.println("***********lista devuelta***********");
            return estado;
        } catch (Exception e) {
            System.out.println("-----------error lista------------");
            return estado;
        }
    }

}
