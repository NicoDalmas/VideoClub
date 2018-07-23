<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List, videoclub.ui.Reserva"%>
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
    <link href="assets/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
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
      </div>
    </nav>

	

	<!-- *****************************************************************************************************************
	 TITLE & CONTENT
	 ***************************************************************************************************************** -->
 <!-- Page Content -->
    <div class="container">
	 
	 	
				
			
				 <div class="p-3 mb-2 bg-success text-white">
						 <h1 class="my-4">Reservas</h1>
				</div>		 
								 <form action="CerrarReservaServlet" name=formulario method="POST">
								 
								 <center><h1><small></>Listado de Reservas</h1></small></center>
											<div class="table-responsive">
  												<table class="table table-hover">
													<thead>
												<tr>
													<th>ID RESERVA</th>
													<th>PELICULA</th>
													<th>CLIENTE</th>
													<th>FECHA RESERVA</th>
													<th><span class="glyphicon glyphicon-question-sign"></span></th>
												</tr>
												</thead>
												<%

													List<Reserva> reservas = (List<Reserva>) request.getAttribute("reservas");
													for(Reserva r : reservas) {

												%>	
												<tbody>
												<tr>
													<td>   <%=r.getIdReserva() %></td>
													<td>   <%=r.getTitulo()%></td>
													<td>   <%=r.getUsuario()%></td>
													<td>   <%=r.getFechaReserva()%></td>
													<td>	<input type="checkbox" name=chxReservas value=<%=r.getIdReserva()%> onclick="javascript:habilitarBtn(this);"  /></td>
													
												</tr>
												<%}%>
												</tbody>
											</table>
								 <br></br>
								 <br></br>
								 <input style="visibility:hidden" type="text" name="txtNombre" value=<%=request.getParameter("txtNombre")%>  />
								 <center><input class="btn btn-success" type="submit" id="btnCerrarRes" name="btnEnviar" value=CerrarReservas disabled/></center>
								 <center><input class="btn" type="submit" name="btnEnviar" value=volver onclick="form.action='VolverServlet';" /><center>
								 </form>
								 <br></br>
								 <hr>
								 <br>
								
								 
			<!-- Gráficos -->
			
				 <div class="container">
			<center><h1><small></>Gráficos</h1></small></center>	 
			 <div class="row">	
				
			 <div class="col-lg-6 portfolio-item">
          <div class="card h-100">
            
            <div class="card-body">
              <h4  class="card-title">
                <div class="p-3 mb-2 bg-success text-white">Grafico 1</div>
              </h4>
            
                    
            </div>
            <canvas id="myChart"></canvas>
          </div>
        </div>
       
   
   		 <div class="col-lg-6 portfolio-item">
          <div class="card h-100">
            
            <div class="card-body">
              <h4  class="card-title">
                <div class="p-3 mb-2 bg-success text-white">Grafico 2</div>
              </h4>
            
                    
            </div>
            <canvas id="myChart"></canvas>
          </div>
        </div>
        </div> </div>
			
				
				<!-- FIN CODIGO -->
				
			
	 

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Alumno: Nicolás Dalmás &copy;  2018</p>
      </div>
      <!-- /.container -->
    </footer>
     <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/retina-1.1.0.js"></script>
	<script src="assets/js/jquery.hoverdir.js"></script>
	<script src="assets/js/jquery.hoverex.min.js"></script>
	<script src="assets/js/jquery.prettyPhoto.js"></script>
  	<script src="assets/js/jquery.isotope.min.js"></script>
  	<script src="assets/js/custom.js"></script>
  	
  	<script src="assets/graficos/Chart.bundle.min.js"></script>
		<script>

			//Label
			 // These labels appear in the legend and in the tooltips when hovering different arcs
		

			// Data
						data = {
						datasets: [{
						label: "My First dataset",
			            backgroundColor: ['rgb(255, 99, 132)', 'rgb(53, 161, 1)', 'rgb(53, 161, 216)', 'rgb(53, 50, 216)'],
			            borderColor: 'rgb(255, 255, 255)',
			   			data: [10, 20, 30]
				}],
				labels: [
					        'Red',
					        'Yellow',
					        'Blue'
					    ]};
			
			// Gráfico de Torta
			// For a pie chart
				var ctx = document.getElementById('myChart').getContext('2d');
				var myPieChart = new Chart(ctx,{
				    type: 'pie',
				    data: data
				});
					
		</script>

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
 				d.btnCerrarRes.disabled = false;
 				}
 			else
 	 			{
 				d.btnCerrarRes.disabled= true;
 			}
 		}
 </script>
    


  </body>

</html>