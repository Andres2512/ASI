
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
                <h1>Agregar Empleado</h1>
                <form action="<%=request.getContextPath()%>/CrtUsuario">
                    Nombres:<br>
                    <input class="form-control" type="text" name="txtNombre" required><br>
                    Apellidos: <br>
                    <input class="form-control" type="text" name="txtApellidos" required><br>
                    Número celular:<br>
                    <input class="form-control" type="number" name="txtCelular" required><br>
                    Número teléfono:<br>
                    <input class="form-control" type="number" name="txtTelefono" required><br>
                    Correo electrónico:<br>
                    <input class="form-control" type="email" name="txtCorreo" required><br>
                    Dirección:<br>
                    <input class="form-control" type="text" name="txtDireccion" required><br>
                    Código rol:<br>
                    <input class="form-control" type="number" name="txtRol" required><br>
                    Id Ciudad:<br>
                    <input class="form-control" type="number" name="txtCiudad" required><br>
                    Código Proyecto:<br>
                    <input class="form-control" type="number" name="txtProyecto" required><br>

                    <input class="btn btn-warning" type="submit" name="accion" value="Agregar">
                    <br>
                    <a class="btn btn-danger" href="<%=request.getContextPath()%>/vistasEmpleado/listarEmpleado">Regresar</a>       
                </form>         
            </div>
        </div>

    </body>
</html>
