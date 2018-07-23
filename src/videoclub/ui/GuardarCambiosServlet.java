package videoclub.ui;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuardarCambiosServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		try{
			Connection con = null;
			try{
				con = DBConnection.getConnection();
				Usuario u = new Usuario(request.getParameter("txtNombre"), request.getParameter("txtPassword"), request.getParameter("txtNombreReal"), request.getParameter("txtTelefono"), request.getParameter("txtDireccion"));

				if(request.getParameter("txtNombre") != "" && request.getParameter("txtPassword") != "" && request.getParameter("txtPassword2") != "" && request.getParameter("txtNombreReal") != "" && request.getParameter("txtTelefono") != "" && request.getParameter("txtDireccion") != ""   )
				{
					RequestDispatcher rd;
					if(request.getParameter("txtPassword").equals(request.getParameter("txtPassword2")))
					{
						Statement st = con.createStatement();

						int ra = st.executeUpdate("UPDATE Usuarios set Nombre='"+ request.getParameter("txtNombreReal") +"', Clave='"+ request.getParameter("txtPassword") +"', Direccion='" + request.getParameter("txtDireccion") +"', Telefono='"+ request.getParameter("txtTelefono") +"' WHERE Login ='"+ request.getParameter("txtNombre") + "'");
	
						rd = request.getRequestDispatcher("/WEB-INF/jsps/exito.jsp");
					}
					else
					{ 
						request.setAttribute("usuario", u);
						request.setAttribute("mensaje","Las claves no son iguales");
						rd = request.getRequestDispatcher("/WEB-INF/jsps/modificarUsuario.jsp"); 
					}
				rd.forward(request, response);
				}
				else
				{
					request.setAttribute("usuario", u);
					request.setAttribute("mensaje","Todos los campos son obligatorios");
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsps/modificarUsuario.jsp");
					rd.forward(request, response); 
				}
			}
			finally{
				con.close();
			}
		}catch(SQLException e) {
			RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
			e.printStackTrace();
		}
	}
}
