<%@page import="modeloDAO.DAOCotizacion"%>
<%@page import="modelo.DTOCotizacion"%>
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
                    DAOCotizacion daocotip = new DAOCotizacion();
                    int Id_cotizacion = Integer.parseInt((String) request.getAttribute("Id_cotizacion"));
                   DTOCotizacion coti = (DTOCotizacion) daocotip.list(Id_cotizacion);
                %>
                
                <h1>Modificar Cotizacion</h1>
                <form action="<%= request.getContextPath()%>/CtrCotizacion">
                    Id_cotizacion <br>
                    <input class="form-control" type="number" name="txtidcoti" value="<%=coti.getId_cotizacion()%>" readonly="" ><br>
                    Fecha_cotizacion <br>
                    <input class="form-control" type="date" name="txtfecoti" value="<%=coti.getFecha_cotizacion()%>" required><br>
                    Cantidad_trabajadores <br>
                    <input class="form-control" type="number" name="txtcantra" value="<%=coti.getCantidad_trabajadores()%>" required><br>
                    Descripcion <br>
                    <input class="form-control" type="text" name="txtdes" value="<%=coti.getDescripcion()%>" required><br>
                    Valor_total <br>
                    <input class="form-control" type="number" name="txtvaltor" value="<%=coti.getValor_total()%>" required><br>
                    Proyecto_Id_proyecto <br>
                    <input class="form-control" type="number" name="txtpidp" value="<%=coti.getProyecto_Id_proyecto()%>" required><br>
                    Usuario_Id_usuario <br>
                    <input class="form-control" type="number" name="txtuidu" value="<%=coti.getUsuario_Id_usuario()%>" required><br>
                    
                    <input class="btn btn-warning" type="submit" name="accion" value="Actualizar"><br>
                    
                    <a class="btn btn-danger" href="CtrCotizacion?accion=listar">Regresar</a>
                </form>
            </div>
        </div>            
    </body>
</html>
