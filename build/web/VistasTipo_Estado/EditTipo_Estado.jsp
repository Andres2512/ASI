<%@page import="modeloDAO.DAOTipo_estado"%>
<%@page import="modelo.DTOTipo_estado"%>
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
                    DAOTipo_estado daote = new DAOTipo_estado();
                    int Id_tipo_estado = Integer.parseInt((String) request.getAttribute("Id_tipo_estado"));
                    DTOTipo_estado tep = (DTOTipo_estado) daote.list(Id_tipo_estado);
                %>

                <h1>Actualizar Tipo Estado</h1>
                <form action="<%= request.getContextPath()%>/CtrTipo_estado">
                    Id_tipo_estado<br>
                    <input class="form-control" type="text" value="<%=tep.getId_tipo_estado()%>" name="txtId_tipo_estado" readonly=""><br>
                    Nombre<br>
                    <input class="form-control" type="text" value="<%=tep.getEstado()%>" name="txtestado"><br>
                    Nombre<br>
                    <input class="form-control" type="text" value="<%=tep.getObservacion()%>" name="txtobservacion"><br>

                           <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"><br>
                    <a href="CtrTipo_estado?accion=listar">Regresar</a>
                </form>
            </div>
        </div> 
    </body>
</html>
