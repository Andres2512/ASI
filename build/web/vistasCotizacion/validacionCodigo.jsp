<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <div class="container">
        <h2>Validación código</h2>
    </div>
    <%
        Object[] codigo = (Object[]) session.getAttribute("codigoSesion");
    %>
    <form action="validar.jsp" method="post">
        <div class="form-group">
            <div class="col-3">
                <label for="exampleInputEmail1">Código para validar usuario:</label>
                <input type="text" class="form-control" id="codigo" placeholder="Codigo" name="codigo"> 
                <input
                    type="hidden" value="<%out.print(codigo[0]);%>" name="codigoAleatorio" id="codigoAleatorio">
            </div>
        </div>
        <button type="submit" class="btn btn-primary" id="validar">Validar</button>
    </form>
</html>
