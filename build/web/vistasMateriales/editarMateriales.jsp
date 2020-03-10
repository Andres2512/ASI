<%@page import="modelo.DTOMateriales"%>
<%@page import="modeloDAO.DAOMateriales"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Editar Materiales</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- HOJAS DE ESTILOS PROPIA -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssModulos.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <%
                DAOMateriales mtlDAO = new DAOMateriales();
                int Id_materiales = Integer.parseInt((String) request.getAttribute("Id_materiales"));
                DTOMateriales mtl = (DTOMateriales) mtlDAO.list(Id_materiales);
            %>
            <h1>Modificar Materiales</h1>
            <form action="<%= request.getContextPath()%>/CtrMateriales">
                <div class="form-group">
                    <label for="" class="control-label">ID</label>
                    <input type="number" readonly="readonly" style="background:rgba(0,0,0,0.1)" class="form-control" name="txtId_materiales" value="<%= mtl.getId_materiales()%>" placeholder="Id">    
                </div>
                
                <div class="form-group">
                    <label for="" class="control-label">Material</label>
                    <input type="text" class="form-control" name="txtNombre" value="<%= mtl.getNombre()%>" placeholder="Material">
                </div>    

                <div class="form-group"> 
                    <label for="" class="control-label">Descripción</label>
                    <input type="text" class="form-control" name="txtDescripcionMtl" value="<%= mtl.getDescripcion()%>" placeholder="Descripción">
                </div>
                
                <div class="form-group"> 
                    <label for="" class="control-label">Precio</label>
                    <input type="text" class="form-control" name="txtPrecio" value="<%= mtl.getPrecio()%>" placeholder="Precio">
                </div>
                
                <div class="form-group"> 
                    <label for="" class="control-label">Cantidad</label>
                    <input type="text" class="form-control" name="txtCantidad" value="<%= mtl.getCantidad()%>" placeholder="Cantidad">
                </div>
                
                <div class="form-group"> 
                    <label for="" class="control-label">Marca</label>
                    <input type="text" class="form-control" name="txtMarca_Id_marca" value="<%= mtl.getMarca_Id_marca()%>" placeholder="Marca del Material">
                </div>
                
                <div class="form-group"> 
                    <label for="" class="control-label">Tipo de Material</label>
                    <input type="text" class="form-control" name="txtTipo_materiales_Id_tipo_materiales" value="<%= mtl.getTipo_materiales_Id_tipo_materiales()%>" placeholder="Tipo de Herramienta">
                </div>
                <br>

                <p><button type="submit" name="accion" class="btn btn-primary" value="btnActualizarMtl">Modificar Material</button></p>
            </form>
        </div>    
    </body>
</html>
