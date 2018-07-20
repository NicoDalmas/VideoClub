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

import javax.servlet.RequestDispatcher;

public class VerReservasServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		try {
			Connection con = null;
			try {
				con = DBConnection.getConnection();
				Statement st2 = con.createStatement();
				
				List<Reserva> reservas = new ArrayList<Reserva>();
				ResultSet rs2 = st2.executeQuery("SELECT * FROM (Reservas" +
						" INNER JOIN Peliculas ON Reservas.idPelicula = Peliculas.idPelicula)" +
						" INNER JOIN Usuarios ON Reservas.idUsuario = Usuarios.ID WHERE Reservas.fechaDevolucion is null");
				while (rs2.next()) {
					Reserva r = new Reserva();
					r.setTitulo(rs2.getString("titulo"));
					r.setUsuario(rs2.getString("Login"));
					r.setFechaReserva(rs2.getString("fechaReserva"));
					r.setIdReserva(rs2.getInt("idReserva"));
					reservas.add(r);
			
				}
				request.setAttribute("reservas", reservas);
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsps/reservas.jsp");
				rd.forward(request, response);
			} finally {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
