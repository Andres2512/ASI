<%@page import="java.sql.*"%>
<%@page import="config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Registrar Herramientas</title>
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/A$I_png-logo.png">

        <!-- BOOTSTRAP LOCAL <link rel="stylesheet" href="css/bootstrap.min.css">  -->
        <!-- BOOTSTRAP 4 ONLINE -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- HOJAS DE ESTILOS PROPIA -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssModulos.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
    <body>
        <div class="lead" style="font-size: 15px;">
            <small>
                <a href="">Inicio</a> > <a href="">Materiales y Herramientas</a> > <a href="">Registrar Herramientas</a>
                <hr style="background-color: gold;">
            </small>
        </div>
        <div class="container">
            <h1 class="h2 text-center my-5" style="font-family: Microsoft YaHei Light">REGISTRAR HERRAMIENTAS</h1>
            <form action="<%=request.getContextPath()%>/CtrHerramientas" method="get">
                <div class="form-group">
                    <label for="" class="control-label">Herramienta</label>
                    <input type="text" pattern="[A-Za-z]{1,30}" maxlength="30" class="form-control" name="txtNombre" placeholder="Herramienta" required>
                </div>    

                <div class="form-group"> 
                    <label for="" class="control-label">Descripción</label>
                    <input type="text" maxlength="70" class="form-control" name="txtDescripcionHta" placeholder="Descripción" required>
                </div>

                <div class="form-group"> 
                    <label for="" class="control-label">Precio</label>
                    <input type="text" pattern="[0-9]{3,7}" minlength="3" maxlength="7" class="form-control" name="txtPrecio" placeholder="Precio" required>
                </div>

                <div class="form-group"> 
                    <label for="" class="control-label">Cantidad</label>
                    <input type="text" pattern="[0-9]{1,3}" class="form-control" name="txtCantidad" placeholder="Cantidad" required>
                </div>

                <div class="form-group"> 
                    <label for="" class="control-label">Tipo de Herramienta</label>
                    <input type="text" class="form-control" name="txtTipo_herramientas_Id_tipo_herramientas" placeholder="Tipo de Herramienta" required>
                </div>
 <!--<select class="form-control" name="txtTipo_herramientas_Id_tipo_herramientas">
                        <%
                            Conexion cn = new Conexion();
                            Connection con;
                            PreparedStatement ps;
                            ResultSet rs;

                            String sql = "select * from marca;";

                            con = cn.getConnection();
                            ps = con.prepareStatement(sql);
                            rs = ps.executeQuery();
                            while (rs.next()) {
                                out.println("<option>" +rs.getString(2)+ "</option>");
                            }
                        %>
                    </select>-->
                <div class="form-group"> 
                    <p><button type="submit" name="accion" class="btn btn-primary" value="btnAgregarHta">Agregar Herramienta</button></p>
                </div>
            </form>
        </div>
        <!-- SCRPTS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>