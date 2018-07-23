package videoclub.ui;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NuevoUsuarioServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		try{
			Connection con = null;
			try{
				con = DBConnection.getConnection();
				String login = request.getParameter("txtNombreUsu");
				String clave = request.getParameter("txtPassword");
				String clave2 = request.getParameter("txtPassword2");
				String nombre = request.getParameter("txtNombre");
				String telefono = request.getParameter("txtTelefono");
				String direccion = request.getParameter("txtDireccion");
				
				Statement st = con.createStatement();
				
				ResultSet rs = st.executeQuery("SELECT Login FROM Usuarios WHERE Login ='"+ login + "'");
				if (rs.next()) {
									RequestDispatcher rd = request.getRequestDispatcher("/nuevoUsuario.jsp");
									request.setAttribute("mensaje",	"Ya existe ese nombre de usuario");
									rd.forward(request, response);
								}
				else {
								Statement st2 = con.createStatement();
								if(login != "" && clave != "" && clave2 != "" && nombre != "" && telefono != "" && direccion != ""  )
								{
									if(clave.equals(clave2))
										{
										int ra3 = st2.executeUpdate("INSERT INTO Usuarios (Login,Clave,Nombre,Telefono,Direccion,admin) values ('"
												+ login + "','" + clave + "','" + nombre + "','" + telefono + "','" + direccion + "','No')");
				
										RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsps/usuariocreado.jsp");
										rd.forward(request, response);
										}
									else
										{
										RequestDispatcher rd = request.getRequestDispatcher("/nuevoUsuario.jsp");
										request.setAttribute("mensaje", "las claves no son iguales");
										rd.forward(request, response);												
										}
									}
								else
									{
										RequestDispatcher rd = request.getRequestDispatcher("/nuevoUsuario.jsp");
										request.setAttribute("mensaje","todos los campos son obligatorios");
										rd.forward(request, response);
									}
					}
			}
			finally{
				con.close();
			}
		}
		catch(SQLException e) {
			RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
			e.printStackTrace();
		}
	}
	
}
