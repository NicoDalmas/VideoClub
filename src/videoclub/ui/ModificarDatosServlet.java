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

public class ModificarDatosServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Connection con = null;
		try{
			con = ConnectionServlet.getConnection();
			String idUsuario = request.getParameter("txtIdUsuario");
			
			Statement st = con.createStatement();
			
			List<Usuario> usuario = new ArrayList<Usuario>();
			
			ResultSet rs = st.executeQuery("SELECT Login, Clave,Nombre,Telefono,Direccion FROM Usuarios WHERE ID=" + idUsuario);
			if (rs.next()) {
					Usuario u = new Usuario();
					u.setLogin(rs.getString("Login"));
					u.setClave(rs.getString("Clave"));
					u.setNombre(rs.getString("Nombre"));
					u.setTelefono(rs.getString("Telefono"));
					u.setDireccion(rs.getString("Direccion"));
//					usuario.add(u);
					RequestDispatcher rd = request
					.getRequestDispatcher("/WEB-INF/jsps/modificarUsuario.jsp");
					request.setAttribute("usuario",u);
					rd.forward(request, response);
					}
		}catch(SQLException e) {
				e.printStackTrace();
		}
	}
}
