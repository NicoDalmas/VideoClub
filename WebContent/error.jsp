<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error</title>
</head>
<body>
<h1>Error llego al limite de reservas pendientes</h1>
<form action="LoginServlet" name=formulario method="POST">
<input style="visibility:hidden" type="text" name="txtNombre" value=<%=request.getParameter("txtNombre")%>  />
<input type="submit" name="btnEnviar" value=volver />
</form>
</body>
</html>