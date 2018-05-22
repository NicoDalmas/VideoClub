package videoclub.ui;

public class Pelicula {

	private String titulo;
	
	private String sinopsis;
	
	private String genero;
	
	private String calificacion;
	
	private Integer idPelicula;
	public Pelicula(){
		
	}
	public Pelicula(Integer idPelicula, String titulo,String genero, String sinopsis){
		this.idPelicula = idPelicula;
		this.genero = genero;
		this.sinopsis = sinopsis;
		this.titulo = titulo;
	}

	public Integer getIdPelicula() {
		return idPelicula;
	}

	public void setIdPelicula(Integer idPelicula) {
		this.idPelicula = idPelicula;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getSinopsis() {
		return sinopsis;
	}

	public void setSinopsis(String sinopsis) {
		this.sinopsis = sinopsis;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public void setCalificacion(String calificacion) {
		this.calificacion = calificacion;
	}

	public String getCalificacion() {
		return calificacion;
	}
	
	
}
