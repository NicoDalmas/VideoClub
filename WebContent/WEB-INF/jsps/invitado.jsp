<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List, videoclub.ui.Pelicula"%>
<!DOCTYPE html>
<html lang="es">
 <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="assets/ico/favicon.ico">
	<meta charset="utf-8">
	 
    <title>Peliculas</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
    <link href="assets/css/2-col-portfolio.css" rel="stylesheet"> 
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/checkbox.css"  rel="stylesheet">

 </head>

 <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">Peliculas</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.jsp">Salir</a>
            </li>
            <li class="nav-item">
            </li>
            <li class="nav-item">
            </li>
          </ul>
        </div>
   </nav>
	
 <!-- Page Content -->
    <div class="container">
		<div class="alert alert-success" role="alert">
  			<p> Bienvenido Invitado </p>
		</div>

			<form action="LoginServlet" name=formulario method="POST">
				<%
					Integer contador=0;
					List<Pelicula> peliculas = (List<Pelicula>) request.getAttribute("peliculas");
					for(Pelicula p : peliculas) { 
				%>	
				<div class="row">
			        <div class="col-lg-6 portfolio-item">
			          <div class="card h-100">
			              <a href="#"> <img style="width:399px" class="card-img-top" src="img/<%=p.getIdPelicula()%>.jpg" alt=""> </a> 
				          <div class="card-body">
				             <h4 class="card-title">
				               <%=p.getTitulo() %>
				             </h4>
		            		  <p class="card-text"><%=p.getGenero()%></p>
							  <p class="card-text"><%=p.getSinopsis() %></p>
			           	 </div>
			          </div>
			       	 </div>
			   	 </div>    
				<p class="card-text"><%contador=contador+1;}%></p>
			 </form>	
			
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<a class="page-link" href="#" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
					<span class="sr-only">Previous</span>
					</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">1</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">2</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">3</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					<span class="sr-only">Next</span>
					</a>
				</li>
			</ul>
					
	</div>
	
	<input style="visibility:hidden" type="text" name="txtContador" value=<%out.println(contador);%> />
	<input style="visibility:hidden" type="text" name="txtIdUsuario" value=<%=request.getAttribute("r_id") %> />
					

 <!-- Footer -->
   <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Alumno: Nicolás Dalmás &copy;  2018</p>
      </div>
   </footer>
 
 <!-- Bootstrap core JavaScript -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>
</html>