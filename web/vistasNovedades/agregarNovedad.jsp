
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
        <h1>Agregar Novedades</h1>
        <form action="<%=request.getContextPath()%>/CrtNovedades">
            Fecha :<br>
            <input class="form-control" type="date" name="txtFecha" required><br>
            Novedades : <br>
            <input class="form-control" type="text" name="txtNovedades" required><br>
            Observaciones : <br>
            <input class="form-control" type="text" name="txtObservaciones" required><br>
            Numero novedad : <br> 
            <input class="form-control" type="number" name="txtTipo_novedad_Id_tipo_novedad" required><br>
            
            <input class="btn btn-warning" type="submit" name="accion" value="Agregar">
            
            <a class="btn btn-danger" href="CrtNovedades?accion=listar">Regresar</a>
        </form>         
            </div>
        </div>
    </body>
</html>
