<!DOCTYPE html>
<html lang="en">

  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <script src='/VideoClub/dwr/interface/[YOUR-SCRIPT].js'></script>
<script src='/VideoClub/dwr/engine.js'></script>
   
    <title>Peliculas</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    

    <!-- Custom styles for this template -->
   
    <link href="assets/css/2-col-portfolio.css" rel="stylesheet">

    <!-- *****   codigo Java   ****   -->
      
      
       <link href="assets/css/bootstrap.css" rel="stylesheet">

    <!-- **************************   -->

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">Peliculas</a>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
      <h1 class="my-4">UCEL
        <small>Programación Avanzada</small>
      </h1>

      <div class="row">
        <div class="col-lg-6 portfolio-item">
          <div class="card h-100">
            
            <div class="card-body">
              <h4  class="card-title">
                <div class="p-3 mb-2 bg-success text-white">Login</div>
              </h4>
             <form action="LoginServlet" name=formulario method="POST">
            <br>
            <label class="label label-default">User : </label> <input class="form-control" type="text" name=txtNombre />
            <br></br>
            <label class="label label-default">Pass : </label> <input class="form-control" type="password" name="txtPassword" />
            <br></br>
            <input class="btn btn-success" type="submit" name="btnEnviar" value=Enviar />
            <a class="btn btn-info" href="nuevoUsuario.jsp">Registrarse</a>
            <input class="btn btn-basic" type="submit" name="btnEnviar" value=Invitado />
            
            </form>
            <p style="color:red"> 
              <%= request.getAttribute("mensaje") != null ? request.getAttribute("mensaje") : "" %>
             </p>
            </div>
          </div>
        </div>
       
   
   
   		      <div class="col-lg-6 portfolio-item">
										
											
             
								<a href="#"> <img  class="card-img-top" src="img/a1.jpg" alt="Estreno!"> </a> 
				<label class="label label-success">Nuevo Estreno! </label>  <label class="label label-default">No te pierdas la película más taquillera de la historia:   The Avengers Infinity War 2018. </label>
			
				     </div>
				
			   
      <!-- /.row -->

      <!-- Pagination -->


    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Alumno: Nicolás Dalmás &copy;  2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
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

    

    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
