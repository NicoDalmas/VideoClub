<!DOCTYPE html>
<html lang="es">

  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Error</title>

<!-- Bootstrap core CSS -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    

    <!-- Custom styles for this template -->
   
    <link href="assets/css/2-col-portfolio.css" rel="stylesheet">

   	<link href="assets/css/bootstrap.css" rel="stylesheet">

   
  </head>
</head>
<body>

<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">Ups!! Algo sali� mal :( </a>
      </div>
    </nav>

<!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
      <h1 class="my-4">Error
        <small> lleg� al l�mite de reservas pendientes.</small>
      </h1>


<form action="LoginServlet" name=formulario method="POST">
<input style="visibility:hidden" type="text" name="txtNombre" value=<%=request.getParameter("txtNombre")%>  />
<input class="btn btn-basic" type="submit" name="btnEnviar" value=volver />

</form>
</body>
</html>