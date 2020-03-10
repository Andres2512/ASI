<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Validar código</title>
</head>
<body>
<%
   int codigoFormulario = Integer.parseInt(request.getParameter("codigo"));
   int codigoEmailAleatorio = Integer.parseInt(request.getParameter("codigoAleatorio"));
   
   if(codigoFormulario==codigoEmailAleatorio){
	   response.sendRedirect("actualizarContrasenia.jsp");
   }else{
	   response.sendRedirect("validacionCodigo.jsp");
   }
%>
</body>
</html>