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

public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	  throws ServletException, java.io.IOException{
		//RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsps/bienvenidoAdmin.jsp");
		//rd.forward(request, response);
		response.sendRedirect("http://localhost:8084/VideoClub/bienvenidoAdmin.jsp");
	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		try {
			Connection con = null;
			try {
				con = DBConnection.getConnection();
				
				String boton = request.getParameter("btnEnviar");
				/* IF VOLVER */
				if (boton.equals("volver")) {
					// fin carga driver
					
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
				}
				/* FIN IF VOLVER */
				
				/* IF LOGIN */
				if (boton.equals("Enviar")) {
					// fin carga driver
					// crear coneccion

					// fin coneccion
					String nombre = request.getParameter("txtNombre");
					String clave = request.getParameter("txtPassword");
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("SELECT * FROM Usuarios WHERE Login ='" + nombre + "' and Clave ='" + clave + "'");
					Statement st2 = con.createStatement();

					List<Pelicula> peliculas = new ArrayList<Pelicula>();
					ResultSet rs2 = st2.executeQuery("SELECT * FROM Peliculas");
					while (rs2.next()) {
						Pelicula p = new Pelicula(rs2.getInt("idPelicula"),rs2.getString("titulo"), rs2.getString("genero"),rs2.getString("sinopsis"));
						/*Pelicula p = new Pelicula();
						p.setTitulo(rs2.getString("titulo"));
						p.setSinopsis(rs2.getString("sinopsis"));
						p.setGenero(rs2.getString("genero"));
						p.setIdPelicula(rs2.getInt("idPelicula"));*/
						
						// se usa un constructor 
						
						peliculas.add(p);
					}
					// }

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
					} else {
						RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
						request.setAttribute("mensaje",	"error de clave o usuario");
						rd.forward(request, response);
					}
				}
				/* FIN IF LOGIN */
				/* IF VOLVER */
				if (boton.equals("volver")) {
					// fin carga driver
					// crear coneccion

					// fin coneccion
					String nombre = request.getParameter("txtNombre");
					
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("SELECT * FROM Usuarios WHERE Login ='" + nombre + "'");
					Statement st2 = con.createStatement();

					List<Pelicula> peliculas = new ArrayList<Pelicula>();
					ResultSet rs2 = st2.executeQuery("SELECT * FROM Peliculas");
					while (rs2.next()) {
						Pelicula p = new Pelicula(rs2.getInt("idPelicula"),rs2.getString("titulo"), rs2.getString("genero"),rs2.getString("sinopsis"));
						peliculas.add(p);
					}
					// }

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
					} else {
						RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
						request.setAttribute("mensaje", "error de clave o usuario");
						rd.forward(request, response);
					}
				}
				/* FIN IF VOLVER */
				/* IF INVITADO */
				if (boton.equals("Invitado")) {

					Statement st2 = con.createStatement();

					List<Pelicula> peliculas = new ArrayList<Pelicula>();
					ResultSet rs2 = st2.executeQuery("SELECT * FROM Peliculas");
					while (rs2.next()) {
						Pelicula p = new Pelicula(rs2.getInt("idPelicula"),rs2.getString("titulo"), rs2.getString("genero"),rs2.getString("sinopsis"));
						peliculas.add(p);

					}
					request.setAttribute("peliculas", peliculas);
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsps/invitado.jsp");
					rd.forward(request, response);
				}
				/* FIN IF INVITADO */
				/* IF VER RESERVAS */
				if (boton.equals("VerReservas")) {

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
				}
				/* FIN IF VER RESERVAS */
				/* IF NUEVO USUARIO */
				else if (boton.equals("NuevoUsuario")) {
					// fin carga driver
					// crear coneccion
					// fin coneccion
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
					
											RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsps/exito.jsp");
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
				/* FIN IF NUEVO USUARIO */
				/* IF Modificar Datos */
				/*else if (boton.equals("ModificarDatos")) {
								// fin carga driver
								// crear coneccion
								// fin coneccion
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
//										usuario.add(u);
										RequestDispatcher rd = request
										.getRequestDispatcher("/WEB-INF/jsps/modificarUsuario.jsp");
										request.setAttribute("usuario",u);
										rd.forward(request, response);
										}
						}*/
				/* FIN IF Modificar Datos */
				/* IF GUARDAR CAMBIOS */
				else if (boton.equals("GuardarCambios")) {
					// fin carga driver
					// crear coneccion
					// fin coneccion
					/*String login = request.getParameter("txtNombre");
					String clave = request.getParameter("txtPassword");
					String clave2 = request.getParameter("txtPassword2");
					String nombre = request.getParameter("txtNombreReal");
					String telefono = request.getParameter("txtTelefono");
					String direccion = request.getParameter("txtDireccion");
					SE USA EL CONSTRUCTOR DEL USUARIO
					*/
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
					/* FIN IF GUARDAR CAMBIOS */
					// IF RESERVAR

				/*else if (boton.equals("reservar")) {
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
						RequestDispatcher rd = request
						.getRequestDispatcher("/WEB-INF/jsps/bienvenido.jsp");

						rd.forward(request, response);
						} 
						Statement st = con.createStatement();
						ResultSet ra = st
								.executeQuery("SELECT COUNT(*) as total FROM RESERVAS WHERE idUsuario ="+idUsuario+" and fechaDevolucion is null");
						if (ra.next()) {
							int resultado = ra.getInt("total");
							if (resultado > 1) {
								RequestDispatcher rd = request
										.getRequestDispatcher("/error.jsp");
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
					// finif valida que haya reservado una pelicula
				}// FIN IF RESERVAR
				// IF CERRAR RESERVAS
				*//*else if (boton.equals("CerrarReservas")) {

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
				}*/// FIN IF CERRAR RESERVAS
				else {
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
					rd.forward(request, response);
				}
			} finally {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void getRequestDispatcher(String string) {
		// TODO Auto-generated method stub
		
	}
}
