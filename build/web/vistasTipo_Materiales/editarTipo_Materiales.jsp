<%@page import="modelo.DTOTipo_Materiales"%>
<%@page import="modeloDAO.DAOTipo_Materiales"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Editar Tipo de Materiales</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- HOJAS DE ESTILOS PROPIA -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssMod.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssPrinc.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <%
                DAOTipo_Materiales Tipo_mtlDAO = new DAOTipo_Materiales();
                int Id_tipo_materiales = Integer.parseInt((String)request.getAttribute("Id_tipo_materiales"));
                DTOTipo_Materiales mtl=(DTOTipo_Materiales)Tipo_mtlDAO.list(Id_tipo_materiales);
            %>
            <h1>Modificar Tipo de Material</h1>
            <form action="<%= request.getContextPath()%>/CtrTipo_Materiales">
                
                <div class="form-group">
                    <label for="" class="control-label">ID</label>
                    <input type="number" readonly="readonly" style="background:rgba(0,0,0,0.1)" class="form-control" name="txtId_tipo_materiales" value="<%= mtl.getId_tipo_materiales()%>" placeholder="Id">    
                </div>
                <br>
                <div class="form-group">
                    <label for="" class="control-label">Tipo de Material</label>
                    <input type="text" class="form-control" name="txtTipo_materiales" value="<%= mtl.getTipo_materiales()%>" placeholder="Tipo de Material">
                </div>
                <br>
                <div class="form-group">
                    <label for="" class="control-label">Descripcion</label>
                    <input type="text" class="form-control" name="txtDescripcionMtl" value="<%= mtl.getDescripcion()%>" placeholder="Descripcion">
                </div>
                <br>
                
                <p><button type="submit" name="accion" class="btn btn-primary" value="btnActualizarTipoMtl">Modificar Tipo de Material</button></p>
            </form>
        </div>
    </body>
</html>
