<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.List, videoclub.ui.Usuario"%>
<!DOCTYPE html>
<html lang="es">

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="assets/ico/favicon.ico">

    <title>Modificar Datos</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/2-col-portfolio.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">Peliculas</a>
 
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
      <h1 class="my-4">Modificar Datos
        <small>Configuración Personal</small>
      </h1>

      <div class="row">
        <div class="col-lg-6 portfolio-item">
          <div class="card h-100">
            <a href="#"></a>
            <div class="card-body">
              <h4 class="card-title">
                <div class="p-3 mb-2 bg-success text-white">Datos</div>
              </h4>
              <p class="card-text"><form action="LoginServlet" name=formulario method="POST" ">
                <div class="form-group">
                  <%
                if (request.getAttribute("usuario") != null) {
                Usuario u = (Usuario) request.getAttribute("usuario"); 
                 
                %>  
                <table> 
                  <tr>
                    <td><label>Nombre de Usuario : </label></td>
                    <td><input type="text" class="form-control" name=txtNombre value=<%=u.getLogin()%> readonly /></td>
                    <input type="text" style="visibility:hidden;" name=txtIdUsuario value=<%=request.getParameter("txtIdUsuario")%>  />
                  </tr>
                  <tr>
                    <td><label>Contraseña : </label></td>
                    <td><input type="password" name="txtPassword" class="form-control" id="txtPassword" value="<%=u.getClave()%>" onchange="javascript:habilitarBtn();" /></td>
                  </tr> 
                  <tr>
                    <td><label>Confirmar Contraseña : </label></td>
                    <td><input type="password" class="form-control" name="txtPassword2" id="txtPassword2"value="<%=u.getClave()%>" onchange="javascript:habilitarBtn();" /></td>
                    </tr>    
                  <tr>
                    <td><label>Nombre : </label></td>
                    <td> <input type="text" id="txtNombreReal" class="form-control" name="txtNombreReal" value="<%=u.getNombre()%>"  onchange="javascript:habilitarBtn();" /></td>
                  </tr> 
                  <tr>
                    <td><label>Telefono: </label></td>
                    <td> <input type="text" name="txtTelefono" class="form-control" id="txtTelefono"value="<%=u.getTelefono()%>" onchange="javascript:habilitarBtn();" /></td>
                  </tr>      
                  <tr>
                    <td><label>Direccion: </label></td>
                    <td> <input type="text" name="txtDireccion" class="form-control" id="txtDireccion"value="<%=u.getDireccion()%>" onchange="javascript:habilitarBtn();" /></td>
                  </tr> 
                 </table>
                <%} %>  
              </div>
                <p style="color:red"> 
                  <%= request.getAttribute("mensaje") != null ? request.getAttribute("mensaje") : "" %>
                 </p>   
                
                <input class="btn btn-success" type="submit" name="btnEnviar" value=GuardarCambios id="GuardarCambios"  />
                <a href="index.jsp">
                <input type="button" class="btn btn-default" value=Salir />
                </a>
              

                
                </form></p>
                <p style="color:red"> 
              <%= request.getAttribute("mensaje") != null ? request.getAttribute("mensaje") : "" %>
             </p>
            </div>
          </div>
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
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
