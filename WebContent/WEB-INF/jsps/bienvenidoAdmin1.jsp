<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List, videoclub.ui.Pelicula"%>
<!DOCTYPE html>
<html lang="es">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="assets/ico/favicon.ico">

    <title>VideoClub</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">


    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script src="assets/js/modernizr.js"></script>
  </head>

  <body>

    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.html">VideoClub</a>
        </div>
        <div class="navbar-collapse collapse navbar-right">

        </div><!--/.nav-collapse -->
      </div>
    </div>


	<!-- *****************************************************************************************************************
	 BLUE WRAP
	 ***************************************************************************************************************** -->
	<div id="blue">
	    <div class="container">
			<div class="row">
				<h3>Bienvenido</h3>
			</div><!-- /row -->
	    </div> <!-- /container -->
	</div><!-- /blue -->

	<!-- *****************************************************************************************************************
	 TITLE & CONTENT
	 ***************************************************************************************************************** -->

	 <div class="container mt">
	 	<div class="row">
		 	<div class="col-lg-10 col-lg-offset-1 centered">
			 	<div Id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<!-- CODIGO -->
				
						<p> Bienvenido <%=request.getAttribute("r_nombre") %> </p>
						 <form action="LoginServlet" name=formulario method="POST">
						 <input type="submit" name="btnEnviar" value=ModificarDatos />
						 <input type="submit" name="btnEnviar" value=VerReservas /></br>
						 <a href="index.jsp">Salir</a>
						 
						 <center><h1>Listado de Peliculas</h1></center>
											<style>
												.demo {
													border:1px solid #C0C0C0;
													border-collapse:collapse;
													padding:5px;
												}
												.demo th {
													border:1px solid #C0C0C0;
													padding:5px;
													background:#F0F0F0;
												}
												.demo td {
													border:1px solid #C0C0C0;
													padding:5px;
												}
											</style>
											<table class="demo">
												<thead>
												<tr>
													<th>TITULO</th>
													<th>IMAGEN</th>
													<th>GENERO</th>
													<th>SINOPSIS</th>
													
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
													
												</tr>
												<%contador=contador+1;}%>
												</tbody>
											</table>
						<input style="visibility:hidden" type="text" name="txtContador" value=<%out.println(contador);%> />
						<input style="visibility:hidden" type="text" name="txtIdUsuario" value=<%=request.getAttribute("r_id") %> />
						<input style="visibility:hidden" type="text" name="txtNombre" value=<%=request.getParameter("txtNombre")%>  />
						<br></br>
						<br></br>
						
						 <br></br>
						 </form>
				
				<!-- FIN CODIGO -->
				
				</div><! --/Carousel -->
		 	</div>
		 	

		 	

		 	
	 	</div><! --/row -->
	 </div><! --/container -->
	 


	<!-- *****************************************************************************************************************
	 FOOTER
	 ***************************************************************************************************************** -->
	 <div id="footerwrap">
	 	<div class="container">
		 	<div class="row">
		 		<div class="col-lg-4">
		 			<h4>Facundo Diaz</h4>
		 			
		 		</div>

		 	
		 	</div><! --/row -->
	 	</div><! --/container -->
	 </div><! --/footerwrap -->
	 
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/retina-1.1.0.js"></script>
	<script src="assets/js/jquery.hoverdir.js"></script>
	<script src="assets/js/jquery.hoverex.min.js"></script>
	<script src="assets/js/jquery.prettyPhoto.js"></script>
  	<script src="assets/js/jquery.isotope.min.js"></script>
  	<script src="assets/js/custom.js"></script>


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
</html>
