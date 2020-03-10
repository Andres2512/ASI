

<%@page import="modeloDAO.DAORoles"%>
<%@page import="modelo.DTORoles"%>
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
                <%
                    DAORoles daorold = new DAORoles();
                    int Id_roles = Integer.parseInt((String)request.getAttribute("Id_roles"));
                    DTORoles rold = (DTORoles) daorold.list(Id_roles);
                %>
                <h1>Modificar Rol</h1>
                <form action="<%= request.getContextPath()%>/CrtRol">
                    Id rol: <br>
                    <input class="form-control" type="number" name="txtid" value="<%= rold.getId_roles()%>" required><br>
                    Nombre:<br>
                    <input class="form-control" type="text" name="txtnom" value="<%= rold.getNombre()%>" required><br>
                    
                    <input class="btn btn-warning" type="submit" name="accion" value="Actualizar"><br>
                    <a class="btn btn-danger" href="CrtRol?accion=listar">Regresar</a>
                </form>
            </div>
        </div>
    </body>
</html>
