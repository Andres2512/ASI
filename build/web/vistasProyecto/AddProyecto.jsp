<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <h1>Agregar Proyecto</h1>
                <form action="<%=request.getContextPath()%>/CrtProyecto">
                    Costo:<br>
                    <input class="form-control" type="number" name="txtcos" required><br>
                    Direccion:<br>
                    <input class="form-control" type="text" name="txtdes" required><br>
                    Fecha incio:<br>
                    <input class="form-control" type="date" name="txtfein" required><br>
                    Fecha fin:<br>
                    <input class="form-control" type="date" name="txtfefin" required><br>
                    ID Asignacion Recursos:<br>
                    <input class="form-control" type="number" name="txtaid" required><br>
                    ID ciudades:<br>
                    <input class="form-control" type="number" name="txtcid" required><br>
                    ID novedades:<br>
                    <input class="form-control" type="number" name="txtnid" required><br>
                    ID estado proyecto:<br>
                    <input class="form-control" type="number" name="txteid" required><br>
                    Nombre Proyecto <br>
                    <input class="form-control" type="text" name="txtNombre_Proyecto" required><br>
                    
                    <input class="btn btn-warning" type="submit" name="accion" value="Agregar">
                    
                    <a class="btn btn-danger" href="CrtProyecto?accion=ListarProyecto">Regresar</a>
                </form>         
            </div>
        </div>
    </body>
</html>
