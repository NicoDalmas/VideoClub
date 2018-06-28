<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List, videoclub.ui.Usuario"%>
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
				<h3>Modificar Usuario</h3>
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
				
						<form action="LoginServlet" name=formulario method="POST" ">

							  <%
							  	if (request.getAttribute("usuario") != null) {
								Usuario u = (Usuario) request.getAttribute("usuario");
							  %>
								<table>	
									<tr>
										<td><label>Nombre de Usuario : </label></td>
										<td><input type="text" name=txtNombre value=<%=u.getLogin()%> readonly   /></td>
										<input type="text" style="visibility:hidden;" name=txtIdUsuario value=<%=request.getParameter("txtIdUsuario")%>  />
									</tr>
									<tr>
										<td><label>Contrase�a : </label></td>
										<td><input type="password" name="txtPassword" id="txtPassword" value="<%=u.getClave()%>" onchange="javascript:habilitarBtn();" /></td>
									</tr>
									<tr>
										<td><label>Repita Contrase�a : </label></td>
										<td><input type="password" name="txtPassword2" id="txtPassword2"value="<%=u.getClave()%>" onchange="javascript:habilitarBtn();" /></td>
									</tr>											 
									<tr>
										<td><label>Nombre : </label></td>
										<td> <input type="text" id="txtNombreReal" name="txtNombreReal" value="<%=u.getNombre()%>"  onchange="javascript:habilitarBtn();" /></td>
									</tr>	
									<tr>
										<td><label>Telefono: </label></td>
										<td> <input type="text" name="txtTelefono" id="txtTelefono"value="<%=u.getTelefono()%>" onchange="javascript:habilitarBtn();" /></td>
									</tr>			 
									<tr>
										<td><label>Direccion: </label></td>
										<td> <input type="text" name="txtDireccion" id="txtDireccion"value="<%=u.getDireccion()%>" onchange="javascript:habilitarBtn();" /></td>
									</tr>	
								 </table>
								 <%} %>	
								
								<input type="submit" name="btnEnviar" value=GuardarCambios id="GuardarCambios"  />
								<br></br>
								<input type="submit" name="btnEnviar" value=volver />
								</br>

								
								</form>
						<p style="color:red"> 
						  <%= request.getAttribute("mensaje") != null ? request.getAttribute("mensaje") : "" %>
						 </p>
				<!-- FIN CODIGO -->
				
				</div> 
		 	</div>
		 	

		 	

		 	
	 	</div><!--/row -->
	 </div> <!--/container -->
	 


	<!-- *****************************************************************************************************************
	 FOOTER
	 ***************************************************************************************************************** -->
	 <div id="footerwrap">
	 	<div class="container">
		 	<div class="row">
		 		<div class="col-lg-4">
		 			<p class="m-0 text-center text-white">Alumno: Nicol�s Dalm�s &copy;  2018</p>
		 			
		 		</div>

		 	
		 	</div><!--/row -->
	 	</div><!--/container -->
	 </div><!--/footerwrap -->
	 
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
