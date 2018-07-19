package videoclub.ui;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection{

    private static Connection con;
    
    public static Connection getConnection() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            try {
                con = DriverManager.getConnection("jdbc:odbc:VideoClub");
            } catch (SQLException ex) {
                // log an exception. fro example:
                System.out.println("Hubo un error al crear la conexion a la base de datos"); 
                ex.printStackTrace();
            }
        } catch (ClassNotFoundException ex) {
            // log an exception. for example:
            System.out.println("No funciona el Driver de conexion a la BD.");
            ex.printStackTrace();
        }
        return con;
    }
}