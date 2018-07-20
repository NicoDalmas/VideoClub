package videoclub.ui;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VolverServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		try {
			Connection con = null;
			try {
				con = DBConnection.getConnection();
				String nombre = request.getParameter("txtNombre");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("SELECT * FROM Usuarios WHERE Login = '"+nombre+"'");
				Statement st2 = con.createStatement();
			
				List<Pelicula> peliculas = new ArrayList<Pelicula>();
				ResultSet rs2 = st2.executeQuery("SELECT * FROM Peliculas");
				while (rs2.next()) {
					Pelicula p = new Pelicula(rs2.getInt("idPelicula"),rs2.getString("titulo"), rs2.getString("genero"),rs2.getString("sinopsis"));
					
			
					peliculas.add(p);
				}
			
				request.setAttribute("peliculas", peliculas);
				if (rs.next()) {
					String admin = rs.getString("admin");
					RequestDispatcher rd;
					if ( admin.equals("admin"))
						{
						rd = request.getRequestDispatcher("/WEB-INF/jsps/bienvenidoAdmin.jsp");
						}
					else
						{
						rd = request.getRequestDispatcher("/WEB-INF/jsps/bienvenido.jsp");
						
						}
					request.setAttribute("r_nombre", rs.getString("login"));
					request.setAttribute("r_id", rs.getString("id"));
					rd.forward(request, response);
				} 
			}finally{
				con.close();	
			}	
		}catch(SQLException e) {
			RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
			e.printStackTrace();
		}
	}
}
