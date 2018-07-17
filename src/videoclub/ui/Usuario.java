package videoclub.ui;

public class Usuario {

	private String login;

	public Usuario(String login, String clave,String nombre, String telefono, String direccion){
		this.login = login;
		this.clave = clave;
		this.nombre = nombre;
		this.telefono = telefono;
		this.direccion = direccion;
	}
	
	public Usuario(){

	}
	
	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	private String clave;
	
	private String nombre;
	
	private String telefono;
	
	private String direccion;

	public void setLogin(String login) {
		this.login = login;
	}

	public String getLogin() {
		return login;
	}

}

