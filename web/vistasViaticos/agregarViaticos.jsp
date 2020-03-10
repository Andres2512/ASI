
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
                <h1>Agregar Viaticos</h1>
                <form action="<%=request.getContextPath()%>/CtrViaticos">

                    Descripcion viaticos :<br>
                    <input class="form-control" type="text"  name="txtDescripcion_viatico" required><br>
                    Tipo viaticos : <br>
                   
                     <select class="custom-select mr-sm-2" name="txtTipo_viatico">
                        <option selected>Seleccione Tipo...</option>
                        <option value="1">Transporte</option>
                        <option value="2">Estadia</option>
                        <option value="3">Alimentacion</option>
                      </select><br>
                      <br>
                    Nombres_trabajador : <br>
                    <input class="form-control" type="text" name="txtNombre_trabajador" required><br>
                    Id_usuario: <br> 
                    <input class="form-control" type="text" name="txtid_usuario" required><br>

                    valor_viatico: <br> 
                    <input class="form-control" type="text" name="txtvalor_viatico" required><br>
                   <br> 




 <div class="form-group">
    <label for="exampleFormControlFile1"> Insertar_evidencia: </label>
    <input type="file" class="form-control-file" id="File" name="txtInsertar_evidencia">
  </div>





                    <input class="btn btn-warning" type="submit" name="accion" value="addvv">

                    <a class="btn btn-danger" href="CtrViaticos?accion=listar">Regresar</a>




                </form>         
            </div>
        </div>
    </body>
</html>

