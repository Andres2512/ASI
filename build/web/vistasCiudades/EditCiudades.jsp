<%@page import="modeloDAO.DAOCiudades"%>
<%@page import="modelo.DTOCiudades"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <%
                    DAOCiudades daoci = new DAOCiudades();
                    int Id_ciudades = Integer.parseInt((String) request.getAttribute("Id_ciudades"));
                    DTOCiudades ci = (DTOCiudades) daoci.list(Id_ciudades);
                %>

                <h1>Actualizar Ciudades</h1>
                <form action="<%= request.getContextPath()%>/CrtCiudades">
                    Id_ciudades<br>
                    <input class="form-control" type="text" value="<%=ci.getId_ciudades()%>" name="txtId_ciudades" readonly=""><br>
                    Nombre<br>
                    <input class="form-control" type="text" value="<%=ci.getNombre()%>" name="txtNombre"><br>

                           <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"><br>
                    <a href="CrtCiudades?accion=listar">Regresar</a>
                </form>
            </div>
        </div> 
    </body>
</html>
