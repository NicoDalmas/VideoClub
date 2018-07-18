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

public class ReservaServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Connection con = null;
		try{
			con = ConnectionServlet.getConnection();
			String totalPelicula = request.getParameter("txtContador");
			int totalPelicula2 = Integer.parseInt(totalPelicula);
		
			String[] idPeliculaMarcado;
		
			int aux = 1;
		
			String idUsuario = request.getParameter("txtIdUsuario");
			Calendar calendario = new GregorianCalendar();
		
			int año = calendario.get(Calendar.YEAR);
			int mes = calendario.get(Calendar.MONTH);
			int dia = calendario.get(Calendar.DAY_OF_MONTH);
			String fechaReserva = dia + "/" + mes + "/" + año;
			idPeliculaMarcado = request.getParameterValues("chxReserva");
			try {
				if (null == idPeliculaMarcado ){}// if valida que haya
			} catch(NullPointerException e) {
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsps/bienvenido.jsp");
				rd.forward(request, response);
			}
			Statement st = con.createStatement();
			ResultSet ra = st.executeQuery("SELECT COUNT(*) as total FROM RESERVAS WHERE idUsuario ="+idUsuario+" and fechaDevolucion is null");
			if (ra.next()) {
				int resultado = ra.getInt("total");
				if (resultado > 1) {
					RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
					rd.forward(request, response);
				} else {
					for (int i = 0; i < idPeliculaMarcado.length; i++) {
						// IF cargar reserva
						int aux99;
						aux99 = Integer.parseInt(idPeliculaMarcado[i]);
							Statement st2 = con.createStatement();
							int ra2 = st2
									.executeUpdate("INSERT INTO Reservas (idPelicula,idUsuario,fechaReserva) values ('"
											+ aux99
											+ "','"
											+ idUsuario
											+ "','"
											+ fechaReserva
											+ "')");
					}// fin for
					RequestDispatcher rd = request
							.getRequestDispatcher("/WEB-INF/jsps/exito.jsp");
	
					rd.forward(request, response);
				}// fin else cuenta reservas marcadas
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}