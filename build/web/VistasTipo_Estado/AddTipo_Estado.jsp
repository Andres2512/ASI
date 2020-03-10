<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <h1>Agregar Tipo de estado</h1>
                <form action="<%=request.getContextPath()%>/CtrTipo_estado">
                      Estado:<br>
                    <input class="form-control" type="text" name="txtestado" required><br>
                      Observacion:<br>
                    <input class="form-control" type="text" name="txtobservacion" required><br>

                    <input class="btn btn-warning" type="submit" name="accion" value="Agregar"><br>

                    <a class="btn btn-danger" href="CtrTipo_estado?accion=Listar">Regresar</a>
                </form>
            </div>
        </div>
    </body>
</html>