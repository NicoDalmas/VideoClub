<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List, videoclub.ui.Pelicula"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="assets/ico/favicon.ico">
	 
    <title>Peliculas</title>

    <!-- Bootstrap CSS -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/2-col-portfolio.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">Peliculas</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
            	<span class="sr-only">(current)</span> </a>
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
      </div>
    </nav>

	
 <!-- Page Content -->
    <div class="container">
		<div class="alert alert-success" role="alert" style="margin-top: 20px;">
			<p> Bienvenido administrador: <%=request.getAttribute("r_nombre") %> </p>
		</div>
			<h1>Panel de Administración</h1>
				<div class="form-group"> 
					<form action="LoginServlet" name=formulario method="POST">
						<div class="row">
							<div class="col-sm-2"><input class="btn btn-success" type="submit" name="btnEnviar" value="Modificar Datos" onclick="form.action='ModificarDatosServlet';" /></div>
							<div class="col-sm-2"><input class="btn btn-info" type="submit" name="btnEnviar" onclick="form.action='VerReservasServlet';" value="Ver Reservas" /></div>
						</div>	
						<input style="visibility:hidden" type="text" name="txtIdUsuario" value=<%=request.getAttribute("r_id") %> />
						<input style="visibility:hidden" type="text" name="txtNombre" value=<%=request.getParameter("txtNombre")%>  />
					</form>	 
				</div>	
		<h1 class="my-4">Catálogo</h1>
			<form action="LoginServlet" name=formulario method="POST">
				<%
					Integer contador=0;
					List<Pelicula> peliculas = (List<Pelicula>) request.getAttribute("peliculas");
					for(int i = 0;i < peliculas.size();i++){
				%>
				<div class="row">
		        	<div style=col-lg-6 portfolio-item align="middle" style="margin:50px 0px padding: 25px">
		           		<div style="padding: 20px" >
		           			<div class="card h-100">
		           				<a href="#"> <img style="width:320px" height="200" class="card-img-top" src="img/<%=peliculas.get(i).getIdPelicula()%>.jpg" alt=""> </a> 
		           				<div class="card-body">
						           <h5 class="card-title">
										<%=peliculas.get(i).getTitulo() %>
						           </h5>
		              			   <p class="card-text"><%=peliculas.get(i).getSinopsis() %></p>
					  			</div>
		          			</div>
		        		</div>
				        <%i = i +1;%>
				        <div style=col-lg-6	portfolio-item align="middle" style="margin:50px 0px padding: 25px">
				        	<div style="padding: 20px" >
				          		<div class="card h-100">
				            		<a href="#"> <img style="width:320px" height="200" class="card-img-top" src="img/<%=peliculas.get(i).getIdPelicula()%>.jpg" alt=""> </a> 
				            			<div class="card-body">
				              				<h5 class="card-title">
				                				<%=peliculas.get(i).getTitulo()%>
				              				</h5>
							  			<p class="card-text"><%=peliculas.get(i).getSinopsis()%></p>
				            			</div>
				            	</div>
				            			
				           </div>
				           
				        </div>
				        
			       </div>	
			     	    <%}%>
			   </div>
			   
			    </div>
		
		 
	</form>	
	</div>
			
		
	<!-- Page Content -->
	<div class="container">
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
</div>		
<!-- FIN CODIGO -->
    
<!-- Footer -->
<footer class="py-5 bg-dark" style="width:100%">
   
     <p class="m-0 text-center text-white">Alumno: Nicolás Dalmás &copy;  2018</p>
   
</footer>

</body>	

</html>