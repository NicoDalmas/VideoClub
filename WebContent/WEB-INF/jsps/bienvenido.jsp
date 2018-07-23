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
  			<p> Bienvenido <%=request.getAttribute("r_nombre") %> </p>
		</div>
		<div class="row">
		<div class="col-lg-10 col-lg-offset-1 centered">
			 <form action="ReservaServlet" name=formulario method="POST">
			 <input type="submit" class="btn btn-primary" name="btnEnviar" onclick="form.action='ModificarDatosServlet';" value="Modificar Datos" />
			 <center><h1> Listado de Peliculas </h1></center>
				<table class="table table-hover table-bordered">
					<thead class="thead-dark">
					<tr>
						<th scope="col"><center>TITULO</center></th>
						<th scope="col"><center>IMAGEN</center></th>
						<th scope="col"><center>GENERO</center></th>
						<th scope="col"><center>SINOPSIS</center></th>
						<th scope="col"><center>RESERVA</center></th>
					</tr>
					</thead>
					<%
						Integer contador=0;
						List<Pelicula> peliculas = (List<Pelicula>) request.getAttribute("peliculas");
						for(Pelicula p : peliculas) { 
					%>	
					<tbody>
						<tr>
							<td><%=p.getTitulo() %></td>
							<td><IMG SRC="img/<%=p.getIdPelicula()%>.jpg" height=300 width=500></img></td>
							<td><%=p.getGenero()%></td>
							<td><%=p.getSinopsis() %></td>
							<td>
							<ul class="list-group">
								<label class="switch">
								  <input type="checkbox" name=chxReserva value=<%=p.getIdPelicula()%> onclick="javascript:habilitarBtn(this);">
								  <span class="slider round"></span>
								</label>
                      		</ul>
							</td>
						</tr>
						<%contador=contador+1;}%>
					</tbody>
				</table>
				
				<input style="visibility:hidden" type="text" name="txtContador" value=<%out.println(contador);%> />
				<input style="visibility:hidden" type="text" name="txtIdUsuario" value=<%=request.getAttribute("r_id") %> />
				<input style="visibility:hidden" type="text" name="txtNombre" value=<%=request.getAttribute("r_nombre") %> />
				<center>
					<input type="submit" class="btn btn-success" id=btnReservar name="btnEnviar" value=Reservar disabled />
				</center>
				<br>
				</form>
				
				<!-- FIN CODIGO -->
				
				<! --/Carousel -->
		 	</div>
		 	
		 	
	 	</div><! --/row -->
	 </div><! --/container -->

	<!-- Footer -->
   <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Alumno: Nicolás Dalmás &copy;  2018</p>
      </div>
   </footer>
	 

  	
  	<!-- Bootstrap core JavaScript -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	
 

    <script>
// Portfolio
(function($) {
	"use strict";
	var $container = $('.portfolio'),
		$items = $container.find('.portfolio-item'),
		portfolioLayout = 'fitRows';
		
		if( $container.hasClass('portfolio-centered') ) {
			portfolioLayout = 'masonry';
		}
				
		$container.isotope({
			filter: '*',
			animationEngine: 'best-available',
			layoutMode: portfolioLayout,
			animationOptions: {
			duration: 750,
			easing: 'linear',
			queue: false
		},
		masonry: {
		}
		}, refreshWaypoints());
		
		function refreshWaypoints() {
			setTimeout(function() {
			}, 1000);   
		}
				
		$('nav.portfolio-filter ul a').on('click', function() {
				var selector = $(this).attr('data-filter');
				$container.isotope({ filter: selector }, refreshWaypoints());
				$('nav.portfolio-filter ul a').removeClass('active');
				$(this).addClass('active');
				return false;
		});
		
		function getColumnNumber() { 
			var winWidth = $(window).width(), 
			columnNumber = 1;
		
			if (winWidth > 1200) {
				columnNumber = 5;
			} else if (winWidth > 950) {
				columnNumber = 4;
			} else if (winWidth > 600) {
				columnNumber = 3;
			} else if (winWidth > 400) {
				columnNumber = 2;
			} else if (winWidth > 250) {
				columnNumber = 1;
			}
				return columnNumber;
			}       
			
			function setColumns() {
				var winWidth = $(window).width(), 
				columnNumber = getColumnNumber(), 
				itemWidth = Math.floor(winWidth / columnNumber);
				
				$container.find('.portfolio-item').each(function() { 
					$(this).css( { 
					width : itemWidth + 'px' 
				});
			});
		}
		
		function setPortfolio() { 
			setColumns();
			$container.isotope('reLayout');
		}
			
		$container.imagesLoaded(function () { 
			setPortfolio();
		});
		
		$(window).on('resize', function () { 
		setPortfolio();          
	});
})(jQuery);
</script>
  </body>
 <script>
 	function habilitarBtn(obj)
 		{
 			var d = document.formulario;
 			if(obj.checked==true)
 	 			{
 				d.btnReservar.disabled = false;
 				}
 			else
 	 			{
 				d.btnReservar.disabled= true;
 			}
 		}
 </script>
</html>
