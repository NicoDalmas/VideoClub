package videoclub.ui;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.sun.enterprise.deployment.runtime.web.Servlet;


public class ConnectionServlet extends Servlet {

    private static String driverName = "sun.jdbc.odbc.JdbcOdbcDriver";   
    private static Connection con;
    
    public static Connection getConnection() {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            try {
                con = DriverManager.getConnection("jdbc:odbc:VideoClub");
            } catch (SQLException ex) {
                // log an exception. fro example:
                System.out.println("Failed to create the database connection."); 
                ex.printStackTrace();
            }
        } catch (ClassNotFoundException ex) {
            // log an exception. for example:
            System.out.println("Driver not found.");
            ex.printStackTrace();
        }
        return con;
    }
}