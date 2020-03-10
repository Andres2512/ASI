<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Registrar Tipo de Materiales</title>
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/A$I_png-logo.png">

        <!-- BOOTSTRAP LOCAL <link rel="stylesheet" href="css/bootstrap.min.css">  -->
        <!-- BOOTSTRAP 4 ONLINE -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- HOJAS DE ESTILOS PROPIA -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssMod.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssPrinc.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
    <body>
        <div class="lead" style="font-size: 15px;">
            <small>
                <a href="">Inicio</a> > <a href="">Materiales y Herramientas</a> > <a href="">Registrar Tipo de Materiales</a>
                <hr style="background-color: gold;">
            </small>
        </div>
        <div class="container">
            <h1 class="h2 text-center my-5" style="font-family: Microsoft YaHei Light">REGISTRAR TIPO DE MATERIALES</h1>
            <form action="<%=request.getContextPath()%>/CtrTipo_Materiales">
                <div class="form-group">
                    <label for="" class="control-label">Tipo de Material</label>
                    <input type="text" class="form-control" name="txtTipo_materiales" placeholder="Tipo de Material" required>
                </div>    

                <div class="form-group"> 
                    <label for="" class="control-label">Descripción</label>
                    <input type="text" class="form-control" name="txtDescripcionMtl" placeholder="Descripción" required>
                </div>                    

                <div class="form-group"> 
                    <p><button type="submit" name="accion" class="btn btn-primary" value="btnAgregarTipoMtl">Agregar Tipo de Material</button></p>
                </div>
            </form>
        </div>
        <!-- SCRPTS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
