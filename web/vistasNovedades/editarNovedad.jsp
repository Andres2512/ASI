
<%@page import="modelo.DTONovedades"%>
<%@page import="modeloDAO.DAONovedades"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
       <div class="container">
            <div class="col-lg-6">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <%
                    DAONovedades dao = new DAONovedades();
                    int Id_novedades=Integer.parseInt((String)request.getAttribute("Id_novedades"));
                    DTONovedades nov= (DTONovedades)dao.list(Id_novedades);
                    %>
                    
        <h1>Actualizar Novedades</h1>
        <form action="<%=request.getContextPath()%>/CrtNovedades">
            
            id:<br>
            <input class="form-control" type="text" value="<%= nov.getId_novedades()%>" name="txtId_Novedades" readonly="" ><br>          
           
            Fecha :<br>
            <input class="form-control" type="date" value="<%= nov.getFecha()%>" name="txtFecha" required><br> 
            Novedad : <br>
            <input class="form-control" type="text" value="<%= nov.getNovedades()%>" name="txtNovedades" required><br>
            Observaciones : <br>
            <input class="form-control" type="text" value="<%= nov.getObservaciones()%>" name="txtObservaciones" required><br>
            Tipo de Novedad : <br>
            <input class="form-control" type="number" value="<%=nov.getTipo_novedad_Id_tipo_novedad()%>" name="txtTipo_novedad_Id_tipo_novedad" required>
            
            <input class="btn btn-warning" type="submit" name="accion" value="Actualizar">
            
            <a class="btn btn-danger" href="CrtNovedades?accion=listar">Regresar</a>
        </form>
            </div>
        </div>     
    </body>
</html>
