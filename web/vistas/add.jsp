<%-- 
    Document   : add
    Created on : 3/07/2019, 01:43:30 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <h1>Agregar Rol</h1>
                <form action="<%=request.getContextPath()%>/CrtRol">
                    Id_roles:<br>
                    <input class="form-control" type="text" name="txtid"><br>
                    Nombre:<br>
                    <input class="form-control" type="text" name="txtnom"><br>
                    <input class="btn btn-warning" type="submit" name="accion" value="Agregar"><br>
                    <a class="btn btn-danger" href="CrtRol?accion=listar">Regresar</a>
                </form>
            </div>
        </div>
    </body>
</html>
