package videoclub.ui;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CerrarReservaServlet extends HttpServlet{
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
				Calendar calendario = new GregorianCalendar();
				
				int año = calendario.get(Calendar.YEAR);
				int mes = calendario.get(Calendar.MONTH);
				int dia = calendario.get(Calendar.DAY_OF_MONTH);
				String fechaCierreReserva = dia + "/" + mes + "/" + año;
			
				String idReservaMarcada[];
				idReservaMarcada = request.getParameterValues("chxReservas");
				if (idReservaMarcada.length == 0)// if valida que haya seleccionado al menos una reserva
					{
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			
					rd.forward(request, response);
					} 
				else 
					{
						for (int i = 0; i < idReservaMarcada.length; i++) {
							int aux99;
							aux99 = Integer.parseInt(idReservaMarcada[i]);
							Statement st2 = con.createStatement();
							int ra2 = st2
							.executeUpdate("UPDATE Reservas SET fechaDevolucion='"+fechaCierreReserva+"' WHERE idReserva="+aux99);
							}// fin for
						RequestDispatcher rd = request
						.getRequestDispatcher("/WEB-INF/jsps/exito.jsp");
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
